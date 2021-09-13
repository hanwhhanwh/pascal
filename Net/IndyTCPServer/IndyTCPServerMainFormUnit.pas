unit IndyTCPServerMainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPServer, ExtCtrls, StdCtrls,
  Sockets;

type
  TIndyTCPServerMainFormForm = class(TForm)
    IdTCPServer: TIdTCPServer;
    mmoLog: TMemo;
    spl1: TSplitter;
    pnlMenu: TPanel;
    btnStart: TButton;
    btnStop: TButton;
    procedure IdTCPServerConnect(AThread: TIdPeerThread);
    procedure IdTCPServerDisconnect(AThread: TIdPeerThread);
    procedure IdTCPServerExecute(AThread: TIdPeerThread);
    procedure IdTCPServerStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TCPServerAccept(Sender: TObject;
      ClientSocket: TCustomIpClient);
    procedure TCPServerCreateHandle(Sender: TObject);
    procedure TCPServerDestroyHandle(Sender: TObject);
    procedure TCPServerGetThread(Sender: TObject;
      var ClientSocketThread: TClientSocketThread);
    procedure TCPServerListening(Sender: TObject);
  private
    procedure RecvData(ASender: TObject; pData: PByte; nRead: integer);
  public
    { Public declarations }
  end;



  TRecvDataEvent = procedure(ASender: TObject; pData: PByte; nRead: integer) of object;
  TClientPartThread = class(TIdPeerThread)
  private
    FOnRecvData: TRecvDataEvent;
    FBuffer: array[0..MAXSHORT] of byte;
    FRead: integer;
  protected
    procedure AfterRun; override;
    procedure BeforeRun; override;
    procedure Cleanup; override;
    // If things need freed, free them in AfterRun so that pooled threads clean themselves up.
    // Only persistent things should be handled in AfterExecute (Destroy)
    procedure Run; override;
  public
  	procedure SyncOnRecvData;

    property OnRecvData: TRecvDataEvent read FOnRecvData write FOnRecvData;
  End;//TClientPartThread


var
  IndyTCPServerMainFormForm: TIndyTCPServerMainFormForm;

implementation

{$R *.dfm}

procedure TIndyTCPServerMainFormForm.FormCreate(Sender: TObject);
begin
  btnStart.Enabled := true;
  btnStop.Enabled := false;
  IdTCPServer.ThreadClass := TClientPartThread;
end;


procedure TIndyTCPServerMainFormForm.IdTCPServerConnect(
  AThread: TIdPeerThread);
begin
  mmoLog.Lines.Add('IdTCPServerConnected : ' + AThread.Connection.Socket.Binding.PeerIP);
  if (AThread is TClientPartThread) then
	  TClientPartThread(AThread).OnRecvData := RecvData;

end;


procedure TIndyTCPServerMainFormForm.IdTCPServerDisconnect(
  AThread: TIdPeerThread);
begin
  mmoLog.Lines.Add('IdTCPServerDisconnected : ' + AThread.Connection.Socket.Binding.PeerIP);
end;


function BufferToHexaString(pBuffer: PByte; nBufferLen: integer): string;
var
  nIndex: Integer;
begin
  Result := '';
  if (nBufferLen <= 0) then
  	Exit;
  Result := '    ';
  for nIndex := 0 to nBufferLen - 1 do
  begin
    if ((nIndex > 0) and ((nIndex mod 16) = 0)) then
    	Result := Result + #13#10'    ';
    Result := Result + IntToHex((pBuffer)^, 2) + ' ';
    Inc(pBuffer);
  end;
end;


procedure TIndyTCPServerMainFormForm.IdTCPServerExecute(
  AThread: TIdPeerThread);
var
  pBuffer: array[0..MAXSHORT] of byte;
  nRead: integer;
begin
	if ((not AThread.Terminated) and (AThread.Connection.Connected)) then
  begin
		if (AThread.Connection.Socket.Readable(1)) then
    begin
//      nRead := AThread.Connection.Socket.Recv(pBuffer, MAXSHORT);
//      if (nRead > 0) then
//      begin
//        mmoLog.Lines.Add('Received ' + IntToStr(nRead) + #13#10 + BufferToHexaString(@pBuffer[0], nRead));
//  			pBuffer
//        mmoLog.Lines.Add('IdTCPServerExecute');
//		  end;
    end;
  end;
end;


procedure TIndyTCPServerMainFormForm.IdTCPServerStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
begin
  mmoLog.Lines.Add('IdTCPServerStatus : ' + IntToStr(integer(AStatus)) + ' ; ' + AStatusText);
end;


procedure TIndyTCPServerMainFormForm.btnStartClick(Sender: TObject);
begin
  btnStart.Enabled := false;
  btnStop.Enabled := true;
  mmoLog.Lines.Add('IdTCPServer Startedd...');
	IdTCPServer.Active := true;
end;


procedure TIndyTCPServerMainFormForm.btnStopClick(Sender: TObject);
var
  AList: TList;
  nIndex: integer;
begin
  try
    AList := IdTCPServer.Threads.LockList;
    for nIndex := 0 to AList.Count - 1 do
    begin
      TClientPartThread(AList[nIndex]).Connection.Socket.Close;
    end;
  finally
    IdTCPServer.Threads.UnlockList;
  end;
  Sleep(500);
	IdTCPServer.Active := false;
  btnStart.Enabled := true;
  btnStop.Enabled := false;
  mmoLog.Lines.Add('IdTCPServer Stopped...');
end;


procedure TIndyTCPServerMainFormForm.RecvData(ASender: TObject;
  pData: PByte; nRead: integer);
begin
  mmoLog.Lines.Add('Received ' + IntToStr(nRead) + #13#10 + BufferToHexaString(pData, nRead));
end;


{ TClientPartThread }

procedure TClientPartThread.AfterRun;
begin
  inherited;

end;

procedure TClientPartThread.BeforeRun;
begin
  inherited;

end;

procedure TClientPartThread.Cleanup;
begin
  inherited;

end;


procedure TClientPartThread.Run;
begin
  while not Terminated do
  begin
	  FRead := FConnection.Socket.Recv(FBuffer, MAXSHORT);
    if (FRead = -1) then
    begin
      Stop;
    	break;
    end;

  	Synchronize(SyncOnRecvData);
  end;
end;


procedure TClientPartThread.SyncOnRecvData;
begin
	if (assigned(FOnRecvData)) then
  	FOnRecvData(self, @FBuffer[0], FRead);
end;



end.

unit IndyTCPServerMainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPServer, ExtCtrls, StdCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IndyTCPServerMainFormForm: TIndyTCPServerMainFormForm;

implementation

{$R *.dfm}

procedure TIndyTCPServerMainFormForm.FormCreate(Sender: TObject);
begin
  btnStart.Enabled := true;
  btnStop.Enabled := false;
end;

procedure TIndyTCPServerMainFormForm.IdTCPServerConnect(
  AThread: TIdPeerThread);
begin
  mmoLog.Lines.Add('IdTCPServerConnect : ');
  AThread.Connection
end;

procedure TIndyTCPServerMainFormForm.IdTCPServerDisconnect(
  AThread: TIdPeerThread);
begin
  mmoLog.Lines.Add('IdTCPServerDisconnect');
end;

procedure TIndyTCPServerMainFormForm.IdTCPServerExecute(
  AThread: TIdPeerThread);
begin
  mmoLog.Lines.Add('IdTCPServerExecute');
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
begin
	IdTCPServer.Active := true;
  btnStart.Enabled := true;
  btnStop.Enabled := false;
  mmoLog.Lines.Add('IdTCPServer Stopped...');
end;


end.

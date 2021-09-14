program IndyTCPServer;

uses
  Forms,
  IndyTCPServerMainFormUnit in 'IndyTCPServerMainFormUnit.pas' {IndyTCPServerMainFormForm},
  crc16ccittUnit in 'crc16ccittUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TIndyTCPServerMainFormForm, IndyTCPServerMainFormForm);
  Application.Run;
end.

program IndyTCPServer;

uses
  Forms,
  IndyTCPServerMainFormUnit in 'IndyTCPServerMainFormUnit.pas' {IndyTCPServerMainFormForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TIndyTCPServerMainFormForm, IndyTCPServerMainFormForm);
  Application.Run;
end.

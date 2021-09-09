program WinAPITest;

uses
  Forms,
  WinAPITestMainFormUnit in 'WinAPITestMainFormUnit.pas' {WinAPITestMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TWinAPITestMainForm, WinAPITestMainForm);
  Application.Run;
end.

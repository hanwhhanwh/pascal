unit ErrorsMainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btnViolatesSubrangeBounds: TButton;
    procedure btnViolatesSubrangeBoundsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnViolatesSubrangeBoundsClick(Sender: TObject);
type
	TNums = 1..9;
var
	my_data: TNums;
begin
	my_data := 1; // OK
	my_data := 0; // Error : Constant expression violates subrange bounds
end;

end.

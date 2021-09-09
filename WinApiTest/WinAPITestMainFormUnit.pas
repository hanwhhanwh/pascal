unit WinAPITestMainFormUnit;
{
  @summary Windows API Test demo program Main Form Unit
  @author hbesthee@naver.com
  @date 2021-09-09
}

{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

type
  TWinAPITestMainForm = class(TForm)
    mmoLog: TMemo;
    pgc1: TPageControl;
    tsFindWindow: TTabSheet;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    btnFindWindow: TButton;
    btnFindWindowEx: TButton;
    edtFindWindowHandle: TEdit;
    edtClassName: TEdit;
    edtCaption: TEdit;
    spl1: TSplitter;
    procedure btnFindWindowClick(Sender: TObject);
    procedure btnFindWindowExClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WinAPITestMainForm: TWinAPITestMainForm;

implementation

{$R *.dfm}

procedure TWinAPITestMainForm.btnFindWindowClick(Sender: TObject);
var
	hwnd: THandle;
  strClassName, strCaption: string;
  pClassName, pCaption: PChar;
begin
  strClassName := Trim(edtClassName.Text);
  strCaption := Trim(edtCaption.Text);
  if (strClassName = '') then
    pClassName := nil
  else
    pClassName := PChar(strClassName);
  if (strCaption = '') then
    pCaption := nil
  else
    pCaption := PChar(strCaption);

	// 클래스 이름으로 메모장 핸들 찾기
	hwnd := FindWindow(pClassName, pCaption);
  edtFindWindowHandle.Text := IntToStr(hwnd) + ' = $' + IntToHex(hwnd, 8);
end;

procedure TWinAPITestMainForm.btnFindWindowExClick(Sender: TObject);
var
  hwndPrev, hwnd: THandle;
  strCaption: string;
begin
  hwnd := FindWindow('#32770', nil);
  mmoLog.Lines.Add('First Hwnd = ' + Format('%x', [hwnd]));
  repeat
    hwndPrev := hwnd;
    hwnd := FindWindowEx(0, hwndPrev, '#32770', nil);
    if hwnd = 0 then
      break;
    SetLength(strCaption, GetWindowTextLength(hwnd) + 1);
    GetWindowText(hwnd, @strCaption[1], Length(strCaption));
    mmoLog.Lines.Add('Hwnd = ' + Format('%x', [hwnd]) + ' , Caption = ' + strCaption);
  until hwnd = 0;
end;

end.

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
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Spin;

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
    tsMouse: TTabSheet;
    lbl1: TLabel;
    edtMouseHandle: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    btnMouseClick: TButton;
    seMouseX: TSpinEdit;
    seMouseY: TSpinEdit;
    procedure btnFindWindowClick(Sender: TObject);
    procedure btnFindWindowExClick(Sender: TObject);
    procedure btnMouseClickClick(Sender: TObject);
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
	hwndParent, hwndNext, hwnd: THandle;
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
	hwndParent := FindWindow(pClassName, pCaption);
	hwndNext := FindWindowEx(hwndParent, 0, 'Qt5QWindowIcon', 'Nox');
	hwnd := FindWindowEx(hwndParent, hwndNext, 'Qt5QWindowIcon', 'Nox');
  edtFindWindowHandle.Text := IntToStr(hwnd) + ' = $' + IntToHex(hwnd, 8);
  edtMouseHandle.Text := IntToStr(hwnd);
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
	  edtMouseHandle.Text := IntToStr(hwnd);
  until hwnd = 0;
end;


procedure TWinAPITestMainForm.btnMouseClickClick(Sender: TObject);
var
  hwnd: THandle;
  lParam: Cardinal;
begin
  hwnd := StrToIntDef(edtMouseHandle.Text, 0);
  if (hwnd = 0) then
  begin
    edtMouseHandle.SelectAll;
    edtMouseHandle.SetFocus;
  	exit;
  end;

  lParam := (seMouseY.Value shl 16) or (seMouseX.Value);
	PostMessage(hwnd, WM_LBUTTONDOWN, 1, lParam);
	PostMessage(hwnd, WM_MOUSEMOVE,   1, lParam);
	PostMessage(hwnd, WM_LBUTTONUP,   0, lParam);
end;

end.

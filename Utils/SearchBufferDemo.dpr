program SearchBufferDemo;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  FBuffer: array[0..19] of byte = (
      $0, $1, $2, $3, $4, $0, $1, $2, $3, $4
      , $0, $1, $2, $55, $4, $0, $1, $2, $56, $4
  );


function SearchBuffer(pBuffer: PByte; nBufferPos, nBufferLen: integer; pSearch: PByte; nSearchLen: integer): integer;
var
  nBufferIndex, nSearchIndex: Integer;
  blnFound: Boolean;
  pBufferPart, pSearchPart: PByte;
begin
  Result := -1;
  if ( (nBufferPos > nBufferLen) or (nBufferLen <= 0) or (nSearchLen <= 0)
      or (pBuffer = nil) or (pSearch = nil)
      or ((nBufferPos + nSearchLen) > nBufferLen) ) then
  	Exit;

  if (nBufferPos < 0) then
    nBufferPos := 0;

  for nBufferIndex := nBufferPos to nBufferLen - nSearchLen do
  begin
    pBufferPart := PByte(Cardinal(pBuffer) + nBufferIndex);
    pSearchPart := pSearch;
    blnFound := true;
    for nSearchIndex := 0 to nSearchLen - 1 do
    begin
      if (pBufferPart^ <> pSearchPart^) then
      begin
        blnFound := false;
        break;
      end;

      inc(pBufferPart);
      inc(pSearchPart);
    end;

    if (blnFound) then
    begin
      Result := nBufferIndex;
      Exit;
    end;
  end;
end;


var
  pBuffer: array[0..4] of byte;
  nPos: integer;
begin
  pBuffer[0] := $55;
  nPos := SearchBuffer(@FBuffer[0], 0, 20, @pBuffer[0], 1);
  writeln('nPos = ' + IntToStr(nPos));
  pBuffer[0] := $56;
  pBuffer[1] := $4;
  nPos := SearchBuffer(@FBuffer[0], 10, 20, @pBuffer[0], 2);
  writeln('nPos = ' + IntToStr(nPos));

  pBuffer[0] := $1;
  pBuffer[1] := $2;
  nPos := 0;
  while (True) do
  begin
    nPos := SearchBuffer(@FBuffer[0], nPos, 20, @pBuffer[0], 2);
    writeln('nPos = ' + IntToStr(nPos));
    if (nPos < 0) then
      break;
    Inc(nPos);
  end;
end.

{ Result
nPos = 13
nPos = 18
nPos = 1
nPos = 6
nPos = 11
nPos = 16
nPos = -1
}

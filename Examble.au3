#AutoIt3Wrapper_UseX64=NO
#include <imageSearchEX.au3>
#include "_IMGSearch_Debug.au3"
Example()
Func Example()
	$ImagePath = @ScriptDir & "\test.bmp"
	$Title = "Google - Google Chrome"
	WinActivate($Title)
	_IMGSearch_Create_BMP($ImagePath) ; Create image
	MsgBox(0,"Message","Press OK to click image!")
	ControlClickWindowsByImage($Title, $ImagePath)
	If @error Then MsgBox(0,"Message","Image wasn't exit")
EndFunc   ;==>Example
Func ControlClickWindowsByImage($Title, $ImgPath)
	If BitAND(WinGetState($Title), 16) Then
		Local $myLastWin = WinGetTitle(WinActive("[ACTIVE]"))
		WinActivate($Title)
		WinActivate($myLastWin)
	EndIf
	$p = imageSearchEX($Title, $ImgPath)
	If $p = 0 Then
		Return SetError(3)
	EndIf
	ControlClick($Title, "", "", "",1 , $p[0], $p[1])
	WinActivate($myLastWin)
EndFunc   ;==>ControlClickWindowsByImage


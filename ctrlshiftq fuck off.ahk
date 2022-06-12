/* 
Current Mappings:

	- ctrl + shift + q => open snipping tool and/or start new snip

	- LaunchMedia button => home
		- shift + LaunchMedia also works as expected

	- capslock + q + u => left click

	- capslock + q + o => right click

	- capslock + q + [i, k, j, l] => Move Mouse [up, down, left, right]
		- mouse movement speed controlled by Mouse_Offset variable

	- capslock + \ => home
		- shift + capslock + \ also works as expected

	- capslock + RShift => end
		- LShift + capslock + RShift also works as expected

	- capslock + [i, k, j, l] => arrow key [up, down, left, right]
		- [LShift, Ctrl, Alt, WindowsKey] + capslock + [i, k, j, l] also work (mostly) as expected
		- note caps + l + WindowsKey does not work as expected. It puts computer to sleep
		
	- WindowsKey + l => put computer to sleep

*/


#NoTrayIcon
SetTitleMatchMode, Regex
SetCapsLockState AlwaysOff

;controls mouse movement speed
Mouse_Offset := 20
return

; starts snipping tool snip, deprecated, replaced with win + shift + s 
^+q::
if WinExist("ahk_class Microsoft-Windows-SnipperToolbar") or WinExist("ahk_class Microsoft-Windows-SnipperEditor") {
	WinActivate,
	WinWaitActive,
	Send !n
	return
}else{
	Run, "%windir%\System32\SnippingTool.exe"
	WinWait, ahk_class Microsoft-Windows-SnipperToolbar
	WinActivate, ahk_class Microsoft-Windows-SnipperToolbar
	WinWaitActive, ahk_class Microsoft-Windows-SnipperToolbar
	Send !n
	return
}

;Remap Launch_Media button (on windows wireless keyboard) to End
+Launch_Media::Send {Shift down}{End}{Shift up}
*Launch_Media::Send {End}	

;Remap Caps + q + u to left click
Capslock & u::
	If GetKeyState("q", "P"){
		MouseClick, left
		return
	}else{
		return
	}
	

;Remap Caps + q + u to left click
Capslock & o::
	If GetKeyState("q", "P"){
		MouseClick, right
		return
	}else{
		return
	}

;Remap capslock + \ to Home
Capslock & \::
	If GetKeyState("Shift", "P") {
		Send, {Shift down}{Home}{Shift up}
		return
	}Else If GetKeyState("LWin", "p") {
		Send, {LWin down}{Home}{LWin up}
		return
	}Else If GetKeyState("Alt", "p") {
		Send, {Alt down}{Home}{Alt up}
		return
	}Else If GetKeyState("Ctrl", "p") {
		Send, {Ctrl down}{Home}{Ctrl up}
		return
	}Else{
		Send, {Home}
		return
	}

;Remap capslock + RShift to End
Capslock & RShift::
	If GetKeyState("LShift", "P") {
		Send, {LShift down}{End}{LShift up}
		return
	}Else If GetKeyState("LWin", "p") {
		Send, {LWin down}{End}{LWin up}
		return
	}Else If GetKeyState("Alt", "p") {
		Send, {Alt down}{End}{Alt up}
		return
	}Else If GetKeyState("Ctrl", "p") {
		Send, {Ctrl down}{End}{Ctrl up}
		return
	}Else{
		Send, {End}
		return
	}
	
;Remap capslock + i to UpArrow
Capslock & i::
	If GetKeyState("Shift", "P") {
		Send, {Shift down}{Up}{Shift up}
		return
	}Else If GetKeyState("LWin", "p") {
		Send, {LWin down}{Up}{LWin up}
		return
	}Else If GetKeyState("Alt", "p") {
		Send, {Alt down}{Up}{Alt up}
		return
	}Else If GetKeyState("Ctrl", "p") {
		Send, {Ctrl down}{Up}{Ctrl up}
		return
	}Else if (GetKeyState("q", "P")){
		If (GetKeyState("l", "P")){
			MouseMove,(Mouse_Offset), (Mouse_Offset * -1), 0, R	
		} Else IF (GetKeyState("j", "P")){
			MouseMove,(Mouse_Offset * -1), (Mouse_Offset * -1), 0, R	
		}Else{
			MouseMove, 0, (Mouse_Offset * -1), 0, R
		}
		return
	}Else{
		Send, {Up}
		return
	}
	
;Remap capslock + k to DownArrow
Capslock & k::
	If GetKeyState("Shift", "P") {
		Send, {Shift down}{Down}{Shift up}
		return
	}Else If GetKeyState("LWin", "p") {
		Send, {LWin down}{Down}{LWin up}
		return
	}Else If GetKeyState("Alt", "p") {
		Send, {Alt down}{Down}{Alt up}
		return
	}Else If GetKeyState("Ctrl", "p") {
		Send, {Ctrl down}{Down}{Ctrl up}
		return
	}Else if (GetKeyState("q", "P")){
		If (GetKeyState("l", "P")){
			MouseMove,(Mouse_Offset), (Mouse_Offset), 0, R	
		} Else IF (GetKeyState("j", "P")){
			MouseMove,(Mouse_Offset * -1), (Mouse_Offset), 0, R	
		}Else{
			MouseMove, 0, (Mouse_Offset), 0, R
		}
		return
	}Else{
		Send, {Down}
		return
	}

;Remap capslock + j to UpArrow
Capslock & j::
	If GetKeyState("Shift", "P") {
		Send, {Shift down}{Left}{Shift up}
		return
	}Else If GetKeyState("LWin", "p") {
		Send, {LWin down}{Left}{LWin up}
		return
	}Else If GetKeyState("Alt", "p") {
		Send, {Alt down}{Left}{Alt up}
		return
	}Else If GetKeyState("Ctrl", "p") {
		Send, {Ctrl down}{Left}{Ctrl up}
		return
	}Else if (GetKeyState("q", "P")){
		If (GetKeyState("i", "P")){
			MouseMove,(Mouse_Offset * -1), (Mouse_Offset * -1), 0, R	
		} Else IF (GetKeyState("k", "P")){
			MouseMove,(Mouse_Offset * -1), (Mouse_Offset), 0, R	
		}Else{
			MouseMove,(Mouse_Offset * -1), 0, 0, R
		}
		return
	}Else{
		Send, {Left}
		return
	}
	
;Remap capslock + l to DownArrow
Capslock & l::
	If GetKeyState("Shift", "P") {
		Send, {Shift down}{Right}{Shift up}
		return
	}Else If GetKeyState("LWin", "p") {
		Send, {LWin down}{Right}{LWin up}
		return
	}Else If GetKeyState("Alt", "p") {
		Send, {Alt down}{Right}{Alt up}
		return
	}Else If GetKeyState("Ctrl", "p") {
		Send, {Ctrl down}{Right}{Ctrl up}
		return
	}Else if (GetKeyState("q", "P")){
		If (GetKeyState("i", "P")){
			MouseMove,(Mouse_Offset), (Mouse_Offset * -1), 0, R	
		} Else IF (GetKeyState("k", "P")){
			MouseMove,(Mouse_Offset), (Mouse_Offset), 0, R	
		}Else{
			MouseMove,(Mouse_Offset), 0, 0, R
		}
		return
	}Else{
		Send, {Right}
		return
	}

#\::
DllCall("PowrProf\SetSuspendState", "int", 0, "int", 1, "int", 0)

; XButton2::RAlt

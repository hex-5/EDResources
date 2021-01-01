#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
#SingleInstance
TOGGLE := true
SetTimer, WatchPOV, 5
Return

WatchPOV:
if TOGGLE Return
GetKeyState, POV, JoyPOV
if POV < 0 
    Return
else if POV = 0
    Goto Engine
else if POV = 9000
    Goto Weapons	
;else if POV = 18000
;    Goto Engine
else if POV = 27000 
    Goto Shields
Return

Joy9:: ;L-Stick down
TOGGLE := !TOGGLE
Return

Shields:
Send, {Down}
Sleep, 10
Send, {Up}
Sleep, 10
Send, {Up}
Sleep, 10
Send, {Left}
Sleep, 10
Send, {Left}
Sleep, 10
Send, {Left}
Sleep, 10
Send, {Left}
Sleep, 10
Return

Weapons:
Send, {Down}
Sleep, 10
Send, {Up}
Sleep, 10
Send, {Up}
Sleep, 10
Send, {Right}
Sleep, 10
Send, {Right}
Sleep, 10
Send, {Right}
Sleep, 10
Send, {Right}
Sleep, 10
Return


Engine:
Send, {Down}
Sleep, 10
Send, {Up}
Sleep, 10
Send, {Up}
Sleep, 10
Send, {Up}
Sleep, 10
Send, {Up}
Sleep, 10
Return
#NoEnv                        ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn                       ; Enable warnings to assist with detecting common errors.
SendMode Input                ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%   ; Ensures a consistent starting directory.
#Persistent
#SingleInstance
BoostAvaiable := true
TOGGLE := true
SetTimer, WatchPOV, 5
Return

WatchPOV:
if TOGGLE Return
GetKeyState, POV, JoyPOV
if POV < 0
    Return
else if POV = 0
    Engine()
else if POV = 9000
    Weapons()
else if POV = 27000
    Shields()
Return

Joy9::                    ; L-Stick down
TOGGLE := !TOGGLE
Return

Joy2::                    ; B-Button down
BoostInterval()
Return

Shields()
{
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
}

Weapons()
{
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
}

Engine()
{
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
}

BoostInterval(){
  Global                    ; uses BoostAvaiable, which is declared global
	if(BoostAvaiable){
    BoostAvaiable := false
    Sleep, 1000             ; Wait time for the boost to trigger
    Engine()
    Sleep, 2500
    Shields()               ; Boost shields after boosting
    Sleep, 2000             ; Boost refraction time, needs some fine tuning
    BoostAvaiable := true
	}
  Return
}

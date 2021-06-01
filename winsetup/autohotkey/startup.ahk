
; prevent asking if you want to replace the running script (not admin) with admin
#SingleInstance, Force

;
; Run As Admin (when needing to be admin)
; https://www.autohotkey.com/boards/viewtopic.php?t=15820&start=20
; https://stackoverflow.com/questions/43298908/how-to-add-administrator-privileges-to-autohotkey-script
; 
;if not A_IsAdmin
;  Run *RunAs "%A_ScriptFullPath%"

SendMode Input
SetWorkingDir, %A_ScriptDir%

^+v::SendRaw %clipboard%

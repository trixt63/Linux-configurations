#Requires AutoHotkey v2.0

; Map Capslock to Control
; Map press & release of Capslock with no other key to Esc
; Press both shift keys together to toggle Capslock

; *CapsLock::
; {
;     Send "{Blind}{LControl down}"
; }
; *CapsLock up::
; {
;     Send "{Blind}{LControl up}"
;     if A_PRIORKEY = "CapsLock"
;     {
;         Send "{Esc}"
;     }
;  }

; RShift & LShift::
; LShift & RShift::
; {
;     SetCapsLockState !GetKeyState("CapsLock", "T")
; }

; Map Right Alt + P,N,F,B to arrows
>!p::Up       ; Right Alt + P to Up
>!n::Down     ; Right Alt + N to Down
>!f::Right    ; Right Alt + F to Right
>!b::Left     ; Right Alt + B to Left


; Switch virtual windows with windows + 1/2
#2::^#Right
#1::^#Left
#3::Return
#4::Return


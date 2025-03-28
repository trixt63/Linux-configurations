#Requires AutoHotkey v2.0

ih := InputHook("B L1 T1", "{Esc}")

; Map Left Control to Escape if pressed alone, else behave as normal Control

~LControl::
{
    thisKey := "LControl"
    KeyWait thisKey  ; Wait until Ctrl is released
    if A_PriorKey = thisKey && A_TimeSinceThisHotkey < 300
    {
        Send "{Esc}"
    }
    return
}

; Optional: Add the same behavior for Right Control if desired
~RControl::
{
    thisKey := "RControl"
    KeyWait thisKey
    if A_PriorKey = thisKey && A_TimeSinceThisHotkey < 300
    {
        Send "{Esc}"
    }
    return
}

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


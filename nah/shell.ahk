;________________________
; \____Mouse Edit_____/  

;   By SlimlinE

; Hold down LButton and click RButton:-
;   Once to Copy
;   Twice to Paste
;   Three to Cut
; Hold down LButton and scroll MouseWheel:-
;   Down to Select All
;   Up to Undo
; Holding down LButton and clicking MouseWheel sends Enter
;
; Tip: Functions can be used one after another if LButton isn't released
;      ie.  Hold down LButton
;           scroll MouseWheel Down (Select All), click RButton once (Copy) etc.

~mbutton::
  WinGetClass cos_class, A
    SendInput ^v
  return
  
#IfWinNotActive


;; clipx
  ^mbutton::
  sendinput ^+{insert}
  return








; Cut Copy & Paste.

~LButton & RButton::
    If RMB_Click > 0
	    {
			RMB_Click += 1
			Return
		}
	RMB_Click = 1
    SetTimer, WaitForClicks, 300
Return

WaitForClicks:
    SetTimer, WaitForClicks, Off
    If RMB_Click = 1
        {
            Send, {LButton Up}^c
	        ClipWait,1
            String = %clipboard%

            TrayTip, ________ COPIED TO CLIPBOARD. _______, %String%
            SetTimer, RemoveTrayTip, 300            
        }
    Else If RMB_Click = 2
        {
            Send, {LButton Up}^x
            String = %clipboard%

            TrayTip, ________ CUT TO CLIPBOARD. _______, %String%
            SetTimer, RemoveTrayTip, 300            
        }
    Else If RMB_Click > 2
        {
            Send, {LButton Up}

            TrayTip, ___ TOO MANY CLICKS! ___,Edit Aborted.
            SetTimer, RemoveTrayTip, 300            
        }
    RMB_Click = 0
Return

RemoveTrayTip:
SetTimer, RemoveTrayTip, Off
TrayTip
Return


;_________________________
; \____End Of Code____/
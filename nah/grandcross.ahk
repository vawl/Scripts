; Autohotkey Capslock Remapping Script 
; Danik
; More info at http://danikgames.com/blog/?p=714
; danikgames.com
; 
; Functionality:
; - Deactivates capslock for normal (accidental) use.
; - Hold Capslock and drag anywhere in a window to move it (not just the title bar).
; - Access the following functions when pressing Capslock: 
;     Cursor keys           - J, K, L, I
;     Enter                 - Space
;     Home, PgDn, PgUp, End - U, O, Y, H
;     Backspace and Del     - N, M
;
;     Insert                - B
;     Select all            - A
;     Cut, copy, paste      - S, D, F
;     Close tab, window     - W, E
;     Esc                   - R
;     Next, previous tab    - Tab, Q
;     Undo, redo            - , and .
;  
; To use capslock as you normally would, you can press WinKey + Capslock


; This script is mostly assembled from modified versions of the following awesome scripts:
;
; # Home Row Computing by Gustavo Duarte: http://duartes.org/gustavo/blog/post/home-row-computing for 
; Changes: 
; - Does not need register remapping of AppsKey using SharpKeys.
; - Uses normal cursor key layout 
; - Added more hotkeys for insert, undo, redo etc.
;
; # Get the Linux Alt+Window Drag Functionality in Windows: http://www.howtogeek.com/howto/windows-vista/get-the-linux-altwindow-drag-functionality-in-windows/
; Changes: The only change was using Capslock instead of Alt. This 
; also removes problems in certain applications.




#Persistent
SetCapsLockState, AlwaysOff



; Capslock + jkli (left, down, up, right)

Capslock & j::Send {Blind}{Left DownTemp}
Capslock & j up::Send {Blind}{Left Up}

Capslock & k::Send {Blind}{Down DownTemp}
Capslock & k up::Send {Blind}{Down Up}

Capslock & i::Send {Blind}{Up DownTemp}
Capslock & i up::Send {Blind}{Up Up}

Capslock & l::Send {Blind}{Right DownTemp}
Capslock & l up::Send {Blind}{Right Up}


; Capslock + sdef (left, down, up, right) extended movement

Capslock & s::Send {Blind}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left DownTemp}
Capslock & s up::Send {Blind}{Left Up}

Capslock & d::Send {Blind}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down DownTemp}
Capslock & d up::Send {Blind}{Down Up}

Capslock & e::Send {Blind}{Up}{Up}{Up}{Up}{Up}{Up}{Up}{Up DownTemp}
Capslock & e up::Send {Blind}{Up Up}

Capslock & f::Send {Blind}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right DownTemp}
Capslock & f up::Send {Blind}{Right Up}


; Capslock + a (select all)

Capslock & a::SendInput {Ctrl Down}{a Down}
Capslock & a up::SendInput {Ctrl Up}{a Up}

; Capslock + things (insert, backspace, del)

Capslock & b::SendInput {Blind}{Insert Down}
Capslock & SC027::SendInput {Blind}{Del Down}
Capslock & Space::SendInput {Blind}{BS Down}
Capslock & BS::SendInput {Blind}{BS Down}


 


; Make Capslock & Alt Equivalent to Control+Alt
!Capslock::SendInput {Ctrl down}{Alt Down}
!Capslock up::SendInput {Ctrl up}{Alt up}


; Capslock + TAB/q (prev/next tab)

Capslock & q::SendInput {Ctrl Down}{Tab Down}
Capslock & q up::SendInput {Ctrl Up}{Tab Up}
Capslock & Tab::SendInput {Ctrl Down}{Shift Down}{Tab Down}
Capslock & Tab up::SendInput {Ctrl Up}{Shift Up}{Tab Up}

; Capslock + ,/. (undo/redo)

Capslock & u::SendInput {Ctrl Down}{z Down}
Capslock & u up::SendInput {Ctrl Up}{z Up}
Capslock & r::SendInput {Ctrl Down}{y Down}
Capslock & r up::SendInput {Ctrl Up}{y Up}



; Make Win Key + Capslock work like Capslock
Capslock & RAlt::
If GetKeyState("CapsLock", "T") = 1
    SetCapsLockState, AlwaysOff
Else 
    SetCapsLockState, AlwaysOn
Return





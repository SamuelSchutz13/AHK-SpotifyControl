#Requires AutoHotkey 2.0
#SingleInstance Force
#Include "The Destination Path of Audio.ahk"

DetectHiddenWindows(1)
CoordMode "ToolTip", "Screen"

!^Left::SpotifyPlaybackPrevious
!^Space::SpotifyPlaybackPlayPause
!^Right::SpotifyPlaybackNext

SpotifyPlaybackNext() => SpotifyControl(0xB0000)
SpotifyPlaybackPrevious() => SpotifyControl(0xC0000)
SpotifyPlaybackPlayPause() => SpotifyControl(0xE0000)

SpotifyControl(action) {
    static WM_APPCOMMAND := 0x319
    
    if !(Spot_PID := ProcessExist("Spotify.exe"))
        return

    Spot_hwnd := WinGetID("ahk_pid " Spot_PID)
    if Spot_hwnd {
        DllCall("SendMessage", "Ptr", Spot_hwnd, "UInt", WM_APPCOMMAND, "Ptr", 0, "Ptr", action)
    }
}
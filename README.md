# 🎵 AHK-SpotifyControl

Control **Spotify** from anywhere in Windows with global keyboard shortcuts, without bringing the app window to the front.

Built with **AutoHotkey v2**.

---

## ✨ Features

- ⏯️ **Play / Pause** the current track
- ⏭️ **Next track**
- ⏮️ **Previous track**
- 🪟 Works even when Spotify is **minimized** or in the system tray
- 🔒 Single instance: running the script again replaces the previous one
- 🛡️ If Spotify isn't running, the shortcuts simply do nothing (no errors)

---

## ⌨️ Shortcuts

| Shortcut | Action |
|---|---|
| `Ctrl` + `Alt` + `Space` | Play / Pause |
| `Ctrl` + `Alt` + `→` | Next track |
| `Ctrl` + `Alt` + `←` | Previous track |

---

## 📋 Requirements

- Windows 10 or 11
- [AutoHotkey v2.0+](https://www.autohotkey.com/)
- [Spotify for Desktop](https://www.spotify.com/download/) (the desktop app, not the web player)

---

## 🚀 Installation

1. **Install AutoHotkey v2** from the [official website](https://www.autohotkey.com/).

2. **Clone or download** this repository:

   ```bash
   git clone https://github.com/SamuelSchutz13/AHK-SpotifyControl.git
   ```

3. **Set the path to `Audio.ahk`** in `Main.ahk`. Replace this line:

   ```ahk
   #Include "The Destination Path of Audio.ahk"
   ```

   with the actual path to the file. If both files are in the same folder, just use:

   ```ahk
   #Include "Audio.ahk"
   ```

4. **Run** `Main.ahk` by double-clicking it. An AutoHotkey icon will appear in the system tray.

---

## 🔁 Run at Windows startup (optional)

1. Press `Win` + `R`, type `shell:startup` and press `Enter`.
2. Create a **shortcut** to `Main.ahk` inside the folder that opens.

That's it: the shortcuts will be active every time you start your PC.

---

## ⚙️ How it works

The script finds the `Spotify.exe` process, gets its window handle (including hidden windows, via `DetectHiddenWindows`) and sends the Windows `WM_APPCOMMAND` message directly to it. This is the same command sent by the media keys on a keyboard.

| Action | `APPCOMMAND` code |
|---|---|
| Next track | `0xB0000` |
| Previous track | `0xC0000` |
| Play / Pause | `0xE0000` |

Because the message goes straight to Spotify, the shortcuts don't interfere with other media players you may have open (browser, YouTube, etc.).

---

## 🛠️ Customizing the shortcuts

The hotkeys are defined at the top of `Main.ahk`:

```ahk
!^Left::SpotifyPlaybackPrevious
!^Space::SpotifyPlaybackPlayPause
!^Right::SpotifyPlaybackNext
```

AutoHotkey modifier symbols:

| Symbol | Key |
|---|---|
| `^` | Ctrl |
| `!` | Alt |
| `+` | Shift |
| `#` | Win |

Example: to use `Win` + `Shift` + `P` for Play/Pause:

```ahk
#+p::SpotifyPlaybackPlayPause
```

---

## 📁 Project structure

```
AHK-SpotifyControl/
├── Main.ahk    # Main script: hotkeys and commands sent to Spotify
└── Audio.ahk   # Windows Core Audio API library (by thqby)
```

---

## 🙏 Credits

- **[thqby](https://github.com/thqby)**: author of the `Audio.ahk` library (Core Audio APIs for AutoHotkey v2).
- **[Samuel Schutz](https://github.com/SamuelSchutz13)**: project author.

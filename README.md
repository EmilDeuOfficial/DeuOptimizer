# DeuOptimizer

A Windows 11 optimization tool with a clean terminal UI — built entirely in Batch + PowerShell. No installs, no dependencies, just run as Administrator.

![Version](https://img.shields.io/badge/version-v3.1-brightgreen)
![Platform](https://img.shields.io/badge/platform-Windows%2011-blue)
![Language](https://img.shields.io/badge/shell-Batch%20%2B%20PowerShell-lightgrey)
![Languages](https://img.shields.io/badge/languages-6-orange)

---

## Features

- **Quick Boost** — One-click optimization: telemetry, startup, visual effects, RAM, temp files
- **Services Manager** — Disable/re-enable background services (DiagTrack, SysMain, Xbox, etc.)
- **Privacy Tweaks** — Telemetry level, Cortana, Advertising ID, Activity History, Feedback
- **Gaming Mode** — Game Mode, Ultimate Power Plan, HAGS, Nagle Algorithm, Mouse Acceleration, GameDVR
- **Network Boost** — DNS flush, Winsock reset, QoS, TCP optimization, Network Throttling
- **Aggression Levels** — ECO (safe) / TURBO (extended) / NUKE (maximum, aggressive)
- **Full Reset** — Reverts all applied changes back to Windows defaults
- **Action Log** — Every change is logged with timestamp
- **6 Languages** — Deutsch, English, Español, Français, Русский, 中文

---

## Requirements

- Windows 11
- **Run as Administrator** (required for registry and service changes)

---

## Usage

1. Download `DeuOptimizer.bat`
2. Right-click → **Run as Administrator**
3. Select your language on first launch
4. Navigate with number keys, confirm with `R + number`

> All changes can be reverted via **Reset All** or individual undo options.

---

## File Structure

```
DeuOptimizer.bat        ← main script
data\
  lang\
    DE.txt              ← German
    EN.txt              ← English
    ES.txt              ← Spanish
    FR.txt              ← French
    RU.txt              ← Russian (UTF-8)
    ZH.txt              ← Chinese Simplified (UTF-8)
  DeuOptimizer_Log.txt  ← action log (auto-created)
  DeuOptimizer_Lang.cfg ← language preference (auto-created)
  DeuOptimizer_Level.cfg← aggression level (auto-created)
```

---

## Changelog

### v3.1
- Added French (Français) and Russian (Русский) language support
- Fixed non-Latin script rendering in language selection menu
- Universal UTF-8 loading for all language files

### v3.0
- Language strings moved to external `data\lang\` files
- Added Spanish and Chinese (Simplified) language support
- All data files now stored in `data\` subfolder
- Aggression level persists across restarts
- Fixed font issue caused by UTF-8 code page switch
- Smooth ANSI RGB gradient banner
- Reset All now checks log before running

### v2.6
- Initial public version

---

## License

MIT — free to use, modify, and distribute.

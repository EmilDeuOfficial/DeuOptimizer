# DeuOptimizer

A Windows 11 optimization tool with a clean terminal UI — built entirely in Batch + PowerShell. No installs, no dependencies, just run as Administrator.

![Version](https://img.shields.io/badge/version-v3.2-brightgreen)
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
- **Restore Point** — Creates a Windows System Restore Point before applying changes
- **Full Reset** — Reverts all applied changes back to Windows defaults
- **Action Log** — Every change is logged with timestamp
- **System Info** — Live overview of OS, CPU, GPU, RAM and CPU load
- **6 Languages** — Deutsch, English, Español, Français, Русский, 中文

---

## Benchmark

Tested on Windows 11 (idle, same system, same conditions):

| Metric | Before | After | Improvement |
|---|---|---|---|
| CPU Load | 6% | 2–3% | ~60% less |
| CPU Clock | 1.60 GHz | 3.99 GHz | +149% |
| Processes | 195 | 180 | −15 |
| Threads | 3280 | 3220 | −60 |
| Handles | 80500 | 79850 | −650 |

> The clock speed difference is the most significant — Windows was throttling the CPU in its default power plan. With the Ultimate Power Plan applied, the processor runs at full speed.

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
DeuOptimizer.bat         ← main script
data\
  lang\
    DE.txt               ← German
    EN.txt               ← English
    ES.txt               ← Spanish
    FR.txt               ← French
    RU.txt               ← Russian (UTF-8)
    ZH.txt               ← Chinese Simplified (UTF-8)
  DeuOptimizer_Log.txt   ← action log (auto-created)
  DeuOptimizer_Lang.cfg  ← language preference (auto-created)
  DeuOptimizer_Level.cfg ← aggression level (auto-created)
```

---

## Changelog

### v3.2
- Added Create Restore Point option ([8] in main menu)
- Added GPU info to System Info screen
- Dynamic label alignment in System Info (works correctly for all languages including CJK)
- English moved to top of language selection
- Window height auto-fitted to main menu content

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

@echo off
setlocal EnableDelayedExpansion

title DeuOptimizer v3.0 - by Emil_Deu

if not exist "%~dp0data\" mkdir "%~dp0data\" >nul 2>&1
if not exist "%~dp0data\lang\" mkdir "%~dp0data\lang\" >nul 2>&1
if exist "%~dp0DeuOptimizer_Log.txt"  move "%~dp0DeuOptimizer_Log.txt"  "%~dp0data\" >nul 2>&1
if exist "%~dp0DeuOptimizer_Lang.cfg" move "%~dp0DeuOptimizer_Lang.cfg" "%~dp0data\" >nul 2>&1

set "LOGFILE=%~dp0data\DeuOptimizer_Log.txt"
set "LANGFILE=%~dp0data\DeuOptimizer_Lang.cfg"
set "LEVELFILE=%~dp0data\DeuOptimizer_Level.cfg"
set "LANGDIR=%~dp0data\lang"

net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -NoProfile -Command "Write-Host '[ERROR] Administrator rights required!' -ForegroundColor Red; Write-Host 'Right-click > Run as Administrator' -ForegroundColor Yellow"
    pause
    exit /b 1
)

set "LANG=DE"
if exist "!LANGFILE!" (
    for /f "usebackq tokens=2 delims==" %%L in ("!LANGFILE!") do set "LANG=%%L"
) else (
    call :SELECT_LANG
)

call :LOAD_STRINGS

set "LEVEL=1"
set "LEVEL_NAME=ECO"
if exist "!LEVELFILE!" (
    for /f "usebackq tokens=1,2 delims==" %%A in ("!LEVELFILE!") do (
        if "%%A"=="LEVEL" set "LEVEL=%%B"
        if "%%A"=="LEVEL_NAME" set "LEVEL_NAME=%%B"
    )
)
call :LOG_INIT

:: ============================================================
:MAIN_MENU
:: ============================================================
cls
powershell -NoProfile -Command "$b='ICDilojilojilojilojilojilojilZcg4paI4paI4paI4paI4paI4paI4paI4pWX4paI4paI4pWXICAg4paI4paI4pWXIOKWiOKWiOKWiOKWiOKWiOKWiOKVlyDilojilojilojilojilojilojilZcg4paI4paI4paI4paI4paI4paI4paI4paI4pWX4paI4paI4pWX4paI4paI4paI4pWXICAg4paI4paI4paI4pWX4paI4paI4pWX4paI4paI4paI4paI4paI4paI4paI4pWX4paI4paI4paI4paI4paI4paI4paI4pWX4paI4paI4paI4paI4paI4paI4pWXIAogIOKWiOKWiOKVlOKVkOKVkOKWiOKWiOKVl+KWiOKWiOKVlOKVkOKVkOKVkOKVkOKVneKWiOKWiOKVkSAgIOKWiOKWiOKVkeKWiOKWiOKVlOKVkOKVkOKVkOKWiOKWiOKVl+KWiOKWiOKVlOKVkOKVkOKWiOKWiOKVl+KVmuKVkOKVkOKWiOKWiOKVlOKVkOKVkOKVneKWiOKWiOKVkeKWiOKWiOKWiOKWiOKVlyDilojilojilojilojilZHilojilojilZHilZrilZDilZDilojilojilojilZTilZ3ilojilojilZTilZDilZDilZDilZDilZ3ilojilojilZTilZDilZDilojilojilZcKICDilojilojilZEgIOKWiOKWiOKVkeKWiOKWiOKWiOKWiOKWiOKVlyAg4paI4paI4pWRICAg4paI4paI4pWR4paI4paI4pWRICAg4paI4paI4pWR4paI4paI4paI4paI4paI4paI4pWU4pWdICAg4paI4paI4pWRICAg4paI4paI4pWR4paI4paI4pWU4paI4paI4paI4paI4pWU4paI4paI4pWR4paI4paI4pWRICDilojilojilojilZTilZ0g4paI4paI4paI4paI4paI4pWXICDilojilojilojilojilojilojilZTilZ0KICDilojilojilZEgIOKWiOKWiOKVkeKWiOKWiOKVlOKVkOKVkOKVnSAg4paI4paI4pWRICAg4paI4paI4pWR4paI4paI4pWRICAg4paI4paI4pWR4paI4paI4pWU4pWQ4pWQ4pWQ4pWdICAgIOKWiOKWiOKVkSAgIOKWiOKWiOKVkeKWiOKWiOKVkeKVmuKWiOKWiOKVlOKVneKWiOKWiOKVkeKWiOKWiOKVkSDilojilojilojilZTilZ0gIOKWiOKWiOKVlOKVkOKVkOKVnSAg4paI4paI4pWU4pWQ4pWQ4paI4paI4pWXCiAg4paI4paI4paI4paI4paI4paI4pWU4pWd4paI4paI4paI4paI4paI4paI4paI4pWX4pWa4paI4paI4paI4paI4paI4paI4pWU4pWd4pWa4paI4paI4paI4paI4paI4paI4pWU4pWd4paI4paI4pWRICAgICAgICDilojilojilZEgICDilojilojilZHilojilojilZEg4pWa4pWQ4pWdIOKWiOKWiOKVkeKWiOKWiOKVkeKWiOKWiOKWiOKWiOKWiOKWiOKWiOKVl+KWiOKWiOKWiOKWiOKWiOKWiOKWiOKVl+KWiOKWiOKVkSAg4paI4paI4pWRCiAg4pWa4pWQ4pWQ4pWQ4pWQ4pWQ4pWdIOKVmuKVkOKVkOKVkOKVkOKVkOKVkOKVnSDilZrilZDilZDilZDilZDilZDilZ0gIOKVmuKVkOKVkOKVkOKVkOKVkOKVnSDilZrilZDilZ0gICAgICAgIOKVmuKVkOKVnSAgIOKVmuKVkOKVneKVmuKVkOKVnSAgICAg4pWa4pWQ4pWd4pWa4pWQ4pWd4pWa4pWQ4pWQ4pWQ4pWQ4pWQ4pWQ4pWd4pWa4pWQ4pWQ4pWQ4pWQ4pWQ4pWQ4pWd4pWa4pWQ4pWdICDilZrilZDilZ0='; $lines=[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($b)).Split([char]10); $e=[char]27; $w=$Host.UI.RawUI.WindowSize.Width; Write-Host; Write-Host; $i=0; foreach($l in $lines){$tc=$l.TrimEnd([char]13).Trim(); if($tc.Length -gt 0){$r=$i*51; $pad=[Math]::Max(0,[int](($w-$tc.Length)/2)); $sp=' '*$pad; Write-Host ($e.ToString()+'[38;2;'+$r+';255;0m'+$sp+$tc+$e.ToString()+'[0m'); $i++}}; Write-Host; Write-Host"
powershell -NoProfile -Command "Write-Host '   [1]  !M_1!' -NoNewline -ForegroundColor Cyan; Write-Host ' - !M_1D!' -ForegroundColor DarkGray; Write-Host '   [2]  !M_2!' -NoNewline -ForegroundColor Cyan; Write-Host ' - !M_2D!' -ForegroundColor DarkGray; Write-Host '   [3]  !M_3!' -NoNewline -ForegroundColor Cyan; Write-Host ' - !M_3D!' -ForegroundColor DarkGray; Write-Host '   [4]  !M_4!' -NoNewline -ForegroundColor Cyan; Write-Host ' - !M_4D!' -ForegroundColor DarkGray; Write-Host '   [5]  !M_5!' -NoNewline -ForegroundColor Cyan; Write-Host ' - !M_5D!' -ForegroundColor DarkGray; Write-Host '   [6]  !M_6!' -NoNewline -ForegroundColor Cyan; Write-Host ' - !M_6D!' -NoNewline -ForegroundColor DarkGray; Write-Host '!LEVEL_NAME!' -ForegroundColor Green; Write-Host '   [7]  !M_7!' -ForegroundColor Cyan; Write-Host '   [8]  !M_8!' -ForegroundColor Yellow; Write-Host '   [9]  !M_9!' -ForegroundColor DarkGray; Write-Host; Write-Host '   [0]  !M_0!' -ForegroundColor DarkGray; Write-Host"
call :READ_KEY
set "CHOICE=!INPUT_VAL!"

if "!CHOICE!"=="1" goto QUICK_BOOST
if "!CHOICE!"=="2" goto SERVICES
if "!CHOICE!"=="3" goto PRIVACY
if "!CHOICE!"=="4" goto GAMING
if "!CHOICE!"=="5" goto NETWORK
if "!CHOICE!"=="6" goto SET_LEVEL
if "!CHOICE!"=="7" goto SYSINFO
if "!CHOICE!"=="8" goto RESTORE_ALL
if "!CHOICE!"=="9" goto SHOW_LOG
if "!CHOICE!"=="0" goto EXIT
goto MAIN_MENU

:: ============================================================
:SET_LEVEL
:: ============================================================
cls
powershell -NoProfile -Command "Write-Host; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host '    !SL_TITLE!' -ForegroundColor White; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host; Write-Host '   [1]  ECO   ' -NoNewline -ForegroundColor Green; Write-Host ' - !SL_ECO_D!' -ForegroundColor DarkGray; Write-Host '          !SL_ECO_I!' -ForegroundColor DarkGray; Write-Host; Write-Host '   [2]  TURBO ' -NoNewline -ForegroundColor Yellow; Write-Host ' - !SL_TUR_D!' -ForegroundColor DarkGray; Write-Host '          !SL_TUR_I!' -ForegroundColor DarkGray; Write-Host; Write-Host '   [3]  NUKE  ' -NoNewline -ForegroundColor Red; Write-Host ' - !SL_NUK_D!' -ForegroundColor DarkGray; Write-Host '          !SL_NUK_I!' -ForegroundColor DarkGray; Write-Host '          !SL_NUK_W!' -ForegroundColor Red; Write-Host; Write-Host '   [0]  !C_BACK!' -ForegroundColor DarkGray; Write-Host"
call :READ_KEY
set "LVL=!INPUT_VAL!"

if "!LVL!"=="1" ( set "LEVEL=1" & set "LEVEL_NAME=ECO"   & call :SAVE_LEVEL & goto MAIN_MENU )
if "!LVL!"=="2" ( set "LEVEL=2" & set "LEVEL_NAME=TURBO" & call :SAVE_LEVEL & goto MAIN_MENU )
if "!LVL!"=="3" ( set "LEVEL=3" & set "LEVEL_NAME=NUKE"  & call :SAVE_LEVEL & goto MAIN_MENU )
if "!LVL!"=="0" goto MAIN_MENU
goto SET_LEVEL

:: ============================================================
:QUICK_BOOST
:: ============================================================
cls
powershell -NoProfile -Command "Write-Host; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host '    !QB_TITLE! !LEVEL_NAME!' -ForegroundColor White; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host; Write-Host '   --- !C_APPLY! ---' -ForegroundColor DarkGray; Write-Host '   [1]  !QB_1!' -NoNewline -ForegroundColor Cyan; Write-Host '  (!QB_1X!)' -ForegroundColor DarkGray; Write-Host '   [2]  !QB_2!' -ForegroundColor Cyan; Write-Host '   [3]  !QB_3!' -ForegroundColor Cyan; Write-Host '   [4]  !QB_4!' -ForegroundColor Cyan; Write-Host '   [5]  !QB_5!' -ForegroundColor Cyan; Write-Host '   [6]  !QB_6!' -ForegroundColor Cyan; Write-Host; Write-Host '   --- !C_UNDO! ---' -ForegroundColor DarkGray; Write-Host '   [R1] !QB_R1!' -ForegroundColor Yellow; Write-Host '   [R2] !QB_R2!' -ForegroundColor Yellow; Write-Host '   [R3] !QB_R3!' -ForegroundColor Yellow; Write-Host; Write-Host '   [0]  !C_BACK!' -ForegroundColor DarkGray; Write-Host"
call :READ_KEY
set "QB=!INPUT_VAL!"

if /i "!QB!"=="0"  goto MAIN_MENU
if /i "!QB!"=="1"  goto QB_ALL
if /i "!QB!"=="2"  ( call :DO_TELEMETRY    & call :DONE_MSG & goto QUICK_BOOST )
if /i "!QB!"=="3"  ( call :DO_STARTUP      & call :DONE_MSG & goto QUICK_BOOST )
if /i "!QB!"=="4"  ( call :DO_VISUAL       & call :DONE_MSG & goto QUICK_BOOST )
if /i "!QB!"=="5"  ( call :DO_RAM          & call :DONE_MSG & goto QUICK_BOOST )
if /i "!QB!"=="6"  ( call :DO_TEMP         & call :DONE_MSG & goto QUICK_BOOST )
if /i "!QB!"=="R1" ( call :UNDO_TELEMETRY  & call :DONE_MSG & goto QUICK_BOOST )
if /i "!QB!"=="R2" ( call :UNDO_STARTUP    & call :DONE_MSG & goto QUICK_BOOST )
if /i "!QB!"=="R3" ( call :UNDO_VISUAL     & call :DONE_MSG & goto QUICK_BOOST )
goto QUICK_BOOST

:QB_ALL
call :DO_TELEMETRY
call :DO_VISUAL
call :DO_RAM
call :DO_TEMP
if !LEVEL! GEQ 2 call :DO_SERVICES_BASIC
if !LEVEL! GEQ 3 call :DO_NUKE
call :DONE_MSG
goto QUICK_BOOST

:: ============================================================
:SERVICES
:: ============================================================
cls
powershell -NoProfile -Command "Write-Host; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host '    !SV_TITLE!' -ForegroundColor White; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host; Write-Host '   --- !C_DISABLE! ---' -ForegroundColor DarkGray; Write-Host '   [1]  DiagTrack       ' -NoNewline -ForegroundColor Cyan; Write-Host '!SV_1D!' -ForegroundColor DarkGray; Write-Host '   [2]  SysMain         ' -NoNewline -ForegroundColor Cyan; Write-Host '!SV_2D!' -ForegroundColor DarkGray; Write-Host '   [3]  Windows Search  ' -NoNewline -ForegroundColor Cyan; Write-Host '!SV_3D!' -ForegroundColor DarkGray; Write-Host '   [4]  !SV_4!' -ForegroundColor Cyan; Write-Host '   [5]  BITS            ' -NoNewline -ForegroundColor Cyan; Write-Host '!SV_5D!' -ForegroundColor DarkGray; Write-Host '   [6]  !SV_6!' -NoNewline -ForegroundColor Cyan; Write-Host '!SV_6D!' -ForegroundColor DarkGray; Write-Host '   [7]  !SV_7!' -ForegroundColor Cyan; Write-Host; Write-Host '   --- !C_REENABLE! ---' -ForegroundColor DarkGray; Write-Host '   [R1] DiagTrack  [R2] SysMain  [R3] Win Search' -ForegroundColor Yellow; Write-Host '   [R4] Xbox       [R5] BITS     [R6] !SV_6!' -ForegroundColor Yellow; Write-Host '   [R7] !SV_R7!' -ForegroundColor Yellow; Write-Host; Write-Host '   [0]  !C_BACK!' -ForegroundColor DarkGray; Write-Host"
call :READ_KEY
set "SVC=!INPUT_VAL!"

if /i "!SVC!"=="0"  goto MAIN_MENU
if /i "!SVC!"=="1"  ( call :SVC_OFF DiagTrack      & call :DONE_MSG & goto SERVICES )
if /i "!SVC!"=="2"  ( call :SVC_OFF SysMain        & call :DONE_MSG & goto SERVICES )
if /i "!SVC!"=="3"  ( call :SVC_OFF WSearch        & call :DONE_MSG & goto SERVICES )
if /i "!SVC!"=="4"  ( call :SVC_OFF XblAuthManager & call :SVC_OFF XblGameSave & call :SVC_OFF XboxNetApiSvc & call :DONE_MSG & goto SERVICES )
if /i "!SVC!"=="5"  ( call :SVC_OFF BITS           & call :DONE_MSG & goto SERVICES )
if /i "!SVC!"=="6"  ( call :SVC_OFF Spooler        & call :DONE_MSG & goto SERVICES )
if /i "!SVC!"=="7"  ( call :DO_SERVICES_BASIC      & call :DONE_MSG & goto SERVICES )
if /i "!SVC!"=="R1" ( call :SVC_ON DiagTrack       & call :DONE_MSG & goto SERVICES )
if /i "!SVC!"=="R2" ( call :SVC_ON SysMain         & call :DONE_MSG & goto SERVICES )
if /i "!SVC!"=="R3" ( call :SVC_ON WSearch         & call :DONE_MSG & goto SERVICES )
if /i "!SVC!"=="R4" ( call :SVC_ON XblAuthManager  & call :SVC_ON XblGameSave & call :SVC_ON XboxNetApiSvc & call :DONE_MSG & goto SERVICES )
if /i "!SVC!"=="R5" ( call :SVC_ON BITS            & call :DONE_MSG & goto SERVICES )
if /i "!SVC!"=="R6" ( call :SVC_ON Spooler         & call :DONE_MSG & goto SERVICES )
if /i "!SVC!"=="R7" ( call :DO_RESTORE_SERVICES    & call :DONE_MSG & goto SERVICES )
goto SERVICES

:: ============================================================
:PRIVACY
:: ============================================================
cls
powershell -NoProfile -Command "Write-Host; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host '    !PR_TITLE!' -ForegroundColor White; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host; Write-Host '   --- !C_APPLY! ---' -ForegroundColor DarkGray; Write-Host '   [1]  !PR_1!' -ForegroundColor Cyan; Write-Host '   [2]  !PR_2!' -ForegroundColor Cyan; Write-Host '   [3]  !PR_3!' -ForegroundColor Cyan; Write-Host '   [4]  !PR_4!' -ForegroundColor Cyan; Write-Host '   [5]  !PR_5!' -ForegroundColor Cyan; Write-Host '   [6]  !PR_6!' -ForegroundColor Cyan; Write-Host; Write-Host '   --- !C_UNDO! ---' -ForegroundColor DarkGray; Write-Host '   [R1] !PR_R1!  [R2] !PR_R2!' -ForegroundColor Yellow; Write-Host '   [R3] !PR_R3!  [R4] !PR_R4!' -ForegroundColor Yellow; Write-Host '   [R5] !PR_R5!  [R6] !PR_R6!' -ForegroundColor Yellow; Write-Host; Write-Host '   [0]  !C_BACK!' -ForegroundColor DarkGray; Write-Host"
call :READ_KEY
set "PRV=!INPUT_VAL!"

if /i "!PRV!"=="0"  goto MAIN_MENU
if /i "!PRV!"=="1"  ( call :DO_TELE_REG    & call :DONE_MSG & goto PRIVACY )
if /i "!PRV!"=="2"  ( call :DO_CORTANA     & call :DONE_MSG & goto PRIVACY )
if /i "!PRV!"=="3"  ( call :DO_ADID        & call :DONE_MSG & goto PRIVACY )
if /i "!PRV!"=="4"  ( call :DO_ACTIVITY    & call :DONE_MSG & goto PRIVACY )
if /i "!PRV!"=="5"  ( call :DO_FEEDBACK    & call :DONE_MSG & goto PRIVACY )
if /i "!PRV!"=="6"  ( call :DO_TELE_REG & call :DO_CORTANA & call :DO_ADID & call :DO_ACTIVITY & call :DO_FEEDBACK & call :DONE_MSG & goto PRIVACY )
if /i "!PRV!"=="R1" ( call :UNDO_TELE_REG  & call :DONE_MSG & goto PRIVACY )
if /i "!PRV!"=="R2" ( call :UNDO_CORTANA   & call :DONE_MSG & goto PRIVACY )
if /i "!PRV!"=="R3" ( call :UNDO_ADID      & call :DONE_MSG & goto PRIVACY )
if /i "!PRV!"=="R4" ( call :UNDO_ACTIVITY  & call :DONE_MSG & goto PRIVACY )
if /i "!PRV!"=="R5" ( call :UNDO_FEEDBACK  & call :DONE_MSG & goto PRIVACY )
if /i "!PRV!"=="R6" ( call :UNDO_TELE_REG & call :UNDO_CORTANA & call :UNDO_ADID & call :UNDO_ACTIVITY & call :UNDO_FEEDBACK & call :DONE_MSG & goto PRIVACY )
goto PRIVACY

:: ============================================================
:GAMING
:: ============================================================
cls
powershell -NoProfile -Command "Write-Host; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host '    !GM_TITLE!' -ForegroundColor White; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host; Write-Host '   --- !C_APPLY! ---' -ForegroundColor DarkGray; Write-Host '   [1]  !GM_1!' -ForegroundColor Cyan; Write-Host '   [2]  !GM_2!' -ForegroundColor Cyan; Write-Host '   [3]  !GM_3! ' -NoNewline -ForegroundColor Cyan; Write-Host '!GM_3D!' -ForegroundColor DarkGray; Write-Host '   [4]  !GM_4!' -ForegroundColor Cyan; Write-Host '   [5]  !GM_5!' -ForegroundColor Cyan; Write-Host '   [6]  !GM_6!' -ForegroundColor Cyan; Write-Host '   [7]  !GM_7!' -ForegroundColor Cyan; Write-Host; Write-Host '   --- !C_UNDO! ---' -ForegroundColor DarkGray; Write-Host '   [R1] !GM_R1!   [R2] !GM_R2!' -ForegroundColor Yellow; Write-Host '   [R3] !GM_R3!        [R4] !GM_R4!' -ForegroundColor Yellow; Write-Host '   [R5] !GM_R5!   [R6] !GM_R6!' -ForegroundColor Yellow; Write-Host '   [R7] !GM_R7!' -ForegroundColor Yellow; Write-Host; Write-Host '   [0]  !C_BACK!' -ForegroundColor DarkGray; Write-Host"
call :READ_KEY
set "GM=!INPUT_VAL!"

if /i "!GM!"=="0"  goto MAIN_MENU
if /i "!GM!"=="1"  ( call :DO_GAMEMODE    & call :DONE_MSG & goto GAMING )
if /i "!GM!"=="2"  ( call :DO_POWERPLAN   & call :DONE_MSG & goto GAMING )
if /i "!GM!"=="3"  ( call :DO_HAGS        & call :DONE_MSG & goto GAMING )
if /i "!GM!"=="4"  ( call :DO_NAGLE       & call :DONE_MSG & goto GAMING )
if /i "!GM!"=="5"  ( call :DO_MOUSEACCEL  & call :DONE_MSG & goto GAMING )
if /i "!GM!"=="6"  ( call :DO_GAMEDVR     & call :DONE_MSG & goto GAMING )
if /i "!GM!"=="7"  ( call :DO_GAMEMODE & call :DO_POWERPLAN & call :DO_HAGS & call :DO_NAGLE & call :DO_MOUSEACCEL & call :DO_GAMEDVR & call :DONE_MSG & goto GAMING )
if /i "!GM!"=="R1" ( call :UNDO_GAMEMODE   & call :DONE_MSG & goto GAMING )
if /i "!GM!"=="R2" ( call :UNDO_POWERPLAN  & call :DONE_MSG & goto GAMING )
if /i "!GM!"=="R3" ( call :UNDO_HAGS       & call :DONE_MSG & goto GAMING )
if /i "!GM!"=="R4" ( call :UNDO_NAGLE      & call :DONE_MSG & goto GAMING )
if /i "!GM!"=="R5" ( call :UNDO_MOUSEACCEL & call :DONE_MSG & goto GAMING )
if /i "!GM!"=="R6" ( call :UNDO_GAMEDVR    & call :DONE_MSG & goto GAMING )
if /i "!GM!"=="R7" ( call :UNDO_GAMEMODE & call :UNDO_POWERPLAN & call :UNDO_HAGS & call :UNDO_NAGLE & call :UNDO_MOUSEACCEL & call :UNDO_GAMEDVR & call :DONE_MSG & goto GAMING )
goto GAMING

:: ============================================================
:NETWORK
:: ============================================================
cls
powershell -NoProfile -Command "Write-Host; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host '    !NT_TITLE!' -ForegroundColor White; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host; Write-Host '   --- !C_APPLY! ---' -ForegroundColor DarkGray; Write-Host '   [1]  !NT_1!' -ForegroundColor Cyan; Write-Host '   [2]  !NT_2!' -ForegroundColor Cyan; Write-Host '   [3]  !NT_3!' -ForegroundColor Cyan; Write-Host '   [4]  !NT_4!' -ForegroundColor Cyan; Write-Host '   [5]  !NT_5!' -ForegroundColor Cyan; Write-Host '   [6]  !NT_6!' -ForegroundColor Cyan; Write-Host; Write-Host '   --- !C_UNDO! ---' -ForegroundColor DarkGray; Write-Host '   [R3] !NT_R3!   [R4] !NT_R4!' -ForegroundColor Yellow; Write-Host '   [R5] !NT_R5!  [R6] !NT_R6!' -ForegroundColor Yellow; Write-Host; Write-Host '   [0]  !C_BACK!' -ForegroundColor DarkGray; Write-Host"
call :READ_KEY
set "NET=!INPUT_VAL!"

if /i "!NET!"=="0"  goto MAIN_MENU
if /i "!NET!"=="1"  ( call :DO_DNS           & call :DONE_MSG & goto NETWORK )
if /i "!NET!"=="2"  ( call :DO_WINSOCK       & call :DONE_MSG & goto NETWORK )
if /i "!NET!"=="3"  ( call :DO_QOS           & call :DONE_MSG & goto NETWORK )
if /i "!NET!"=="4"  ( call :DO_TCP           & call :DONE_MSG & goto NETWORK )
if /i "!NET!"=="5"  ( call :DO_NET_THROTTLE  & call :DONE_MSG & goto NETWORK )
if /i "!NET!"=="6"  ( call :DO_DNS & call :DO_WINSOCK & call :DO_QOS & call :DO_TCP & call :DO_NET_THROTTLE & call :DONE_MSG & goto NETWORK )
if /i "!NET!"=="R3" ( call :UNDO_QOS          & call :DONE_MSG & goto NETWORK )
if /i "!NET!"=="R4" ( call :UNDO_TCP          & call :DONE_MSG & goto NETWORK )
if /i "!NET!"=="R5" ( call :UNDO_NET_THROTTLE & call :DONE_MSG & goto NETWORK )
if /i "!NET!"=="R6" ( call :UNDO_QOS & call :UNDO_TCP & call :UNDO_NET_THROTTLE & call :DONE_MSG & goto NETWORK )
goto NETWORK

:: ============================================================
:RESTORE_ALL
:: ============================================================
cls
set "_TEMP2=%~dp0._rc.tmp"
powershell -NoProfile -Command "$f='!LOGFILE!'; $r=0; if(Test-Path $f){$lines=[System.IO.File]::ReadAllLines($f,[System.Text.Encoding]::Default); $last=-1; for($j=$lines.Length-1;$j -ge 0;$j--){if($lines[$j] -match '\[RESTORE\]'){$last=$j;break}}; for($k=$last+1;$k -lt $lines.Length;$k++){if($lines[$k] -match '\[APPLY\]'){$r=1;break}}}; [System.IO.File]::WriteAllText('!_TEMP2!',([string]$r),[System.Text.Encoding]::ASCII)" 2>nul
set "_DO_RESET=0"
if exist "!_TEMP2!" (
    set /p "_DO_RESET=" < "!_TEMP2!"
    del "!_TEMP2!" >nul 2>&1
)
if "!_DO_RESET!"=="0" (
    powershell -NoProfile -Command "Write-Host; Write-Host '  !RA_NOTHING!' -ForegroundColor Yellow"
    timeout /t 2 /nobreak >nul
    goto MAIN_MENU
)
powershell -NoProfile -Command "Write-Host; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host '    !RA_TITLE!' -ForegroundColor Red; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host; Write-Host '   !RA_MSG!' -ForegroundColor White; Write-Host; Write-Host '   [R]  !RA_YES!' -ForegroundColor Yellow; Write-Host '         !RA_HINT!' -ForegroundColor DarkGray; Write-Host '   [0]  !RA_NO!' -ForegroundColor DarkGray; Write-Host"
call :READ_KEY
set "RA=!INPUT_VAL!"
set "RA_FIRST=!RA:~0,1!"
if /i "!RA_FIRST!"=="R" goto RA_DO
goto MAIN_MENU

:RA_DO
powershell -NoProfile -Command "Write-Host; Write-Host '  !RA_DO_MSG!' -ForegroundColor Yellow; Write-Host '  ------------------------------------------' -ForegroundColor DarkGray"
call :UNDO_TELEMETRY
call :UNDO_VISUAL
call :UNDO_TELE_REG
call :UNDO_CORTANA
call :UNDO_ADID
call :UNDO_ACTIVITY
call :UNDO_FEEDBACK
call :UNDO_GAMEMODE
call :UNDO_POWERPLAN
call :UNDO_HAGS
call :UNDO_NAGLE
call :UNDO_MOUSEACCEL
call :UNDO_GAMEDVR
call :UNDO_QOS
call :UNDO_TCP
call :UNDO_NET_THROTTLE
call :DO_RESTORE_SERVICES
powershell -NoProfile -Command "$f='!LOGFILE!'; if(Test-Path $f){$lines=[System.IO.File]::ReadAllLines($f,[System.Text.Encoding]::Default); $idx=-1; for($j=$lines.Length-1;$j -ge 0;$j--){if($lines[$j] -match '\[RESTORE\]'){$idx=$j;break}}; if($idx -ge 0){[System.IO.File]::WriteAllLines($f,$lines[0..$idx],[System.Text.Encoding]::Default)}else{if($lines.Length -ge 3){[System.IO.File]::WriteAllLines($f,$lines[0..2],[System.Text.Encoding]::Default)}}}" 2>nul
call :LOG "RESTORE" "Full system reset"
call :DONE_MSG
goto MAIN_MENU

:: ============================================================
:SHOW_LOG
:: ============================================================
cls
powershell -NoProfile -Command "Write-Host; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host '    !LG_TITLE!' -ForegroundColor White; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host"
if not exist "!LOGFILE!" (
    powershell -NoProfile -Command "Write-Host '   !LG_EMPTY!' -ForegroundColor DarkGray"
) else (
    type "!LOGFILE!"
)
powershell -NoProfile -Command "Write-Host; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host; Write-Host '   [C]  !LG_CLEAR!' -ForegroundColor Red; Write-Host '   [0]  !C_BACK!' -ForegroundColor DarkGray; Write-Host"
call :READ_KEY
set "SL=!INPUT_VAL!"
if /i "!SL!"=="C" (
    del "!LOGFILE!" >nul 2>&1
    call :LOG_INIT
    powershell -NoProfile -Command "Write-Host '   !LG_CLEARED!' -ForegroundColor Green"
    timeout /t 1 >nul
)
goto MAIN_MENU

:: ============================================================
:SYSINFO
:: ============================================================
cls
powershell -NoProfile -Command "Write-Host; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host '    !SI_TITLE!' -ForegroundColor White; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host; $os=(Get-CimInstance Win32_OperatingSystem); $cpu=(Get-CimInstance Win32_Processor); $cs=(Get-CimInstance Win32_ComputerSystem); Write-Host ('   OS:        ' + $os.Caption) -ForegroundColor Gray; Write-Host ('   CPU:       ' + $cpu.Name) -ForegroundColor Gray; Write-Host ('   !SI_RAMF!' + [math]::Round($os.FreePhysicalMemory/1024) + ' MB') -ForegroundColor Green; Write-Host ('   !SI_RAMT!' + [math]::Round($cs.TotalPhysicalMemory/1GB,1) + ' GB') -ForegroundColor Gray; Write-Host ('   !SI_CPUL!' + $cpu.LoadPercentage + '%%') -ForegroundColor Yellow; Write-Host; Write-Host '  ==========================================' -ForegroundColor DarkGray; Write-Host; Write-Host '   [0]  !C_BACK!' -ForegroundColor DarkGray; Write-Host"
call :READ_KEY
goto MAIN_MENU

:: ============================================================
:: ======  LANGUAGE SELECTION  ================================
:: ============================================================

:SELECT_LANG
cls
powershell -NoProfile -EncodedCommand VwByAGkAdABlAC0ASABvAHMAdAA7ACAAVwByAGkAdABlAC0ASABvAHMAdAAgACcAIAAgAD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9ACcAIAAtAEYAbwByAGUAZwByAG8AdQBuAGQAQwBvAGwAbwByACAARABhAHIAawBHAHIAYQB5ADsAIABXAHIAaQB0AGUALQBIAG8AcwB0ACAAJwAgACAAIAAgAEwAQQBOAEcAVQBBAEcARQAnACAALQBGAG8AcgBlAGcAcgBvAHUAbgBkAEMAbwBsAG8AcgAgAFcAaABpAHQAZQA7ACAAVwByAGkAdABlAC0ASABvAHMAdAAgACcAIAAgAD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9ACcAIAAtAEYAbwByAGUAZwByAG8AdQBuAGQAQwBvAGwAbwByACAARABhAHIAawBHAHIAYQB5ADsAIABXAHIAaQB0AGUALQBIAG8AcwB0ADsAIABXAHIAaQB0AGUALQBIAG8AcwB0ACAAJwAgACAAIABbADEAXQAgACAARABlAHUAdABzAGMAaAAnACAALQBGAG8AcgBlAGcAcgBvAHUAbgBkAEMAbwBsAG8AcgAgAEMAeQBhAG4AOwAgAFcAcgBpAHQAZQAtAEgAbwBzAHQAIAAnACAAIAAgAFsAMgBdACAAIABFAG4AZwBsAGkAcwBoACcAIAAtAEYAbwByAGUAZwByAG8AdQBuAGQAQwBvAGwAbwByACAAQwB5AGEAbgA7ACAAVwByAGkAdABlAC0ASABvAHMAdAAgACcAIAAgACAAWwAzAF0AIAAgAEUAcwBwAGEAbgBvAGwAJwAgAC0ARgBvAHIAZQBnAHIAbwB1AG4AZABDAG8AbABvAHIAIABDAHkAYQBuADsAIABXAHIAaQB0AGUALQBIAG8AcwB0ACAAJwAgACAAIABbADQAXQAgACAARgByAGEAbgBjAGEAaQBzACcAIAAtAEYAbwByAGUAZwByAG8AdQBuAGQAQwBvAGwAbwByACAAQwB5AGEAbgA7ACAAVwByAGkAdABlAC0ASABvAHMAdAAgACcAIAAgACAAWwA1AF0AIAAgACAEQwRBBEEEOgQ4BDkEJwAgAC0ARgBvAHIAZQBnAHIAbwB1AG4AZABDAG8AbABvAHIAIABDAHkAYQBuADsAIABXAHIAaQB0AGUALQBIAG8AcwB0ACAAJwAgACAAIABbADYAXQAgACAAWgBoAG8AbgBnAHcAZQBuACAALwAgAC1Oh2UnACAALQBGAG8AcgBlAGcAcgBvAHUAbgBkAEMAbwBsAG8AcgAgAEMAeQBhAG4AOwAgAFcAcgBpAHQAZQAtAEgAbwBzAHQA
call :READ_KEY
set "LC=!INPUT_VAL!"
if "!LC!"=="1" ( set "LANG=DE" & echo LANG=DE> "!LANGFILE!" & goto :eof )
if "!LC!"=="2" ( set "LANG=EN" & echo LANG=EN> "!LANGFILE!" & goto :eof )
if "!LC!"=="3" ( set "LANG=ES" & echo LANG=ES> "!LANGFILE!" & goto :eof )
if "!LC!"=="4" ( set "LANG=FR" & echo LANG=FR> "!LANGFILE!" & goto :eof )
if "!LC!"=="5" ( set "LANG=RU" & echo LANG=RU> "!LANGFILE!" & goto :eof )
if "!LC!"=="6" ( set "LANG=ZH" & echo LANG=ZH> "!LANGFILE!" & goto :eof )
goto SELECT_LANG

:: ============================================================
:: ======  STRING LOADER  =====================================
:: ============================================================

:LOAD_STRINGS
for /f "usebackq" %%C in (`powershell -NoProfile -Command "([string](chcp.com)).split(':')[-1].Trim('.').Trim()"`) do set "_ORIG_CP=%%C"
chcp 65001 >nul 2>&1
for /f "usebackq tokens=1* delims==" %%A in ("!LANGDIR!\!LANG!.txt") do set "%%A=%%B"
chcp !_ORIG_CP! >nul 2>&1
goto :eof

:: ============================================================
:: ======  APPLY SUBROUTINES  =================================
:: ============================================================

:DO_TELEMETRY
powershell -NoProfile -Command "Write-Host '  [*] !T_TEL_S!' -ForegroundColor Yellow"
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start=disabled >nul 2>&1
sc stop dmwappushservice >nul 2>&1
sc config dmwappushservice start=disabled >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_TEL_E!' -ForegroundColor Green"
call :LOG "APPLY" "Telemetry services disabled"
goto :eof

:DO_TELE_REG
powershell -NoProfile -Command "Write-Host '  [*] !T_TLR_S!' -ForegroundColor Yellow"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_TLR_E!' -ForegroundColor Green"
call :LOG "APPLY" "Telemetry level set to 0"
goto :eof

:DO_CORTANA
powershell -NoProfile -Command "Write-Host '  [*] !T_COR_S!' -ForegroundColor Yellow"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_COR_E!' -ForegroundColor Green"
call :LOG "APPLY" "Cortana disabled"
goto :eof

:DO_ADID
powershell -NoProfile -Command "Write-Host '  [*] !T_ADI_S!' -ForegroundColor Yellow"
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_ADI_E!' -ForegroundColor Green"
call :LOG "APPLY" "Advertising ID disabled"
goto :eof

:DO_ACTIVITY
powershell -NoProfile -Command "Write-Host '  [*] !T_ACT_S!' -ForegroundColor Yellow"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_ACT_E!' -ForegroundColor Green"
call :LOG "APPLY" "Activity history disabled"
goto :eof

:DO_FEEDBACK
powershell -NoProfile -Command "Write-Host '  [*] !T_FBK_S!' -ForegroundColor Yellow"
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_FBK_E!' -ForegroundColor Green"
call :LOG "APPLY" "Feedback requests disabled"
goto :eof

:DO_VISUAL
powershell -NoProfile -Command "Write-Host '  [*] !T_VIS_S!' -ForegroundColor Yellow"
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d 0 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_VIS_E!' -ForegroundColor Green"
call :LOG "APPLY" "Visual effects reduced"
goto :eof

:DO_RAM
powershell -NoProfile -Command "Write-Host '  [*] !T_RAM_S!' -ForegroundColor Yellow"
powershell -NoProfile -NonInteractive -Command "[System.GC]::Collect()" >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_RAM_E!' -ForegroundColor Green"
call :LOG "APPLY" "RAM cache cleared"
goto :eof

:DO_TEMP
powershell -NoProfile -Command "Write-Host '  [*] !T_TMP_S!' -ForegroundColor Yellow"
del /q /f /s "%TEMP%\*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_TMP_E!' -ForegroundColor Green"
call :LOG "APPLY" "Temp files deleted"
goto :eof

:DO_STARTUP
powershell -NoProfile -Command "Write-Host '  [*] !T_STA_S!' -ForegroundColor Yellow"
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "OneDrive" /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Skype" /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_STA_E!' -ForegroundColor Green"
call :LOG "APPLY" "Startup cleaned"
goto :eof

:DO_GAMEMODE
powershell -NoProfile -Command "Write-Host '  [*] !T_GMD_S!' -ForegroundColor Yellow"
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 1 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_GMD_E!' -ForegroundColor Green"
call :LOG "APPLY" "Game Mode enabled"
goto :eof

:DO_POWERPLAN
powershell -NoProfile -Command "Write-Host '  [*] !T_PWR_S!' -ForegroundColor Yellow"
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
for /f "tokens=4" %%G in ('powercfg -list ^| findstr /i "ultimat"') do powercfg -setactive %%G >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_PWR_E!' -ForegroundColor Green"
call :LOG "APPLY" "Ultimate power plan activated"
goto :eof

:DO_HAGS
powershell -NoProfile -Command "Write-Host '  [*] !T_HAG_S!' -ForegroundColor Yellow"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_HAG_E! !T_HAG_N!' -ForegroundColor Green"
call :LOG "APPLY" "HAGS enabled"
goto :eof

:DO_NAGLE
powershell -NoProfile -Command "Write-Host '  [*] !T_NGL_S!' -ForegroundColor Yellow"
for /f "skip=2 tokens=*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces"') do (
    reg add "%%A" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f >nul 2>&1
    reg add "%%A" /v "TCPNoDelay"      /t REG_DWORD /d 1 /f >nul 2>&1
)
powershell -NoProfile -Command "Write-Host '  [+] !T_NGL_E!' -ForegroundColor Green"
call :LOG "APPLY" "Nagle Algorithm disabled"
goto :eof

:DO_MOUSEACCEL
powershell -NoProfile -Command "Write-Host '  [*] !T_MAC_S!' -ForegroundColor Yellow"
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed"      /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d 0 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_MAC_E!' -ForegroundColor Green"
call :LOG "APPLY" "Mouse acceleration disabled"
goto :eof

:DO_GAMEDVR
powershell -NoProfile -Command "Write-Host '  [*] !T_DVR_S!' -ForegroundColor Yellow"
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_DVR_E!' -ForegroundColor Green"
call :LOG "APPLY" "GameDVR and GameBar disabled"
goto :eof

:DO_DNS
powershell -NoProfile -Command "Write-Host '  [*] !T_DNS_S!' -ForegroundColor Yellow"
ipconfig /flushdns >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_DNS_E!' -ForegroundColor Green"
call :LOG "APPLY" "DNS cache flushed"
goto :eof

:DO_WINSOCK
powershell -NoProfile -Command "Write-Host '  [*] !T_WSK_S!' -ForegroundColor Yellow"
netsh winsock reset >nul 2>&1
netsh int ip reset  >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_WSK_E! !T_WSK_N!' -ForegroundColor Green"
call :LOG "APPLY" "Winsock reset"
goto :eof

:DO_QOS
powershell -NoProfile -Command "Write-Host '  [*] !T_QOS_S!' -ForegroundColor Yellow"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d 0 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_QOS_E!' -ForegroundColor Green"
call :LOG "APPLY" "QoS bandwidth released"
goto :eof

:DO_TCP
powershell -NoProfile -Command "Write-Host '  [*] !T_TCP_S!' -ForegroundColor Yellow"
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global ecncapability=enabled  >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_TCP_E!' -ForegroundColor Green"
call :LOG "APPLY" "TCP stack optimized"
goto :eof

:DO_NET_THROTTLE
powershell -NoProfile -Command "Write-Host '  [*] !T_NTH_S!' -ForegroundColor Yellow"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness"   /t REG_DWORD /d 0          /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_NTH_E!' -ForegroundColor Green"
call :LOG "APPLY" "Network throttling disabled"
goto :eof

:DO_SERVICES_BASIC
powershell -NoProfile -Command "Write-Host '  [*] !T_SBS_S!' -ForegroundColor Yellow"
call :SVC_OFF DiagTrack
call :SVC_OFF dmwappushservice
call :SVC_OFF SysMain
call :SVC_OFF XblAuthManager
call :SVC_OFF XblGameSave
goto :eof

:DO_NUKE
powershell -NoProfile -Command "Write-Host '  [*] !T_NUK_S!' -ForegroundColor Red"
powercfg -hibernate off >nul 2>&1
sc config wuauserv start=disabled >nul 2>&1
sc stop wuauserv >nul 2>&1
call :SVC_OFF WSearch
call :SVC_OFF BITS
call :SVC_OFF Fax
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [*] !T_NUK_E!' -ForegroundColor Red"
call :LOG "APPLY" "NUKE mode executed"
goto :eof

:: ============================================================
:: ======  UNDO SUBROUTINES  ==================================
:: ============================================================

:UNDO_TELEMETRY
powershell -NoProfile -Command "Write-Host '  [*] !T_UTL_S!' -ForegroundColor Yellow"
sc config DiagTrack start=auto >nul 2>&1 & sc start DiagTrack >nul 2>&1
sc config dmwappushservice start=auto >nul 2>&1 & sc start dmwappushservice >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_UTL_E!' -ForegroundColor Green"
call :LOG "UNDO" "Telemetry services re-enabled"
goto :eof

:UNDO_TELE_REG
powershell -NoProfile -Command "Write-Host '  [*] !T_UTR_S!' -ForegroundColor Yellow"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 3 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_UTR_E!' -ForegroundColor Green"
call :LOG "UNDO" "Telemetry level restored to default"
goto :eof

:UNDO_CORTANA
powershell -NoProfile -Command "Write-Host '  [*] !T_UCO_S!' -ForegroundColor Yellow"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d 1 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_UCO_E!' -ForegroundColor Green"
call :LOG "UNDO" "Cortana re-enabled"
goto :eof

:UNDO_ADID
powershell -NoProfile -Command "Write-Host '  [*] !T_UAD_S!' -ForegroundColor Yellow"
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 1 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_UAD_E!' -ForegroundColor Green"
call :LOG "UNDO" "Advertising ID re-enabled"
goto :eof

:UNDO_ACTIVITY
powershell -NoProfile -Command "Write-Host '  [*] !T_UAC_S!' -ForegroundColor Yellow"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 1 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_UAC_E!' -ForegroundColor Green"
call :LOG "UNDO" "Activity history re-enabled"
goto :eof

:UNDO_FEEDBACK
powershell -NoProfile -Command "Write-Host '  [*] !T_UFB_S!' -ForegroundColor Yellow"
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 3 /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_UFB_E!' -ForegroundColor Green"
call :LOG "UNDO" "Feedback requests re-enabled"
goto :eof

:UNDO_VISUAL
powershell -NoProfile -Command "Write-Host '  [*] !T_UVI_S!' -ForegroundColor Yellow"
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d 1 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_UVI_E!' -ForegroundColor Green"
call :LOG "UNDO" "Visual effects restored"
goto :eof

:UNDO_STARTUP
powershell -NoProfile -Command "Write-Host '  [i] !T_UST_M!' -ForegroundColor DarkGray"
call :LOG "UNDO" "Startup check reminder"
goto :eof

:UNDO_GAMEMODE
powershell -NoProfile -Command "Write-Host '  [*] !T_UGM_S!' -ForegroundColor Yellow"
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_UGM_E!' -ForegroundColor Green"
call :LOG "UNDO" "Game Mode disabled"
goto :eof

:UNDO_POWERPLAN
powershell -NoProfile -Command "Write-Host '  [*] !T_UPW_S!' -ForegroundColor Yellow"
powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_UPW_E!' -ForegroundColor Green"
call :LOG "UNDO" "Default power plan restored"
goto :eof

:UNDO_HAGS
powershell -NoProfile -Command "Write-Host '  [*] !T_UHA_S!' -ForegroundColor Yellow"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 1 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_UHA_E! !T_HAG_N!' -ForegroundColor Green"
call :LOG "UNDO" "HAGS disabled"
goto :eof

:UNDO_NAGLE
powershell -NoProfile -Command "Write-Host '  [*] !T_UNG_S!' -ForegroundColor Yellow"
for /f "skip=2 tokens=*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces"') do (
    reg delete "%%A" /v "TcpAckFrequency" /f >nul 2>&1
    reg delete "%%A" /v "TCPNoDelay"      /f >nul 2>&1
)
powershell -NoProfile -Command "Write-Host '  [+] !T_UNG_E!' -ForegroundColor Green"
call :LOG "UNDO" "Nagle Algorithm re-enabled"
goto :eof

:UNDO_MOUSEACCEL
powershell -NoProfile -Command "Write-Host '  [*] !T_UMA_S!' -ForegroundColor Yellow"
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed"      /t REG_SZ /d 1  /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d 6  /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d 10 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_UMA_E!' -ForegroundColor Green"
call :LOG "UNDO" "Mouse acceleration re-enabled"
goto :eof

:UNDO_GAMEDVR
powershell -NoProfile -Command "Write-Host '  [*] !T_UDV_S!' -ForegroundColor Yellow"
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 1 /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 1 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_UDV_E!' -ForegroundColor Green"
call :LOG "UNDO" "GameDVR and GameBar re-enabled"
goto :eof

:UNDO_QOS
powershell -NoProfile -Command "Write-Host '  [*] !T_UQO_S!' -ForegroundColor Yellow"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d 20 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_UQO_E!' -ForegroundColor Green"
call :LOG "UNDO" "QoS restored to default"
goto :eof

:UNDO_TCP
powershell -NoProfile -Command "Write-Host '  [*] !T_UTP_S!' -ForegroundColor Yellow"
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global ecncapability=disabled >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_UTP_E!' -ForegroundColor Green"
call :LOG "UNDO" "TCP defaults restored"
goto :eof

:UNDO_NET_THROTTLE
powershell -NoProfile -Command "Write-Host '  [*] !T_UNT_S!' -ForegroundColor Yellow"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 10 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness"   /t REG_DWORD /d 20 /f >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] !T_UNT_E!' -ForegroundColor Green"
call :LOG "UNDO" "Network throttling restored"
goto :eof

:DO_RESTORE_SERVICES
powershell -NoProfile -Command "Write-Host '  [*] !T_RSV_S!' -ForegroundColor Yellow"
call :SVC_ON DiagTrack
call :SVC_ON SysMain
call :SVC_ON WSearch
call :SVC_ON BITS
call :SVC_ON wuauserv
call :SVC_ON XblAuthManager
call :SVC_ON XblGameSave
call :SVC_ON Spooler
call :LOG "UNDO" "All services restored"
goto :eof

:SVC_OFF
powershell -NoProfile -Command "Write-Host '  [*] !T_SVC_S!%1' -ForegroundColor Yellow"
sc stop %1   >nul 2>&1
sc config %1 start=disabled >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] %1!T_SVC_E!' -ForegroundColor Green"
call :LOG "APPLY" "Service disabled: %1"
goto :eof

:SVC_ON
sc config %1 start=auto >nul 2>&1
sc start %1  >nul 2>&1
powershell -NoProfile -Command "Write-Host '  [+] %1!T_SON_E!' -ForegroundColor Green"
call :LOG "UNDO" "Service re-enabled: %1"
goto :eof

:: ============================================================
:: ======  INPUT (SINGLE KEYPRESS)  ===========================
:: ============================================================

:READ_KEY
set "_TEMP=%~dp0._wk.tmp"
if exist "!_TEMP!" del "!_TEMP!" >nul 2>&1
powershell -NoProfile -Command "$t='!_TEMP!'; Start-Sleep -Milliseconds 100; while([Console]::KeyAvailable){$null=[Console]::ReadKey($true)}; Write-Host -NoNewline '  > '; $k=[Console]::ReadKey($true); $c=[string]$k.KeyChar; if($c -match '[0-9Cc]'){[System.IO.File]::WriteAllText($t,$c.ToUpper(),[System.Text.Encoding]::ASCII)}elseif($c -match '[Rr]'){Write-Host -NoNewline 'R'; $d=[Console]::ReadKey($true); [System.IO.File]::WriteAllText($t,'R'+([string]$d.KeyChar),[System.Text.Encoding]::ASCII)}"
set "INPUT_VAL="
if exist "!_TEMP!" (
    set /p "INPUT_VAL=" < "!_TEMP!"
    del "!_TEMP!" >nul 2>&1
)
goto :eof

:: ============================================================
:: ======  LOG SYSTEM  ========================================
:: ============================================================

:SAVE_LEVEL
echo LEVEL=!LEVEL!> "!LEVELFILE!"
echo LEVEL_NAME=!LEVEL_NAME!>> "!LEVELFILE!"
goto :eof

:LOG_INIT
if not exist "!LOGFILE!" (
    echo ==========================================  > "!LOGFILE!"
    echo  WinOptimizer Log                         >> "!LOGFILE!"
    echo ==========================================  >> "!LOGFILE!"
)
goto :eof

:LOG
for /f "usebackq delims=" %%T in (`powershell -NoProfile -Command "Get-Date -Format 'yyyy-MM-dd HH:mm:ss'"`) do set "DT=%%T"
echo [!DT!] [%~1] %~2 >> "!LOGFILE!"
goto :eof

:DONE_MSG
powershell -NoProfile -Command "Write-Host; Write-Host '  ------------------------------------------' -ForegroundColor DarkGray; Write-Host '  !C_DONE!' -ForegroundColor Green"
pause >nul
goto :eof

:: ============================================================
:EXIT
:: ============================================================
cls
powershell -NoProfile -Command "Write-Host; Write-Host '  !EX_MSG!' -ForegroundColor DarkGray; Write-Host"
timeout /t 1 >nul
exit /b 0

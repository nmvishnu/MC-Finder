@echo off
REM Function: Windows batch file to display hostname and McAfee ePO processes and drivers. Creates an MC_out.txt file in executed directory.
REM IMPORTANT: Requires WRITE permission within the folder from which batch file is executed. Drivers section is a hack; results may not be accurate.
REM Works for Standard users and Administrators. Code is NOT tested on McAfee ePO; should work on McAfee VirusScan Enterprise (VSE) 8.8.x & McAfee Agent (MA) 5.x (process list update: 16th April 2020).
REM P.S. I'm not a 'Pro' in batch scripting. Created as a quick, lazy work - DO NOT expect Updates, Fixes, etc.
REM Feel free to modify this code and use it in your work/project.

echo Hostname: >> MC_out.txt
hostname >> MC_out.txt

echo ============================== >> MC_out.txt
echo McAfee Agent processes >> MC_out.txt
echo ============================== >> MC_out.txt

tasklist | findstr "masvc.exe" >> MC_out.txt
tasklist | findstr "macmnsvc.exe" >> MC_out.txt
tasklist | findstr "macompatsvc.exe" >> MC_out.txt
tasklist | findstr "cmdagent.exe" >> MC_out.txt
tasklist | findstr "FrmInst.exe" >> MC_out.txt
tasklist | findstr "maconfig.exe" >> MC_out.txt
tasklist | findstr "McScanCheck.exe" >> MC_out.txt
tasklist | findstr "McScript_InUse.exe" >> MC_out.txt
tasklist | findstr "UpdaterUI.exe" >> MC_out.txt
tasklist | findstr "marepomirror.exe" >> MC_out.txt
tasklist | findstr "FramePkg.exe" >> MC_out.txt
tasklist | findstr "mctray.exe" >> MC_out.txt

tasklist /FI "IMAGENAME eq masvc.exe" 2>NUL | find /I /N "masvc.exe">NUL
if "%ERRORLEVEL%"=="0" echo McAfee Agent Service is running >> MC_out.txt

tasklist /FI "IMAGENAME eq macmnsvc.exe" 2>NUL | find /I /N "macmnsvc.exe">NUL
if "%ERRORLEVEL%"=="0" echo McAfee Agent Common Services is running >> MC_out.txt

tasklist /FI "IMAGENAME eq macompatsvc.exe" 2>NUL | find /I /N "macompatsvc.exe">NUL
if "%ERRORLEVEL%"=="0" echo McAfee Agent Backwards Compatibility Service is running >> MC_out.txt

tasklist /FI "IMAGENAME eq cmdagent.exe" 2>NUL | find /I /N "cmdagent.exe">NUL
if "%ERRORLEVEL%"=="0" echo Command line agent possibly used for initiating McAfee Agent is running >> MC_out.txt

tasklist /FI "IMAGENAME eq FrmInst.exe" 2>NUL | find /I /N "FrmInst.exe">NUL
if "%ERRORLEVEL%"=="0" echo McAfee Agent installation process is running >> MC_out.txt

tasklist /FI "IMAGENAME eq maconfig.exe" 2>NUL | find /I /N "maconfig.exe">NUL
if "%ERRORLEVEL%"=="0" echo McAfee configuration program is running >> MC_out.txt

tasklist /FI "IMAGENAME eq McScanCheck.exe" 2>NUL | find /I /N "McScanCheck.exe">NUL
if "%ERRORLEVEL%"=="0" echo DAT or Engine updates running >> MC_out.txt

tasklist /FI "IMAGENAME eq McScript_InUse.exe" 2>NUL | find /I /N "McScript_InUse.exe">NUL
if "%ERRORLEVEL%"=="0" echo DAT or Engine updates (process loader) running >> MC_out.txt

tasklist /FI "IMAGENAME eq UpdaterUI.exe" 2>NUL | find /I /N "UpdaterUI.exe">NUL
if "%ERRORLEVEL%"=="0" echo User Interface for Updates is running >> MC_out.txt

tasklist /FI "IMAGENAME eq marepomirror.exe" 2>NUL | find /I /N "marepomirror.exe">NUL
if "%ERRORLEVEL%"=="0" echo Repository mirroring is running >> MC_out.txt

tasklist /FI "IMAGENAME eq FramePkg.exe" 2>NUL | find /I /N "FramePkg.exe">NUL
if "%ERRORLEVEL%"=="0" echo McAfee Agent installer is running >> MC_out.txt

tasklist /FI "IMAGENAME eq mctray.exe" 2>NUL | find /I /N "mctray.exe">NUL
if "%ERRORLEVEL%"=="0" echo Tray icon management tool is running >> MC_out.txt

tasklist /FI "IMAGENAME eq mcupdater.exe" 2>NUL | find /I /N "mcupdater.exe">NUL
if "%ERRORLEVEL%"=="0" echo McAfee Data Exchange Layer (DXL) client installer is running >> MC_out.txt

echo ============================== >> MC_out.txt
echo McAfee VSE (Virus Scan Enterprise) processes >> MC_out.txt
echo ============================== >> MC_out.txt

tasklist | findstr "Mcshield.exe" >> MC_out.txt
tasklist | findstr "Scan32.exe" >> MC_out.txt
tasklist | findstr "Scan64.exe" >> MC_out.txt
tasklist | findstr "Shstat.exe" >> MC_out.txt
tasklist | findstr "VsTskMgr.exe" >> MC_out.txt
tasklist | findstr "mfevtps.exe" >> MC_out.txt
tasklist | findstr "mfeann.exe" >> MC_out.txt

tasklist /FI "IMAGENAME eq Mcshield.exe" 2>NUL | find /I /N "Mcshield.exe">NUL
if "%ERRORLEVEL%"=="0" echo McShield on-access scanner Service is running >> MC_out.txt

tasklist /FI "IMAGENAME eq Scan32.exe" 2>NUL | find /I /N "Scan32.exe">NUL
if "%ERRORLEVEL%"=="0" echo On Demand Scan process loader (32-bit) is running >> MC_out.txt

tasklist /FI "IMAGENAME eq Scan64.exe" 2>NUL | find /I /N "Scan64.exe">NUL
if "%ERRORLEVEL%"=="0" echo On Demand Scan process loader (64-bit) is running >> MC_out.txt

tasklist /FI "IMAGENAME eq Shstat.exe" 2>NUL | find /I /N "Shstat.exe">NUL
if "%ERRORLEVEL%"=="0" echo Keyloader for McAfee VSE  is running >> MC_out.txt

tasklist /FI "IMAGENAME eq VsTskMgr.exe" 2>NUL | find /I /N "VsTskMgr.exe">NUL
if "%ERRORLEVEL%"=="0" echo Task Manager for McAfee processes is running >> MC_out.txt

tasklist /FI "IMAGENAME eq mfevtps.exe" 2>NUL | find /I /N "mfevtps.exe">NUL
if "%ERRORLEVEL%"=="0" echo Trust validation service for McAfee processes is running >> MC_out.txt

tasklist /FI "IMAGENAME eq mfeann.exe" 2>NUL | find /I /N "mfeann.exe">NUL
if "%ERRORLEVEL%"=="0" echo Event creation and logging for VsTskMgr is running >> MC_out.txt

echo ============================== >> MC_out.txt
echo McAfee Drivers >> MC_out.txt
echo ============================== >> MC_out.txt

driverquery | findstr "mfeapfk" >> MC_out.txt
driverquery | findstr "mfeavfk" >> MC_out.txt
driverquery | findstr "mfebopk" >> MC_out.txt
driverquery | findstr "mfeclnk" >> MC_out.txt
driverquery | findstr "mfeelamk" >> MC_out.txt
driverquery | findstr "mfehidk" >> MC_out.txt
driverquery | findstr "mferkdet" >> MC_out.txt
driverquery | findstr "Mfetdik2" >> MC_out.txt
driverquery | findstr "Mfewfpk" >> MC_out.txt
driverquery | findstr "Mfefirek" >> MC_out.txt

echo ============================== >> MC_out.txt
echo Results saved to MC_out.txt
echo Press any key to exit
pause >nul
exit





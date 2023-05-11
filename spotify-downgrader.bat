@echo off
set link="https://store1.gofile.io/download/dd1afb08-cd25-4c64-80e2-61ba3cd53dd5/spotify-1-2-5-1006.exe"
set NL=^&echo.

echo Spotify ujratelepito + update blokk
echo Fajlhost: gofile.io
echo ========
echo 1. vard meg mig letolt
echo 2. telepitsd
echo 3. engedelyezd hogy letilthassa a frissiteseket
echo 4. jo
echo ========

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
	echo %NEWLINE%Letoltes folyamatban...
	powershell -Command "(New-Object Net.WebClient).DownloadFile('%link%', '%userprofile%\Downloads\spotify.exe')"
	
	echo Letoltes kesz.
	START /WAIT %userprofile%\Downloads\spotify.exe
	
	del %userprofile%\Downloads\spotify.exe
    echo Engedelyezd az adminisztratori jogokat, hogy a frissitest blokkolni lehessen.
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

echo Frissitesek blokkolasa.
set hostspath=%windir%\System32\drivers\etc\hosts
echo %NL%127.0.0.1 upgrade.scdn.co >> %hostspath%
echo OK
pause

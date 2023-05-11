@echo off
set NL=^&echo.

echo Spotify ujratelepito + update blokk
echo ========
echo 1. vard meg mig letolt
echo 2. telepitsd
echo 3. engedelyezd hogy letilthassa a frissiteseket
echo 4. jo
echo ========

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
	echo %NEWLINE%Letoltes folyamatban...
	powershell -Command "Invoke-RestMethod "https://www.dropbox.com/s/40m6ojyl1fb2qb5/spotify-1-2-5-1006.exe?dl=1" -OutFile '%userprofile%\Downloads\spotify.exe'"
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

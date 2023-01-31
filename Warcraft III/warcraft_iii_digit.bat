@echo off
TITLE Warcraft III
color 07

c:
cd \
copy warcraft_iiib.bmp warcraft_iii.bmp 
copy warcraft_iiia.bmp warcraft_iiib.bmp
copy warcraft_iii.bmp warcraft_iiia.bmp 

goto :launcher

:launcher
if not exist "c:\Program Files (x86)\warcraft III\war3.exe" goto :dlroc
if not exist "c:\Program Files (x86)\warcraft III\RenderEdge_Widescreen.mix" copy "c:\tmp\RenderEdge_Widescreen.mix" "c:\Program Files (x86)\warcraft III"
cls
echo.
echo.
echo.	-------------------------------------------------
echo.	Blizzard - Warcraft III - Classic/Digital edition
echo.	-------------------------------------------------
echo.
echo.	1) Play Warcraft III - Reign Of Chaos - Directx 9 mode
echo.	2) Play Warcraft III - Reign Of Chaos - OpenGL mode
echo.	3) Play Warcraft III - The Frozen Throne - Directx 9 mode
echo.	4) Play Warcraft III - The Frozen Throne - OpenGL mode
echo. 	5) About official CD update 1.27b
echo.	6) Exit
echo.
echo.	-------------------------------------------------
echo.
echo.

choice /c1234 /s /N Your choice? [1-4]:

if errorlevel 6 goto :exit
if errorlevel 5 goto :update
if errorlevel 4 goto :TFTOGL
if errorlevel 3 goto :TFTDX
if errorlevel 2 goto :ROCOGL
if errorlevel 1 goto :ROCDX

:ROCOGL
start "" "c:\program files (x86)\warcraft iii\warcraft iii.exe" -opengl
goto :launcher

:ROCDX
start "" "c:\program files (x86)\warcraft iii\warcraft iii.exe"
goto :launcher

:TFTOGL
if not exist "c:\program files (x86)\warcraft iii\frozen throne.exe" goto :notft
start "" "c:\program files (x86)\warcraft iii\frozen throne.exe" -opengl
goto :launcher

:TFTDX
if not exist "c:\program files (x86)\warcraft iii\frozen throne.exe" goto :notft
start "" "c:\program files (x86)\warcraft iii\frozen throne.exe"
goto :launcher

:update
cls
start "" iexplore "https://gaming-tools.com/warcraft-3/patches/"
goto :launcher

:notft
IF EXIST "c:\tmp\w3tft.exe" (
    IF NOT EXIST "c:\program files (x86)\warcraft iii\frozen throne.exe" (
        GOTO :dltft
        )
    )
cls
echo.
echo.
echo.	-------------------------------------------------
echo.	Blizzard - Warcraft III - Classic/Digital edition
echo.	-------------------------------------------------
echo.
echo.	Warcraft III - The Frozen Throne extension is 
echo.	not installed.If you own this extension, install it with
echo. 	Lutris script installer called:
echo.	"Digital 1.27 + WS version"
echo.	available on this web page.
echo.
echo.	-------------------------------------------------
echo.
echo.
start "" iexplore "https://lutris.net/games/warcraft-iii-the-frozen-throne/"
pause
goto :launcher

:dlroc
cls
echo.
echo.
echo.	-------------------------------------------------
echo.	Blizzard - Warcraft III - Classic/Digital edition
echo.	-------------------------------------------------
echo.
echo.   Downloading Warcraft III - Reign of Chaos...
echo.	
echo.	-------------------------------------------------
echo.
echo.
c:\tmp\w3roc.exe
goto :exit

:dltft
cls
echo.
echo.
echo.	-------------------------------------------------
echo.	Blizzard - Warcraft III - Classic/Digital edition
echo.	-------------------------------------------------
echo.
echo.   Downloading Warcraft III - The Frozen Throne...
echo.	
echo.	-------------------------------------------------
echo.
echo.
c:\tmp\w3tft.exe
goto :exit


:exit
exit

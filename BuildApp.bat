@echo off
::cls

set framework=v4.0.30319

if exist "%windir%\Microsoft.NET\Framework64\%framework%\csc.exe" set compiler="%windir%\Microsoft.NET\Framework64\%framework%\csc.exe"
if not exist "%cd%\build" md build

::SET refs=-r:"test\PresentationCore.dll"
::SET libs=-l:""
::SET defines=-d RELEASE

%compiler% -t:exe -out:"%cd%\build\App.exe" "%cd%\src\*.cs"

rd /S /Q "%cd%/bin"
mkdir "%cd%/bin"


if %errorlevel% neq 0 (
		color 0c
		echo Build failed!
) else (
		color 0a
		echo Build succeeded. Launching app...
		cd build
		start "" App.exe
)


@echo off
set "firefox=c:\program files\mozilla firefox"
set "chrome=c:\program files\google\chrome\application"
set "edge=c:\program files (x86)\microsoft\edge\application"
set "url=http://www.google.com"
if exist "%chrome%" (
    start "" "%chrome%\chrome.exe" --incognito --new-window "%url%"
) else if exist "%firefox%" (
    tasklist /fi "imagename eq firefox.exe" 2>nul | find /i "firefox.exe" >nul
    if errorlevel 1 (
        start "" "%firefox%\firefox.exe" --private-window "%url%"
    ) else (
        start "" "%firefox%\firefox.exe" --private-window
    )
) else if exist "%edge%" (
    start "" "%edge%\msedge.exe" --inprivate --new-window "%url%"
)
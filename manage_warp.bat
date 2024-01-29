@echo off
setlocal EnableDelayedExpansion

set "serviceName=CloudflareWARP"

REM Проверка текущего статуса службы
sc query "%serviceName%" | find "RUNNING"
if !errorlevel! equ 0 (
    set /p "choice=Service WARP is running, turn off WARP (Y/N): "
    
    echo !choice! | findstr /i "Y" >nul && (
        net stop "%serviceName%"
        echo The WARP service is turned off        
    ) || (
        echo Disabling WARP canceled
    )
    
) else (
    set /p "choice=The WARP service is turned off, enable WARP? (Y/N): "
    
    echo !choice! | findstr /i "Y" >nul && (
        net start "%serviceName%"
        echo The WARP service is enabled        
    ) || (
        echo Enabling WARP canceled
    )
)

pause

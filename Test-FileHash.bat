@ECHO OFF
SETLOCAL
REM Script exits with errorlevel 1 except if validation is skipped or successful.
SET HashResult=1
ECHO ------------------------------------------------------------------------------
IF NOT EXIST "%1" GOTO ERR1

:Launch
ECHO Calculating Hash . . .
ECHO.
FOR /F %%f in ('PowerShell -NoProfile -Command "& { (Get-Filehash -Path %1).Hash }"') do SET HashCalc=%%f
IF "%HashCalc%"=="" GOTO ERR2
ECHO Your file has been processed.
ECHO       File : %1
ECHO     SHA256 : %HashCalc%
ECHO ------------------------------------------------------------------------------
ECHO Choose one of the next steps:
ECHO     Verify : Paste hash to verify (Right-Click / Ctrl+V + Enter) 
ECHO      Close : Press Enter to end Script.
ECHO   Advanced : You may provide the SHA256 to validate against as Parameter 2
ECHO              (Command line: %~n0.bat filename SHA256hash)
ECHO ------------------------------------------------------------------------------

REM Hash to validate against provided as Parameter 2? 
IF "%HashCalc%"=="%2" (
  SET HashValidate=%2
  ECHO Your Input : %2
  ) ELSE (
    SET /P HashValidate="Your Input : "
)
IF "%HashValidate%"=="" GOTO EOF

REM Validate Input
ECHO ------------------------------------------------------------------------------
ECHO Calculated : %HashCalc%
ECHO   Provided : %HashValidate%
IF "%HashCalc%"=="%HashValidate%" (
  ECHO     Result : OK!
  SET HashResult=0
  ) ELSE (
  ECHO     Result : Failed!
)
GOTO END

:ERR1
ECHO - Please provide the full path of a single file to validate
ECHO   or drag-and-drop the file onto this .BAT file / shortcut.
ECHO - Optionally provide SHA256 to validate against as Parameter 2
ECHO   (Command line: %~n0.bat filename SHA256hash)
GOTO END

:ERR2
ECHO - Failed to calculate File Hash.
GOTO END

:END
ECHO ------------------------------------------------------------------------------
ECHO Script Completed.
ECHO ------------------------------------------------------------------------------
PAUSE
EXIT /B %HashResult%
:EOF
# Test-FileHash
A .bat file that will let you drop a file onto it to generate and optionally validate SHA256 hash.
- Errorlevel 1 returned if script execution or validation fails.
- Errorlevel 0 returned if validation is true or skipped.

Requires PowerShell to generate SHA256 using Get-FileHash cmdlet
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-filehash

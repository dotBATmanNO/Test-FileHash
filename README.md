# Test-FileHash
A .bat file that will let you drop a file onto it to generate and optionally validate SHA256 hash.

It will also work from commandline for automated tests;
Test-FileHash.bat filename SHA256hash
- Errorlevel 1 returned if script execution or validation fails.
- Errorlevel 0 returned if validation is true or skipped.

Requires PowerShell to generate SHA256 using Get-FileHash cmdlet
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-filehash

Example output:
```
------------------------------------------------------------------------------
Calculating Hash . . .

Your file has been processed.
      File : C:\Users\TooManySecrets\Downloads\ubuntu-23.10.1-desktop-amd64.iso
    SHA256 : 3B6C5275366D02160554FA5703ADD462DA3B8CE9BE1749F8806E8DBBFFAA2B5A
------------------------------------------------------------------------------
Choose one of the next steps:
    Verify : Paste hash to verify (Right-Click / Ctrl+V + Enter)
     Close : Press Enter to end Script.
  Advanced : You may provide the SHA256 to validate against as Parameter 2
             (Command line: Test-FileHash.bat filename SHA256hash)
------------------------------------------------------------------------------
Your Input : 3b6c5275366d02160554fa5703add462da3b8ce9be1749f8806e8dbbffaa2b5a
------------------------------------------------------------------------------
Calculated : 3B6C5275366D02160554FA5703ADD462DA3B8CE9BE1749F8806E8DBBFFAA2B5A
  Provided : 3b6c5275366d02160554fa5703add462da3b8ce9be1749f8806e8dbbffaa2b5a
    Result : OK!
------------------------------------------------------------------------------
Script Completed.
------------------------------------------------------------------------------
Press any key to continue . . .
```

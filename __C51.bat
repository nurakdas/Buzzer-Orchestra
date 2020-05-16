@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\tnurs\Desktop\Buzzer_Orchestra\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\tnurs\Desktop\Buzzer_Orchestra\main.c"
if not exist hex2mif.exe goto done
if exist main.ihx hex2mif main.ihx
if exist main.hex hex2mif main.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\tnurs\Desktop\Buzzer_Orchestra\main.hex

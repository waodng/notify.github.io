set strOld=#
set strNew="<h1>"
for /f "tokens=*" %%i in (������־.md) do (		
endlocal
		
		
set "var=%%i"
		
		
setlocal enabledelayedexpansion
		
rem findstrƥ�����֮ǰ��ӡ�к�eg 1:��ȥ���кš�������һ��ð��֮ǰ������ȥ��
		
set var=!var:*:=!
set "var=!var:%strOld%=%strNew%!"
echo !var!>>1.txt
)

pause
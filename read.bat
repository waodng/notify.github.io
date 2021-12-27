set strOld=#
set strNew="<h1>"
for /f "tokens=*" %%i in (发布日志.md) do (		
endlocal
		
		
set "var=%%i"
		
		
setlocal enabledelayedexpansion
		
rem findstr匹配的行之前打印行号eg 1:，去掉行号。即将第一个冒号之前的内容去掉
		
set var=!var:*:=!
set "var=!var:%strOld%=%strNew%!"
echo !var!>>1.txt
)

pause
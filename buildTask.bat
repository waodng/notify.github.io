SET Path=E:/Projects/供应室系统webApi/CSSDMS.WebApi
SET RemotePath=E:\OpenSource\notify.github.io
SET TargetRootFolder=D:/publish

SET IDEPath="D:/Program Files (x86)/Microsoft Visual Studio 12.0/Common7/IDE"
SET dotNetFrameworkDrive=c:
SET IdeDrive=d:
SET TargetFolderDrive=d:

rem============================强制关闭IIS进程=======================
 C:\windows\system32\taskkill /im w3wp.exe /t -f 

%dotNetFrameworkDrive%

rem============================删除文件===============================
%TargetFolderDrive%
cd %TargetRootFolder%
del /s /q "packages.config"
del /s /q *.rar

rem============================打包压缩文件===========================
"C:/Program Files/WinRAR/Rar.exe" a -r -ep1 供应室PDA接口程序-%date:~0,4%%date:~5,2%%date:~8,2%.rar %Path%\CSSDMS.WebApi\obj\Debug\Package\PackageTmp\* -phsoft.top
del /s /q %RemotePath%\download\*.rar
copy 供应室PDA接口程序-%date:~0,4%%date:~5,2%%date:~8,2%.rar %RemotePath%\download

rem============================服务器IIS部署拷贝============================
cd %TargetRootFolder%
C:\Windows\System32\xcopy.exe Build \\192.168.3.222\gysapi /E /H /Y

rem============================git源码提交============================
 E:
 cd %RemotePath%
 "D:\Program Files\Git\bin\git" add .
 "D:\Program Files\Git\bin\git" commit -m %date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%
 "D:\Program Files\Git\bin\git" push -u origin master

pause

SET Path=E:/Projects/��Ӧ��ϵͳwebApi/CSSDMS.WebApi
SET RemotePath=E:\OpenSource\notify.github.io
SET TargetRootFolder=D:/publish

SET IDEPath="D:/Program Files (x86)/Microsoft Visual Studio 12.0/Common7/IDE"
SET dotNetFrameworkDrive=c:
SET IdeDrive=d:
SET TargetFolderDrive=d:

rem============================ǿ�ƹر�IIS����=======================
 C:\windows\system32\taskkill /im w3wp.exe /t -f 

%dotNetFrameworkDrive%

rem============================ɾ���ļ�===============================
%TargetFolderDrive%
cd %TargetRootFolder%
del /s /q "packages.config"
del /s /q *.rar

rem============================���ѹ���ļ�===========================
"C:/Program Files/WinRAR/Rar.exe" a -r -ep1 ��Ӧ��PDA�ӿڳ���-%date:~0,4%%date:~5,2%%date:~8,2%.rar %Path%\CSSDMS.WebApi\obj\Debug\Package\PackageTmp\* -phsoft.top
del /s /q %RemotePath%\download\*.rar
copy ��Ӧ��PDA�ӿڳ���-%date:~0,4%%date:~5,2%%date:~8,2%.rar %RemotePath%\download

rem============================������IIS���𿽱�============================
cd %TargetRootFolder%
C:\Windows\System32\xcopy.exe Build \\192.168.3.222\gysapi /E /H /Y

rem============================gitԴ���ύ============================
 E:
 cd %RemotePath%
 "D:\Program Files\Git\bin\git" add .
 "D:\Program Files\Git\bin\git" commit -m %date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%
 "D:\Program Files\Git\bin\git" push -u origin master

pause

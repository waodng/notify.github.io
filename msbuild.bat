SET Path=E:/Projects/供应室系统webApi/CSSDMS.WebApi
SET RemotePath=E:\OpenSource\notify.github.io
SET TargetRootFolder=D:/publish

SET dotNetFrameworkPath=C:/WINDOWS/Microsoft.NET/Framework/v4.0.30319
SET IDEPath="D:/Program Files (x86)/Microsoft Visual Studio 12.0/Common7/IDE"

SET dotNetFrameworkDrive=c:
SET IdeDrive=d:
SET TargetFolderDrive=d:

rem============================强制关闭IIS进程=======================
C:\windows\system32\taskkill /im w3wp.exe -f

rem============================IIS发布工程===========================
cd %dotNetFrameworkPath%
%dotNetFrameworkDrive%
msbuild %Path%/CSSDMS.WebApi/CSSDMS.WebApi.csproj /t:ResolveReferences;Compile /t:_WPPCopyWebApplication /p:Configuration=Debug /p:_ResolveReferenceDependencies=true /p:WebProjectOutputDir=%TargetRootFolder%/Build >>%TargetRootFolder%/执行记录.txt

# 基于项目内的发布文件发布，缺失目标文件，执行报错
# msbuild %Path%/CSSDMS.WebApi.sln /p:Configuration=Debug;DeployOnBuild=true;PublishProfile=publish.pubxml >>%TargetRootFolder%/执行记录.txt

rem============================删除文件===============================
%TargetFolderDrive%
cd %TargetRootFolder%
del /s /q "packages.config"
rd /s /q "Build/Controllers"
del /s /q *.rar

rem============================分析文件===============================
for /f "tokens=*" %%i in (Build\发布日志.md) do echo %%i>>%RemotePath%\template.html

# copy "Build\发布日志.md" %RemotePath%

rem============================打包压缩文件===========================
C:\windows\system32\XCOPY Build 供应室PDA接口程序\ /E /Y
"C:/Program Files/WinRAR/Rar.exe" a 供应室PDA接口程序-%date:~0,4%%date:~5,2%%date:~8,2%.rar 供应室PDA接口程序 -phsoft.top
rd /s /q 供应室PDA接口程序
del /s /q %RemotePath%\download\*.rar
copy 供应室PDA接口程序-%date:~0,4%%date:~5,2%%date:~8,2%.rar %RemotePath%\download

rem============================git源码提交============================
E:
cd %RemotePath%
"D:\Program Files\Git\bin\git" add .
"D:\Program Files\Git\bin\git" commit -m %date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%
"D:\Program Files\Git\bin\git" push origin master

pause

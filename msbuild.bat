SET Path=E:/Projects/��Ӧ��ϵͳwebApi/CSSDMS.WebApi
SET RemotePath=E:\OpenSource\notify.github.io
SET TargetRootFolder=D:/publish

SET dotNetFrameworkPath=C:/WINDOWS/Microsoft.NET/Framework/v4.0.30319
SET IDEPath="D:/Program Files (x86)/Microsoft Visual Studio 12.0/Common7/IDE"

SET dotNetFrameworkDrive=c:
SET IdeDrive=d:
SET TargetFolderDrive=d:

rem============================ǿ�ƹر�IIS����=======================
C:\windows\system32\taskkill /im w3wp.exe -f

rem============================IIS��������===========================
cd %dotNetFrameworkPath%
%dotNetFrameworkDrive%
msbuild %Path%/CSSDMS.WebApi/CSSDMS.WebApi.csproj /t:ResolveReferences;Compile /t:_WPPCopyWebApplication /p:Configuration=Debug /p:_ResolveReferenceDependencies=true /p:WebProjectOutputDir=%TargetRootFolder%/Build >>%TargetRootFolder%/ִ�м�¼.txt

# ������Ŀ�ڵķ����ļ�������ȱʧĿ���ļ���ִ�б���
# msbuild %Path%/CSSDMS.WebApi.sln /p:Configuration=Debug;DeployOnBuild=true;PublishProfile=publish.pubxml >>%TargetRootFolder%/ִ�м�¼.txt

rem============================ɾ���ļ�===============================
%TargetFolderDrive%
cd %TargetRootFolder%
del /s /q "packages.config"
rd /s /q "Build/Controllers"
del /s /q *.rar

rem============================�����ļ�===============================
for /f "tokens=*" %%i in (Build\������־.md) do echo %%i>>%RemotePath%\template.html

# copy "Build\������־.md" %RemotePath%

rem============================���ѹ���ļ�===========================
C:\windows\system32\XCOPY Build ��Ӧ��PDA�ӿڳ���\ /E /Y
"C:/Program Files/WinRAR/Rar.exe" a ��Ӧ��PDA�ӿڳ���-%date:~0,4%%date:~5,2%%date:~8,2%.rar ��Ӧ��PDA�ӿڳ��� -phsoft.top
rd /s /q ��Ӧ��PDA�ӿڳ���
del /s /q %RemotePath%\download\*.rar
copy ��Ӧ��PDA�ӿڳ���-%date:~0,4%%date:~5,2%%date:~8,2%.rar %RemotePath%\download

rem============================gitԴ���ύ============================
E:
cd %RemotePath%
"D:\Program Files\Git\bin\git" add .
"D:\Program Files\Git\bin\git" commit -m %date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%
"D:\Program Files\Git\bin\git" push origin master

pause

@pushd %~dp0

del /Q /F ..\TestResults\*.*
del /Q /F *.feature.cs
del /Q /F *.feature
del /Q /F .\bin\*.*

..\packages\Acheve.Jira.XRay.0.0.3\tools\Acheve.Jira.XRay.exe get-features -h http://10.1.133.215:8181 -u denisg -p 123qwe -t XRAYT0-1829 -d ./
rename 1.feature 16.feature

rem @where /q msbuild

rem @IF ERRORLEVEL 1 (
rem 	echo "MSBuild is not in your PATH. Please use a developer command prompt!"
rem 	goto :end
rem ) ELSE (
	"C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\"MSBuild.exe "XrayTestProj.csproj"
rem )

@if ERRORLEVEL 1 goto end

@cd ..\packages\SpecRun.Runner.*\tools

@set profile=%1
@if "%profile%" == "" set profile=Default

SpecRun.exe run %profile%.srprofile "/baseFolder:%~dp0\bin\Debug" /log:specrun.log %2 %3 %4 %5

..\..\Acheve.Jira.XRay.0.0.3\tools\Acheve.Jira.XRay.exe upload-results -h http://10.1.133.215:8181 -u denisg -p 123qwe -t XRAYT0-1829 -f ..\..\..\XrayTestProj\bin\Debug\data.json

:end

@popd

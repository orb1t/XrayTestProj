@pushd %~dp0

rem @where /q msbuild

rem @IF ERRORLEVEL 1 (
rem 	echo "MSBuild is not in your PATH. Please use a developer command prompt!"
rem 	goto :end
rem ) ELSE (
	C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\MSBuild.exe "XrayTestProj.csproj"
rem )

@if ERRORLEVEL 1 goto end

@cd ..\packages\SpecRun.Runner.*\tools

@set profile=%1
@if "%profile%" == "" set profile=Default

SpecRun.exe run %profile%.srprofile "/baseFolder:%~dp0\bin\Debug" /log:specrun.log %2 %3 %4 %5

:end

@popd

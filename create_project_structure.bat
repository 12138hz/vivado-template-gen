@echo off
chcp 65001 >nul
rem Enable delayed variable expansion
setlocal enabledelayedexpansion

rem Initialize error flag
set error_flag=0

rem Create a log file to store debug output
set log_file=%~dp0project_creation_log.txt
echo Debug log for project creation > %log_file%

rem Prompt user to enter project name
echo Please enter the project name (e.g., my_fpga_project):
set /p project_name=

rem Output debug information to check the entered project name
echo You entered: %project_name% >> %log_file%

rem If no name is entered, set a default project name
if "%project_name%"=="" set project_name=your_project

echo Creating project: %project_name% >> %log_file%

rem Check if the directory already exists


rem Create the main project directory
echo Creating main directory: %project_name% >> %log_file%
mkdir "%project_name%" || (
    echo Failed to create main directory! >> %log_file%
    set error_flag=1
    goto end
)

rem Change to the project directory
cd "%project_name%" || (
    echo Failed to change directory to: %project_name% >> %log_file%
    set error_flag=1
    goto end
)

rem Verify directory change was successful
echo Current directory is: %CD% >> %log_file%

echo Main directory created successfully. >> %log_file%

rem Create source code directory
echo Creating source code directory: src >> %log_file%
mkdir src || (
    echo Failed to create src directory! >> %log_file%
    set error_flag=1
    goto end
)

rem Create IP directory
echo Creating IP directory: ip >> %log_file%
mkdir ip || (
    echo Failed to create ip directory! >> %log_file%
    set error_flag=1
    goto end
)

rem Create "coe" subdirectory inside the "ip" folder for COE files
echo Creating COE directory inside IP folder: ip\coe >> %log_file%
mkdir ip\coe || (
    echo Failed to create ip\coe directory! >> %log_file%
    set error_flag=1
    goto end
)

rem Create constraints folder
echo Creating constraints folder: constrs >> %log_file%
mkdir constrs || (
    echo Failed to create constrs directory! >> %log_file%
    set error_flag=1
    goto end
)

rem Create simulation folder
echo Creating simulation folder: sim >> %log_file%
mkdir sim || (
    echo Failed to create sim directory! >> %log_file%
    set error_flag=1
    goto end
)

rem Create scripts folder
echo Creating scripts folder: scripts >> %log_file%
mkdir scripts || (
    echo Failed to create scripts directory! >> %log_file%
    set error_flag=1
    goto end
)

rem Create documentation folder
echo Creating documentation folder: doc >> %log_file%
mkdir doc || (
    echo Failed to create doc directory! >> %log_file%
    set error_flag=1
    goto end
)

rem Create root-level files: README.md and .gitignore
echo Creating root-level files: README.md and .gitignore >> %log_file%
type nul > README.md || (
    echo Failed to create README.md! >> %log_file%
    set error_flag=1
    goto end
)

rem Write predefined content to .gitignore
echo # 忽略 fpga_project 里面的所有东西  >> .gitignore
echo fpga_project/** >> .gitignore

echo # 但是保留 .xpr 文件 >> .gitignore
echo !fpga_project/*.xpr >> .gitignore

echo # 忽略 ip 目录下所有文件和子文件夹 >> .gitignore
echo ip/** >> .gitignore

echo # 但保留 .xci 和 .coe 文件 >> .gitignore
echo !!ip/**/*.xci >> .gitignore
echo !ip/**/*.coe >> .gitignore

echo # 保留 ip 目录结构 >> .gitignore
echo !ip/ >> .gitignore
echo !ip/**/ >> .gitignore

echo# 保留根目录的 README.md 和 .gitignore >> .gitignore
echo !README.md >> .gitignore
echo !.gitignore >> .gitignore

:end
if "%error_flag%"=="0" (
    echo. >> %log_file%
    echo ✅ Project "%project_name%" created successfully! >> %log_file%
    start .
) else (
    echo. >> %log_file%
    echo ❌ An error occurred, the project was not created properly. >> %log_file%
)

echo.
echo (Process complete, press any key to exit)
exit /b

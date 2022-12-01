REM run as Administrator
@echo off

set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

@REM git clone --recursive https://github.com/emscripten-core/emsdk.git && cd emsdk && git checkout 3.1.25
SET EMSDK=%DOWNLOADS_DIR%\emsdk
SET EMSDK_NODE=%EMSDK%\node\14.18.2_64bit\bin\node.exe
SET EMSDK_PYTHON=%EMSDK%\python\3.9.2-nuget_64bit\python.exe
SET JAVA_HOME=%EMSDK%\java\8.152_64bit

SET PATH=^
%DOWNLOADS_DIR%\PortableGit\bin;^
%DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0;^
%DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\bin;^
%DOWNLOADS_DIR%\cmake-3.22.2-windows-x86_64\bin;^
%EMSDK%;^
%EMSDK%\upstream\emscripten;^
%EMSDK%\node\14.18.2_64bit\bin;

@REM set PATH=^
@REM D:\Softwares\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64;^
@REM D:\Softwares\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64\bin;^
@REM D:\Softwares\cmake-3.23.0-rc1-windows-x86_64\bin;

set CD_LINUX=%CD:\=/%

echo %CD_LINUX%

cd %~dp0

if exist cmake-build rmdir /s /q cmake-build

cmake.exe -G"MinGW Makefiles" ^
-DCMAKE_BUILD_TYPE=Debug ^
-DCMAKE_TOOLCHAIN_FILE="%DOWNLOADS_DIR_LINUX%/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake" ^
-Dflac_DIR="%DOWNLOADS_DIR_LINUX%/flac/cmake-build/flac-v1.4.2-emscripten-emsdk-3.1.25/lib/cmake/FLAC" ^
-DWITH_OGG=OFF ^
-B./cmake-build &&^
cd cmake-build &&^
cmake --build . &&^
echo "Successful build"
pause
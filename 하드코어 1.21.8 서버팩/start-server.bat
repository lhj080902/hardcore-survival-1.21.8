@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
title Minecraft Server Auto Launcher

echo ================================
echo Minecraft Server Auto Launcher
echo ================================
echo.

:: server.jar 파일 찾기
if not exist "server.jar" (
    echo server.jar 파일을 찾을 수 없습니다.
    echo 현재 폴더의 jar 파일 목록:
    echo.
    dir /b *.jar
    echo.
    set /p jarfile="사용할 jar 파일명을 입력하세요: "
) else (
    set jarfile=server.jar
)

if not exist "!jarfile!" (
    echo 파일을 찾을 수 없습니다: !jarfile!
    pause
    exit /b 1
)

echo.
echo 서버 파일: !jarfile!
echo 마인크래프트 버전 분석 중...
echo.

:: 파일명에서 버전 추출
set version=unknown
set filename=!jarfile!

:: 일반적인 버전 패턴 감지
echo !filename! | findstr /r "1\.20\.[5-9]" >nul && set version=1.20.5+
echo !filename! | findstr /r "1\.20\.[0-4]" >nul && set version=1.20
echo !filename! | findstr /r "1\.19" >nul && set version=1.19
echo !filename! | findstr /r "1\.18" >nul && set version=1.18
echo !filename! | findstr /r "1\.17" >nul && set version=1.17
echo !filename! | findstr /r "1\.16" >nul && set version=1.16
echo !filename! | findstr /r "1\.15" >nul && set version=1.15
echo !filename! | findstr /r "1\.14" >nul && set version=1.14
echo !filename! | findstr /r "1\.13" >nul && set version=1.13
echo !filename! | findstr /r "1\.12" >nul && set version=1.12
echo !filename! | findstr /r "1\.11" >nul && set version=1.12
echo !filename! | findstr /r "1\.10" >nul && set version=1.12
echo !filename! | findstr /r "1\.9" >nul && set version=1.12
echo !filename! | findstr /r "1\.8" >nul && set version=1.12
echo !filename! | findstr /r "1\.7" >nul && set version=1.12

echo 감지된 마인크래프트 버전: !version!

:: 버전에 따른 필요 자바 버전 결정
set required_java=8
if "!version!"=="1.20.5+" set required_java=21
if "!version!"=="1.20" set required_java=17
if "!version!"=="1.19" set required_java=17
if "!version!"=="1.18" set required_java=17
if "!version!"=="1.17" set required_java=16

echo 필요한 Java 버전: Java !required_java!+
echo.

:: 설치된 자바 찾기
set java_found=0
set java_path=

:: Java 21 찾기
if !required_java! LEQ 21 (
    for /d %%i in ("C:\Program Files\Java\jdk-21*") do (
        if exist "%%i\bin\java.exe" (
            set java_path=%%i\bin\java.exe
            set java_version=21
            set java_found=1
            goto :found
        )
    )
)

:: Java 17 찾기
if !required_java! LEQ 17 (
    for /d %%i in ("C:\Program Files\Java\jdk-17*") do (
        if exist "%%i\bin\java.exe" (
            set java_path=%%i\bin\java.exe
            set java_version=17
            set java_found=1
            goto :found
        )
    )
)

:: Java 16 찾기
if !required_java! LEQ 16 (
    for /d %%i in ("C:\Program Files\Java\jdk-16*") do (
        if exist "%%i\bin\java.exe" (
            set java_path=%%i\bin\java.exe
            set java_version=16
            set java_found=1
            goto :found
        )
    )
)

:: Java 11 찾기
if !required_java! LEQ 11 (
    for /d %%i in ("C:\Program Files\Java\jdk-11*") do (
        if exist "%%i\bin\java.exe" (
            set java_path=%%i\bin\java.exe
            set java_version=11
            set java_found=1
            goto :found
        )
    )
)

:: Java 8 찾기
if !required_java! LEQ 8 (
    for /d %%i in ("C:\Program Files\Java\jdk1.8*") do (
        if exist "%%i\bin\java.exe" (
            set java_path=%%i\bin\java.exe
            set java_version=8
            set java_found=1
            goto :found
        )
    )
    for /d %%i in ("C:\Program Files\Java\jre1.8*") do (
        if exist "%%i\bin\java.exe" (
            set java_path=%%i\bin\java.exe
            set java_version=8
            set java_found=1
            goto :found
        )
    )
)

:found
if !java_found!==0 (
    echo [오류] Java !required_java! 이상을 찾을 수 없습니다.
    echo.
    echo 다음 중 하나를 설치해주세요:
    if !required_java!==21 echo - Java 21: https://adoptium.net/
    if !required_java!==17 echo - Java 17: https://adoptium.net/
    if !required_java!==16 echo - Java 16: https://adoptium.net/
    if !required_java!==8 echo - Java 8: https://adoptium.net/
    pause
    exit /b 1
)

echo [성공] Java !java_version! 찾음
echo 경로: !java_path!
echo.
echo 서버를 시작합니다...
echo ================================
echo.

:: 서버 실행
"!java_path!" -Xmx12G -Xms4G -jar "!jarfile!" nogui

pause
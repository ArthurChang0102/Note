@ECHO OFF
CLS
MODE CON COLS=75 LINES=18
SETLOCAL ENABLEDELAYEDEXPANSION
TITLE  Windows 7 SP1(x86) ��s�] Update Package [WanMP]
ECHO  ��s�{�Ǥw�Ұʦ��\!
FOR /f "usebackq" %%i IN (`dir /b .\*.msu ^| find /c "msu"`) do set /a "TOTAL=%%i"
set /a "CURRENT=1"
FOR /f %%i in ('dir /b .\*.msu') do (
CLS
ECHO.
set /a "PERCENT=!CURRENT!*100/!TOTAL!"
ECHO �@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@  WanMP Online System
ECHO.
ECHO   ��������������������������������������������������������������
ECHO                                            �w�˶i�סG!PERCENT!/100
ECHO.
ECHO   ���b�w�˲� !CURRENT! �ӧ�s�A�`�@ %TOTAL% �ӧ�s�C
ECHO.
ECHO   ���b�w�� "%%i" �еy�� ... Please Wait ...
ECHO   ��������������������������������������������������������������
ECHO.
ECHO �@http://wmos.info/
ECHO.
start /wait .\%%i /quiet /norestart > nul
set /a "CURRENT+=1"
CLS
)
EXIT

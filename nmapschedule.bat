@echo off

chcp 65001
setlocal EnableDelayedExpansion

REM バージョン情報: v1.0

REM 診断対象のIPを格納するための変数
REM IP1の受け取り

echo 診断対象のIPがこれ以上ない場合は何も入力せずに「Enter」を入力してください。

set /p ip1=診断対象IPを入力してください: 
if "!ip1!"=="" (
    goto :next_process
)
set /p ip2=診断対象IPを入力してください: 
if "!ip2!"=="" (
    goto :next_process
)
set /p ip3=診断対象IPを入力してください: 
if "!ip3!"=="" (
    goto :next_process
)
set /p ip4=診断対象IPを入力してください: 
if "!ip4!"=="" (
    goto :next_process
)
set /p ip5=診断対象IPを入力してください: 
if "!ip5!"=="" (
    goto :next_process
)
set /p ip6=診断対象IPを入力してください: 
if "!ip6!"=="" (
    goto :next_process
)
set /p ip7=診断対象IPを入力してください: 
if "!ip7!"=="" (
    goto :next_process
)
set /p ip8=診断対象IPを入力してください: 
if "!ip8!"=="" (
    goto :next_process
)
set /p ip9=診断対象IPを入力してください: 
if "!ip9!"=="" (
    goto :next_process
)
set /p ip10=診断対象IPを入力してください: 
if "!ip10!"=="" (
    goto :next_process
)
set /p ip11=診断対象IPを入力してください: 
if "!ip11!"=="" (
    goto :next_process
)
set /p ip12=診断対象IPを入力してください: 
if "!ip12!"=="" (
    goto :next_process
)
set /p ip13=診断対象IPを入力してください: 
if "!ip13!"=="" (
    goto :next_process
)
set /p ip14=診断対象IPを入力してください: 
if "!ip14!"=="" (
    goto :next_process
)
set /p ip15=診断対象IPを入力してください: 
if "!ip15!"=="" (
    goto :next_process
)
set /p ip16=診断対象IPを入力してください:
if "!ip16!"=="" (
    goto :next_process
) 
set /p ip17=診断対象IPを入力してください: 
if "!ip17!"=="" (
    goto :next_process
)
set /p ip18=診断対象IPを入力してください: 
if "!ip18!"=="" (
    goto :next_process
)
set /p ip19=診断対象IPを入力してください: 
if "!ip19!"=="" (
    goto :next_process
)
set /p ip20=診断対象IPを入力してください: 
if "!ip20!"=="" (
    goto :next_process
)

:next_process
REM タスクスケジュールスキャンで使用するコマンド生成

set /p years=診断年を入力してください(yyyy):
set /p month=診断月を入力してください(mm):
set /p day=診断日を入力してください(dd):
set /p starttime=診断開始時間を入力してください(hh:mm):
set /p endtime=診断終了時間を入力してください(hh:mm):

REM ディレクトリのパスを指定

set /p directory_path=作成するディレクトリのパスを入力してください: 

REM 入力された変数の名前のディレクトリを作成する
for /L %%i in (1, 1, 20) do (
    if not "!ip%%i!"=="" (
        mkdir "!directory_path!\!ip%%i!"
    )
)

REM 入力された変数の名前のディレクトリを作成し、その下に log フォルダーと bat フォルダーを作成する
for /L %%i in (1, 1, 20) do (
    if not "!ip%%i!"=="" (
        mkdir "!directory_path!\!ip%%i!\log"
        mkdir "!directory_path!\!ip%%i!\bat"
        REM nmap_tcp.bat を作成し、指定された IP を含むコマンドを記述する
        echo nmap -sS -Pn !ip%%i! > "!directory_path!\!ip%%i!\bat\nmap_tcp.bat"
        type "!directory_path!\!ip%%i!\bat\nmap_tcp.bat"

        REM REM nmap_udp.bat を作成し、指定された IP を含むコマンドを記述する
        echo nmap -sU -Pn !ip%%i! > "!directory_path!\!ip%%i!\bat\nmap_udp.bat"
        type "!directory_path!\!ip%%i!\bat\nmap_udp.bat"
        
        REM タスクスケジューラに登録するためのコマンドを算出
        set task_name=Nmap_tcp_%%i
        echo schtasks /create /tn "%task_name%" /tr "%executable_path%" /sc once /sd %years%/%month%/%day% /st %starttime% /ru system 
    )
)

goto :end

:next_process
echo 診断対象IPが入力されていません。
echo 処理を中止します。
goto :end


@echo off
:: 设置目标目录（母文件夹路径）
set target_dir=D:\your\folder\path

:: 切换到目标目录
cd /d "%target_dir%"

:: 遍历当前目录下的所有子文件夹
for /d %%d in (*) do (
    7z a "%%d.zip" "%%d\*"
)

pause
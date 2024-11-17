@echo off
setlocal enabledelayedexpansion

:: 定义解压工具的路径（如果已添加到系统环境变量，可直接使用）
set sevenZipPath="C:\Program Files\7-Zip\7z.exe"

:: 检查 7-Zip 是否可用
if not exist %sevenZipPath% (
    echo 7-Zip 未找到，请检查路径或安装 7-Zip。
    pause
    exit /b
)

:: 遍历当前文件夹及所有子文件夹中的压缩包
for /r %%f in (*.zip) do (
    echo 正在解压 %%f ...
    set "currentFile=%%f"
    set "outputDir=%%~dpf"
    :: 创建一个与压缩包同名的文件夹
    set "extractFolder=%%~dpnxf_extracted"
    mkdir "!extractFolder!"
    :: 解压到指定文件夹
    %sevenZipPath% x "!currentFile!" -o"!extractFolder!" -y >nul
    echo 已解压到 "!extractFolder!"
)

echo 所有压缩包已解压完成。
pause

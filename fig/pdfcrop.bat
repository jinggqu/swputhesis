@echo off
setlocal enabledelayedexpansion

rem 提示用户输入参数 num 的值
set /p num=Enter the number of PDF files to process: 

rem 将变量 num 转换为整数类型
set /a num=%num%

rem 判断 num 是否小于等于 0
if %num% LEQ 0 (
  goto end
)

rem 切换到当前脚本所在目录
cd /d %~dp0

rem 将当前文件夹内所有 pdf 文件按照修改日期倒序排序
for /f "tokens=*" %%f in ('dir /b /a-d /o-d *.pdf') do (
  rem 循环处理最新的 num 个 pdf 文件
  echo Processing %%f.
  echo !num! files left.
  pdfcrop.exe "%%f" "%%f"
  set /a num-=1
  rem 判断 num 是否小于等于 0
  if !num! LEQ 0 (
    goto end
  )
)

:end
echo Loop ended
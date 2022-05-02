@echo off
%~d0
cd %~dp0

echo.
echo 初始化已存在的项目到git上.
echo 注:存在.git目录需要先删除,否则初始化是无效的.
echo.
set /p user_name=用户名:
rem 邮箱
set /p user_email=Email:
rem 密码
set /p user_password=密码:
rem 
set /p git_http_url=项目git的http地址:

cls

rem 显示配置
echo.
echo 用户名 :%user_name%
echo Email  :%user_email%
echo 密码   :%user_password%
echo git地址:%git_http_url%

rem 组合为带密码的url
if "%git_http_url:~0,5%"=="https" (
	set url1=https://
	set url2=%git_http_url:~8%
) else (
	set url1=http://
	set url2=%git_http_url:~7%
)

if "%user_password%"=="" (
    set git_url=%url1%%user_name%@%url2%
) else (
    set git_url=%url1%%user_name%:%user_password%@%url2%
)

echo 资源URL:%git_url%
echo.
pause

echo 请编辑.gitignore忽略脚本
echo.>> .gitignore
echo 通配符方式:git_*.bat
echo 文件夹方式:mydir/tempdir
notepad.exe .gitignore


rem 配置变量
git config user.name "%user_name%"
git config user.email "%user_email%"

echo 初始化项目
git init
git config user.name "%user_name%"
git config user.email "%user_email%"

echo 指定远程url
git remote add origin %git_url%

echo 添加本地目录到仓库
git add .

echo 提交本地仓库
git commit -m "init"

echo 提交线上仓库
git push -u origin master

pause

@echo off
%~d0
cd %~dp0

echo.
echo ��ʼ���Ѵ��ڵ���Ŀ��git��.
echo ע:����.gitĿ¼��Ҫ��ɾ��,�����ʼ������Ч��.
echo.
set /p user_name=�û���:
rem ����
set /p user_email=Email:
rem ����
set /p user_password=����:
rem 
set /p git_http_url=��Ŀgit��http��ַ:

cls

rem ��ʾ����
echo.
echo �û��� :%user_name%
echo Email  :%user_email%
echo ����   :%user_password%
echo git��ַ:%git_http_url%

rem ���Ϊ�������url
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

echo ��ԴURL:%git_url%
echo.
pause

echo ��༭.gitignore���Խű�
echo.>> .gitignore
echo ͨ�����ʽ:git_*.bat
echo �ļ��з�ʽ:mydir/tempdir
notepad.exe .gitignore


rem ���ñ���
git config user.name "%user_name%"
git config user.email "%user_email%"

echo ��ʼ����Ŀ
git init
git config user.name "%user_name%"
git config user.email "%user_email%"

echo ָ��Զ��url
git remote add origin %git_url%

echo ��ӱ���Ŀ¼���ֿ�
git add .

echo �ύ���زֿ�
git commit -m "init"

echo �ύ���ϲֿ�
git push -u origin master

pause

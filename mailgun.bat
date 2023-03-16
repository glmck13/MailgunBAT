@echo off

setlocal enableextensions

set MAILGUN_DOMAIN=
set MAILGUN_APIKEY=
set MAILGUN_FROM=
set MAILGUN_TO=
set MAILGUN_BCC=

set /P MAILGUN_TEMPLATE=Enter template name = 
set /P MAILGUN_SUBJECT=Enter subject = 
set /P MAILGUN_ATTACHMENT=Enter attachment = 

if not defined MAILGUN_ATTACHMENT set MAILGUN_ATTACHMENT=null
if exist %MAILGUN_ATTACHMENT% (set MAILGUN_ATTACHMENT=-F attachment=@%MAILGUN_ATTACHMENT%) else set MAILGUN_ATTACHMENT= 

echo.
set MAILGUN
echo.
pause

curl -k --user api:%MAILGUN_APIKEY% ^
    https://api.mailgun.net/v3/%MAILGUN_DOMAIN%/messages ^
    -F from=%MAILGUN_FROM% ^
    -F to=%MAILGUN_TO% ^
    -F bcc=%MAILGUN_BCC% ^
    -F subject="%MAILGUN_SUBJECT%" ^
    -F template=%MAILGUN_TEMPLATE% %MAILGUN_ATTACHMENT% ^
    -F h:X-Mailgun-Variables="{\"unsubscribe\":\"%%mailing_list_unsubscribe_url%%\",\"name\":\"%%recipient_name%%\"}"
pause

endlocal

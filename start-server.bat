@echo off
cd /d %~dp0
php -S 127.0.0.1:8082 -t public
pause

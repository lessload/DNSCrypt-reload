@echo off
cd /d "%~dp0"
xcopy .\win64 "C:\Program Files\dnscrypt-proxy-win64\" /h/i/c/k/e/r/y
cd /d "C:\Program Files\dnscrypt-proxy-win64\"
dnscrypt-proxy.exe -service stop
dnscrypt-proxy.exe -service uninstall
dnscrypt-proxy.exe -service install
for /F "tokens=3,*" %%A in ('netsh interface show interface ^| find "Dedicated"') do (netsh int ipv4 set dns name="%%B" static 127.0.0.1 primary validate=no && netsh int ipv6 set dns name="%%B" static ::1 primary validate=no)
ipconfig /flushdns
pause

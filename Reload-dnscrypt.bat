@echo off
cd /d "C:\Program Files\dnscrypt-proxy-win64\"
echo x > "%Temp%\dnscrypt-check.txt"

::StopService
dnscrypt-proxy.exe -service stop
for /F "tokens=3,*" %%A in ('netsh interface show interface ^| find "Dedicated"') do (netsh int ipv4 set dns "%%B" dhcp && netsh int ipv6 set dns "%%B" dhcp)
ipconfig /flushdns

:OfflineTest
timeout /t 1 /nobreak
powershell -Command "Invoke-WebRequest https://czd1.github.io/c.txt -OutFile '%Temp%\dnscrypt-check.txt' "
for /F "delims=:" %%I in (%Temp%\dnscrypt-check.txt) do (if /I "czd" == "%%I" (echo x > "%Temp%\dnscrypt-check.txt" && GoTo OnlineRun) else (GoTo OfflineTest))

:OnlineRun
::StartService
dnscrypt-proxy.exe -service start
::for temporary fix NCSI indicator in some case
::timeout /t 15 /nobreak
for /F "tokens=3,*" %%A in ('netsh interface show interface ^| find "Connected"') do (netsh int ipv4 set dns name="%%B" static 127.0.0.1 primary validate=no && netsh int ipv6 set dns name="%%B" static ::1 primary validate=no)
ipconfig /flushdns
::pause

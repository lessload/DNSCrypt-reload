:: LESSLOAD-DNSCrypt v1.0
@echo off
cd /d "C:\Program Files\dnscrypt-proxy-win64\"
echo x > "%Temp%\dnscrypt-check.txt"

::StopService
dnscrypt-proxy.exe -service stop
for /F "tokens=3,*" %%A in ('netsh interface show interface ^| find "Dedicated" ^| find /i /v "Local Area"') do (netsh int ipv4 set dns "%%B" dhcp && netsh int ipv6 set dns "%%B" dhcp)
ipconfig /flushdns

:OfflineTest
cls
echo [-Retest Connection-]
powershell -Command "Invoke-WebRequest https://pastebin.com/raw/RH3GW47Q -OutFile '%Temp%\dnscrypt-check.txt' -TimeoutSec 1"
for /F "delims=:" %%I in (%Temp%\dnscrypt-check.txt) do (if /I "czd" == "%%I" (echo x > "%Temp%\dnscrypt-check.txt" && GoTo OnlineRun) else (GoTo OfflineTest))

:OnlineRun
::StartService
dnscrypt-proxy.exe -service start
::you can remove timeout if you use static sdns://
timeout /t 5 /nobreak
for /F "tokens=3,*" %%A in ('netsh interface show interface ^| find "Connected" ^| find /i /v "Local Area"') do (netsh int ipv4 set dns name="%%B" static 127.0.0.1 primary validate=no && netsh int ipv6 set dns name="%%B" static ::1 primary validate=no)
ipconfig /flushdns
::pause

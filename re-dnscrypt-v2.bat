:: LESSLOAD-DNSCrypt v2.0 beta
@echo off
cd /d "C:\Program Files\dnscrypt-proxy-win64\"
echo x > "%Temp%\dnscrypt-check.txt"

::StopService
dnscrypt-proxy.exe -service stop
for /F "tokens=3,*" %%A in ('netsh interface show interface ^| find "Dedicated" ^| find /i /v "Local Area"') do (netsh int ipv4 set dns "%%B" dhcp && netsh int ipv6 set dns "%%B" dhcp)
ipconfig /flushdns

:OnlineTest
cls
echo [-Retest Connection-]
powershell -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest https://pastebin.com/raw/RH3GW47Q -OutFile '%Temp%\dnscrypt-check.txt' -TimeoutSec 1"
for /F "delims=:" %%I in (%Temp%\dnscrypt-check.txt) do (if /I "czd" == "%%I" (echo x > "%Temp%\dnscrypt-check.txt" && GoTo RunService) else (GoTo OnlineTest))

:RunService
::StartService
::Don't forget edit script to your file location
start "" powershell -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v2/public-resolvers.md.minisig -OutFile 'C:\Program Files\dnscrypt-proxy-win64\public-resolvers.md.minisig'"
start "" powershell -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v2/relays.md -OutFile 'C:\Program Files\dnscrypt-proxy-win64\relays.md'"
start "" powershell -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v2/relays.md.minisig -OutFile 'C:\Program Files\dnscrypt-proxy-win64\relays.md.minisig'"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v2/public-resolvers.md -OutFile 'C:\Program Files\dnscrypt-proxy-win64\public-resolvers.md'"
dnscrypt-proxy.exe -service start
for /F "tokens=3,*" %%A in ('netsh interface show interface ^| find "Connected" ^| find /i /v "Local Area"') do (netsh int ipv4 set dns name="%%B" static 127.0.0.1 primary validate=no && netsh int ipv6 set dns name="%%B" static ::1 primary validate=no)
ipconfig /flushdns
::pause

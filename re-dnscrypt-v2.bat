:: LESSLOAD-DNSCrypt v2.2 beta
@echo off
cd /d "C:\Program Files\dnscrypt-proxy-win64\"
echo x > "%Temp%\dnscrypt-check.txt"

::StopService
dnscrypt-proxy.exe -service stop
for /F "tokens=3,*" %%A in ('netsh interface show interface ^| find "Dedicated" ^| find /i /v "Local Area"') do (netsh int ipv4 set dns "%%B" dhcp && netsh int ipv6 set dns "%%B" dhcp)
ipconfig /flushdns

:OnlineTest
::use timeout reduce cpu usage from 70 to 30% on Intel Atom.
::timeout /t 1
cls
echo [-Retest Connection-]
::Pastebin.com access denine sometime, please change to your host
curl --silent --connect-timeout 1 https://pastebin.com/raw/RH3GW47Q -o %Temp%\dnscrypt-check.txt
for /F "delims=:" %%I in (%Temp%\dnscrypt-check.txt) do (if [%%I]==[czd] (GoTo RunService) else (GoTo OnlineTest))

:RunService
::StartService
::Don't forget edit script to your file location
start cmd /c "curl --silent https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v2/public-resolvers.md.minisig -o C:\Program Files\dnscrypt-proxy-win64\public-resolvers.md.minisig & curl --silent https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v2/relays.md -o C:\Program Files\dnscrypt-proxy-win64\relays.md & curl --silent https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v2/relays.md.minisig -o C:\Program Files\dnscrypt-proxy-win64\relays.md.minisig"
curl --silent https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v2/public-resolvers.md -o C:\Program Files\dnscrypt-proxy-win64\public-resolvers.md
dnscrypt-proxy.exe -service start
for /F "tokens=3,*" %%A in ('netsh interface show interface ^| find "Connected" ^| find /i /v "Local Area"') do (netsh int ipv4 set dns name="%%B" static 127.0.0.1 primary validate=no && netsh int ipv6 set dns name="%%B" static ::1 primary validate=no)
ipconfig /flushdns
::pause

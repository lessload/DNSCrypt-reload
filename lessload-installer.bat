@echo off
cd /d "%~dp0"
xcopy .\win64 "C:\Program Files\dnscrypt-proxy-win64\" /h/i/c/k/e/r/y
cd /d "C:\Program Files\dnscrypt-proxy-win64\"
dnscrypt-proxy.exe -service stop
dnscrypt-proxy.exe -service uninstall
dnscrypt-proxy.exe -service install
::reg add not work with device that never use
for /f "tokens=1" %%I in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /k /f "{" ^| find /i "{"') do (for /f "tokens=1" %%J in ('reg query "%%I" /v "DhcpIPAddress" ^| find /i "HKEY"') do (Reg add %%I /v "NameServer" /t REG_SZ /d "127.0.0.1" /f))
for /f "tokens=1" %%I in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters\Interfaces" /k /f "{" ^| find /i "{"') do (for /f "tokens=1" %%J in ('reg query "%%I" /v "Dhcpv6State" ^| find /i "HKEY"') do (Reg add %%I /v "NameServer" /t REG_SZ /d "::1" /f))
::
for /F "tokens=3,*" %%A in ('netsh interface show interface ^| find "Connected"') do (netsh int ipv4 set dns name="%%B" static 127.0.0.1 primary validate=no && netsh int ipv6 set dns name="%%B" static ::1 primary validate=no)
ipconfig /flushdns
pause

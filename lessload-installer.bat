@echo off
net stop dnscrypt-proxy
cd /d "%~dp0"
xcopy .\win64 "C:\Program Files\dnscrypt-proxy-win64\" /h/i/c/k/e/r/y
cd /d "C:\Program Files\dnscrypt-proxy-win64\"
dnscrypt-proxy.exe -service uninstall
dnscrypt-proxy.exe -service install
for /F "tokens=3,*" %%A in ('netsh interface show interface ^| find "Dedicated" ^| find /i /v "Local Area"') do (netsh int ipv4 set dns name="%%B" static 127.0.0.1 primary validate=no && netsh int ipv6 set dns name="%%B" static ::1 primary validate=no)
ipconfig /flushdns

::NCSI modify
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "PassivePollPeriod" /t REG_DWORD /d "5" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d "0" /f
::NCSI modify [need Manual config in Group Policy]
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v UseGlobalDNS /t REG_DWORD /d 1 /f

pause

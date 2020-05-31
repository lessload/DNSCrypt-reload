# LESSLOAD-DNSCrypt

cmd script automatic detect internet and start. one click base to run dnscrypt-proxy.

1. download `dnscrypt-proxy-winXX-x.x.x.zip` ( [source](https://github.com/DNSCrypt/dnscrypt-proxy/releases/) ) and place `winXX` folder same directory as `lessload-installer.bat`

2. run `lessload-installer.bat` _[run as admin]_ to install <br/>(it will install loopback to all interface & block all internet by default)

3. config your `dnscrypt-proxy.toml` and other.

4. one click `re-dnscrypt.bat` _[run as admin]_ to check internet and start dnscrypt, script will automatic detect internet or wait for you to login through Web Portal and run dnscrypt-proxy.

( recommend you to run script before connect wifi , Web Captive Portal will not show _in some case_ if you run script after connect wifi )<br/>
( no need to stop service just restart to get internet connection back )



## Pro
- support Web Captive Portal, Normally `dnscrypt-proxy` may break web portal in some case.
- easy to re-run dnscrypt-proxy by run `re-dnscrypt.bat` _[run as admin]_
- just script, no need more resource usage.
- less DNS traffic leak ( `just 5s` `nearly 0 if you use static sdns://` )
- clean.

## Con
- you need to config *.toml manual. ( [From this manual](https://github.com/DNSCrypt/dnscrypt-proxy/wiki/Configuration) )
- Request PowerShell, work on Windows 8 or above

## _NCSI problem with dnscrypt-proxy_
If you do not use your device too long, and `*.md` was outdate and 127.0.0.1 is still DNS of windows.
`dnscrypt-proxy` will fail to update and stop themself. That why i make this script.
This script will help you to fastly connect to your DNSCrypt as possible ans set loopback, to prevent some DNS traffic leak.

  ( _temporary fix_ it by custom timout between script, as in `re-dnscrypt.bat` )<br/>
  ( to _fix it without_ custom timeout, your need to static `sdns://` in `dnscrypt-proxy.toml` )<br/>
  ( use `lessload-installer.bat` to reduce NCSI poll period before run `re-dnscrypt.bat` )<br/>
  _dnscrypt-proxy update method use or trust in [Microsoft NCSI](https://answers.microsoft.com/en-us/windows/forum/windows_10-networking/network-connection-status-indicator-ncsi-showing/02664ddf-4eac-449a-8318-bdae1a5bad3d) make it got problem _<br/>
  _All explain about this issue is [here](https://github.com/DNSCrypt/dnscrypt-proxy/issues/1345)_
  
## Bug
- some anti-virus may block PowerShell to connect the internet. make it allow.


------------------------------------------
***Please advice me to make code more stable.***  - LESSLOAD

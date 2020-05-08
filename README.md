# LESSLOAD-DNSCrypt

cmd script automatic detect internet and start. one click base to run dnscrypt-proxy.

1. download `dnscrypt-proxy-winXX-x.x.x.zip` ( [source](https://github.com/DNSCrypt/dnscrypt-proxy/releases/) ) and place `winXX` folder same directory as `lessload-installer.bat`

2. run `lessload-installer.bat` _[run as admin]_ to install <br/>(it will install loopback to all interface & block all internet by default)

3. one click `reload-dnscrypt.bat` _[run as admin]_ to access internet with dnscrypt, script will automatic detect internet or wait for you to login through Web Portal and run dnscrypt-proxy.

( recommend you to run script before connect wifi , Web Captive Portal will not show _in some case_ if you run script after )<br/>
( no need to stop service just restart to get internet connection back )



## Pro
- support Web Captive Portal, Normally `dnscrypt-proxy` may break web portal in some case.
- easy to re-run dnscrypt-proxy by run `reload-dnscrypt.bat` _[run as admin]_
- just script, no need more resource usage.
- less data leak ( `just 5s` )
- clean.

## Con
- you need to config *.toml manual. ( [From this manual](https://github.com/DNSCrypt/dnscrypt-proxy/wiki/Configuration) )
- Request PowerShell, work on Windows 8 or above

## Bug
- some anti-virus may block PowerShell to connect the internet. make it allow.
- in case of Microsoft NCSI indicator not detect internet, `dnscrypt-proxy` will not download dnscrypt-resolvers make it start service fail.
  `log: System DNS configuration not usable yet, exceptionally resolving [raw.githubusercontent.com] using fallback resolvers over tcp`<br/>
  ( dnscrypt-proxy use or trust in [Microsoft NCSI](https://answers.microsoft.com/en-us/windows/forum/windows_10-networking/network-connection-status-indicator-ncsi-showing/02664ddf-4eac-449a-8318-bdae1a5bad3d) make it got problem, custom time out in script<br/>to temporary fix )<br/>
  ( use `lessload-installer.bat` to reduce NCSI poll period )

------------------------------------------
***Please advice me to make code more stable.***  - LESSLOAD

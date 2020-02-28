# LESSLOAD-DNSCrypt

cmd script automatic detect internet and start. one click base to run dnscrypt-proxy.

1. download dnscrypt-proxy-winXX-x.x.x.zip ( [source](https://github.com/DNSCrypt/dnscrypt-proxy/releases/) ) and place winXX folder same as lessload-installer.bat

2. run lessload-installer.bat {run as admin} to install ( it will install loopback to all interface & block all internet by default )

3. one click Reload-dnscrypt.bat {run as admin} to access internet with dnscrypt, script will automatic detect internet and run dnscrypt-proxy.

( you can run script before or after connect wifi but Web Captive Portal will not show if you not run script after )

( no need to stop service just restart to get internet connection )



## Pro
- one click base to run dnscrypt-proxy by run "Reload-dnscrypt.bat" {run as admin}
- support Web Captive Portal ('nslookup' & 'ping' not work like this script ).
- less resource usage.
- less data leak ( maybe )
- clean.

## Con
- you need to config *.toml manual. ( [From this manual](https://github.com/DNSCrypt/dnscrypt-proxy/wiki/Configuration) )
- Request PowerShell work on Windows 8 or above

## Bug
- can not install loopback to interface that never use.
- some anti-virus may block PowerShell to connect the internet. make it allow.
- in some case dnscrypt-proxy can not download nscrypt-resolvers make it start service fail. ( please advice )

------------------------------------------
***Please advice me to make code more stable.***  - LESSLOAD

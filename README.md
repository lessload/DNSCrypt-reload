# LESSLOAD-DNSCrypt

cmd script automatic detect internet and start. one click base to run dnscrypt-proxy.

1. run install script (it will install loopback to all interface by default & block all internet)

2. one click restart to access internet with dnscrypt, script will automatic detect internet and run dnscrypt-proxy.

(you can run script before or after connect internet but Web Captive Portal will not detect if you not run script after)



## Pro
- one click base to run dnscrypt-proxy.
- support Web Captive Portal ('nslookup' & 'ping' not work like this script).
- less resource usage.
- less data leak (maybe)
- clean.

## Con
- you need to config *.toml manual. Ref: (https://github.com/DNSCrypt/dnscrypt-proxy/wiki/Configuration)


## Bug
- can not install loopback to interface that never use.
- some anti-virus may block PowerShell to connect the internet. make it allow.
- in some case dnscrypt-proxy can not download nscrypt-resolvers make it start service fail.

------------------------------------------
Please advice me to make code more stable.

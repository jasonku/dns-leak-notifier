# DNS Leak Notifier

Displays a Mac OS X notification if a [DNS leak](https://en.wikipedia.org/wiki/DNS_leak) or [DNS hijacking](https://en.wikipedia.org/wiki/DNS_hijacking) is detected.

![notif](https://cloud.githubusercontent.com/assets/318214/24342016/e4fcc3f6-1272-11e7-8c87-c63b930014e8.png)

## Usage

### DNS Leak Detection

Put a `.dnsleak` in your home directory containing a list of cities you expect your VPN IP address to come from. A notification will be shown if your IP is reported as NOT coming from any of these cities.

Example:

```
Chicago
Houston
Matawan
```

To have the script run as a service, copy or symlink `dns-leak-notifier.plist` to `~/Library/LaunchAgents` and modify the paths to point to the script and a log destination.

To start the service, use `launchctl load ~/Library/LaunchAgents/dns-leak-notifier.plist && launchctl start dns-leak-notifier` or just re-login.

### DNS Hijacking Detection

The script will also `nslookup` a non-existent domain, to ensure that the `NXDOMAIN` response is returned. If a valid IP is returned for a non-existent domain, [your ISP is likely hijacking your DNS requests](https://en.wikipedia.org/wiki/DNS_hijacking#Manipulation_by_ISPs).
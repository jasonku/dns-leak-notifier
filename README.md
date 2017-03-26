# DNS Leak Notifier

Displays a Mac OS X notification if a DNS leak is detected.

![default](https://cloud.githubusercontent.com/assets/318214/24335683/4a589446-1237-11e7-8a4f-6fb2802c3b97.png)

## Usage

Put a `.dnsleak` in your home directory containing a list of cities. A notification will be shown if your IP is reported as coming from one of these cities.

Example:

```
San Francisco
Berkeley
Oakland
```

To have the script run as a service, copy or symlink `dns-leak-notifier.plist` to `~/Library/LaunchAgents` and modify the paths to point to the script and a log destination.

To start the service, use `launchctl load dns-leak-notifier && launchctl start dns-leak-notifier` or just re-login.

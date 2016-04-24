# Unofficial Quiver Export

This is the un-official gem for [Quiver](http://happenapps.com/#quiver). It exports Quiver notes to text files.

## Installation

```bash
gem install unofficial-quiver-export
```

## Warnings

This gem removes the selected --out option directory, if you select --clean option. Please back up the directory before execute it.

## Usage

```bash
$ quiver-export --in $HOME/Dropbox/Apps/Quiver/Quiver.qvlibrary --out $HOME/Dropbox/Apps/Quiver/Quiver.export
```

## Scheduled task

In order to execute scheduled task, you should use launchctl.

For Example:

First: Create ~/Library/LaunchAgents/com.example.quiver-export.plist.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>local.job</string>
  <key>ProgramArguments</key>
  <array>
    <string>/Users/Nori/.rbenv/shims/quiver-export</string>
    <string>--in</string>
    <string>/Users/Nori/Dropbox/Apps/Quiver/Quiver.qvlibrary</string>
    <string>--out</string>
    <string>/Users/Nori/Dropbox/Apps/Quiver/Quiver.export</string>
    <string>--ext</string>
    <string>.md</string>
  </array>
  <key>StandardErrorPath</key>
  <string>/Users/Nori/LaunchctlLogs/com.nori3tsu.quiver-export.stderr</string>
  <key>StandardOutPath</key>
  <string>/Users/Nori/LaunchctlLogs/com.nori3tsu.quiver-export.stdout</string>
  <key>StartCalendarInterval</key>
  <array>
    <dict/>
    <dict>
      <key>Minute</key>
      <integer>0</integer>
    </dict>
    <dict>
      <key>Minute</key>
      <integer>5</integer>
    </dict>
    <dict>
      <key>Minute</key>
      <integer>10</integer>
    </dict>
    <dict>
      <key>Minute</key>
      <integer>15</integer>
    </dict>
    <dict>
      <key>Minute</key>
      <integer>20</integer>
    </dict>
    <dict>
      <key>Minute</key>
      <integer>25</integer>
    </dict>
    <dict>
      <key>Minute</key>
      <integer>30</integer>
    </dict>
    <dict>
      <key>Minute</key>
      <integer>35</integer>
    </dict>
    <dict>
      <key>Minute</key>
      <integer>40</integer>
    </dict>
    <dict>
      <key>Minute</key>
      <integer>45</integer>
    </dict>
    <dict>
      <key>Minute</key>
      <integer>50</integer>
    </dict>
    <dict>
      <key>Minute</key>
      <integer>55</integer>
    </dict>
  </array>
</dict>
</plist>
```

Second: load a setting with launchctrl.

```
$ launchctl load ~/Library/LaunchAgents/com.example.quiver-export.plist
```

## For more information

```bash
$ quiver-export help exec
```


# Unofficial Quiver Export

This is the un-official gem for [Quiver](http://happenapps.com/#quiver). It exports Quiver notes to text files.

## Installation

```ruby
gem 'unofficial-quiver-export'
```

## Warnings

This gem removes the selected --out option directory. Please back up the directory before execute it.

## Usage

```bash
quiver-export --in $HOME/Dropbox/Apps/Quiver/Quiver.qvlibrary --out $HOME/Dropbox/Apps/Quiver/Quiver.export
```

## Scheduled task

In order to execute scheduled task, you should use `crontab -e`.

Example of a setting:

```cron
LC_CTYPE=en_US.UTF-8
*/5 * * * * $HOME/.rbenv/shims/quiver-export --in $HOME/Dropbox/Apps/Quiver/Quiver.qvlibrary --out $HOME/Dropbox/Apps/Quiver/Quiver.export > $HOME/.quiver-export/quiver-export.log 2>&1
```

## For more information

```bash
quiver-export help exec
```


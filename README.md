# peakeutils
custom scripts that aid in productivity

## connectwise-manage-tab-title.user.js
A userscript that dynamically sets the browser tab title based on the current page heading in Connectwise Manage

Install with a userscript extension like TamperMonkey or ViolentMonkey. Set the @match variable to the base Url of your Manage instance. Ex: `@match https://manage.mydomain.tld`

## lp-fzf
Filter LastPass entries through FZF on the commandline, then copy password to clipboard. 1000% faster than using the web ui.

Requires: WSL/Linux/Mac, [lastpass-cli](https://github.com/lastpass/lastpass-cli), [fzf](https://github.com/junegunn/fzf)

## download-from-github.ps1
Powershell script to download (and optionally, run) other powershell scripts from any URL or private GitHub repo

Usage:
```
PS> .\download-from-github.ps1 [-Url https://domain.tld/file.ps1] | [-Path user/repo/file.ps1] [-Token github token] [-Run] [-Params "-Arguments 'to pass to' -Downloaded 'script"]
```
Example:

`.\download-from-github.ps1 -Path "PEAKE-Technology-Partners/peakeutils/test.ps1" -Token "ghp_xxxxxxxxxxxxxxxxxx" -Run -Params "-Name Jon"`

Output:
`Hello, Jon`

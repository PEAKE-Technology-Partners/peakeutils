param([string]$name = "world", [switch]$getdate)
"hello $name"
if ($getdate) {
  Get-Date
}
New-Item -ItemType "Directory" -Path "C:\temp\" -Force
Add-Content -Path "C:\temp\test.log" -Value "ran test script at $(get-date)"

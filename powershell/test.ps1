param([string]$name = "world", [switch]$getdate, [switch]$log)
"hello $name"
if ($getdate) {
  Get-Date
}
if ($log) {
  $filepath = "C:\temp"
  if($PSVersionTable.Platform -eq "Unix") {
    $filepath = "/tmp"
  }
  try {
    New-Item -ItemType "Directory" -Path $filepath -Force
    Add-Content -Path $(Join-Path $filepath "test.log") -Value "ran test script at $(get-date)"
  }
  catch {
    Write-Host "error: "
    Write-Host $_
  }
}

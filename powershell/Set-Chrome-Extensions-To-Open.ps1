param([string]$extensions)
$chrome_prefs_files = $(Get-ChildItem "C:\Users\*\AppData\Local\Google\Chrome\User Data\Default\Preferences")
$chrome_prefs_files.ForEach({
  $prefs_json = Get-Content $_.FullName -Raw | ConvertFrom-Json
  if (-not $prefs_json.download) {
    $exts_prop = New-Object PSObject -Property $(@{extensions_to_open = $extensions})
    $prefs_json | Add-Member -Type NoteProperty -Name "download" -Value $exts_prop
  }
  else {
    if (-not $prefs_json.download.extensions_to_open) {
      $prefs_json.download | Add-Member -Type NoteProperty -Name "extensions_to_open" -Value $extensions
    }
    else {
      $prefs_json.download.extensions_to_open += ":$extensions"
    }
  }
  ConvertTo-Json $prefs_json -Compress -Depth 100 | Out-File $_.FullName -Encoding utf8
  Write-Host "Updated download.extensions_to_open in $($_.FullName)"
})

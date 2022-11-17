function Get-TimeNoun {
    param (
        $Time = [DateTime]::Now
    )
    if ($Time.Hour -lt 12) {
        return "morning"
    }
    elseif ($Time.Hour -ge 12) {
        if ($Time.Hour -ge 18) { return "evening" }
        return "afternoon"
    }
}

Write-Host -NoNewline $(Get-TimeNoun)
# Enable TLSv1.2 for compatibility with older clients
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12

$DownloadCMD = 'https://naeembolchhi.github.io/Update-SpotX/shortcutter.bat'
$DownloadICON = 'https://naeembolchhi.github.io/Update-SpotX/spotter.ico'

$folderPath = "$env:ProgramData\U3BvdHRlcg"
if (-not (Test-Path -Path $folderPath)) {
    New-Item -Path $folderPath -ItemType Directory
}

$FilePath = "$folderPath\spotter.bat"
$ShellPath = "$folderPath\spotter.ps1"
$IconPath = "$folderPath\spotter.ico"
$CMDPath = "$folderPath\shortcutter.bat"

if (Test-Path $FilePath) {
    $item = Get-Item -LiteralPath $FilePath
    $item.Delete()
}
if (Test-Path $ShellPath) {
    $item = Get-Item -LiteralPath $ShellPath
    $item.Delete()
}
if (Test-Path $IconPath) {
    $item = Get-Item -LiteralPath $IconPath
    $item.Delete()
}
if (Test-Path $CMDPath) {
    $item = Get-Item -LiteralPath $CMDPath
    $item.Delete()
}

try {
    Invoke-WebRequest -Uri $DownloadICON -UseBasicParsing -OutFile $IconPath
	Invoke-WebRequest -Uri $DownloadCMD -UseBasicParsing -OutFile $CMDPath
	
	"@echo off" | Out-File -FilePath $FilePath
	"powershell -File `"spotter.ps1`"" | Out-File -FilePath $FilePath -Append
	"pause" | Out-File -FilePath $FilePath -Append
	
	"iex" | Out-File -FilePath $ShellPath -NoNewline
	" `"& { $" | Out-File -FilePath $ShellPath -Append -NoNewline
	"(" | Out-File -FilePath $ShellPath -Append -NoNewline
	"iwr" | Out-File -FilePath $ShellPath -Append -NoNewline
	" -useb '" | Out-File -FilePath $ShellPath -Append -NoNewline
	"https://raw.githubusercontent.com/SpotX-Official/spotx-official.github.io/main/run." | Out-File -FilePath $ShellPath -Append -NoNewline
	"ps1') } " | Out-File -FilePath $ShellPath -Append -NoNewline
	"-confirm_uninstall_ms_spoti -confirm_spoti_recomended_over -podcasts_off -block_update_on -start_spoti -new_theme -adsections_off -lyrics_stat spotify`"" | Out-File -FilePath $ShellPath -Append -NoNewline
	
} catch {
    Write-Error $_
	Return
}

if (Test-Path $CMDPath) {
    Start-Process $CMDPath -Wait
	
	$item = Get-Item -LiteralPath $CMDPath
    $item.Delete()
}

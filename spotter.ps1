# Enable TLSv1.2 for compatibility with older clients
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12

$DownloadFILE1 = 'https://naeembolchhi.github.io/Update-SpotX/spotter.bat'
$DownloadFILE2 = 'https://naeembolchhi.github.io/Update-SpotX/spotx.ps1'
$DownloadFILE3 = 'https://naeembolchhi.github.io/Update-SpotX/shortcutter.bat'
$DownloadICON = 'https://naeembolchhi.github.io/Update-SpotX/spotter.ico'

$folderPath = "$env:ProgramData\U3BvdHRlcg"
if (-not (Test-Path -Path $folderPath)) {
    New-Item -Path $folderPath -ItemType Directory
}

$FilePath1 = "$folderPath\spotter.bat"
$FilePath2 = "$folderPath\spotx.ps1"
$FilePath3 = "$folderPath\shortcutter.bat"
$IconPath = "$folderPath\spotter.ico"

if (Test-Path $FilePath1) {
    $item = Get-Item -LiteralPath $FilePath1
    $item.Delete()
}
if (Test-Path $FilePath2) {
    $item = Get-Item -LiteralPath $FilePath2
    $item.Delete()
}
if (Test-Path $FilePath3) {
    $item = Get-Item -LiteralPath $FilePath3
    $item.Delete()
}
if (Test-Path $IconPath) {
    $item = Get-Item -LiteralPath $IconPath
    $item.Delete()
}

try {
	Invoke-WebRequest -Uri $DownloadICON -UseBasicParsing -OutFile $IconPath
	Invoke-WebRequest -Uri $DownloadFILE1 -UseBasicParsing -OutFile $FilePath1
	Invoke-WebRequest -Uri $DownloadFILE2 -UseBasicParsing -OutFile $FilePath2
	Invoke-WebRequest -Uri $DownloadFILE3 -UseBasicParsing -OutFile $FilePath3
} catch {
    Write-Error $_
	Return
}

if (Test-Path $FilePath3) {
    Start-Process $FilePath3 -Wait
	
	$item = Get-Item -LiteralPath $FilePath3
    $item.Delete()
}

Write-Host ""
Write-Host "A shortcut for SpotX was successfully added to Start Menu's Programs folder."
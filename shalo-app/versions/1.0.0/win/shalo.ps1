#Requires -RunAsAdministrator
$instalarionPath = "$Env:Programfiles\Shalo"
Remove-Item -Path "$instalarionPath\shalo.exe" -Force -ErrorAction Ignore
New-Item -ItemType Directory -Path $instalarionPath -Force -Verbose
Invoke-WebRequest -Uri "https://salomonvargas.github.io/shalo-universe/shalo-app/versions/1.0.0/win/shalo.exe" -OutFile "$instalarionPath\shalo.exe"

if(! $env:Path -like "*$instalarionPath*"){
    $env:Path += ";$instalarionPath" 
}

Clear-Host
Write-Host "Congratularions!, Shalo app is now installed"
Write-Host " "
Write-Host "Please run 'Shalo -h' for get help"
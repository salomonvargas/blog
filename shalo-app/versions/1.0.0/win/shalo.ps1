#Requires -RunAsAdministrator
$instalarionPath = "$Env:Programfiles\Shalo"
Remove-Item -Path "$instalarionPath\shalo.exe" -Force -ErrorAction Ignore -InformationAction SilentlyContinue
New-Item -ItemType Directory -Path $instalarionPath -Force -InformationAction SilentlyContinue
Invoke-WebRequest -Uri "https://salomonvargas.github.io/shalo-universe/shalo-app/versions/1.0.0/win/shalo.exe" -OutFile "$instalarionPath\shalo.exe"

$oldpath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
if(! $oldpath.IndexOf("$instalarionPath") -ge 0){
    $oldpath += ";$instalarionPath" 
    Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $oldpath

    $ENV:PATH="$ENV:PATH;$instalarionPath"
}

Clear-Host
Write-Host "Congratularions!, Shalo app is now installed"
Write-Host " "
Write-Host "Please run 'shalo -h' for get help"
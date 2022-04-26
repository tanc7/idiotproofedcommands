# Open a Powershell prompt as administrator and run this `powershell -ep bypass .\route_ssh_to_wsl.ps1`

wsl.exe sudo /etc/init.d/ssh start
$wsl_ip = (wsl hostname -I).trim()
Write-Host "WSL Machine IP: ""$wsl_ip"""
netsh interface portproxy add v4tov4 listenport=3000 connectport=22 connectaddress=$wsl_ip

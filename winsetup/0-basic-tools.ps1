"Installing Chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

"Installing Basic Tools..."
cinst -y echoargs curl 7zip winmerge autoruns procexp gimp vlc filezilla git

"Web Browsers"
cinst -y googlechrome firefox

"Notepad++"
cinst -y notepadplusplus

"Notepad Replacer (defaults to Notepad++)"
$argList="/notepad=`"`"$env:ProgramFiles\Notepad++\Notepad++.exe`"`" /verysilent"
cinst notepadreplacer --force -y -ia $argList

"LibreOffice"
cinst -y libreoffice-fresh

"Java LTS"
cinst -y openjdk11

"Visual Studio Code"
cinst -y vscode

"Visual Studio 2019 Community"
cinst -y visualstudio2019community

"Remote Desktop"
cinst -y anydesk

"Tablacus (lternative File Explorer)"
cinst -y tablacus


"WARNING: Requires a few clicks"

"Any Video Converter (Free)"
cinst -y anyvideoconverter


<##############################################
To Review:
###############################################
Install or Update Multiple apps at once
https://ninite.com/

Peer-to-peer file sharing
https://www.tixati.com/discover/

Video Converter
HandBreak

Video Editors (Free)
https://shotcut.org/
https://www.openshot.org/

# HWINFO

Advanced Uninstaller Free
https://www.revouninstaller.com/products/revo-uninstaller-free/
#>

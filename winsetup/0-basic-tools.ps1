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
# cmd arguments: https://chocolatey.org/packages/visualstudio2019community
# https://docs.microsoft.com/en-us/visualstudio/install/use-command-line-parameters-to-install-visual-studio?view=vs-2019
cinst -y visualstudio2019community --package-parameters "--locale en-US --includeRecommended --includeOptional --add Microsoft.VisualStudio.Workload.Azure --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Workload.Data --add Microsoft.VisualStudio.Workload.ManagedDesktop --passive"

"SQL Server Management Studio"
cinst -y ssms

"Fiddler (Web Debugger)"
cinst -y fiddler

"Remote Desktop"
cinst -y anydesk

"WARNING: Requires a few clicks"

"Any Video Converter (Free)"
cinst -y anyvideoconverter

"Screen Recorder (Free)"
cinst -y obs-studio

"Tabbed File Explorer: Double Commander for Windows"
cinst -y doublecmd

"Video Editors (Free): Openshot"
cinst -y openshot


<##############################################
To Review:
###############################################
Loom | Free Screen & Video Recording Software
https://www.loom.com/welcome?recorded=false

Install or Update Multiple apps at once
https://ninite.com/

Peer-to-peer file sharing
https://www.tixati.com/discover/

Video Converter
HandBreak

"Video Editors (Free): ShotCut"
cinst -y shotcut

# HWINFO

Advanced Uninstaller Free
https://www.revouninstaller.com/products/revo-uninstaller-free/
#>

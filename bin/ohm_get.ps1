# Based on the original works by captainmac40 (Zabbix Forums)
# All changes after 1:22AM 09-03-2018 AWST should be listed via GitHub @ https://github.com/clontarfx/zabbix-template-openhardwaremonitor

param([string]$ident)
$strFileName=".\sensors.dat"
If (Test-Path $strFileName){
	del $strFileName
}
$cle = '{"{#ID_WMI}":"'
$valeur = '","value":"'
$fermeture = '"}]}'
$request = "SELECT * FROM Sensor WHERE Identifier=" + "'" + $ident + "'"

Get-WmiObject -Namespace "Root\OpenHardwareMonitor" -Query $request  | ForEach-Object {
	$clecomplete = $_.value -replace ',','.'     
    ADD-content -path $strFileName -value $clecomplete
}
Get-content -path $strFileName

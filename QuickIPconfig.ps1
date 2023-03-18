$netAdapter=Get-NetAdapter
Get-NetIPAddress -InterfaceIndex $netAdapter.ifIndex  | Remove-NetIPAddress
Get-NetRoute -InterfaceIndex $netAdapter.ifIndex -DestinationPrefix "0.0.0.0/0" | Remove-NetRoute -ErrorAction SilentlyContinue


New-NetIPAddress -InterfaceIndex $netAdapter.ifIndex `
–IPAddress '192.168.10.2' `
–PrefixLength 24 `
-DefaultGateway '192.168.10.1'




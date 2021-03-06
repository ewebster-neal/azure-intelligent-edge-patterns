function Get-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Collections.Hashtable])]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$EncryptionType
	)

    $VpnServerIPsecConfiguration = Get-VpnServerIPsecConfiguration 

	$returnValue = @{
		EncryptionType = [System.String]$VpnServerIPsecConfiguration.EncryptionType
		IdleDisconnectSeconds = [System.UInt32]$VpnServerIPsecConfiguration.IdleDisconnect
		Ikev2Ports = [System.UInt32]$VpnServerIPsecConfiguration.Ikev2Ports
        L2tpPorts = [System.UInt32]$VpnServerIPsecConfiguration.L2tpPorts
        PSComputerName = [System.String]$VpnServerIPsecConfiguration.PSComputerName
        SADataSizeForRenegotiationKilobytes = [System.UInt32]$VpnServerIPsecConfiguration.SADataSizeForRenegotiation
        SALifeTimeSeconds = [System.UInt32]$VpnServerIPsecConfiguration.SALifeTime
        SstpPorts = [System.UInt32]$VpnServerIPsecConfiguration.SstpPorts
		TunnelType = [System.String]$VpnServerIPsecConfiguration.TunnelType
	}

	$returnValue
}


function Set-TargetResource
{
	[CmdletBinding()]
	param
	(
		[System.String]
		$AuthenticationTransformConstants,

		[System.String]
		$CipherTransformConstants,

		[System.String]
		$CustomPolicy,

		[System.String]
		$DHGroup,

		[System.String]
		$EncryptionMethod,

		[parameter(Mandatory = $true)]
		[System.String]
		$EncryptionType,

		[System.UInt32]
		$IdleDisconnectSeconds,

		[System.UInt32]
		$Ikev2Ports,

		[System.String]
		$IntegrityCheckMethod,

		[System.UInt32]
		$L2tpPorts,

		[System.String]
		$PfsGroup,

		[System.UInt32]
		$SADataSizeForRenegotiationKilobytes,

		[System.UInt32]
		$SALifeTimeSeconds
	)

    $Params = $PSBoundParameters
    $output = $Params.Remove('Ensure')
    $output = $Params.Remove('Debug')
    $output = $Params.Remove('Verbose')
    $output = $Params.Remove('DependsOn')

    Set-VpnServerIPsecConfiguration @Params
}


function Test-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Boolean])]
	param
	(
		[System.String]
		$AuthenticationTransformConstants,

		[System.String]
		$CipherTransformConstants,

		[System.String]
		$CustomPolicy,

		[System.String]
		$DHGroup,

		[System.String]
		$EncryptionMethod,

		[parameter(Mandatory = $true)]
		[System.String]
		$EncryptionType,

		[System.UInt32]
		$IdleDisconnectSeconds,

		[System.UInt32]
		$Ikev2Ports,

		[System.String]
		$IntegrityCheckMethod,

		[System.UInt32]
		$L2tpPorts,

		[System.String]
		$PfsGroup,

		[System.UInt32]
		$SADataSizeForRenegotiationKilobytes,

		[System.UInt32]
		$SALifeTimeSeconds
	)

    $result = [System.Boolean]$false
    $VpnServerIPsecConfiguration = Get-VpnServerIPsecConfiguration

    # To validate configuration rather than deployment, this should test all properties

	if ($VpnServerIPsecConfiguration.EncryptionType -eq $EncryptionType) {
        $result = [System.Boolean]$true
    }
	
	$result
}


Export-ModuleMember -Function *-TargetResource


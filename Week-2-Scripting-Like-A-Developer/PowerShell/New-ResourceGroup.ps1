function New-ResourceGroup {
    [cmdletbinding()]

    param (
        [parameter(Mandatory)]
        [string]$rgName,

        [parameter(Mandatory)]
        [string]$location
    )
    
    $params = @{
        'Name' = $rgName
        'Location' = $location
    }

    New-AzResourceGroup @params
}
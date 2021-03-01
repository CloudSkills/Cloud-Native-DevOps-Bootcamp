Describe "New-ResourceGroup" {
    $location = 'eastus2'
    $name = 'cloudskillsbootcamp'

    It "Name should be cloudskillsbootcamp" {
        $name | Should Be 'cloudskillsboot'
    }

    It "location should be eastus2" {
        $location | Should Be 'eastus2'
    }
}
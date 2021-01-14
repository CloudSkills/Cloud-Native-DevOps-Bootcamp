# To run the test:
# Invoke-Pester .\New-ResourceGroup_test.ps1

Describe "New-ResourceGroup" {
    $location = 'eastus2'
    $name = 'cloudskillsbootcamp'

    It "Name should be youtube92" {
        $name | Should Be 'cloudskillsbootcamp'
    }

    It "location should be eastus" {
        $location | Should Be 'eastus2'
    }
}
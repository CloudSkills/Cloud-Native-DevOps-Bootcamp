# To run the test:
# Invoke-Pester .\New-ResourceGroup_test.ps1

Describe "New-ResourceGroup" {
    $location = 'eastus2'
    $name = 'cloudskillsbootcamp'

    It "Name should be cloudskillsbootcamp" {
        $name | Should Be 'cloudskillsbootcamp'
    }

    It "location should be eastus2" {
        $location | Should Be 'eastus2'
    }
}
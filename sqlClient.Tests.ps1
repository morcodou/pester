BeforeAll {
    . ./sqlClient.ps1
}

Describe "Open-SqlConnection" {
BeforeEach{
    class Mock_SqlConnection {
        [string] $ConnectionString
        [boolean] $Opened
        [void] Open(){ 
            $this.Opened = $True
            Write-Host 'CALLED' }
        Mock_SqlConnection () {
            Write-Host 'CTOR'
        }
    }
}

    Context "when parameter ThingToGet is not used" {
        
        It "should return 'I got something!'" {


            $mockSqlConnect = New-Object Mock_SqlConnection
            Mock New-Object { return $mockSqlConnect  } `
            -ParameterFilter {
                $TypeName -and  
                $TypeName -eq 'System.Data.SqlClient.SqlConnection'
            }

           $sqlConnection = Open-SqlConnection

           $sqlConnection.ConnectionString | Should -Be 'Server=localhost\sql12;Integrated Security=true;Initial Catalog=master'
           $sqlConnection.Opened | Should -Be $True
        }
    }
}

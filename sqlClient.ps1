function Open-SqlConnection {    
    [CmdletBinding()]
    param ()
    try {
        $sqlConnection = New-Object System.Data.SqlClient.SqlConnection
        $sqlConnection.ConnectionString = 'Server=localhost\sql12;Integrated Security=true;Initial Catalog=master'
        $sqlConnection.Open()
    }
    catch {
        Write-Output "Error"
        Write-Output $_
    }
    
    return $sqlConnection;
}
Import-Module SqlServer

$connectionString = "Server=WIN-92AJ315238K\PAYLATER;Database=PayLater;User Id=Store1;Password=cft6VGY&"

$Customer_ID = Read-Host("What is the Customer ID?")

$NewValue = Read-Host("What would you like to change their DATE OF BIRTH to")

$Update = "UPDATE Loans SET Date_Of_Birth = '$NewValue' WHERE Customer_ID = '$Customer_ID'"                    

$results = Invoke-Sqlcmd -ConnectionString $connectionString -Query $Update | Out-GridView

$results

Import-Module SqlServer

$connectionString = "Server=WIN-92AJ315238K\PAYLATER;Database=PayLater;User Id=Store1;Password=cft6VGY&"

$Firstname = Read-Host("What is the Customers First Name?")
$Lastname = Read-Host("What is the Customers Last Name?")
$RemoveCustomer = "DELETE FROM Loans WHERE First_Name = '$Firstname' AND Last_Name = '$Lastname'"                    

$results = Invoke-Sqlcmd -ConnectionString $connectionString -Query $RemoveCustomer | Out-GridView

$results
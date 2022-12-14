Import-Module SqlServer

$Firstname = Read-Host("What is the Customer First Name?")
$Lastname = Read-Host("What is the Customer Last Name?")
$SIN_Number = Read-Host("What is the Customer Sin Number? (Format 000-000-000)")
$Date_Of_Birth = Read-Host("What is the Customer Date Of Birth? (YYYY-MM-DD)")
$Gender = Read-Host("What is the Customer Gender? (Must be M, F, Or O)")
$Street = Read-Host("What is the Customer Street Number and Name?")
$Apt = Read-Host("What is the Customers Apartment Number if needed?")
$City = Read-Host("What City does the Customer live in?")
$Prov = Read-Host("What Province does the Customer live in?( Must Be ON NL AB, BC, YT, NU, NT, PE, NS, NB, QC, MB, SK)")
$Country = Read-Host("What Country Do they live in?")
$Postal_Code = Read-Host("What is their Postal Code?")

$connectionString = "Server=WIN-92AJ315238K\PAYLATER;Database=PayLater;User Id=Store1;Password=cft6VGY&"
                    
$Customer_ID = Invoke-Sqlcmd -ConnectionString $connectionString -Query "(SELECT COUNT(*) FROM Loans)"

$Customer_ID = $Customer_ID.Column1

$Customer_ID = $Customer_ID + 1

$InsertLoan = "INSERT INTO Loans VALUES('$Customer_ID' ,'$FirstName', '$LastName', '$SIN_Number', '$Date_Of_Birth', '$Gender', '$Street', '$Apt', '$City', '$Prov', '$Country', '$Postal_Code');"

$NewLoan = Invoke-Sqlcmd -ConnectionString $connectionString -Query $InsertLoan | Out-GridView
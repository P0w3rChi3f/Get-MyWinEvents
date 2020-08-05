# Download and format the EventIDs
$url = "https://raw.githubusercontent.com/P0w3rChi3f/CheatSheets/master/EventIDs.txt"
$RawEventIDs = ((Invoke-WebRequest -Uri $url).RawContent).Split("`n") | Select-Object -Skip 28

# Create a custom EventID Object
 $EventIDs = @()

# Fill the Cusomt EventID
foreach ($Item in $RawEventIDs) {
   
    $EventIDs += New-Object -TypeName PSObject -Property @{
        ID = ($Item).Split("`t")[0]; 
        Description = ($Item).Split("`t")[1]
        
    }# Close PSCustomObject

} # Close Foreach loop


$EventIDs



# invoke-restmethod

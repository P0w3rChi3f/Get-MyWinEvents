
# Get the list of Event IDs from my CheatSheet from GitHub

$EventIDs = Invoke-WebRequest -uri "https://github.com/P0w3rChi3f/CheatSheets/blob/master/WindowsEventIDs.md"

$EventIDs 

$EventIDs.RawContent | out-file ./WineventsCheatsheet.txt 

$tableItems = Get-Content ./WineventsCheatsheet.txt | select-string -pattern "<tr>" -Context 0,3

foreach ($item in $tableItems) {
    $int = 1
    foreach ($thing in ($item.ToString().Split([Environment]::NewLine))) {
        
        Write-host $thing.trimstart().trim('<tr/d>')
        $int += 1
    } # close foreach inner loop
    
} # Close Foreach Outter Loop




<# .ToString().Split([Environment]::NewLine) 

$int = 1
foreach ($thing in ($item.ToString().Split([Environment]::NewLine))) { 
    Write-Host "Line $int" + " " + $thing
    $int += 1
}

switch ($thing) {
            '<tr>' {$Message = "Delete ,<tr>"}
            '<td>' {$Message = $thing}
            '</tr>' {$Message = "Delete </tr>"}
        default {}
} # Close switch
#>
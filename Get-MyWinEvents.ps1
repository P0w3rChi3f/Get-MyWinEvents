
# Get the list of Event IDs from my CheatSheet from GitHub

$RawWebContent = Invoke-WebRequest -uri "https://github.com/P0w3rChi3f/CheatSheets/blob/master/WindowsEventIDs.md"
($RawWebContent.RawContent) | Out-File "$env:TMPDIR/WineventsCheatsheet.txt" 
$Content = Get-Content "$env:TMPDIR/WineventsCheatsheet.txt" | Select-String -Pattern '^(<td>)[\d|\w].+(</td>)$'

$EventIDs = @()
$int = 0

foreach ($item in $Content) {
    $item.TrimStart('</start>')
    Write-Host "$item is at index $int"
    
    $int += 1
    
} # Close Foreach Outter Loop

$EventIDs




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
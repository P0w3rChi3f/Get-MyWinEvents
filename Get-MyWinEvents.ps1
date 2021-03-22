
function Get-WinEventIDList {

# Get the list of Event IDs from my CheatSheet from GitHub

  $RawWebContent = Invoke-WebRequest -uri "https://github.com/P0w3rChi3f/CheatSheets/blob/master/WindowsEventIDs.md"

<#
This line of code takes parsed the webpage down to just the EventID and Definition.  This is done by taking the just grabbing the raw content from the webpage and splitting it on each new line.  Once that is done, it then just grabs each line that starts with <td> and ends with </td>.  This is the table data that holds the data we need.  Then I was able to just grab the line property and trim the <td>
#>
  $Content = (((($RawWebContent.RawContent).Split("`n") | Select-String -Pattern '^(<td>)[\d|\w].+(</td>)$').Line).TrimStart("<td>")).TrimEnd("</td>")

  $EventIDHastable = @{}

  foreach ($item in $Content) {
    if ($item -match '^\d') {
      $ID = $item
    } 
    else {
      $EventIDHastable.$ID = $item

    } 
  
  }# Close Foreach Outter Loop

  
  }
$WinEventIDs
} #Close function


$WinEventLogs = Get-WinEventIDList
$WinEventLogs 


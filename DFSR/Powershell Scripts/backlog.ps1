Param(
  [string]$RGName,
  [string]$RFName,
  [string]$SendingMember,
  [string]$ReceivingMember
)


$BLCommand = "dfsrdiag Backlog /RGName:'" + $RGName + "' /RFName:'" + $RFName + "' /SendingMember:" + $SendingMember + " /ReceivingMember:" + $ReceivingMember
$Backlog = Invoke-Expression -Command $BLCommand

$BackLogFilecount = 0
foreach ($item in $Backlog)
{
  if ($item -ilike "*Backlog File count*")
  {
    $BacklogFileCount = [int]$Item.Split(":")[1].Trim()
  }
}
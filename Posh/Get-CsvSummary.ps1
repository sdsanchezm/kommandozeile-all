$csvPath = "csvTest1.csv"
$data = Import-Csv -Path $csvPath

# this is an special dataStruct
$result = @{}

foreach ($row in $data)
{
    $name = $row.Name
    $value = [int]$row.Value

    if ($result.ContainsKey($name))
    {
        $result[$name].Count += 1
        $result[$name].TotalValue += $value
    }
    else
    {
        # runs for the first time this conditional
        # this struct is like a hash
        $result[$name] = @{
            Count = 1
            TotalValue = $value
        }
    }
}

foreach ($name in $result.Keys)
{
    $count = $result[$name].Count
    $totalValue = $result[$name].TotalValue
    Write-Output "Name: $name, Count: $count, Total Value: $totalValue"
}
$targetModel = "WDC WD10SPZX-24Z10"
$drive = Get-CimInstance Win32_DiskDrive | Where-Object { $_.Model -eq $targetModel }

if ($drive) {
    $devicePath = $drive.DeviceID
    Write-Host "Mounting $devicePath using WSL..."
    Start-Process "wsl" -ArgumentList "--mount `"$devicePath`" --bare"
} else {
    Write-Host "Drive model '$targetModel' not found."
}

# needs to mounted on fstab
# UUID=e9690bd9-d27f-424e-934e-e4a07e6edd25       /1tb    ext4    defaults        0       2

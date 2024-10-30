# Path to your Docker Compose directory
$dockerDir = "C:\Users\nigge\Projects\iot_zero_trust"

# Change to Docker directory
Set-Location -Path $dockerDir

# Start Docker Compose in detached mode
docker-compose up -d

# Get the list of services from docker-compose.yml
$services = docker-compose config --services

# Function to open a new tab in Windows Terminal for each service's logs
function Open-TerminalForLogs {
    param (
        [string]$service
    )
    # Open a new tab in Windows Terminal with PowerShell to follow the service logs
    wt.exe new-tab -p "PowerShell" -d $dockerDir -e "docker-compose logs -f $service"
}

# Loop through each service and open a new tab
foreach ($service in $services) {
    Open-TerminalForLogs -service $service
}

Write-Output "Docker services started, and individual log tabs opened for each service."

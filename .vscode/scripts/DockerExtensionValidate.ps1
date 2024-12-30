[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]$ImageName
)
process {
    Get-Location | Write-Host
    $imageNameVersioned = "$ImageName`:0.0.1"
    docker buildx build . -t $imageNameVersioned --build-arg CHANGELOG=dummy --platform="linux/amd64,linux/arm64" --load
    docker extension validate $imageNameVersioned
}
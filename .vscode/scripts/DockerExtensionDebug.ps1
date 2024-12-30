[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]$ImageName
)
process {
    docker extension rm $ImageName
    docker buildx build . -t $imageName --build-arg CHANGELOG=dummy  --platform="linux/amd64,linux/arm64" --load
    docker extension install $imageName --force
    docker extension dev debug $imageName
}
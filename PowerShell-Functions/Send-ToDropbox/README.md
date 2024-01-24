# Send-ToDropbox

This PowerShell function allows you to exfiltrate content available from PowerShell to a file in your Dropbox. The syntax of this function is as follows:

```powershell
Send-ToDropbox [-RefreshToken] <string> [-AppKey] <string> [-AppSecret] <string> [-Content] <string> [[-OutputFolder] <string>] [[-OutputFile] <string>]
```

For this function to work you will need to configure a suitable Dropbox "App", this only needs to be done once and only takes about 5 minutes. Once this is done you will need to note its "refresh token", its "app key" and its "app secret" and use them each time you use this function. You can get them by following the instructions below.

## Create a suitable Dropbox "App"

1. Create a Dropbox account at [dropbox.com/register](https://www.dropbox.com/register).
2. Create a Dropbox "App" with "Scoped access" API and "Full Dropbox" access at [dropbox.com/developers/apps/create](https://www.dropbox.com/developers/apps/create).
- Remember to note down the "app key" and "app secret" from the app settings.
- Activate the "files.metadata.write" and "files.content.write" permissions in the application's "Permissions" tab and save your changes.
3. Open the following link in your browser, replacing "APP_KEY" with your own.
```
https://www.dropbox.com/oauth2/authorize?token_access_type=offline&response_type=code&client_id=APP_KEY
```
- Connect your application and grant necessary permissions.
- Note the code provided after authorization, which will be your "app code".
4. Open a command prompt and run the following command, replacing "APP_CODE", "APP_KEY", and "APP_SECRET" with your values.
```bash
curl "https://api.dropbox.com/oauth2/token" -d "grant_type=authorization_code" -d "code=APP_CODE" -u "APP_KEY:APP_SECRET"
```
- Note the "refresh_token" value from the command result, which will be your "refresh token".
5. Keep the "app key", "app secret", and "refresh token" values stored securely for future use, so you don't need to repeat this procedure every time.

## Contributors

- [@PlumpyTurkey](https://github.com/PlumpyTurkey)

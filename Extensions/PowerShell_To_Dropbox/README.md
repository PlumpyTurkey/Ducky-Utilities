## Description

This DuckyScript extension exfiltrates data (for example the result of a command) from the target computer by submitting a file to your Dropbox.

## Obtaining prerequisites

> Make Sure you keep the "App key", "App secret" and "Refresh token" value somewhere, so that you don't have to do this each time you use the extension.

1. Create a [Dropbox account](https://www.dropbox.com/register).
2. Create a [Dropbox *App*](https://www.dropbox.com/developers/apps/create) with a "*Scoped access*" API and a "*Full Dropbox*" access.
3. Go to the settings of this app and write down your "App key" and "App secret."
4. Next, go to the "*Permissions*" tab and enable the "*files.metadata.write*" and "*files.content.write*" permissions.
5. After that, open this link in your browser, **without forgetting to replace values in caps by yours.**
```
https://www.dropbox.com/oauth2/authorize?client_id=APP_KEY&token_access_type=offline&response_type=code
```
6. Connect your application, allow its permissions, and note the code it gives you, it's your "App code."
7. Open a command prompt and run this command, **without forgetting to replace values in caps by yours.**
```
curl https://api.dropbox.com/oauth2/token -d code=APP_CODE -d grant_type=authorization_code -u APP_KEY:APP_SECRET
```
8. Note the "refresh_token" value of the result, it's your "Refresh token."

## Editing your payloads

- Define the "#APP_KEY", "#APP_SECRET", and "#REFRESH_TOKEN" of your application.
- Define a "$report" variable in the payload using powershell with what you want to exfiltrate.
- Include the POWERSHELL_TO_DROPBOX extension.
- Enjoy! 🎉

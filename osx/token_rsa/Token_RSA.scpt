set appName to "SecurID"
set thePin to RsaTokenPin()

-- launch the app
launch application appName

-- type the pin and copy the token
tell application appName
  activate
  tell application "System Events"
    keystroke thePin -- type the pin number
    key code 36 -- return key
    delay 0.3 -- wait for token appear
    key code 48 -- press tab
    key code 49 -- space (to hit the copy button)
  end tell
end tell

-- go back to Chrome as fast as we can.
activate application "Google Chrome"

-- hide SecurID
tell application "Finder"
  set visible of process appName to false
end tell

-- and now quit SecurID
quit application appName

on RsaTokenPin()
  return (do shell script "security -q find-generic-password -gl rsatoken 2>&1  | egrep '^password' | awk -F\\\" '{print $2}'")
end RsaTokenPin

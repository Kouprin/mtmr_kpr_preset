tell application "Google Play Music Desktop Player" to activate
delay 0.1
tell application "System Events"
    tell process "Dock"
        tell list 1
            perform action "AXPress" of UI element "Google Play Music Desktop Player"
        end tell
    end tell
end tell

tell application "System Events"
    tell process "Dock"
        tell list 1
            perform action "AXPress" of UI element "Slack"
            delay 0.1
            perform action "AXPress" of UI element "Slack"
        end tell
    end tell
end tell

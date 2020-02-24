tell application "System Events"
    tell process "Dock"
        tell list 1
            perform action "AXPress" of UI element "Activity Monitor"
            delay 0.1
            perform action "AXPress" of UI element "System Preferences"
            delay 0.1
            perform action "AXPress" of UI element "Sublime Text"
            delay 0.1
            perform action "AXPress" of UI element "Sublime Text"
        end tell
    end tell
end tell

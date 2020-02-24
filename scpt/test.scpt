tell application "System Events"
    tell process "Dock"
        tell list 1
            perform action "AXPress" of UI element "Finder"
        end tell
    end tell
end tell

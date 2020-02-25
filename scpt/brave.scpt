tell application "Brave Browser" to activate
tell application "System Events"
    tell process "Dock"
        tell list 1
            perform action "AXPress" of UI element "Brave Browser"
        end tell
    end tell
end tell

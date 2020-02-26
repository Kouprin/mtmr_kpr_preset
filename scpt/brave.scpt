tell application "Brave Browser" to activate
delay 0.1
tell application "System Events"
    tell process "Dock"
        tell list 1
            perform action "AXPress" of UI element "Brave Browser"
        end tell
    end tell
end tell

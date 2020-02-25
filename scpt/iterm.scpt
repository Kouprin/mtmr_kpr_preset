tell application "iTerm" to activate
tell application "System Events"
    tell process "Dock"
        tell list 1
            perform action "AXPress" of UI element "iTerm"
        end tell
    end tell
end tell

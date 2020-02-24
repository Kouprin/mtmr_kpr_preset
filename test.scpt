tell application "System Events"

    tell application "Mission Control" to launch
    --delay 0.12
    tell process "Dock"
      tell list 1
         --click button "Desktop 2"
         perform action "AXPress" of UI element "Brave Browser"
         --delay 0.12
         --keystroke "Dup"
         --keystroke return
      end tell
        --set countSpaces to count buttons of list 1 of group 1
        --new space
        --click button "Desktop 2"
        --click button 1 of group 1
        --switch to new space
        --repeat until (count buttons of list 1 of group 1) = (countSpaces + 1)
        --end repeat
        --click button (countSpaces + 1) of list 1 of group 1
    end tell
    --tell process "Dock" to tell group 1 to tell list 1 to tell button 1 to click
    --delay 0.5

    --do shell script "/Applications/Mission\\ Control.app/Contents/MacOS/Mission\\ Control 1"

end tell

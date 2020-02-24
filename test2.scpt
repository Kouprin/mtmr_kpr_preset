tell application "System Events"
   tell application process "Dock"
      tell list 1
         tell UI element "Brave Browser"
            perform action "AXShowMenu"
            tell menu "Brave Browser"
               tell menu item "New Window"
                  perform action "AXPress"
               end tell
            end tell
         end tell
      end tell
   end tell
end tell

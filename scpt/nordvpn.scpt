tell application "System Events"
    launch application "NordVPN"
    delay 0.1
    click menu bar item 1 of menu bar 2 of application process "NordVPN"
    delay 0.1
    keystroke (key code 36) --enter
    delay 3
    keystroke (key code 27) --esc
    keystroke (key code 27) --esc
    keystroke (key code 27) --esc
    keystroke (key code 27) --esc
    keystroke (key code 27) --esc
end tell

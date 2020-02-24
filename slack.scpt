tell application "Slack"
    activate
end tell
delay 0.01
tell application "Slack"
    # Each window is represented by the title of its active tab
    # in the "Window" menu.
    # We use GUI scripting to select the matching "Window" menu item
    # and thereby properly activate the window of interest.
    # NOTE: Should there be another window with the exact same title,
    # the wrong window could be activated.

    set winOfInterest to window 1 # example
    set winTitle to name of winOfInterest

    tell application "System Events"
        # Note that we must target the *process* here.
        tell process "Slack"
            # The app's menu bar.
            tell menu bar 1
                # To avoid localization issues,
                # we target the "Window" menu by position - the next-to-last
                # rather than by name.
                click menu item winTitle of menu 1 of menu bar item -2
            end tell
        end tell
    end tell
    # Finally, activate the app.
    activate
end tell

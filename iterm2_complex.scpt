on appIsRunning(appName)
	tell application "System Events" to (name of processes) contains appName
end appIsRunning

on sed(srcString, pattern)
	do shell script "echo " & quoted form of srcString & " |" & "sed '" & pattern & "'"
end sed

on urldecode(URLpath)
	set URLpath to do shell script "x=" & quoted form of URLpath & ";x=${x/#file:\\/\\/};x=${x/#localhost}; printf ${x//%/\\\\x}"
	return URLpath
end urldecode

on frontWinDoc(theApp)
	tell application "System Events" to tell process theApp
		set URLpath to value of attribute "AXDocument" of window 1
		return my urldecode(URLpath)
	end tell
end frontWinDoc

on isDirectory(itemPath)
	set fileType to (do shell script "file -b " & quoted form of itemPath)
	if fileType ends with "directory" then return true
	return false
end isDirectory

on frontApp()
	tell application "System Events"
		name of first process whose frontmost is true
	end tell
end frontApp

set thefrontApp to frontApp()

if thefrontApp is "Finder" then
	tell application "Finder"
		try
			set thefolder to (insertion location) as alias
			set thefolder to (POSIX path of thefolder)
		on error
			set thefolder to do shell script "echo ~/"
		end try
	end tell
-- else if thefrontApp is "iTerm2" and appIsRunning("Sublime Text") then
-- 	tell application "Sublime Text" to activate
else
	try
		set thefrontWinDoc to frontWinDoc(thefrontApp)
		if thefrontWinDoc is not "missing value" then
			if my isDirectory(thefrontWinDoc) then
				set thefolder to thefrontWinDoc
			else
				set thefolder to (do shell script "dirname " & quoted form of thefrontWinDoc) & "/"
			end if
		else
			set thefolder to do shell script "echo ~/"
		end if
	on error
		set thefolder to do shell script "echo ~/"
	end try
end if

set thefolder to (do shell script "cd " & quoted form of thefolder & "; pwd -P") & "/"
set detected to false
--display dialog thefolder

on pwd_tty(tty_name)
	-- Based on http://genbastechthoughts.wordpress.com/2012/07/10/how-to-duplicate-an-iterm-tab-using-applescript/
	set pid to do shell script ("ps -f | grep " & tty_name & " | grep 'zsh\\|bash' | head -n 1 | awk '{ print $2; }'")
	set ret to do shell script ("lsof -a -d cwd -F n -p " & pid & " | grep ^n | awk '{ sub(/^n/, \"\"); print; }'")
	return ret
end pwd_tty

if my appIsRunning("iTerm2") then
	tell application "iTerm"
		repeat with w in windows
			if (count of (tabs of w)) is 0 then
				exit repeat
			end if
			set s to w's current tab's current session
			set thetitle to get name of s
			set tty_name to do shell script "basename " & (get tty of s)
			set working_dir to my pwd_tty(tty_name)
			if working_dir & "/" is thefolder and (thetitle contains "bash" or thetitle contains "zsh") then
				set detected to true
				exit repeat
			end if
            if "/Users/kpr" is thefolder then
				set detected to true
				exit repeat
			end if
		end repeat
	end tell
end if

if detected then
    tell application "iTerm"
        activate
    end tell
    delay 0.1
    tell application "iTerm"
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
            tell process "iTerm2"
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
else
	tell application "iTerm"
		open thefolder
		activate
	end tell
end if

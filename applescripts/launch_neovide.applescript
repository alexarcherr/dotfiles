# On Mac - selecting a file in finder and trying to open it with Neovide opens an empty file #1259
# https://github.com/neovide/neovide/issues/1259

on replace_chars(this_text, search_string, replacement_string)
	set AppleScript's text item delimiters to the search_string
	set the item_list to every text item of this_text
	set AppleScript's text item delimiters to the replacement_string
	set this_text to the item_list as string
	set AppleScript's text item delimiters to ""
	return this_text
end replace_chars

on activate_open_instance(win_title, is_first_time)
	tell application "System Events"
		set neovideProcList to a reference to (every process whose name is "neovide")
		repeat with proc in neovideProcList
			set PID to proc's unix id
			set myFiles to paragraphs of (do shell script "lsof -F -p" & space & PID & space & "| grep ^n/ | cut -c2-")
			set fName to my replace_chars(win_title, "'", "")
			if myFiles contains fName then
				tell proc
					set frontmost to true
				end tell
				return true
			end if
		end repeat
	end tell
	
	return false
end activate_open_instance

on run {input, parameters}
	set filePath to quoted form of POSIX path of (input as text)
	if true or not my activate_open_instance(filePath, false) then
		set enablePathVar to "eval \"$(/usr/libexec/path_helper -s)\"; PATH=$PATH:/opt/homebrew/bin neovide"
		set cmd to "$(/usr/bin/env neovide)"
		set fileCmdPath to quoted form of (POSIX path of (input as text))
		
		do shell script enablePathVar & space & cmd & space & fileCmdPath
		delay 0.3
		my activate_open_instance(filePath, true)
	end if
	return input
end run

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
--import XMonad.Layout
--import XMonad.Layout.Grid
--import XMonad.ManageHook
import XMonad.Hooks.EwmhDesktops -- For full screen

--myLayout = Tall ||| Mirror Tall ||| Full
myWorkspaces = ["1","2","3","4","5","6","7","8","9"]
myNormalBorderColor  = "#444444"
myFocusedBorderColor = "#50ff00"
--myFocusedBorderColor = "#000000"

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/teerat/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        --, layoutHook = avoidStruts  $  layoutHook myLayout
		, workspaces = myWorkspaces
        , logHook = dynamicLogWithPP xmobarPP
						{ ppOutput = hPutStrLn xmproc
					    , ppTitle = xmobarColor "white" "" . shorten 150
					    }

		-- Rebind Mod to the Windows key
        , modMask = mod4Mask     

		-- Go full screen
		, handleEventHook = fullscreenEventHook

		-- Change border color of focused window from red to blue
		, focusedBorderColor = myFocusedBorderColor

		, normalBorderColor  = myNormalBorderColor

		-- Set xterm to green forground on black background
		-- switch -fs (font size) 12
		-- switch -fa (font size) (available choices are in /usr/share/fonts/misc)
		--, terminal = "xterm -fg white -bg black -fa monospace -fs 8" 
		--, terminal = "xterm -fg white -bg black -fa monospace -fs 10 -sl 10000" 
		, terminal = "gnome-terminal"

		-- width of red border on active window
		, borderWidth = 1 

        } `additionalKeys`

		-- mod+shift+z to lock screen
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock") 
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot '%Y-%m-%d-%k%M%S_$wx$h.png' -e 'mv $f ~/screenshots/'") -- printscreen button saves ss to ~/screenshots/
        --, ((0,0x1008ff11), spawn "amixer set Master 10%-") -- lower volume 10%
        --, ((0,0x1008ff13), spawn "amixer set Master 10%+") -- raise volume 10%
        --, ((0,0x1008ff12), spawn "amixer set Master 0%") -- mute volume
        --, ((0,0x1008ff12), spawn "amixer set Master toggle") -- mute/enable volume
        , ((0,0x1008ff11), spawn "/usr/bin/vol_down") -- lower volume 5%
        , ((0,0x1008ff13), spawn "/usr/bin/vol_up") -- raise volume 5%
        , ((0,0x1008ff12), spawn "/usr/bin/mute_toogle") -- mute/enable volume
        ]

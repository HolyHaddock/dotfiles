import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe, unsafeSpawn)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import System.IO
import qualified XMonad.StackSet as W

myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    ] 
    <+> composeOne
    [ isFullscreen -?> doFullFloat
    ] <+> (composeAll . concat $ [
      [ resource  =? c --> doF (W.shift "chat") | c <- ["skype"] ]
     ,[ resource  =? w --> doF (W.shift "www")  | w <- ["Chromium"] ]
     ,[ resource  =? d --> doF (W.shift "dev")  | d <- ["emacs"] ]
     ,[ resource  =? c --> doF (W.shift "cmd")  | c <- ["lxterminal"] ]
   ])
-- To identify classnames, run xprop, click a window and look for WM_CLASS

myWorkspaces = ["www", "dev", "cmd", "chat", "5", "6", "7", "8", "9"]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook <+> (manageHook defaultConfig)
        , layoutHook = avoidStruts  $  smartBorders $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , terminal = "lxterminal"
        , startupHook = myStartupHook
        , workspaces = myWorkspaces
        } `additionalKeys`
        [ ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        , ((mod4Mask .|. shiftMask, xK_l), spawn "xscreensaver-command -lock")
        ]

spawnCommand command runString = unsafeSpawn $ concat ["command -v ", command, " 1>/dev/null && (pgrep ", command, " 1>/dev/null || ", runString, " )"]

spawnNoargs command = spawnCommand command command

myStartupHook = do
  spawnCommand "trayer" "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 15 --height 12 --transparent true --tint 0x000000"
  spawnCommand "xscreensaver" "xscreensaver -no-splash"
  spawnCommand "syndaemon" "syndaemon -i 1 -d"
  spawnCommand "unclutter" "unclutter -idle 1"
  --spawnNoargs "xfce4-power-manager"
  spawnCommand "nm-applet" "nm-applet --sm-disable"
  --spawnNoargs "pidgin"
  --spawnNoargs "empathy"
  spawnNoargs "wallpaper.sh"
  spawnNoargs "pnmixer"
  spawnNoargs "emacs"
  spawnNoargs "chromium"
--  spawnNoargs "padevchooser" ???
--  spawnNoargs "gnome-settings-daemon"
--  spawnNoargs "ivman"
  spawnCommand "dropbox" "dropbox start"

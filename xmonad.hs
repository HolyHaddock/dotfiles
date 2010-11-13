import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe, unsafeSpawn)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import System.IO

myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    ] 
    <+> composeOne
    [ isFullscreen -?> doFullFloat
    ]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  smartBorders $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , terminal = "gnome-terminal"
        , startupHook = myStartupHook
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
  spawnNoargs "xfce4-power-manager"
  spawnCommand "nm-applet" "nm-applet --sm-disable"
  spawnNoargs "pidgin"
  spawnNoargs "empathy"
  spawnNoargs "wallpaper.sh"
  spawnNoargs "xfce4-volumed"
  spawnNoargs "emacs"
  spawnNoargs "chromium-browser"
  spawnNoargs "padevchooser"
  spawnNoargs "gnome-settings-daemon"
  spawnNoargs "ivman"
  spawnCommand "dropbox" "dropbox start"
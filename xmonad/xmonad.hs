import XMonad

import XMonad.Hooks.ManageDocks (docks, avoidStruts)
import XMonad.Hooks.ManageHelpers (doCenterFloat, isDialog)
import XMonad.Hooks.EwmhDesktops (ewmh, ewmhFullscreen)
import XMonad.Hooks.Place (placeHook, simpleSmart)

import XMonad.Util.EZConfig (additionalKeys, additionalKeysP)
import XMonad.Util.NamedActions (addName)

import Data.Map (Map, fromList)
import qualified Data.Map as Map


main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . docks
     $ myConfig

myModMask :: KeyMask
myModMask = mod4Mask

-- TODO look up the type for this and add it (for aesthetic purposes)
myConfig = def
    { modMask    = myModMask
    , layoutHook = avoidStruts $ layoutHook def
    , startupHook = myStartupHook
    , manageHook = myManageHook <> manageHook def
    , terminal = "alacritty"
    , workspaces = ["1", "2", "3", "4"]
    } `additionalKeys` myKeys `additionalKeysP` myMediaKeys


-- TODO migrate to namedactions for keys

myKeys :: [((ButtonMask, KeySym), X ())]
myKeys = [ ((myModMask, xK_r), spawn "rofi -show drun")
         , ((myModMask, xK_p), spawn "rofi -show run")
         ]

myMediaKeys :: [(String, X ())]
myMediaKeys = 
    [ ("<XF86AudioMute>", spawn "pulseaudio-ctl mute")
    , ("<XF86AudioLowerVolume>", spawn "pulseaudio-ctl down")
    , ("<XF86AudioRaiseVolume>", spawn "pulseaudio-ctl up")
    , ("<XF86AudioMicMute>", spawn "pulseaudio-ctl mute-input")
    ]

myStartupHook :: X ()
myStartupHook = do
    spawn "~/.config/polybar/launch.sh &"
    spawn "nitrogen --restore"

myManageHook :: ManageHook
myManageHook = composeAll
                [ className =? "Nitrogen"           --> doFloat
                , className =? "Pavucontrol"        --> doCenterFloat
                , className =? "Blueman-manager"    --> doCenterFloat

                -- firefox bookmarks toolbar
                , (className =? "firefox" <&&>
                    resource =? "Places")           --> doCenterFloat

                , isDialog                          --> doCenterFloat
                ]

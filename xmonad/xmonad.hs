import XMonad

import XMonad.Hooks.ManageDocks (docks, avoidStruts)
import XMonad.Hooks.ManageHelpers (doCenterFloat)
import XMonad.Hooks.EwmhDesktops (ewmh, ewmhFullscreen)
import XMonad.Hooks.Place (placeHook, simpleSmart)

import XMonad.Util.EZConfig (additionalKeys)

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

myConfig = def
    { modMask    = myModMask
    , layoutHook = avoidStruts $ layoutHook def
    , startupHook = myStartupHook
    , manageHook = myManageHook <> manageHook def
    , terminal = "alacritty"
    , workspaces = ["1", "2", "3", "4"]
    } `additionalKeys` myKeys


myKeys :: [((ButtonMask, KeySym), X ())]
myKeys = [ ((myModMask, xK_r), spawn "rofi -show drun")
         , ((myModMask, xK_p), spawn "rofi -show run")
         ]

myStartupHook :: X ()
myStartupHook = do
    spawn "~/.config/polybar/launch.sh &"
    spawn "nitrogen --restore"

myManageHook :: ManageHook
myManageHook = composeAll
                [ className =? "Nitrogen"       --> doFloat
                , className =? "Pavucontrol"    --> doCenterFloat
                ]

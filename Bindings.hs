module Bindings (idle, display, reshape, keyboardMouse) where

import Graphics.UI.GLUT
import Display

-- For whatever reason I don't need this but I'll leave it here just to be sure
reshape :: ReshapeCallback
reshape size = do
  viewport $= (Position 0 0, size)

keyboardMouse :: KeyboardMouseCallback
keyboardMouse _key _state _modifiers _position = return ()

module Display (idle, display) where

import Graphics.UI.GLUT
import Control.Monad
import Data.IORef
import Points
import Cube

display :: IORef GLfloat -> DisplayCallback
display angle = do
  clear [ColorBuffer]
  a <- get angle

  -- global transformations
  rotate a $ Vector3 0 0 1
  scale 0.7 0.7 (0.7::GLfloat)

  -- draw ring
  forM_ (points 7) $ \(x,y,z) ->
    preservingMatrix $ do
      color $ Color3 ((x+1)/2) ((y+1)/2) ((z+1)/2) -- renormalize colors into the interval [0,1]
      translate $ Vector3 x y z
      cube 0.1

  -- commit
  flush

idle :: IORef GLfloat -> IdleCallback
idle angle = do
  angle $~! (+ 0.1)
  postRedisplay Nothing

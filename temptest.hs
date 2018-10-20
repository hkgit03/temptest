import Graphics.UI.GLUT
import Data.IORef
import Bindings

main :: IO ()
main = do
   -- initialization
   (_progName, _args) <- getArgsAndInitialize -- initializes the OpenGL systems
   _window <- createWindow "Hello World"

   -- callbacks
   reshapeCallback $= Just reshape
   keyboardMouseCallback $= Just keyboardMouse
   angle <- newIORef 0.0
   displayCallback $= display angle
   idleCallback $= Just (idle angle)

   -- start
   mainLoop

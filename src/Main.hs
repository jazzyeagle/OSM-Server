import OSCMessage

import qualified Data.ByteString as B
import Data.Maybe
import Sound.OSC.FD
import Sound.OSC.Transport.FD.TCP

main = do
  print "Starting TCP Server..."
  tcpServer' 5282 rcvOSCMessage

testMessage :: TCP -> IO ()
testMessage t = do
        testMessage <- recvMessage t
        if (isJust testMessage)
            then print $ fromJust testMessage
            else print "Invalid message received."

rcvOSCMessage :: TCP -> IO ()
rcvOSCMessage t = do
                print "rcvOSCMessage"
                oscMessage <- recvMessage t
                if (isJust oscMessage) 
                   then processOSCMessage $ fromJust oscMessage
                   else return ()

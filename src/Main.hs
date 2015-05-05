import qualified Data.ByteString as B
import Sound.OSC.FD
import Sound.OSC.Transport.FD.TCP

main = do
  print "Starting TCP Server..."
  tcpServer' 5281 processOSCMessage

processOSCMessage :: TCP -> IO ()
processOSCMessage t = do
                oscMessage <- recvMessage t
                print $ maybe "No Data" show oscMessage

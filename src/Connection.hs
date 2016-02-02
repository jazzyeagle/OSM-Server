{-# LANGUAGE OverloadedStrings #-}

module Connection where

-- import Data.ByteString hiding (unpack)
import Data.ByteString.Char8
import Data.Conduit
import Data.Conduit.List as CL
import Data.Conduit.Network
import Data.Conduit.Network.TLS

mainloop :: IO ()
mainloop = do
    let config = tlsConfig "*"
                           5280
                           (programDir ++ "ssl/osm-server-cert.pem")
                           (programDir ++ "ssl/osm-server-key.pem")
    runTCPServerTLS config threadLoop


threadLoop :: AppData -> IO ()
threadLoop d = do
    Prelude.putStrLn $ "Connection received from " ++ (show $ appSockAddr d)
    appSource d $$ onReceived

programDir :: String
programDir = "/share/programs/osm-server/"


onReceived :: Sink ByteString IO ()
onReceived = CL.mapM_ (Prelude.putStrLn . unpack)

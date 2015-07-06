{-# LANGUAGE OverloadedStrings #-}

module OSCMessage (processOSCMessage) where

import Control.Applicative hiding ((<|>), many)
import Sound.OSC.Type hiding (string)
import Text.Parsec
import Text.Parsec.Error hiding (Message)

processOSCMessage :: Message -> IO ()
processOSCMessage msg = either
                            printErrorMessage
                            handleOSCMessage
                            (parseOSC $ messageAddress msg)

-- Parsing Functions --
parseOSC :: String -> Either ParseError [String] 
parseOSC message = parse oscMessageParser "incoming OSC Message" message

oscMessageParser :: Parsec String () [String]
oscMessageParser = do
        validateOSC
        sepOSC

validateOSC :: Parsec String () String
validateOSC = string "/OSM/"
     <?> "Missing OSM Header in URI"

sepOSC :: Parsec String () [String]
sepOSC = sepBy stringOSC (char '/')
     <?> "Separator of / not found"

stringOSC :: Parsec String () String
stringOSC = many (noneOf "/")

endOSC :: Parsec String () String
endOSC = try (string "\n\r")
     <|> string "\r"
     <|> string "\n"
     <|> string []
     <?> "end of line error"


--Execution Functions

-- branch = Area that command impacts (session, bus, track, etc.)
-- command = Command itself (new, open, etc.)
-- vars = Optional arguments applying to command
handleOSCMessage :: [String] -> IO ()
handleOSCMessage (branch:command:_) = do
        print "handleOSCMessage"
        print (branch ++ " " ++ command)
        return ()


printErrorMessage :: ParseError -> IO ()
printErrorMessage pe = do
        print "printErrorMessage"
        print pe
        return ()

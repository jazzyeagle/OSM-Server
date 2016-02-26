For updated blogs, a discussion board, and ticket statuses, please visit to
https://snowdrift.coop/p/osm-server

##Q. What is the vision of OSM Server?

First of all, despite the same acronym, OSM Server has nothing to do with Open
Street Map.  OSM, in this case, stands for Open Source Musicians, which is a
podcast that I started listening to several years ago now and is what
encouraged me to try Linux for the second time and actually succeed with it,
as well as to start recording the music I was writing.  Without the podcast,
and the wonderful IRC channel with so many wonderful people within it, I don't
know if I ever would have come up with this idea.  Hence, although I could have
probably come up with a name that more accurately describes what the server is
intended to do, the name is to pay homage to the podcast and the excellent
group of friends I have developed across the world because of it.  I couldn't
ask for a better name than that.

The OSM Server is a concept that will allow DAWs to communicate and share
session information with one another through OSC messages.  This will allow
songwriters to collaborate using different DAWs.  By defining a standardized
list of OSC messages and their variable formats, this will enable various DAWs
to share audio, midi, settings and other data without having to worry about
what the other DAW is or how that DAW decides to store things locally.  In
addition, the server will serve as a VCS for the sessions, saving the OSC
messages pertaining to sessions.  That way, if a user wishes to collaborate
and may not be online when the session is started, they can receive all of the 
OSC messages from inception/last update to get their DAW up to speed.

So, on top of creating the server (which will probably be the relatively easy
part, I'll have to also patch some of the Open Source DAWs to be able to
send, receive and process the OSC messages (which will probably be the bigger
task).  Thankfully, most DAWs appear to be written in C++, so I at least know
somewhat of what I'm getting myself into.


##Q. What about proprietary DAWs?  Will your server work with those?

I chose OSC messages because they are an industry standard, and because
it's designed for transmitting audio and MIDI data from one device/application
to another.  Given that and my licensing, there is nothing stopping a company
producing a proprietary DAW from adding in the capabilities to their DAW
to work with my server.  In fact, I welcome them to do so.  Given that the DAWs
in question *are* proprietary, however, I do not have access to the code and
thus cannot make patches for proprietary DAWs like I can for the Open Source
DAWs.

##Q. What is the current status of this project?

This project is still very much in the very beginning stages of development,
with a lot more brainstorming to do.  My plan is to get all the things that
I still need to do logged into the issue tracker (even though they're not
technically issues), so that anyone can track my progress that way.


##Q. What language are you writing this in?

Although I know C/C++ best, and most audio software is actually written in 
C/C++, I'm actually writing this in Haskell.  I started learning Haskell for
another project, and although it frustrated me at times (it was because the
other project used a bunch of advanced concepts and a massive number of 
libraries I was unfamiliar with), I did become rather interested in the concept
of functional programming and want to give it an honest try.  Writing this code
from scratch and taking the time to review the various libraries and using the
ones best suited for the job and my skillset has already helped me with getting
a firmer grasp on the language.


##Q. Can I help?

Sure thing!  I don't have a dedicated IRC channel set up for this endeavor as
of yet, but if there's enough interest, that's obviously easy to set up.  For
now, send me e-mails at jazzyeagle79 at gmail dot com, or feel free to pm me
on freenode on IRC (my nick is JazzyEagle), let me know what part you're
interested in helping with, and we can discuss how best you can help out in
that area.


##Q.  Can I donate?

At this point in time, not monetarily.  I don't have anything set up to receive
donations.  I do plan on utilizing Snowdrift.coop (http://www.snowdrift.coop)
once it goes live, but until that happens, donating your time and energy to
make the server a reality is the only donations I can take right now.

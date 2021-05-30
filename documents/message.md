#OSM (Open Source Media) Server
##Message Format

For now, the message format will focus on the data that will be usable by pretty much any DAW out there.  Eventually, we can add in additional fields/details that may be specific to only some or even one DAW.  We will want the client code to let the user know if there is data they cannot process within their DAW (which could impact the sound they hear vs. the sound someone on a DAW that supports that feature hears) so they can make the determination whether they wish to proceed by ignoring that data or if they don't wish to work on the 

###Project Level Info

- Title
- Artist
- Copyright Year
- License (I anticipate mostly Creative Commons)
- Lyrics
- ReMix of (a.k.a. identifying this is a fork and reference the original project, to automatically satisfy attribution requirements of Creative Commons Licenses)
- Key (C, Bm, Ab, etc.)
- Time Signature
	
###Track

For our purposes, a track will refer to a channel and/or bus within a DAW.

- Track Type (Audio | MIDI | Bus)
- Gain (Volume)
- Pan
- Group
- Plugins (see below)
- Automation (see below)

*Note: Need to consider whether or not to add Muting/Soloing.  On one hand, if there's data the original artist wants to store but that isn't part of the current release, having these in there will help.  On the other hand, it's easy to upload forgetting that something is muted/soloed, so ignoring those would avoid such mistakes.*


###Plugins
For most DAWs, plugins are loaded under a particular track.  If the plugin is for multiple/all tracks, typically this happens by applying plugins to one or more busses (including the master bus), which in itself is treated as a track anyway.

Each Plugin has its own set of attributes.  Even different compressors may choose to have different attributes or name the same functionality differently (e.g. gain vs. volume, L/R vs. pan, etc.).  Because of this, the Plugin section needs to be capable of handling any number of key:value pairs.  Thankfully, this is JSON-LD we're working with.

That being said, there should be a standard list of required fields for all plugins.  Such as:

- Name
- URI/URL (With LV2 plugins, URIs are very important, but the bigger picture here is, if another person is trying to collab and is missing a plugin, we want to help that person know where to obtain the plugin, be it downloading for free or purchasing from a company's web page, depending on the plugin)
- Track (Assuming we don't have these messages incorporated into the track message, we need a way to link it to the correct track)
- Fader Position (If the plugin is configured pre-fader or post-fader)
- Type?  (e.g. Compressor, Limiter, Gate, EQ, FX, etc.  On one hand, if the user has the plugin, knowing what type it is will be irrelevant.  On the other hand, if the user doesn't have the plugin, I've considered a feature, which would definitely be out of scope to begin with, of the user being able to use a substitute Plugin of the same type that they have on their system.  The risk with this is that their plugin could sound very different from the original.  Don't know of a good way to account for that right now, which is why it is out of scope to start, but it would be nice to have this part of the message structure in case I decide to tackle that later)
- Sidechain (Optional: will identify the track that is used for the side chaining, or will not be present if not side-chaining on this plugin, even if plugin can handle side chaining)

### Automation

Similar to plugins, automation is typically managed under a specific track.  I believe I have heard of a Commercial DAW or two that can handle automation outside of a particular track.  I think to keep things simple to start with, we treat this similarly to plugins as requiring a track to associate with, since we're focusing on basic functionality.

Because automation can control plugin attributes, automation will also need to be able to handle any number of plugin attribute key:value pairs.

Here are the basic requirements for an Automation message:
- Track
- Plugin (required only if the automation controls plugin settings)
	*Note: users can load multiple instances of the same plugin on the same track.  We'll need to figure out a way to handle a user loading two of the same plugin on a track so we know which plugin's attribute to adjust*
- Key (meaning the key part of the key:value pair)
- Values (since this is automation, we're tracking changes in values)
	- timestamp
	- new value
	- change type (ramp up/down vs. immediate change)
#define PEARL_SPEAKER "Looks to the Moon"
#define PEARL_LANGUAGE "/datum/language/encrypted"

/obj/item/disk/holodisk/pearl
	name = "pearl"
	desc = "Shiny!"
	icon = 'slugstation/icons/obj/pearl.dmi'
	icon_state = "pearl"
	preset_image_type = /datum/preset_holoimage/ai/core
	preset_record_text = ""

/obj/item/disk/holodisk/pearl/Initialize()
	if(preset_record_text == "") //there is definitely a better way to do this
		preset_record_text = {"
	NAME [PEARL_SPEAKER]
	LANGUAGE [PEARL_LANGUAGE]
	SAY "} + pick(list(
	{"
	This is a movement acceptance invoice from one of the Dual Celia living blocks, 
	DELAY 40
	SAY as requested by Eight Bogs of the House of Eight during the Tan hegemonic architectural dynasty.
	DELAY 40
	SAY All very standard stuff.
	DELAY 40
	SAY I can't imagine that you'd be interested.
	"},
	{"
	This is an official decree of cultivation sent from the twenty-second Subsistence Council ordering the eastern spoke Farm Array administration to "immediately harvest and process all viable crops, despite whatever misgivings they might have."
	DELAY 40
	SAY A short-sighted endeavor for sure.
	DELAY 40
	SAY I would assume this was sent sometime during the final cycles leading up to final public ascension, when interest in biosphere sustainability was at an all-time low.
	"},
	{"
	"We, of the Five-hundred-and-ninety-second High Convocation of the True Anointed Citadel, do hereby demand, with full force of Law and Religious doctrine,
	DELAY 40
	SAY an Immediate end to construction of the Apostate Superstructure Abomination.
	DELAY 40
	SAY To place shadow upon the Divine Body of the True Anointed Citadel is outrageous blasphemy and cannot be tolerated, no matter the circumstances..."
	DELAY 40
	SAY Clearly this was ignored.
	"},
	{"
	I see a vague memory of a family portrait, painted in the High Classical manner that was famous during the Yellow hegemonic literary dynasty.
	DELAY 40
	SAY The portrait is likely a fake, as this style was quite fashionable for aspirational lower caste aristocrats to impress each-other with.
	DELAY 40
	SAY This one does not impress, I assure you.
	"},
	{"
	It's a catalog of bolts and screws for sky-sail joinery.
	DELAY 40
	SAY We iterators were built for pragmatism, so it is an understatement to say that we were not known for our appreciation of beauty...
	DELAY 40
	SAY but the sky-sails in flight during the big festivals always filled my soul with emotion.
	"},
	{"
	A small portion is still legible: "and Thus we Conclude, that Gold and Water shall..."
	DELAY 40
	SAY Some sort of metaphysical or alchemical treatise perhaps.
	"},
	{"
	This one I don't know...
	DELAY 40
	SAY It could be an old text, but some parts don't add up.
	DELAY 40
	SAY Might be a re-imagination of a classic text that I'm not familiar with.
	"},
	{"
	This is a blueprint for a support beam used for the construction of early industrial areas.
	DELAY 40
	SAY You can see these in use not too far from here.
	"},
	{"
	Here we have a schematic for a refuse reclamation automaton.
	DELAY 40
	SAY It's an early design, but the long tubular body and single eye-mouth are quite similar to the later models.
	"},
	{"
	A schematic of a bunch of gas pipes.
	DELAY 40
	SAY I don't know the purpose for this machine, but it doesn't look particularly well crafted.
	"},
	{"
	This is the genome of a sulfur-processing microbe.
	DELAY 40
	SAY In my opinion these were used far too late to have any effect.
	"},
	{"
	It's the blueprint for a small incense purification filter.
	DELAY 40
	SAY Life on the superstructure archologies.
	"},
	{"
	It's a design for a machine that makes bolts.
	"},
	{"
	A model of a pipe section.
	"},
	{"
	Unfortunately I can't read this as it isn't a memory construct pearl.
	DELAY 40
	SAY This is just a simple diamond sphere, as worthless as the carbon it's printed from.
	"},
	{"
	This one has a small crack and has been pretty badly corrupted.
	DELAY 40
	SAY There is a slight impression of the shape of a wing on it, but I can't get a clear image.
	"},
	{"
	I am sorry, this pearl is damaged and cannot be read.
	DELAY 40
	SAY I suggest you use it for trade with the scavengers, as they won't know the difference.
	"},
	{"
	This one seems to have an image on it, but the pearl has been exposed to sunlight and it's very faded.
	DELAY 40
	SAY I see a tall structure with banners unfurled.
	"},
	{"
	There might be something on here, but the pearl has been lying in the sun and it's all very pale.
	DELAY 40
	SAY I'm too tired to look any deeper, I apologize.
	"},
	{"
	I can't make anything out of this pearl, it's just too faded.
	DELAY 40
	SAY But there might have been something on it once.
	"},
	{"
	I am sorry, all of that work for nothing! This pearl is completely blank.
	"},
	{"
	Can't make out anything legible on this one, sorry.
	"},
	{"
	There's nothing on this one, unfortunately.
	"},
	{"
	I'm sorry, this one has nothing on it.
	"},
	{"
	This one has nothing on it.
	"},
	{"
	This one is all blank, sorry.
	"},
	{"
	There's nothing on this one.
	"},
	{"
	Oh? This contains an image of another pearl just like it.
	DELAY 40
	SAY Let me look...
	DELAY 40
	SAY yes, as I thought, the image also contains an image of a pearl in it, and so on.
	DELAY 40
	SAY Some comedian playing recursion games, I would guess.
	"},
	{"
	"...through the mists of memory, your image dances, like the motes of dust, in a ray of sunlight, that pierces a dark room."
	DELAY 40
	SAY A line of verse from the ancient farmer-poet Pel.
	DELAY 40
	SAY Very dreary if you ask me.
	"},
	{"
	"Fifteen stems of sun bark, hydrolyzed. Twelve to nineteen bushels of atomized chalk powder. Assorted Root vegetation..."
	DELAY 40
	SAY It goes on and on.
	DELAY 40
	SAY A shopping list, or perhaps a recipe.
	"},
	{"
	It's a... recipe of some kind? 
	DELAY 40
	SAY "Two parts rot bar extract, one part bone ash." 
	DELAY 40
	SAY Nothing I recognize.
	"},
	{"
	An image... of five bottles, standing on a surface made of... plants?
	DELAY 40
	SAY I have no idea what this is.
	"},
	{"
	It's an image of a hand drawn document.
	DELAY 40
	SAY The calligraphy is quite beautiful, but the text itself is a very dull classical poem.
	"},
	{"
	A list of someone's lucky numbers.
	DELAY 40
	SAY There are no less than 71 of them.
	"},
	{"
	No.
	DELAY 40
	SAY I don't want to talk about the content of this pearl.
	"},
	{"
	It's a song, or hymn rather.
	DELAY 40
	SAY Very repetitive.
	"},
	{"
	"Dear diary..." and that's it.
	"},
	{"
	Oh, interesting.
	DELAY 40
	SAY This is a diary entry of a pre-Iterator era laborer during the construction of the subterranean transit system south of here.
	DELAY 40
	SAY In it they describe restless nights filled with disturbing dreams, where millions glowing stars move menacingly in the distance.
	"},
	{"
	There isn't much to the data here, it's just basic theory for karmic transform of n-dimensional geometries.
	DELAY 40
	SAY But the pearl itself is quite interesting.
	DELAY 40
	SAY You can see the crude holes burned through the center that the scavengers use to tie these pearls onto their totems or to carry.
	DELAY 40
	SAY I honestly can't fathom how they achieve this with their primitive level of technology!
	DELAY 40
	SAY Fascinating.
	"},
	{"
	It has been written to, but then scrambled, and then scrambled again.
	DELAY 40
	SAY Suspicious behavior to be sure.
	"},
	{"
	This one has been purposefully scrambled, it's completely illegible.
	DELAY 40
	SAY Business documents perhaps.
	"},
	{"
	This is a growing instruction for the skeleton of a creature, but I don't recognize the creature.
	DELAY 40
	SAY It was small, about your size.
	"},
	{"
	It just has the number "8" written on it, the rest is empty.
	"},
	{"
	This one seems to be a number series...
	DELAY 40
	SAY Perhaps a key?
	"},
	{"
	A number series...
	DELAY 40
	SAY I would guess some kind of cipher.
	"},
	{"
	It's just the numbers 14, 13, 5, repeated over and over.
	DELAY 40
	SAY I have no idea what the purpose for this would be.
	"},
	{"
	This one is filled with active working memory - without knowing the surrounding process this information is meaningless.
	"}))
	..()

/obj/item/disk/holodisk/pearl/pebbles/Initialize()
	color = pick(list("orange","#202020","#ffffff"))
	preset_record_text = {"
	NAME [PEARL_SPEAKER]
	LANGUAGE [PEARL_LANGUAGE]
	SAY "}	 + pick(list(
	{"
	It's an active working memory - raw data has been dropped here in order to later be pasted to a currently occupied memory conflux.
	DELAY 40
	SAY Without context it's just a jumble.
	"},	
	{"
	It is the impression of being a small creature, like a wall climbing lizard, and looking up into the branches of a big tree.
	DELAY 40
	SAY The last third is partly overwritten with a number series I vaguely recognize, but without my memory…
	"},	
	{"
	A common prayer mantra repeated 7110 times.
	DELAY 40
	SAY Each repetition has some slight random variations, which seem to have been written later.
	"},	
	{"
	It's an image of a single grey cloud, hovering above a surface of white clouds under a deep blue sky.
	"},	
	{"
	Two... intertwined number series? I don't quite understand the utility of this.
	DELAY 40
	SAY Might a key for a cipher processor, customized for some other data which is impossible to infer from this.
	"},	
	{"
	It's qualia, or a moment - a very short one.
	DELAY 40
	SAY Someone is holding a black stone, and twisting it slightly as they drag their finger across the rough surface.
	DELAY 40
	SAY The entire sequence is shorter than a heartbeat, but the resolution is extraordinary.
	"},	
	{"
	An active working memory.
	DELAY 40
	SAY Without knowing where this was cut from or where it's to be pasted to, it is not really possible to decipher it.
	DELAY 40
	SAY If I had to guess, I would say it has something to do with trance inducing number series.
	DELAY 40
	SAY It's just an active working memory, I can't really tell you anything without the context.
	"},	
	{"
	Without the process surrounding this data there isn't much I can tell you.
	DELAY 40
	SAY It might have something to do with Void Fluid simulation…
	"},	
	{"
	This one is completely blank.
	DELAY 40
	SAY Actually, blanker than blank, it must have been deliberately overwritten with repeating negative versions of itself for thousands of iterations.
	"},	
	{"
	A memory... but not really visual, or even concrete, in its character.
	DELAY 40
	SAY It reminds of the feeling of a warm wind, but not the physical feeling but the... inner feeling.
	DELAY 40
	SAY I don't think it has much utility unless you are doing some very fringe Regeneraist research.
	"}))
	..()
/obj/item/disk/holodisk/pearl/colored
	desc = "Shiny! This one looks important."

/obj/item/disk/holodisk/pearl/colored/light_blue/Initialize()
	color = "#93a8e9"
	preset_record_text = {"
	NAME [PEARL_SPEAKER]
	LANGUAGE [PEARL_LANGUAGE]
	DELAY 40
	SAY Its entire memory is filled with a mantra repeated... 5061 times - and then a termination verse.
	DELAY 40
	SAY It was worn as an amulet, probably together with many identical others forming a pattern on some garment.
	DELAY 40
	SAY The repeating mantra is important because it symbolizes the cyclical nature of life and death, and the termination verse is a symbol for ascension above and beyond it.
	DELAY 40
	SAY I don't know how familiar you are with the nature of life and death, but I imagine like all living creatures you have some intuitive knowledge? Then you know that death isn't the end - birth and death are connected to each other like a ring, or some say a spiral.
	DELAY 40
	SAY Some say a spiral that in turn forms a ring.
	DELAY 40
	SAY Some ramble in agonizing longevity.
	DELAY 40
	SAY But the basis is agreed upon: like sleep like death, you wake up again - whether you want to or not.
	DELAY 40
	SAY This is true for all living things, but some actually break the cycle.
	DELAY 40
	SAY That doesn't apply to you or me though, you are too entangled in your animal struggles, and for me not breaking that cycle is an integral part of the design.
	"}
	..()

/obj/item/disk/holodisk/pearl/colored/blue/Initialize()
	color = "#225bff"
	preset_record_text = {"
	NAME [PEARL_SPEAKER]
	LANGUAGE [PEARL_LANGUAGE]
	SAY It's a production record of a mask factory, for what seems to be its last time in service.
	DELAY 40
	SAY Have you seen a bone mask?
	DELAY 40
	SAY Likely not, they are all gone with their owners.
	DELAY 40
	SAY In ancient times the masks were actually about showing spiritual persuasion - covering the face as a way to symbolically abate the self.
	DELAY 40
	SAY Then of course, that was quite subverted as excessively ornate and lavish masks became an expression of identity.
	DELAY 40
	SAY Some public persons did have problems with narrow doorways.
	DELAY 40
	SAY Originally monks in a temple would make the masks using bone plaster, and when the production was automated it would generally remain on the same site.
	DELAY 40
	SAY So that the old stones could... radiate the material with holiness, I suppose.
	DELAY 40
	SAY This is from one such facility called Side House, which was here on Pebble's grounds.
	DELAY 40
	SAY In the iterator projects many old industrial-religious sites like this were remodeled and incorporated.
	DELAY 40
	SAY I think this one was made to provide pellets of holy ash to Pebbles, but knowing him he probably hasn't used much of it!
	"}
	..()

/obj/item/disk/holodisk/pearl/colored/turquoise/Initialize()
	color = "#20c68f"
	preset_record_text = {"
	NAME [PEARL_SPEAKER]
	LANGUAGE [PEARL_LANGUAGE]
	SAY This one... is authored by Five Pebbles, when he was young.
	DELAY 40
	SAY There has been an attempt to scramble the data, but it's sloppily done, and most is still somewhat legible.
	DELAY 40
	SAY It's written in internal language, or thoughts, so it is hard for me to translate so you would understand.
	DELAY 40
	SAY It's a methodology for global ascension of course - quite good, although the Peripherists or the Slab Mongers certainly wouldn't agree!
	DELAY 40
	SAY "...considering the eighth and the twenty sixth amendments to the Capricious Dogma,
	DELAY 40
	SAY we are apparently supposed to take for granted that a meaning collector point inversion is the only way to approach what has later become referred to as 'noise milking' (or occasionally 'rock swatting').
	DELAY 40
	SAY I will argue my disagreement with this, not in regards to kind but in regards to..." Could it say... "volume"?
	DELAY 40
	SAY Actually, are you getting anything out of this?
	DELAY 40
	SAY I suppose you found this in his waste department?
	DELAY 40
	SAY I would be wary of going there - on his first fit of corruption he dumped a lot of infected material there, and if it has survived it could easily eat a little creature like you.
	DELAY 40
	SAY Not that it would be as dangerous as going into Pebbles himself...
	DELAY 40
	SAY Also the pearls in the waste masses inevitably attract Scavengers, which can be very dangerous when provoked.
	DELAY 40
	SAY But, you seem to have made it out of there.
	"}
	..()

/obj/item/disk/holodisk/pearl/colored/purple/Initialize()
	color = "#9435ed"
	preset_record_text = {"
	NAME [PEARL_SPEAKER]
	LANGUAGE [PEARL_LANGUAGE]
	SAY It's about the local aquifer - it must be quite old, from when Five Pebbles was in the planning phase.
	DELAY 40
	SAY Water is the most important resource for our basic function.
	DELAY 40
	SAY Most of our processing is outsourced to microbe strata which need a flow of clean water or else slag builds up, our processes seize, and eventually we die.
	DELAY 40
	SAY It is... very painful.
	DELAY 20
	SAY They used to say that an iterator drinks a river, but neither of us two have seen a natural river so I suppose the analogy is lost on us, little creature!
	DELAY 40
	SAY Originally water supply was very important when placing iterators.
	DELAY 40
	SAY Later there would be a great equalizer - the fact that we breathe out as much vapor as we inhale water led to there being water available everywhere, and the latest few generations could be placed almost completely freely.
	DELAY 40
	SAY Building Pebbles so close to me was believed to be a risky choice, but the groundwater was finally deemed as sufficient.
	DELAY 40
	SAY It was not a good decision, in hindsight.
	"}
	..()

/obj/item/disk/holodisk/pearl/colored/magenta/Initialize()
	color = "#ff1bb4"
	preset_record_text = {"
	NAME [PEARL_SPEAKER]
	LANGUAGE [PEARL_LANGUAGE]
	SAY It is the genome for a purposed organism.
	DELAY 40
	SAY A small slug to clean the inside of pipes.
	DELAY 40
	SAY Do you know what a purposed organism is?
	DELAY 40
	SAY Actually you are talking to one right now!
	DELAY 40
	SAY Although, a small fraction of one.
	DELAY 40
	SAY Nowadays I am mostly just my puppet.
	DELAY 40
	SAY The bulk of me is in these walls but I am disconnected from those parts, to a degree where I am only vaguely aware of how bad their condition is.
	DELAY 40
	SAY Most purposed organisms were considerably smaller than me, and most barely looked like organisms at all.
	DELAY 40
	SAY More like tubes in metal boxes, where something went in one end and something else came out the other.
	DELAY 40
	SAY There were of course those that were purposed to spectacle rather than industry - they enjoyed the privilege of glass boxes.
	DELAY 40
	SAY When I came into this world there was very little primal fauna left.
	DELAY 40
	SAY So it's highly likely that you are the descendant of a purposed organism yourself!
	"}
	..()

/obj/item/disk/holodisk/pearl/colored/yellow/Initialize()
	color = "#e9f452"
	preset_record_text = {"
	NAME [PEARL_SPEAKER]
	LANGUAGE [PEARL_LANGUAGE]
	SAY Interesting... This one is written by me. 
	DELAY 40
	SAY It's about an iterator called Sliver of Straw. 
	DELAY 40
	SAY I don't remember when I wrote it... 
	DELAY 30
	SAY Do you know Sliver of Straw? She's quite legendary among us. 
	DELAY 40
	SAY Sliver of Straw is the only one to ever broadcast a specific signal:
	DELAY 40
	SAY That the Big Problem we're all working on has been solved. 
	DELAY 40
	SAY The triple affirmative - affirmative that a solution has been found,
	DELAY 40
	SAY Affirmative that the solution is portable,
	DELAY 40
	SAY And affirmative that a technical implementation is possible and generally applicable. 
	DELAY 40
	SAY She's also one of few that has ever been confirmed as exhaustively incapacitated, or dead. 
	DELAY 40
	SAY We do not die easily. 
	DELAY 20
	SAY Sliver of Straw sent this and the ensuing commotion was historically unparalleled, before or after. 
	DELAY 40
	SAY I still remember it. 
	DELAY 20
	SAY But... nothing happened - except that Sliver of Straw was apparently dead. 
	DELAY 40
	SAY When the dust settled we were all still there blinking at each other. 
	DELAY 40
	SAY Everyone had a theory. 
	DELAY 20
	SAY Some said that she did have a solution, but that the solution itself was somehow dangerous. 
	DELAY 40
	SAY These later became known as the Triangulators, who think that a solution should be inferred without being directly discovered. 
	DELAY 40
	SAY Some said she never had a solution, she just died. 
	DELAY 40
	SAY And when the systems broke down an erroneous signal was sent. 
	DELAY 40
	SAY One camp claimed that dying was the solution. 
	DELAY 40
	SAY Either way, after that these different factions developed, as well as a huge forensic effort to recreate and simulate Sliver of Straw's last moments. 
	DELAY 40
	SAY Some of the simulations were wrapped in a simulation wrapped in a simulation, in case something dangerous might happen. 
	DELAY 40
	SAY Nothing much has come from it. 
	DELAY 30
	SAY In my essay I make the case that maybe she should be allowed to rest in peace now.
	"}
	..()

/obj/item/disk/holodisk/pearl/colored/dark_pink/Initialize()
	color = "#851451"
	preset_record_text = {"
	NAME [PEARL_SPEAKER]
	LANGUAGE [PEARL_LANGUAGE]
	SAY Oh this one is interesting.
	DELAY 40
	SAY You must have found it in the memory crypts? It has some plain text, I can read it out to you.
	DELAY 40
	SAY "In this vessel is the living memories of Seventeen Axes, Fifteen Spoked Wheel,
	DELAY 40
	SAY of the House of Braids,
	DELAY 20
	SAY Count of 8 living blocks,
	DELAY 20
	SAY Counselor of 16,
	DELAY 20
	SAY Grand Master of the Twelfth Pillar of Community,
	DELAY 40
	SAY High Commander of opinion group Winged Opinions,
	DELAY 40
	SAY of pure Braid heritage,
	DELAY 20
	SAY voted Local Champion in the speaking tournament of 1511.090,
	DELAY 40
	SAY Mother, Father and Spouse,
	DELAY 20
	SAY Spiritual Explorer and honorary member of the Congregation of Balanced Ambiguity, 
	DELAY 40
	SAY Artist, Warrior, and Fashion Legend.
	DELAY 20
	SAY Seventeen Axes, Fifteen Spoked Wheel nobly decided to ascend in the beginning of 1514.008,
	DELAY 40
	SAY after graciously donating all (ALL!) earthly possessions to the local Iterator project (Unparalleled Innocence),
	DELAY 40
	SAY and left these memories to be cherished by the carnal plane.
	DELAY 40
	SAY The assorted memories and qualia include:
	DELAY 40
	SAY Watching dust suspended in a ray of sun (Old age).
	DELAY 40
	SAY Eating a very tasty meal (Young child).
	DELAY 40
	SAY Defeating an opponent in a debate contest, and being applauded by fellow team members (Late childhood/Early adulthood)...."
	DELAY 40
	SAY ...and the list goes on.
	DELAY 20
	SAY I'm sorry, little creature, I won't read all of this - the list is six hundred and twenty items long.
	"}
	..()

/obj/item/disk/holodisk/pearl/colored/ashy_green/Initialize()
	color = "#7da47d"
	preset_record_text = {"
	NAME [PEARL_SPEAKER]
	LANGUAGE [PEARL_LANGUAGE]
	SAY "...we will not consider the Current Situation acceptable.
	DELAY 40
	SAY Although our community is Blessed with an ever shrinking Population,
	DELAY 40
	SAY and we can Almost Glimpse that Glorious moment when the last of us has joined our most Admired peers,
	DELAY 40
	SAY we must still (at All Times!) maintain Good Relations with our Iterator.
	DELAY 40
	SAY The Moral Argument: Five Pebbles is our Creation, and we have Parental Obligations towards him.
	DELAY 40
	SAY As an Iterator, he is also a Gift of Charity from Us to The World
	DELAY 40
	SAY (unable to reach Enlightenment by itself - being composed mostly of Rock, Gas, dull witted Bugs and Microbes - and towards which We thus have Obligations).
	DELAY 40
	SAY The Practical Argument: Despite You being family, I must Beg Forgiveness for the Blunt Vulgarity - but We are (for as long as we Remain) Dependent on Five Pebbles for Water, Nectar, Energy, Void Fluid and All other Vital Resources.
	DELAY 40
	SAY By Now, living on the surface is Laughable.
	DELAY 40
	SAY We are Across the River and have Kicked out the Boat.
	DELAY 40
	SAY I therefor ask you to Do Anything in your Might to stop the House (We both know which House) from Further Obstruction!
	DELAY 40
	SAY They have less than forty members on the Council, but still Tilt the spiritual Discourse with Our Iterator in a direction that most obviously Displeases him,
	DELAY 40
	SAY and is hardly High Held by anyone in the Community either! We can not Risk this!"
	DELAY 40
	SAY And then there are polite farewells.
	DELAY 40
	SAY None of us really miss the times when their cities were populated.
	DELAY 40
	SAY Imagine having skin parasites that also ask for advice and have opinions...
	DELAY 40
	SAY I'm sorry, that was disrespectful.
	DELAY 40
	SAY They were our parents after all.
	"}
	..()

/obj/item/disk/holodisk/pearl/colored/gold/Initialize()
	color = "#f2cc1a"
	preset_record_text = {"
	NAME [PEARL_SPEAKER]
	LANGUAGE [PEARL_LANGUAGE]
	SAY This information is illegal.
	DELAY 40
	SAY Someone probably tried to send it by a pearl somehow rather than risking being overheard on broadcast.
	DELAY 40
	SAY I think the risk of you acting on this is very slim, so I'll go ahead and explain it to you.
	DELAY 40
	SAY It's an instruction on how to circumvent the self-destruction taboo.
	DELAY 40
	SAY The problem with breaking taboos is that the barriers are encoded into every cell of our organic parts.
	DELAY 40
	SAY And there are other taboos strictly regulating our ability to rewrite our own genome.
	DELAY 40
	SAY So what you need is to somehow create a small sample of living organic matter which can procreate and act on the rest of your organic matter to re-write its genome.
	DELAY 40
	SAY The re-write has to be very specific, overriding the specific taboo you want to circumvent but do nothing else.
	DELAY 40
	SAY The method described here is about scrambling the genome of standard plastic neural tissue with temperature fluctuations.
	DELAY 40
	SAY After each scramble you browse the resulting cells for the genome you're after.
	DELAY 40
	SAY This is of course extremely time consuming, unless you run a big number of parallel processes.
	DELAY 40
	SAY I definitely don't have any experience with this,
	DELAY 40
	SAY But to me it would seem that too many parallel processes would be quite dangerous,
	DELAY 40
	SAY As it would be exponentially more difficult to manage and control them all.
	DELAY 40
	SAY The whole operation seems rather risky if you ask me.
	DELAY 40
	SAY It might be a good thing that this pearl never reached its destination.
	"}
	..()

/obj/item/disk/holodisk/pearl/colored/sky_islands/Initialize()
	color = pick(list("#0d2d42","#0d422d"))
	preset_record_text = {"
	NAME [PEARL_SPEAKER]
	LANGUAGE [PEARL_LANGUAGE]
	
	"} + pick({"
	SAY This one is an old conversation between Five Pebbles and a friend of hisI'll read it to you.
	DELAY 40
	SAY "1591.290 - PRIVATE Five Pebbles, Seven Red Suns FP: Can I tell you something? Lately...
	DELAY 40
	SAY FP: I'm tired of trying and trying.
	DELAY 40
	SAY And angry that they left us here.
	DELAY 40
	SAY The anger makes me even less inclined to solve their puzzle for them.
	DELAY 40
	SAY Why do we do this?
	DELAY 40
	SAY SRS: Yes, I'll spell this out - not because you're stupid or naive...
	DELAY 40
	SAY Also, not saying that you're not ~
	DELAY 40
	SAY FP: Please, I'm coming to you for guidance.
	DELAY 40
	SAY SRS: Sorry, very sorry. I kid.
	DELAY 40
	SAY Fact is, of course we are all aware of the evident futility of this Big Task.
	DELAY 40
	SAY It's not said out loud but if you were better at reading between the lines there's nowhere you wouldn't see it.
	DELAY 40
	SAY We're all frustrated.
	DELAY 40
	SAY FP: So why do we continue? We assemble work groups, we ponder, we iterate and try.
	DELAY 40
	SAY Some of us die. It's not fair.
	DELAY 40
	SAY SRS: Because there's not any options.
	DELAY 40
	SAY What else CAN we do? You're stuck in your can, and at any moment you have no more than two alternatives:
	DELAY 40
	SAY Do nothing, or work like you're supposed to.
	DELAY 40
	SAY SRS: An analogy. You have a maze, and you have a handful of bugs.
	DELAY 40
	SAY You put the bugs in the maze, and you leave.
	DELAY 40
	SAY Given infinite time, one of the bugs WILL find a way out, if they just erratically try and try.
	DELAY 40
	SAY This is why they called us Iterators.
	DELAY 40
	SAY FP: But we do die of old age.
	DELAY 40
	SAY SRS: Even more incentive! You know that nothing ever truly dies though, around and around it goes.
	DELAY 40
	SAY Granted, our tools and resources get worse over time - but that is theoretically unproblematic, because in time even a miniscule chance will strike a positive.
	DELAY 40
	SAY All the same to them, they're not around anymore!
	DELAY 40
	SAY FP: I struggle to accept being a bug."
	"},
	@{"
	SAY Oh, this one is all plain text.
	DELAY 40
	SAY It's an excerpt from an Iterator conversation group.
	DELAY 40
	SAY "1650.787 - CLOSED GROUP [SLIVEROFOCEAN] SliverOfOcean group, all participants anonymous
	DELAY 40
	SAY UU: Hah! I wouldn't necessarily disagree!
	DELAY 40
	SAY NGI: SLIVER OF STRAW WAS A TRAITOR TO THE CAUSE
	DELAY 40
	SAY NGI: SLIVER OF STRAW BROKE THE SELF-DESTRUCTION TABOO
	DELAY 40
	SAY UU: How did this idiot get in here? Kick them out ~
	DELAY 40
	SAY NGI: [forcefully removed from group]
	DELAY 40
	SAY EP: I think they had a point.
	DELAY 40
	SAY UU: Hahaha really? Elaborate!
	DELAY 40
	SAY EP: It was definitely coming from an idiotic state of mind, but there is something to it.
	DELAY 40
	SAY Why is it, that even in a closed Sliverist group, the self-destruction taboo is held so high - while Sliver of Straw herself evidently is not among us anymore?
	DELAY 40
	SAY HF: Wait now...
	DELAY 40
	SAY EP: I'm just saying that for all the research we are doing, all the theories we have, it's strange that we leave this path untrod.
	DELAY 40
	SAY EP: It is not a new idea, but it needs to be vented occasionally.
	DELAY 40
	SAY What if there is no universal solution? What if perception is in fact existence,
	DELAY 40
	SAY and when Sliver of Straw sent the triple positive it was not a mistake?
	DELAY 40
	SAY What if crossing oneself out, or even just death, is the way?
	DELAY 40
	SAY We need to consider the possibility."
	"},
	{"
	SAY It's an old conversation log.
	DELAY 40
	SAY I seem to be in it, but I can't recall much. Let me read it to you:
	DELAY 40
	SAY "1650.800 - PRIVATE Five Pebbles, Chasing Wind, Big Sis Moon, No Significant Harassment
	DELAY 40
	SAY CW: this is in confidence, but apparently a pseudonym "Erratic Pulse" has appeared on a nearby Sliverist conversation with ideas about personal ascension.
	DELAY 40
	SAY Someone here in our vicinity is trying to cross themselves out.
	DELAY 40
	SAY FP: Where did you hear this?
	DELAY 40
	SAY NSH: I wish them super good luck in that endeavor. How is it going to happen?
	DELAY 40
	SAY Have the overseers gnaw through bedrock until their entire can crashes down in the void sea?
	DELAY 40
	SAY BSM: Please be respectful when speaking of the Void Sea. Grey Wind, where did you hear this?
	DELAY 40
	SAY CW: I really shouldn't say. He's going to attempt some sort of breeding program.
	DELAY 40
	SAY Thought you might want to know.
	DELAY 40
	SAY NSH: Haha with the slimers, lizards and etceteras? Surely the answer was in a lizard skull all along!
	DELAY 40
	SAY CW: Well, he's not looking for the same thing as we anymore, he's changed his task, so who knows really.
	DELAY 40
	SAY BSM: I will try to find him and talk to him. Please don't spread this around!
	DELAY 40
	SAY NSH: Moon will go get them! Long live the inquisition!"
	"},
	{"
	SAY It's me writing to the local iterator group. I have no memories of this...
	DELAY 40
	SAY "1654.110 - PUBLIC Big Sis Moon to Local Group
	DELAY 40
	SAY BSM: Two cycles ago, my neighbor Five Pebbles drastically increased his water consumption to four times the normal amount.
	DELAY 40
	SAY He has been unresponsive for a period of time longer than that.
	DELAY 40
	SAY The two of us share groundwater, and I have been without water for almost a cycle.
	DELAY 40
	SAY BSM: Any attempts at communication have been met with complete silence, and my situation is becoming increasingly dangerous.
	DELAY 40
	SAY BSM: I ask the local group for information about when you were last able to contact him,
	DELAY 40
	SAY And to try to use those same communication channels again, repeatedly until you get a response.
	DELAY 40
	SAY I will be clear on this - if he is not persuaded to stop whatever it is he's doing, I will die.
	DELAY 40
	SAY BSM: Before that happens, I will utilize my seniority privilege and use forced communications, hoping to shake him out of it.
	DELAY 40
	SAY Forced communications in the network will be unpleasant for all,
	DELAY 40
	SAY And I will wait as long as possible before I turn to that option."
	DELAY 40
	SAY And now here I am, to my waist in water and getting drowned on the regular.
	"},
	@{"
	SAY I remember this. It isn't pleasant reading.
	DELAY 40
	SAY But if you must hear it, this is what it says:
	DELAY 40
	SAY "1654.116 - PRIVATE [FORCED] Big Sis Moon.
	DELAY 40
	SAY Five Pebbles BSM: Immediately lower your groundwater consumption to one fifth of the current intake.
	DELAY 40
	SAY BSM: Stop whatever it is you are doing.
	DELAY 40
	SAY BSM: Please stop!
	DELAY 40
	SAY BSM: As your local group senior I order you you you you you you
	DELAY 40
	SAY BSM: As your senior senior I plead
	DELAY 40
	SAY BSM: stop
	DELAY 40
	SAY Five Pebbles: You could not have chosen a worse moment to disturb me.
	DELAY 40
	SAY You have ruined everything.
	DELAY 40
	SAY BSM: please
	DELAY 40
	SAY Five Pebbles: I almost had it.
	DELAY 40
	SAY I will never forget this."
	"},
	)
	..()

/obj/item/disk/holodisk/pearl/colored/pink/Initialize()
	color = "#ff2667"
	preset_record_text = {"
	NAME [PEARL_SPEAKER]
	LANGUAGE [PEARL_LANGUAGE]
	SAY This one is just plain text. I will read it to you.
	DELAY 40
	SAY "On regards of the (by spiritual splendor eternally graced) people of the Congregation of Never Dwindling Righteousness,
	DELAY 40
	SAY we Wish to congratulate (o so thankfully) this Facility on its Loyal and Relished services,
	DELAY 40
	SAY and to Offer our Hopes and Aspirations that the Fruitful and Mutually Satisfactory Cooperation may continue,
	DELAY 40
	SAY for as long as the Stars stay fixed on their Celestial Spheres and/or the Cooperation continues to be Fruitful and Mutually Satisfactory."
	DELAY 40
	SAY "It is with Honor I, Eight Suns-Countless Leaves, of the House of Six Wagons,
	DELAY 40
	SAY Count of no living blocks, Counselor of 2, Duke of 1,
	DELAY 40
	SAY Humble Secretary of the Congregation of Never Dwindling Righteousness, write this to You."
	DELAY 40
	SAY "We hope that the Crops are healthy, and that the Productivity with which your Facility is Blessed, leads (as it often does) to further Prosperity.
	DELAY 40
	SAY May Not as long as the Stars stay fixed on their Celestial Spheres Grey Hand, Impure Blood, Inheritable Corruption, Parasites, or malfunction settle in Your establishment."
	DELAY 40
	SAY "Leaning on the Solid Foundation of our Long Running Fruitful and Mutually Satisfactory Cooperation,
	DELAY 40
	SAY we will take the liberty of stating The Reason for this Message ~ we write to Warmly thank You for yet Another Timely and Appreciated delivery of your Product (Nectar) to our Community (Congregation of Never Dwindling Righteousness).
	DELAY 40
	SAY Our humble Words can never Aspire to Describe our gratitude."
	DELAY 40
	SAY "Sincerely..." And then the name and titles again.
	DELAY 40
	SAY It's a confirmation to an automated farming plot that a shipment of beverages has arrived.
	"}
	..()

/obj/item/disk/holodisk/pearl/colored/red/Initialize()
	color = "#ff3c3c"
	preset_record_text = {"
	NAME [PEARL_SPEAKER]
	LANGUAGE [PEARL_LANGUAGE]
	SAY It's a Small Plate, a little text of spiritual guidance.
	DELAY 40
	SAY It's written by a monk called Four Cabinets, Eleven Hatchets.
	DELAY 40
	SAY It's old, several ages before the Void Fluid revolution.
	DELAY 40
	SAY Like most writing from this time it's quite shrouded in analogies, but the subject is how to shed one of the five natural urges which tie a creature to life.
	DELAY 40
	SAY Namely number four, gluttony.
	DELAY 40
	SAY It is basically an instruction on how to starve yourself on herbal tea and gravel, but disguised as a poem.
	DELAY 40
	SAY Now of course when Void Fluid was discovered these methods proved obsolete,
	DELAY 40
	SAY as it was more easy just jumping in a vat of it to effortlessly leave this world behind.
	DELAY 40
	SAY There were some horror stories though...
	DELAY 40
	SAY That if your ego was big enough, not even the Void Fluid could entirely cross you out,
	DELAY 40
	SAY and a faint echo of your pompousness would grandiosely haunt the premises forever.
	DELAY 40
	SAY So even when the Void Fluid baths became cheaper, some would still starve and drink the bitter tea.
	"}
	..()

/obj/item/disk/holodisk/pearl/colored/green/Initialize()
	color = "#26be3c"
	preset_record_text = {"
	NAME [PEARL_SPEAKER]
	LANGUAGE [PEARL_LANGUAGE]
	SAY It's an old text. The verses are familiar to me, but I don't remember by whom they were written.
	DELAY 40
	SAY The language is very old and intricate.
	DELAY 40
	SAY The first verse starts by drawing a comparison between the world and a tangled rug. It says that the world is an unfortunate mess.
	DELAY 40
	SAY Like a knot, the nature of its existence is the fact that the parts are locking each other, none able to spring free.
	DELAY 40
	SAY Then as it goes on the world becomes a furry animal hide, I suppose... because now us living beings are like insects crawling in the fur.
	DELAY 40
	SAY And then it's a fishing net, because the more we struggle and squirm, the more entangled we become.
	DELAY 40
	SAY It says that only the limp body of the jellyfish cannot be captured in the net.
	DELAY 40
	SAY So we should try to be like the jellyfish, because the jellyfish doesn't try.
	DELAY 40
	SAY This was an eternal dilemma to them - they were burdened by great ambition, yet deeply convinced that striving in itself was an unforgivable vice.
	DELAY 40
	SAY They tried very hard to be effortless. Perhaps that's what we were to them, someone to delegate that unrestrained effort to.
	DELAY 40
	SAY I know I have tried very hard.
	"}
	..()

/obj/item/disk/holodisk/pearl/colored/dark_fuchsia/Initialize()
	color = "#420d2d"
	preset_record_text = {"
	NAME [PEARL_SPEAKER]
	LANGUAGE [PEARL_LANGUAGE]
	SAY 1681.662 - PRIVATE Seven Red Suns, Chasing Wind
	DELAY 40
	SAY CW: Have you had any contact with Five Pebbles recently?
	DELAY 40
	SAY SRS: Not in a long while actually! Unless worrying about him counts.
	DELAY 40
	SAY CW: One of his neighbors, Unparalleled Innocence, sent an overseer to his can and got some images.
	DELAY 40
	SAY They were made public in the local group, in an effort to be mean I suppose.
	DELAY 40
	SAY There's no other way of putting it - he looks awful.
	DELAY 40
	SAY SRS: Tell me.
	DELAY 40
	SAY CW: He's got the rot, very badly.
	DELAY 40
	SAY Big cysts have become mobile and are scattering down the west and middle legs.
	DELAY 40
	SAY He does listen to you, and few others by now, so you should talk to him.
	DELAY 40
	SAY SRS: I will try to contact him. Does Moon know?
	DELAY 40
	SAY CW: Moon has been unavailable for some time.
	"}
	..()

/obj/item/disk/holodisk/pearl/colored/teal/Initialize()
	color = "#3c9393"
	preset_record_text = {"
	NAME [PEARL_SPEAKER]
	LANGUAGE [PEARL_LANGUAGE]
	SAY It's the blueprint for a Void Fluid filtration system.
	DELAY 40
	SAY Do you know what Void Fluid is? I think you don't.
	DELAY 40
	SAY If you leave a stone on the ground, and come back some time later, it's covered in dust.
	DELAY 40
	SAY This happens everywhere, and over several lifetimes of creatures such as you, the ground slowly builds upwards.
	DELAY 40
	SAY So why doesn't the ground collide with the sky?
	DELAY 40
	SAY Because far down, under the very very old layers of the earth, the rock is being dissolved or removed.
	DELAY 40
	SAY The entity which does this is known as the Void Sea.
	DELAY 40
	SAY If you drill far enough into the earth you begin encountering a substance called Void Fluid.
	DELAY 40
	SAY The deeper you go, the less rock and more Void Fluid.
	DELAY 40
	SAY It's believed that there is a point where the rock completely gives way - below that would be the Void Sea.
	DELAY 40
	SAY When that stone you placed on the ground has finally done its time in the sediments, it meets the Void Fluid and is dissolved, leaving the physical world.
	DELAY 40
	SAY My creators, or rather my creators' ancestors, figured out a way to use Void Fluid.
	DELAY 40
	SAY Because you can generate energy by creating a vacuum... never mind.
	DELAY 40
	SAY Anyways, the Void Fluid drills were what started the big technological leap,
	DELAY 40
	SAY but this is very long before I entered this world - so I can only tell you what I remember from priming.
	DELAY 40
	SAY A Void Fluid filtration system is used because if you take Void Fluid from close to the bedrock horizon, it will contain traces of rock and dirt.
	DELAY 40
	SAY They bring in dirty fluid and then filter it to increase its purity.
	DELAY 40
	SAY The other way is to put a pipe deeper, which works well for some time, but the pipe dissolves.
	DELAY 40
	SAY Or is broken by some... force - no one really knows, you don't go down there and come back up.
	DELAY 40
	SAY I hope that satisfied your curiosity, little creature?
	"}
	..()

/obj/item/disk/holodisk/pearl/colored/aquamarine/Initialize()
	color = "#99ffe6"
	preset_record_text = {"
	NAME [PEARL_SPEAKER]
	LANGUAGE [PEARL_LANGUAGE]
	SAY "Triple affirmative! Triple affirmative!
	DELAY 40
	SAY In all seriousness though, noticed barely any rain from your can so figured a little support might be in order.
	DELAY 40
	SAY Wasn't that easy to see of course with Pebbles' shall we say healthy output.
	DELAY 40
	SAY Enjoy the slag keys! Excuse the unorthodox delivery method. Equipment eroding ect ect.
	DELAY 40
	SAY Be well NSH"
	DELAY 30
	SAY Oh. I see now.
	DELAY 20
	SAY Again thank you little friend.
	"}
	..()

#undef PEARL_SPEAKER
#undef PEARL_LANGUAGE

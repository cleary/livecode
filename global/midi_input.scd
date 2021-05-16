// Evaluate the block below to start the mapping MIDI -> OSC.
// specifically mapped for my launchpad mini
// solos currently not working
(
var mutes, solos, muteAll, soloAll, unmuteAll, unsoloAll, hush;
var playbackControl, playbackState;
var osc;

/* -- MIDI Controller Mapping ---------------------------- */
// Edit this section to configure your MIDI controller

// "mutes" and "solos" are each a Dictionary of MIDI numbers -> Pattern IDs

// In this case, C4, D4 & E4 mute patterns d1, d2 & d3
mutes = Dictionary[
	0 -> 1,
	1 -> 2,
	2 -> 3,
	3 -> 4,
	4 -> 5,
	5 -> 6,
	6 -> 7,
	7 -> 8
];

// In this case, F4, G4 & A4 solo patterns d1, d2 & d3
solos = Dictionary[
	16 -> 1,
	17 -> 2,
	18 -> 3,
	19 -> 4,
	20 -> 5,
	21 -> 6,
	22 -> 7,
	23 -> 8
];

// This MIDI note triggers "muteAll"
// In this case it's set to C5
muteAll = 8;

// This MIDI note triggers "soloAll"
// In this case it's set to D5
unsoloAll = 40;

// This MIDI note triggers "unmuteAll"
// In this case, it's unused
unmuteAll = 24;

// This MIDI note triggers "unsoloAll"
// In this case, it's unused
unsoloAll = 40;

// This MIDI note triggers "hush"
// In this case, it's unused
hush = 56;

/* ------------------------------------------------------- */

playbackState = Dictionary[];

union(mutes.values.asSet, solos.values.asSet).do({
	arg item;
	playbackState.put(item, Dictionary[\mute -> false, \solo -> false]);
});

osc = NetAddr.new("127.0.0.1", 6010);

MIDIClient.init;
MIDIIn.connectAll;

playbackControl = MIDIFunc.noteOn({ |val, num, chan, src|
	var patID, patState;
	if (mutes.at(num) !== nil, {
		patID = mutes.at(num);
		patState = playbackState.at(patID);
		if (patState.trueAt(\mute), {
			osc.sendMsg("/unmute", patID);
			patState.put(\mute, false);
		}, {
			osc.sendMsg("/mute", patID);
			patState.put(\mute, true);
		});
	});

	if (solos.at(num) !== nil, {
		patID = solos.at(num);
		patState = playbackState.at(patID);
		if (patState.trueAt(\solo), {
			osc.sendMsg("/unsolo", patID);
			patState.put(\solo, false);
		}, {
			osc.sendMsg("/solo", patID);
			patState.put(\solo, true);
		});
	});

	if (muteAll == num, {
		osc.sendMsg("/muteAll");
		playbackState.do({
			arg patState;
			patState.put(\mute, true);
		});
	});

	if (soloAll == num, {
		osc.sendMsg("/soloAll");
		playbackState.do({
			arg patState;
			patState.put(\solo, true);
		});
	});

	if (unmuteAll == num, {
		osc.sendMsg("/unmuteAll");
		playbackState.do({
			arg patState;
			patState.put(\mute, false);
		});
	});

	if (unsoloAll == num, {
		osc.sendMsg("/unsoloAll");
		playbackState.do({
			arg patState;
			patState.put(\solo, false);
		});
	});

	if (hush == num, {
		osc.sendMsg("/hush");
	});
});

if (~stopMidiMuteControl != nil, {
	~stopMidiMuteControl.value;
});

~stopMidiMuteControl = {
	playbackControl.free;
};
)

// Evaluate the line below to stop it.
~stopMidiMuteControl.value;
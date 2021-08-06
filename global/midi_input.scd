// Evaluate the block below to start the mapping MIDI -> OSC.
// this is specific to my Midi Fighter Twister setup
// Note: you can also load this in your supercollider startup.scd by adding
// somewhere near the end of the file (I add it after s.latency):
// load("/path/to/source/livecode/global/midi_input.scd");
(
var mutes, solos, muteAll, unmuteAll, unsoloAll, hush;
var playbackControl;
var osc;

/* -- MIDI Controller Mapping ---------------------------- */
// Edit this section to configure your MIDI controller

// "mutes" and "solos" are each a Dictionary of MIDI CC IDs -> Pattern IDs

// in this case, I map multiple buttons to the same Pattern ID
// one button is a toggle (push and release to enable, push and release again to disable)
// the other is a momentary (push and hold, release to release)
mutes = Dictionary[
	16 -> 1,
	17 -> 1,
	20 -> 2,
	21 -> 2,
	24 -> 3,
	25 -> 3,
	28 -> 4,
	29 -> 4
];

solos = Dictionary[
	18 -> 1,
	19 -> 1,
	22 -> 2,
	23 -> 2,
	26 -> 3,
	27 -> 3,
	30 -> 4,
	31 -> 4
];

// This MIDI CC triggers "muteAll"
//muteAll = 27;

// This MIDI CC triggers "soloAll"
//unsoloAll = 23;

// This MIDI CC triggers "unmuteAll"
//unmuteAll = 19;

// This MIDI CC triggers "unsoloAll"
//unsoloAll = 40;

// This MIDI CC triggers "hush"
//hush = 31;

/* ------------------------------------------------------- */

osc = NetAddr.new("127.0.0.1", 6010);

MIDIClient.init;
MIDIIn.connectAll;

playbackControl = MIDIFunc.cc({ |val, num, chan, src|
	var patID;

	if (mutes.at(num) !== nil, {
		patID = mutes.at(num);
		if (val !== 0, {
			osc.sendMsg("/mute", patID);
		}, {
			osc.sendMsg("/unmute", patID);
		});
	});

	if (solos.at(num) !== nil, {
		patID = solos.at(num);
		if (val !== 0, {
			osc.sendMsg("/solo", patID);
		}, {
			osc.sendMsg("/unsolo", patID);
		});
	});

	if (muteAll == num, {
		if (val !== 0, {
			osc.sendMsg("/muteall");
		}, {
			osc.sendMsg("/unmuteall");
		});
	});

	if (unsoloAll == num, {
		osc.sendMsg("/unsoloAll");
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
//~stopMidiMuteControl.value;

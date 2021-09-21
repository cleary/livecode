/*
This is an ansible generated startup file.
Modifications will be overwritten on next run,
but a backup copy will exist in the same dir as this file
*/

// The following section is required for mapping MIDI -> OSC.
// BEGIN MIDI INPUT SECTION 1 OF 3

var on, off, cc;
var osc;

// END MIDI INPUT SECTION 1 OF 3

(
s.reboot { // server options are only updated on reboot
	// configure the sound server: here you could add hardware specific options
	// see http://doc.sccode.org/Classes/ServerOptions.html
	s.options.numBuffers = 1024 * 256; // increase this if you need to load more samples
	s.options.memSize = 8192 * 32; // increase this if you get "alloc failed" messages
	s.options.numWireBufs = 64; // increase this if you get "exceeded number of interconnect buffers" messages
	s.options.maxNodes = 1024*32; // increase this if you are getting drop outs and the message "too many nodes"
	s.options.numOutputBusChannels = 16; // set this to your hardware output channel size, if necessary
	s.options.numInputBusChannels = 2; // set this to your hardware output channel size, if necessary
    s.options.maxLogins = 8; // optional, required to enable feedforward VU meter
	// boot the server and start SuperDirt
	s.waitForBoot {
		~dirt = SuperDirt(2, s); // two output channels, increase if you want to pan across more channels
        loadRelative("ansible_tidal_synthdefs/*.scd");
        ~dirt.doNotReadYet = true;
		~dirt.loadSoundFiles;   // load samples (path containing a wildcard can be passed in)
		// for example: ~dirt.loadSoundFiles("/Users/myUserName/Dirt/samples/*");
    		~dirt.loadSoundFiles("/home/bernie/Music/Samples/my-samples/*");
    		~dirt.loadSoundFiles("/home/bernie/Music/Samples/samples-extra/*");
    		~dirt.loadSoundFiles("/home/bernie/.local/share/ansible-tidalcycles/git_sample_sets_dir/dirt-jv1080/*");
    		~dirt.loadSoundFiles("/home/bernie/.local/share/ansible-tidalcycles/git_sample_sets_dir/dirt-impulse/*");
    		~dirt.loadSoundFiles("/home/bernie/.local/share/ansible-tidalcycles/git_sample_sets_dir/supercontinent/*");
    		~dirt.loadSoundFiles("/home/bernie/.local/share/ansible-tidalcycles/git_sample_individual_dir/*");

		// s.sync; // optionally: wait for samples to be read
		~dirt.start(57120, [0, 2, 4, 6, 8, 10, 12, 14] );   // start listening on port 57120, create 8 stereo busses

        // optional, enable feedforward vu meter
        ~dirt.startSendRMS;

        // midi
        (
            MIDIClient.init;

            ~midithroughport0 = MIDIOut.newByName("Midi Through", "Midi Through Port-0");
            ~midithroughport0.latency = 0;
            ~dirt.soundLibrary.addMIDI(\midi0, ~midithroughport0);

            ~midithroughport1 = MIDIOut.newByName("Midi Through", "Midi Through Port-1");
            ~midithroughport1.latency = 0;
            ~dirt.soundLibrary.addMIDI(\midi1, ~midithroughport1);

          );


        // The following section starts mapping MIDI -> OSC.
        // BEGIN MIDI INPUT SECTION 2 OF 3
        osc = NetAddr.new("127.0.0.1", 6010);

        MIDIClient.init;
        MIDIIn.connectAll;

        on = MIDIFunc.noteOn({ |val, num, chan, src|
            osc.sendMsg("/ctrl", num.asString, val/127);
        });

        off = MIDIFunc.noteOff({ |val, num, chan, src|
            osc.sendMsg("/ctrl", num.asString, 0);
        });

        cc = MIDIFunc.cc({ |val, num, chan, src|
            osc.sendMsg("/ctrl", num.asString, val/127);
        });

        if (~stopMidiToOsc != nil, {
            ~stopMidiToOsc.value;
        });

        ~stopMidiToOsc = {
            on.free;
            off.free;
            cc.free;
        };
        // END MIDI INPUT SECTION 2 OF 3

        // optional, needed for convenient access from sclang:
        (
        	~d1 = ~dirt.orbits[0]; ~d2 = ~dirt.orbits[1]; ~d3 = ~dirt.orbits[2];
        	~d4 = ~dirt.orbits[3]; ~d5 = ~dirt.orbits[4]; ~d6 = ~dirt.orbits[5];
        	~d7 = ~dirt.orbits[6]; ~d8 = ~dirt.orbits[7]; ~d9 = ~dirt.orbits[8];
        	~d10 = ~dirt.orbits[9]; ~d11 = ~dirt.orbits[10]; ~d12 = ~dirt.orbits[11];
        );

        // define global effects for mutable instruments effects
        ~dirt.orbits.do { |x|
            var clouds = GlobalDirtEffect(\global_mi_clouds, [\cloudspitch, \cloudspos, \cloudssize, \cloudsdens, \cloudstex, \cloudswet, \cloudsgain, \cloudsspread, \cloudsrvb, \cloudsfb, \cloudsfreeze, \cloudsmode, \cloudslofi]);
            var verb = GlobalDirtEffect(\global_mi_verb, [\verbwet, \verbtime, \verbdamp, \verbhp, \verbfreeze, \verbdiff, \verbgain]);
            x.globalEffects = x.globalEffects
              .addFirst(clouds)
              .addFirst(verb);
            x.initNodeTree;
        };

	};

	s.latency = 0.3; // increase this if you get "late" messages

	// BEGIN MIDI INPUT SECTION 3 OF 3
	load("/home/bernie/source/livecode/global/midi_input.scd");
    // END MIDI INPUT SECTION 3 OF 3

};
);


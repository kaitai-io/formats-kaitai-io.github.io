// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './VlqBase128Be'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./VlqBase128Be'));
  } else {
    root.StandardMidiFile = factory(root.KaitaiStream, root.VlqBase128Be);
  }
}(this, function (KaitaiStream, VlqBase128Be) {
/**
 * Standard MIDI file, typically known just as "MID", is a standard way
 * to serialize series of MIDI events, which is a protocol used in many
 * music synthesizers to transfer music data: notes being played,
 * effects being applied, etc.
 * 
 * Internally, file consists of a header and series of tracks, every
 * track listing MIDI events with certain header designating time these
 * events are happening.
 * 
 * NOTE: Rarely, MIDI files employ certain stateful compression scheme
 * to avoid storing certain elements of further elements, instead
 * reusing them from events which happened earlier in the
 * stream. Kaitai Struct (as of v0.9) is currently unable to parse
 * these, but files employing this mechanism are relatively rare.
 */

var StandardMidiFile = (function() {
  function StandardMidiFile(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  StandardMidiFile.prototype._read = function() {
    this.hdr = new Header(this._io, this, this._root);
    this.tracks = new Array(this.hdr.numTracks);
    for (var i = 0; i < this.hdr.numTracks; i++) {
      this.tracks[i] = new Track(this._io, this, this._root);
    }
  }

  var TrackEvents = StandardMidiFile.TrackEvents = (function() {
    function TrackEvents(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TrackEvents.prototype._read = function() {
      this.event = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.event.push(new TrackEvent(this._io, this, this._root));
        i++;
      }
    }

    return TrackEvents;
  })();

  var TrackEvent = StandardMidiFile.TrackEvent = (function() {
    function TrackEvent(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TrackEvent.prototype._read = function() {
      this.vTime = new VlqBase128Be(this._io, this, null);
      this.eventHeader = this._io.readU1();
      if (this.eventHeader == 255) {
        this.metaEventBody = new MetaEventBody(this._io, this, this._root);
      }
      if (this.eventHeader == 240) {
        this.sysexBody = new SysexEventBody(this._io, this, this._root);
      }
      switch (this.eventType) {
      case 224:
        this.eventBody = new PitchBendEvent(this._io, this, this._root);
        break;
      case 144:
        this.eventBody = new NoteOnEvent(this._io, this, this._root);
        break;
      case 208:
        this.eventBody = new ChannelPressureEvent(this._io, this, this._root);
        break;
      case 192:
        this.eventBody = new ProgramChangeEvent(this._io, this, this._root);
        break;
      case 160:
        this.eventBody = new PolyphonicPressureEvent(this._io, this, this._root);
        break;
      case 176:
        this.eventBody = new ControllerEvent(this._io, this, this._root);
        break;
      case 128:
        this.eventBody = new NoteOffEvent(this._io, this, this._root);
        break;
      }
    }
    Object.defineProperty(TrackEvent.prototype, 'eventType', {
      get: function() {
        if (this._m_eventType !== undefined)
          return this._m_eventType;
        this._m_eventType = (this.eventHeader & 240);
        return this._m_eventType;
      }
    });
    Object.defineProperty(TrackEvent.prototype, 'channel', {
      get: function() {
        if (this._m_channel !== undefined)
          return this._m_channel;
        if (this.eventType != 240) {
          this._m_channel = (this.eventHeader & 15);
        }
        return this._m_channel;
      }
    });

    return TrackEvent;
  })();

  var PitchBendEvent = StandardMidiFile.PitchBendEvent = (function() {
    function PitchBendEvent(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PitchBendEvent.prototype._read = function() {
      this.b1 = this._io.readU1();
      this.b2 = this._io.readU1();
    }
    Object.defineProperty(PitchBendEvent.prototype, 'bendValue', {
      get: function() {
        if (this._m_bendValue !== undefined)
          return this._m_bendValue;
        this._m_bendValue = (((this.b2 << 7) + this.b1) - 16384);
        return this._m_bendValue;
      }
    });
    Object.defineProperty(PitchBendEvent.prototype, 'adjBendValue', {
      get: function() {
        if (this._m_adjBendValue !== undefined)
          return this._m_adjBendValue;
        this._m_adjBendValue = (this.bendValue - 16384);
        return this._m_adjBendValue;
      }
    });

    return PitchBendEvent;
  })();

  var ProgramChangeEvent = StandardMidiFile.ProgramChangeEvent = (function() {
    function ProgramChangeEvent(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ProgramChangeEvent.prototype._read = function() {
      this.program = this._io.readU1();
    }

    return ProgramChangeEvent;
  })();

  var NoteOnEvent = StandardMidiFile.NoteOnEvent = (function() {
    function NoteOnEvent(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    NoteOnEvent.prototype._read = function() {
      this.note = this._io.readU1();
      this.velocity = this._io.readU1();
    }

    return NoteOnEvent;
  })();

  var PolyphonicPressureEvent = StandardMidiFile.PolyphonicPressureEvent = (function() {
    function PolyphonicPressureEvent(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PolyphonicPressureEvent.prototype._read = function() {
      this.note = this._io.readU1();
      this.pressure = this._io.readU1();
    }

    return PolyphonicPressureEvent;
  })();

  var Track = StandardMidiFile.Track = (function() {
    function Track(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Track.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [77, 84, 114, 107]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([77, 84, 114, 107], this.magic, this._io, "/types/track/seq/0");
      }
      this.lenEvents = this._io.readU4be();
      this._raw_events = this._io.readBytes(this.lenEvents);
      var _io__raw_events = new KaitaiStream(this._raw_events);
      this.events = new TrackEvents(_io__raw_events, this, this._root);
    }

    return Track;
  })();

  var MetaEventBody = StandardMidiFile.MetaEventBody = (function() {
    MetaEventBody.MetaTypeEnum = Object.freeze({
      SEQUENCE_NUMBER: 0,
      TEXT_EVENT: 1,
      COPYRIGHT: 2,
      SEQUENCE_TRACK_NAME: 3,
      INSTRUMENT_NAME: 4,
      LYRIC_TEXT: 5,
      MARKER_TEXT: 6,
      CUE_POINT: 7,
      MIDI_CHANNEL_PREFIX_ASSIGNMENT: 32,
      END_OF_TRACK: 47,
      TEMPO: 81,
      SMPTE_OFFSET: 84,
      TIME_SIGNATURE: 88,
      KEY_SIGNATURE: 89,
      SEQUENCER_SPECIFIC_EVENT: 127,

      0: "SEQUENCE_NUMBER",
      1: "TEXT_EVENT",
      2: "COPYRIGHT",
      3: "SEQUENCE_TRACK_NAME",
      4: "INSTRUMENT_NAME",
      5: "LYRIC_TEXT",
      6: "MARKER_TEXT",
      7: "CUE_POINT",
      32: "MIDI_CHANNEL_PREFIX_ASSIGNMENT",
      47: "END_OF_TRACK",
      81: "TEMPO",
      84: "SMPTE_OFFSET",
      88: "TIME_SIGNATURE",
      89: "KEY_SIGNATURE",
      127: "SEQUENCER_SPECIFIC_EVENT",
    });

    function MetaEventBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MetaEventBody.prototype._read = function() {
      this.metaType = this._io.readU1();
      this.len = new VlqBase128Be(this._io, this, null);
      this.body = this._io.readBytes(this.len.value);
    }

    return MetaEventBody;
  })();

  var ControllerEvent = StandardMidiFile.ControllerEvent = (function() {
    function ControllerEvent(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ControllerEvent.prototype._read = function() {
      this.controller = this._io.readU1();
      this.value = this._io.readU1();
    }

    return ControllerEvent;
  })();

  var Header = StandardMidiFile.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [77, 84, 104, 100]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([77, 84, 104, 100], this.magic, this._io, "/types/header/seq/0");
      }
      this.lenHeader = this._io.readU4be();
      this.format = this._io.readU2be();
      this.numTracks = this._io.readU2be();
      this.division = this._io.readS2be();
    }

    return Header;
  })();

  var SysexEventBody = StandardMidiFile.SysexEventBody = (function() {
    function SysexEventBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SysexEventBody.prototype._read = function() {
      this.len = new VlqBase128Be(this._io, this, null);
      this.data = this._io.readBytes(this.len.value);
    }

    return SysexEventBody;
  })();

  var NoteOffEvent = StandardMidiFile.NoteOffEvent = (function() {
    function NoteOffEvent(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    NoteOffEvent.prototype._read = function() {
      this.note = this._io.readU1();
      this.velocity = this._io.readU1();
    }

    return NoteOffEvent;
  })();

  var ChannelPressureEvent = StandardMidiFile.ChannelPressureEvent = (function() {
    function ChannelPressureEvent(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ChannelPressureEvent.prototype._read = function() {
      this.pressure = this._io.readU1();
    }

    return ChannelPressureEvent;
  })();

  return StandardMidiFile;
})();
return StandardMidiFile;
}));

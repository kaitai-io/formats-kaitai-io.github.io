// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.GenmidiOp2 || (root.GenmidiOp2 = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (GenmidiOp2_, KaitaiStream) {
/**
 * GENMIDI.OP2 is a sound bank file used by players based on DMX sound
 * library to play MIDI files with General MIDI instruments using OPL2
 * sound chip (which was commonly installed on popular AdLib and Sound
 * Blaster sound cards).
 * 
 * Major users of DMX sound library include:
 * 
 * * Original Doom game engine (and games based on it: Heretic, Hexen, Strife, Chex Quest)
 * * Raptor: Call of the Shadows
 * @see {@link http://www.fit.vutbr.cz/~arnost/muslib/op2_form.zip|Source}
 * @see {@link https://doom.fandom.com/wiki/GENMIDI|Source}
 * @see {@link https://moddingwiki.shikadi.net/wiki/OP2_Bank_Format|Source}
 */

var GenmidiOp2 = (function() {
  function GenmidiOp2(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  GenmidiOp2.prototype._read = function() {
    this.magic = this._io.readBytes(8);
    if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([35, 79, 80, 76, 95, 73, 73, 35])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([35, 79, 80, 76, 95, 73, 73, 35]), this.magic, this._io, "/seq/0");
    }
    this.instruments = [];
    for (var i = 0; i < 175; i++) {
      this.instruments.push(new InstrumentEntry(this._io, this, this._root));
    }
    this.instrumentNames = [];
    for (var i = 0; i < 175; i++) {
      this.instrumentNames.push(KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(KaitaiStream.bytesStripRight(this._io.readBytes(32), 0), 0, false), "ASCII"));
    }
  }

  var Instrument = GenmidiOp2.Instrument = (function() {
    function Instrument(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Instrument.prototype._read = function() {
      this.op1 = new OpSettings(this._io, this, this._root);
      this.feedback = this._io.readU1();
      this.op2 = new OpSettings(this._io, this, this._root);
      this.unused = this._io.readU1();
      this.baseNote = this._io.readS2le();
    }

    /**
     * Feedback/AM-FM (both operators)
     */

    /**
     * Base note offset
     */

    return Instrument;
  })();

  var InstrumentEntry = GenmidiOp2.InstrumentEntry = (function() {
    function InstrumentEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    InstrumentEntry.prototype._read = function() {
      this.flags = this._io.readU2le();
      this.finetune = this._io.readU1();
      this.note = this._io.readU1();
      this.instruments = [];
      for (var i = 0; i < 2; i++) {
        this.instruments.push(new Instrument(this._io, this, this._root));
      }
    }

    /**
     * MIDI note for fixed instruments, 0 otherwise
     */

    return InstrumentEntry;
  })();

  /**
   * OPL2 settings for one operator (carrier or modulator)
   */

  var OpSettings = GenmidiOp2.OpSettings = (function() {
    function OpSettings(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    OpSettings.prototype._read = function() {
      this.tremVibr = this._io.readU1();
      this.attDec = this._io.readU1();
      this.sustRel = this._io.readU1();
      this.wave = this._io.readU1();
      this.scale = this._io.readU1();
      this.level = this._io.readU1();
    }

    /**
     * Tremolo/vibrato/sustain/KSR/multi
     */

    /**
     * Attack rate/decay rate
     */

    /**
     * Sustain level/release rate
     */

    /**
     * Waveform select
     */

    /**
     * Key scale level
     */

    /**
     * Output level
     */

    return OpSettings;
  })();

  return GenmidiOp2;
})();
GenmidiOp2_.GenmidiOp2 = GenmidiOp2;
});

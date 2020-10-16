// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import java.nio.charset.Charset;


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
 * @see <a href="http://www.fit.vutbr.cz/~arnost/muslib/op2_form.zip">http://doom.wikia.com/wiki/GENMIDI</a>
 */
public class GenmidiOp2 extends KaitaiStruct {
    public static GenmidiOp2 fromFile(String fileName) throws IOException {
        return new GenmidiOp2(new ByteBufferKaitaiStream(fileName));
    }

    public GenmidiOp2(KaitaiStream _io) {
        this(_io, null, null);
    }

    public GenmidiOp2(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public GenmidiOp2(KaitaiStream _io, KaitaiStruct _parent, GenmidiOp2 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(8);
        if (!(Arrays.equals(magic(), new byte[] { 35, 79, 80, 76, 95, 73, 73, 35 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 35, 79, 80, 76, 95, 73, 73, 35 }, magic(), _io(), "/seq/0");
        }
        instruments = new ArrayList<InstrumentEntry>(((Number) (175)).intValue());
        for (int i = 0; i < 175; i++) {
            this.instruments.add(new InstrumentEntry(this._io, this, _root));
        }
        instrumentNames = new ArrayList<String>(((Number) (175)).intValue());
        for (int i = 0; i < 175; i++) {
            this.instrumentNames.add(new String(KaitaiStream.bytesTerminate(KaitaiStream.bytesStripRight(this._io.readBytes(32), (byte) 0), (byte) 0, false), Charset.forName("ASCII")));
        }
    }
    public static class InstrumentEntry extends KaitaiStruct {
        public static InstrumentEntry fromFile(String fileName) throws IOException {
            return new InstrumentEntry(new ByteBufferKaitaiStream(fileName));
        }

        public InstrumentEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public InstrumentEntry(KaitaiStream _io, GenmidiOp2 _parent) {
            this(_io, _parent, null);
        }

        public InstrumentEntry(KaitaiStream _io, GenmidiOp2 _parent, GenmidiOp2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.flags = this._io.readU2le();
            this.finetune = this._io.readU1();
            this.note = this._io.readU1();
            instruments = new ArrayList<Instrument>(((Number) (2)).intValue());
            for (int i = 0; i < 2; i++) {
                this.instruments.add(new Instrument(this._io, this, _root));
            }
        }
        private int flags;
        private int finetune;
        private int note;
        private ArrayList<Instrument> instruments;
        private GenmidiOp2 _root;
        private GenmidiOp2 _parent;
        public int flags() { return flags; }
        public int finetune() { return finetune; }

        /**
         * MIDI note for fixed instruments, 0 otherwise
         */
        public int note() { return note; }
        public ArrayList<Instrument> instruments() { return instruments; }
        public GenmidiOp2 _root() { return _root; }
        public GenmidiOp2 _parent() { return _parent; }
    }
    public static class Instrument extends KaitaiStruct {
        public static Instrument fromFile(String fileName) throws IOException {
            return new Instrument(new ByteBufferKaitaiStream(fileName));
        }

        public Instrument(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Instrument(KaitaiStream _io, GenmidiOp2.InstrumentEntry _parent) {
            this(_io, _parent, null);
        }

        public Instrument(KaitaiStream _io, GenmidiOp2.InstrumentEntry _parent, GenmidiOp2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.op1 = new OpSettings(this._io, this, _root);
            this.feedback = this._io.readU1();
            this.op2 = new OpSettings(this._io, this, _root);
            this.unused = this._io.readU1();
            this.baseNote = this._io.readS2le();
        }
        private OpSettings op1;
        private int feedback;
        private OpSettings op2;
        private int unused;
        private short baseNote;
        private GenmidiOp2 _root;
        private GenmidiOp2.InstrumentEntry _parent;
        public OpSettings op1() { return op1; }

        /**
         * Feedback/AM-FM (both operators)
         */
        public int feedback() { return feedback; }
        public OpSettings op2() { return op2; }
        public int unused() { return unused; }

        /**
         * Base note offset
         */
        public short baseNote() { return baseNote; }
        public GenmidiOp2 _root() { return _root; }
        public GenmidiOp2.InstrumentEntry _parent() { return _parent; }
    }

    /**
     * OPL2 settings for one operator (carrier or modulator)
     */
    public static class OpSettings extends KaitaiStruct {
        public static OpSettings fromFile(String fileName) throws IOException {
            return new OpSettings(new ByteBufferKaitaiStream(fileName));
        }

        public OpSettings(KaitaiStream _io) {
            this(_io, null, null);
        }

        public OpSettings(KaitaiStream _io, GenmidiOp2.Instrument _parent) {
            this(_io, _parent, null);
        }

        public OpSettings(KaitaiStream _io, GenmidiOp2.Instrument _parent, GenmidiOp2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.tremVibr = this._io.readU1();
            this.attDec = this._io.readU1();
            this.sustRel = this._io.readU1();
            this.wave = this._io.readU1();
            this.scale = this._io.readU1();
            this.level = this._io.readU1();
        }
        private int tremVibr;
        private int attDec;
        private int sustRel;
        private int wave;
        private int scale;
        private int level;
        private GenmidiOp2 _root;
        private GenmidiOp2.Instrument _parent;

        /**
         * Tremolo/vibrato/sustain/KSR/multi
         */
        public int tremVibr() { return tremVibr; }

        /**
         * Attack rate/decay rate
         */
        public int attDec() { return attDec; }

        /**
         * Sustain level/release rate
         */
        public int sustRel() { return sustRel; }

        /**
         * Waveform select
         */
        public int wave() { return wave; }

        /**
         * Key scale level
         */
        public int scale() { return scale; }

        /**
         * Output level
         */
        public int level() { return level; }
        public GenmidiOp2 _root() { return _root; }
        public GenmidiOp2.Instrument _parent() { return _parent; }
    }
    private byte[] magic;
    private ArrayList<InstrumentEntry> instruments;
    private ArrayList<String> instrumentNames;
    private GenmidiOp2 _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public ArrayList<InstrumentEntry> instruments() { return instruments; }
    public ArrayList<String> instrumentNames() { return instrumentNames; }
    public GenmidiOp2 _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

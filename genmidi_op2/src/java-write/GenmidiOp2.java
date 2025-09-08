// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;


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
 * @see <a href="http://www.fit.vutbr.cz/~arnost/muslib/op2_form.zip">Source</a>
 * @see <a href="https://doom.fandom.com/wiki/GENMIDI">Source</a>
 * @see <a href="https://moddingwiki.shikadi.net/wiki/OP2_Bank_Format">Source</a>
 */
public class GenmidiOp2 extends KaitaiStruct.ReadWrite {
    public static GenmidiOp2 fromFile(String fileName) throws IOException {
        return new GenmidiOp2(new ByteBufferKaitaiStream(fileName));
    }
    public GenmidiOp2() {
        this(null, null, null);
    }

    public GenmidiOp2(KaitaiStream _io) {
        this(_io, null, null);
    }

    public GenmidiOp2(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public GenmidiOp2(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, GenmidiOp2 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(8);
        if (!(Arrays.equals(this.magic, new byte[] { 35, 79, 80, 76, 95, 73, 73, 35 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 35, 79, 80, 76, 95, 73, 73, 35 }, this.magic, this._io, "/seq/0");
        }
        this.instruments = new ArrayList<InstrumentEntry>();
        for (int i = 0; i < 175; i++) {
            InstrumentEntry _t_instruments = new InstrumentEntry(this._io, this, _root);
            try {
                _t_instruments._read();
            } finally {
                this.instruments.add(_t_instruments);
            }
        }
        this.instrumentNames = new ArrayList<String>();
        for (int i = 0; i < 175; i++) {
            this.instrumentNames.add(new String(KaitaiStream.bytesTerminate(this._io.readBytes(32), (byte) 0, false), StandardCharsets.US_ASCII));
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.instruments.size(); i++) {
            this.instruments.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.instrumentNames.size(); i++) {
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        for (int i = 0; i < this.instruments.size(); i++) {
            this.instruments.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        for (int i = 0; i < this.instrumentNames.size(); i++) {
            this._io.writeBytesLimit((this.instrumentNames.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")), 32, (byte) 0, (byte) 0);
        }
    }

    public void _check() {
        if (this.magic.length != 8)
            throw new ConsistencyError("magic", 8, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 35, 79, 80, 76, 95, 73, 73, 35 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 35, 79, 80, 76, 95, 73, 73, 35 }, this.magic, null, "/seq/0");
        }
        if (this.instruments.size() != 175)
            throw new ConsistencyError("instruments", 175, this.instruments.size());
        for (int i = 0; i < this.instruments.size(); i++) {
            if (!Objects.equals(this.instruments.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("instruments", _root(), this.instruments.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.instruments.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("instruments", this, this.instruments.get(((Number) (i)).intValue())._parent());
        }
        if (this.instrumentNames.size() != 175)
            throw new ConsistencyError("instrument_names", 175, this.instrumentNames.size());
        for (int i = 0; i < this.instrumentNames.size(); i++) {
            if ((this.instrumentNames.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")).length > 32)
                throw new ConsistencyError("instrument_names", 32, (this.instrumentNames.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")).length);
            if (KaitaiStream.byteArrayIndexOf((this.instrumentNames.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("instrument_names", -1, KaitaiStream.byteArrayIndexOf((this.instrumentNames.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")), ((byte) 0)));
        }
        _dirty = false;
    }
    public static class Instrument extends KaitaiStruct.ReadWrite {
        public static Instrument fromFile(String fileName) throws IOException {
            return new Instrument(new ByteBufferKaitaiStream(fileName));
        }
        public Instrument() {
            this(null, null, null);
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
        }
        public void _read() {
            this.op1 = new OpSettings(this._io, this, _root);
            this.op1._read();
            this.feedback = this._io.readU1();
            this.op2 = new OpSettings(this._io, this, _root);
            this.op2._read();
            this.unused = this._io.readU1();
            this.baseNote = this._io.readS2le();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.op1._fetchInstances();
            this.op2._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.op1._write_Seq(this._io);
            this._io.writeU1(this.feedback);
            this.op2._write_Seq(this._io);
            this._io.writeU1(this.unused);
            this._io.writeS2le(this.baseNote);
        }

        public void _check() {
            if (!Objects.equals(this.op1._root(), _root()))
                throw new ConsistencyError("op1", _root(), this.op1._root());
            if (!Objects.equals(this.op1._parent(), this))
                throw new ConsistencyError("op1", this, this.op1._parent());
            if (!Objects.equals(this.op2._root(), _root()))
                throw new ConsistencyError("op2", _root(), this.op2._root());
            if (!Objects.equals(this.op2._parent(), this))
                throw new ConsistencyError("op2", this, this.op2._parent());
            _dirty = false;
        }
        private OpSettings op1;
        private int feedback;
        private OpSettings op2;
        private int unused;
        private short baseNote;
        private GenmidiOp2 _root;
        private GenmidiOp2.InstrumentEntry _parent;
        public OpSettings op1() { return op1; }
        public void setOp1(OpSettings _v) { _dirty = true; op1 = _v; }

        /**
         * Feedback/AM-FM (both operators)
         */
        public int feedback() { return feedback; }
        public void setFeedback(int _v) { _dirty = true; feedback = _v; }
        public OpSettings op2() { return op2; }
        public void setOp2(OpSettings _v) { _dirty = true; op2 = _v; }
        public int unused() { return unused; }
        public void setUnused(int _v) { _dirty = true; unused = _v; }

        /**
         * Base note offset
         */
        public short baseNote() { return baseNote; }
        public void setBaseNote(short _v) { _dirty = true; baseNote = _v; }
        public GenmidiOp2 _root() { return _root; }
        public void set_root(GenmidiOp2 _v) { _dirty = true; _root = _v; }
        public GenmidiOp2.InstrumentEntry _parent() { return _parent; }
        public void set_parent(GenmidiOp2.InstrumentEntry _v) { _dirty = true; _parent = _v; }
    }
    public static class InstrumentEntry extends KaitaiStruct.ReadWrite {
        public static InstrumentEntry fromFile(String fileName) throws IOException {
            return new InstrumentEntry(new ByteBufferKaitaiStream(fileName));
        }
        public InstrumentEntry() {
            this(null, null, null);
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
        }
        public void _read() {
            this.flags = this._io.readU2le();
            this.finetune = this._io.readU1();
            this.note = this._io.readU1();
            this.instruments = new ArrayList<Instrument>();
            for (int i = 0; i < 2; i++) {
                Instrument _t_instruments = new Instrument(this._io, this, _root);
                try {
                    _t_instruments._read();
                } finally {
                    this.instruments.add(_t_instruments);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.instruments.size(); i++) {
                this.instruments.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.flags);
            this._io.writeU1(this.finetune);
            this._io.writeU1(this.note);
            for (int i = 0; i < this.instruments.size(); i++) {
                this.instruments.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.instruments.size() != 2)
                throw new ConsistencyError("instruments", 2, this.instruments.size());
            for (int i = 0; i < this.instruments.size(); i++) {
                if (!Objects.equals(this.instruments.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("instruments", _root(), this.instruments.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.instruments.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("instruments", this, this.instruments.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private int flags;
        private int finetune;
        private int note;
        private List<Instrument> instruments;
        private GenmidiOp2 _root;
        private GenmidiOp2 _parent;
        public int flags() { return flags; }
        public void setFlags(int _v) { _dirty = true; flags = _v; }
        public int finetune() { return finetune; }
        public void setFinetune(int _v) { _dirty = true; finetune = _v; }

        /**
         * MIDI note for fixed instruments, 0 otherwise
         */
        public int note() { return note; }
        public void setNote(int _v) { _dirty = true; note = _v; }
        public List<Instrument> instruments() { return instruments; }
        public void setInstruments(List<Instrument> _v) { _dirty = true; instruments = _v; }
        public GenmidiOp2 _root() { return _root; }
        public void set_root(GenmidiOp2 _v) { _dirty = true; _root = _v; }
        public GenmidiOp2 _parent() { return _parent; }
        public void set_parent(GenmidiOp2 _v) { _dirty = true; _parent = _v; }
    }

    /**
     * OPL2 settings for one operator (carrier or modulator)
     */
    public static class OpSettings extends KaitaiStruct.ReadWrite {
        public static OpSettings fromFile(String fileName) throws IOException {
            return new OpSettings(new ByteBufferKaitaiStream(fileName));
        }
        public OpSettings() {
            this(null, null, null);
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
        }
        public void _read() {
            this.tremVibr = this._io.readU1();
            this.attDec = this._io.readU1();
            this.sustRel = this._io.readU1();
            this.wave = this._io.readU1();
            this.scale = this._io.readU1();
            this.level = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.tremVibr);
            this._io.writeU1(this.attDec);
            this._io.writeU1(this.sustRel);
            this._io.writeU1(this.wave);
            this._io.writeU1(this.scale);
            this._io.writeU1(this.level);
        }

        public void _check() {
            _dirty = false;
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
        public void setTremVibr(int _v) { _dirty = true; tremVibr = _v; }

        /**
         * Attack rate/decay rate
         */
        public int attDec() { return attDec; }
        public void setAttDec(int _v) { _dirty = true; attDec = _v; }

        /**
         * Sustain level/release rate
         */
        public int sustRel() { return sustRel; }
        public void setSustRel(int _v) { _dirty = true; sustRel = _v; }

        /**
         * Waveform select
         */
        public int wave() { return wave; }
        public void setWave(int _v) { _dirty = true; wave = _v; }

        /**
         * Key scale level
         */
        public int scale() { return scale; }
        public void setScale(int _v) { _dirty = true; scale = _v; }

        /**
         * Output level
         */
        public int level() { return level; }
        public void setLevel(int _v) { _dirty = true; level = _v; }
        public GenmidiOp2 _root() { return _root; }
        public void set_root(GenmidiOp2 _v) { _dirty = true; _root = _v; }
        public GenmidiOp2.Instrument _parent() { return _parent; }
        public void set_parent(GenmidiOp2.Instrument _v) { _dirty = true; _parent = _v; }
    }
    private byte[] magic;
    private List<InstrumentEntry> instruments;
    private List<String> instrumentNames;
    private GenmidiOp2 _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public List<InstrumentEntry> instruments() { return instruments; }
    public void setInstruments(List<InstrumentEntry> _v) { _dirty = true; instruments = _v; }
    public List<String> instrumentNames() { return instrumentNames; }
    public void setInstrumentNames(List<String> _v) { _dirty = true; instrumentNames = _v; }
    public GenmidiOp2 _root() { return _root; }
    public void set_root(GenmidiOp2 _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

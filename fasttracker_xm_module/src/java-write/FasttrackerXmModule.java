// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.Arrays;


/**
 * XM (standing for eXtended Module) is a popular module music file
 * format, that was introduced in 1994 in FastTracker2 by Triton demo
 * group. Akin to MOD files, it bundles both digital samples
 * (instruments) and instructions on which note to play at what time
 * (patterns), which provides good audio quality with relatively small
 * file size. Audio is reproducible without relying on the sound of
 * particular hardware samplers or synths.
 * @see <a href="http://sid.ethz.ch/debian/milkytracker/milkytracker-0.90.85%2Bdfsg/resources/reference/xm-form.txt
 * ftp://ftp.modland.com/pub/documents/format_documentation/FastTracker%202%20v2.04%20(.xm).html
 * ">Source</a>
 */
public class FasttrackerXmModule extends KaitaiStruct.ReadWrite {
    public static FasttrackerXmModule fromFile(String fileName) throws IOException {
        return new FasttrackerXmModule(new ByteBufferKaitaiStream(fileName));
    }
    public FasttrackerXmModule() {
        this(null, null, null);
    }

    public FasttrackerXmModule(KaitaiStream _io) {
        this(_io, null, null);
    }

    public FasttrackerXmModule(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public FasttrackerXmModule(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, FasttrackerXmModule _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.preheader = new Preheader(this._io, this, _root);
        this.preheader._read();
        this._raw_header = this._io.readBytes(preheader().headerSize() - 4);
        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
        this.header = new Header(_io__raw_header, this, _root);
        this.header._read();
        this.patterns = new ArrayList<Pattern>();
        for (int i = 0; i < header().numPatterns(); i++) {
            Pattern _t_patterns = new Pattern(this._io, this, _root);
            try {
                _t_patterns._read();
            } finally {
                this.patterns.add(_t_patterns);
            }
        }
        this.instruments = new ArrayList<Instrument>();
        for (int i = 0; i < header().numInstruments(); i++) {
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
        this.preheader._fetchInstances();
        this.header._fetchInstances();
        for (int i = 0; i < this.patterns.size(); i++) {
            this.patterns.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.instruments.size(); i++) {
            this.instruments.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.preheader._write_Seq(this._io);
        final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(preheader().headerSize() - 4);
        this._io.addChildStream(_io__raw_header);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (preheader().headerSize() - 4));
            final FasttrackerXmModule _this = this;
            _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_header = _io__raw_header.toByteArray();
                    if (_this._raw_header.length != preheader().headerSize() - 4)
                        throw new ConsistencyError("raw(header)", preheader().headerSize() - 4, _this._raw_header.length);
                    parent.writeBytes(_this._raw_header);
                }
            });
        }
        this.header._write_Seq(_io__raw_header);
        for (int i = 0; i < this.patterns.size(); i++) {
            this.patterns.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        for (int i = 0; i < this.instruments.size(); i++) {
            this.instruments.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (!Objects.equals(this.preheader._root(), _root()))
            throw new ConsistencyError("preheader", _root(), this.preheader._root());
        if (!Objects.equals(this.preheader._parent(), this))
            throw new ConsistencyError("preheader", this, this.preheader._parent());
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (this.patterns.size() != header().numPatterns())
            throw new ConsistencyError("patterns", header().numPatterns(), this.patterns.size());
        for (int i = 0; i < this.patterns.size(); i++) {
            if (!Objects.equals(this.patterns.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("patterns", _root(), this.patterns.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.patterns.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("patterns", this, this.patterns.get(((Number) (i)).intValue())._parent());
        }
        if (this.instruments.size() != header().numInstruments())
            throw new ConsistencyError("instruments", header().numInstruments(), this.instruments.size());
        for (int i = 0; i < this.instruments.size(); i++) {
            if (!Objects.equals(this.instruments.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("instruments", _root(), this.instruments.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.instruments.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("instruments", this, this.instruments.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class Flags extends KaitaiStruct.ReadWrite {
        public static Flags fromFile(String fileName) throws IOException {
            return new Flags(new ByteBufferKaitaiStream(fileName));
        }
        public Flags() {
            this(null, null, null);
        }

        public Flags(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Flags(KaitaiStream _io, FasttrackerXmModule.Header _parent) {
            this(_io, _parent, null);
        }

        public Flags(KaitaiStream _io, FasttrackerXmModule.Header _parent, FasttrackerXmModule _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.reserved = this._io.readBitsIntBe(15);
            this.freqTableType = this._io.readBitsIntBe(1) != 0;
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(15, this.reserved);
            this._io.writeBitsIntBe(1, (this.freqTableType ? 1 : 0));
        }

        public void _check() {
            _dirty = false;
        }
        private long reserved;
        private boolean freqTableType;
        private FasttrackerXmModule _root;
        private FasttrackerXmModule.Header _parent;
        public long reserved() { return reserved; }
        public void setReserved(long _v) { _dirty = true; reserved = _v; }

        /**
         * 0 = Amiga frequency table (see below); 1 = Linear frequency table
         */
        public boolean freqTableType() { return freqTableType; }
        public void setFreqTableType(boolean _v) { _dirty = true; freqTableType = _v; }
        public FasttrackerXmModule _root() { return _root; }
        public void set_root(FasttrackerXmModule _v) { _dirty = true; _root = _v; }
        public FasttrackerXmModule.Header _parent() { return _parent; }
        public void set_parent(FasttrackerXmModule.Header _v) { _dirty = true; _parent = _v; }
    }
    public static class Header extends KaitaiStruct.ReadWrite {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }
        public Header() {
            this(null, null, null);
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, FasttrackerXmModule _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, FasttrackerXmModule _parent, FasttrackerXmModule _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.songLength = this._io.readU2le();
            this.restartPosition = this._io.readU2le();
            this.numChannels = this._io.readU2le();
            this.numPatterns = this._io.readU2le();
            this.numInstruments = this._io.readU2le();
            this.flags = new Flags(this._io, this, _root);
            this.flags._read();
            this.defaultTempo = this._io.readU2le();
            this.defaultBpm = this._io.readU2le();
            this.patternOrderTable = new ArrayList<Integer>();
            for (int i = 0; i < 256; i++) {
                this.patternOrderTable.add(this._io.readU1());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.flags._fetchInstances();
            for (int i = 0; i < this.patternOrderTable.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.songLength);
            this._io.writeU2le(this.restartPosition);
            this._io.writeU2le(this.numChannels);
            this._io.writeU2le(this.numPatterns);
            this._io.writeU2le(this.numInstruments);
            this.flags._write_Seq(this._io);
            this._io.writeU2le(this.defaultTempo);
            this._io.writeU2le(this.defaultBpm);
            for (int i = 0; i < this.patternOrderTable.size(); i++) {
                this._io.writeU1(this.patternOrderTable.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (!Objects.equals(this.flags._root(), _root()))
                throw new ConsistencyError("flags", _root(), this.flags._root());
            if (!Objects.equals(this.flags._parent(), this))
                throw new ConsistencyError("flags", this, this.flags._parent());
            if (this.patternOrderTable.size() != 256)
                throw new ConsistencyError("pattern_order_table", 256, this.patternOrderTable.size());
            for (int i = 0; i < this.patternOrderTable.size(); i++) {
            }
            _dirty = false;
        }
        private int songLength;
        private int restartPosition;
        private int numChannels;
        private int numPatterns;
        private int numInstruments;
        private Flags flags;
        private int defaultTempo;
        private int defaultBpm;
        private List<Integer> patternOrderTable;
        private FasttrackerXmModule _root;
        private FasttrackerXmModule _parent;

        /**
         * Song length (in pattern order table)
         */
        public int songLength() { return songLength; }
        public void setSongLength(int _v) { _dirty = true; songLength = _v; }
        public int restartPosition() { return restartPosition; }
        public void setRestartPosition(int _v) { _dirty = true; restartPosition = _v; }

        /**
         * (2,4,6,8,10,...,32)
         */
        public int numChannels() { return numChannels; }
        public void setNumChannels(int _v) { _dirty = true; numChannels = _v; }

        /**
         * (max 256)
         */
        public int numPatterns() { return numPatterns; }
        public void setNumPatterns(int _v) { _dirty = true; numPatterns = _v; }

        /**
         * (max 128)
         */
        public int numInstruments() { return numInstruments; }
        public void setNumInstruments(int _v) { _dirty = true; numInstruments = _v; }
        public Flags flags() { return flags; }
        public void setFlags(Flags _v) { _dirty = true; flags = _v; }
        public int defaultTempo() { return defaultTempo; }
        public void setDefaultTempo(int _v) { _dirty = true; defaultTempo = _v; }
        public int defaultBpm() { return defaultBpm; }
        public void setDefaultBpm(int _v) { _dirty = true; defaultBpm = _v; }

        /**
         * max 256
         */
        public List<Integer> patternOrderTable() { return patternOrderTable; }
        public void setPatternOrderTable(List<Integer> _v) { _dirty = true; patternOrderTable = _v; }
        public FasttrackerXmModule _root() { return _root; }
        public void set_root(FasttrackerXmModule _v) { _dirty = true; _root = _v; }
        public FasttrackerXmModule _parent() { return _parent; }
        public void set_parent(FasttrackerXmModule _v) { _dirty = true; _parent = _v; }
    }

    /**
     * XM's notion of "instrument" typically constitutes of a
     * instrument metadata and one or several samples. Metadata
     * includes:
     * 
     * * instrument's name
     * * instruction of which sample to use for which note
     * * volume and panning envelopes and looping instructions
     * * vibrato settings
     */
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

        public Instrument(KaitaiStream _io, FasttrackerXmModule _parent) {
            this(_io, _parent, null);
        }

        public Instrument(KaitaiStream _io, FasttrackerXmModule _parent, FasttrackerXmModule _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.headerSize = this._io.readU4le();
            this._raw_header = this._io.readBytes(headerSize() - 4);
            KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
            this.header = new Header(_io__raw_header, this, _root);
            this.header._read();
            this.samplesHeaders = new ArrayList<SampleHeader>();
            for (int i = 0; i < header().numSamples(); i++) {
                SampleHeader _t_samplesHeaders = new SampleHeader(this._io, this, _root);
                try {
                    _t_samplesHeaders._read();
                } finally {
                    this.samplesHeaders.add(_t_samplesHeaders);
                }
            }
            this.samples = new ArrayList<SamplesData>();
            for (int i = 0; i < header().numSamples(); i++) {
                SamplesData _t_samples = new SamplesData(this._io, this, _root, samplesHeaders().get(((Number) (i)).intValue()));
                try {
                    _t_samples._read();
                } finally {
                    this.samples.add(_t_samples);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            for (int i = 0; i < this.samplesHeaders.size(); i++) {
                this.samplesHeaders.get(((Number) (i)).intValue())._fetchInstances();
            }
            for (int i = 0; i < this.samples.size(); i++) {
                this.samples.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.headerSize);
            final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(headerSize() - 4);
            this._io.addChildStream(_io__raw_header);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (headerSize() - 4));
                final Instrument _this = this;
                _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_header = _io__raw_header.toByteArray();
                        if (_this._raw_header.length != headerSize() - 4)
                            throw new ConsistencyError("raw(header)", headerSize() - 4, _this._raw_header.length);
                        parent.writeBytes(_this._raw_header);
                    }
                });
            }
            this.header._write_Seq(_io__raw_header);
            for (int i = 0; i < this.samplesHeaders.size(); i++) {
                this.samplesHeaders.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            for (int i = 0; i < this.samples.size(); i++) {
                this.samples.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
            if (this.samplesHeaders.size() != header().numSamples())
                throw new ConsistencyError("samples_headers", header().numSamples(), this.samplesHeaders.size());
            for (int i = 0; i < this.samplesHeaders.size(); i++) {
                if (!Objects.equals(this.samplesHeaders.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("samples_headers", _root(), this.samplesHeaders.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.samplesHeaders.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("samples_headers", this, this.samplesHeaders.get(((Number) (i)).intValue())._parent());
            }
            if (this.samples.size() != header().numSamples())
                throw new ConsistencyError("samples", header().numSamples(), this.samples.size());
            for (int i = 0; i < this.samples.size(); i++) {
                if (!Objects.equals(this.samples.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("samples", _root(), this.samples.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.samples.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("samples", this, this.samples.get(((Number) (i)).intValue())._parent());
                if (!Objects.equals(this.samples.get(((Number) (i)).intValue()).header(), samplesHeaders().get(((Number) (i)).intValue())))
                    throw new ConsistencyError("samples", samplesHeaders().get(((Number) (i)).intValue()), this.samples.get(((Number) (i)).intValue()).header());
            }
            _dirty = false;
        }
        public static class ExtraHeader extends KaitaiStruct.ReadWrite {
            public static ExtraHeader fromFile(String fileName) throws IOException {
                return new ExtraHeader(new ByteBufferKaitaiStream(fileName));
            }

            public enum Type {
                TRUE(0),
                SUSTAIN(1),
                LOOP(2);

                private final long id;
                Type(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, Type> byId = new HashMap<Long, Type>(3);
                static {
                    for (Type e : Type.values())
                        byId.put(e.id(), e);
                }
                public static Type byId(long id) { return byId.get(id); }
            }
            public ExtraHeader() {
                this(null, null, null);
            }

            public ExtraHeader(KaitaiStream _io) {
                this(_io, null, null);
            }

            public ExtraHeader(KaitaiStream _io, FasttrackerXmModule.Instrument.Header _parent) {
                this(_io, _parent, null);
            }

            public ExtraHeader(KaitaiStream _io, FasttrackerXmModule.Instrument.Header _parent, FasttrackerXmModule _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.lenSampleHeader = this._io.readU4le();
                this.idxSamplePerNote = new ArrayList<Integer>();
                for (int i = 0; i < 96; i++) {
                    this.idxSamplePerNote.add(this._io.readU1());
                }
                this.volumePoints = new ArrayList<EnvelopePoint>();
                for (int i = 0; i < 12; i++) {
                    EnvelopePoint _t_volumePoints = new EnvelopePoint(this._io, this, _root);
                    try {
                        _t_volumePoints._read();
                    } finally {
                        this.volumePoints.add(_t_volumePoints);
                    }
                }
                this.panningPoints = new ArrayList<EnvelopePoint>();
                for (int i = 0; i < 12; i++) {
                    EnvelopePoint _t_panningPoints = new EnvelopePoint(this._io, this, _root);
                    try {
                        _t_panningPoints._read();
                    } finally {
                        this.panningPoints.add(_t_panningPoints);
                    }
                }
                this.numVolumePoints = this._io.readU1();
                this.numPanningPoints = this._io.readU1();
                this.volumeSustainPoint = this._io.readU1();
                this.volumeLoopStartPoint = this._io.readU1();
                this.volumeLoopEndPoint = this._io.readU1();
                this.panningSustainPoint = this._io.readU1();
                this.panningLoopStartPoint = this._io.readU1();
                this.panningLoopEndPoint = this._io.readU1();
                this.volumeType = Type.byId(this._io.readU1());
                this.panningType = Type.byId(this._io.readU1());
                this.vibratoType = this._io.readU1();
                this.vibratoSweep = this._io.readU1();
                this.vibratoDepth = this._io.readU1();
                this.vibratoRate = this._io.readU1();
                this.volumeFadeout = this._io.readU2le();
                this.reserved = this._io.readU2le();
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.idxSamplePerNote.size(); i++) {
                }
                for (int i = 0; i < this.volumePoints.size(); i++) {
                    this.volumePoints.get(((Number) (i)).intValue())._fetchInstances();
                }
                for (int i = 0; i < this.panningPoints.size(); i++) {
                    this.panningPoints.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4le(this.lenSampleHeader);
                for (int i = 0; i < this.idxSamplePerNote.size(); i++) {
                    this._io.writeU1(this.idxSamplePerNote.get(((Number) (i)).intValue()));
                }
                for (int i = 0; i < this.volumePoints.size(); i++) {
                    this.volumePoints.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                for (int i = 0; i < this.panningPoints.size(); i++) {
                    this.panningPoints.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                this._io.writeU1(this.numVolumePoints);
                this._io.writeU1(this.numPanningPoints);
                this._io.writeU1(this.volumeSustainPoint);
                this._io.writeU1(this.volumeLoopStartPoint);
                this._io.writeU1(this.volumeLoopEndPoint);
                this._io.writeU1(this.panningSustainPoint);
                this._io.writeU1(this.panningLoopStartPoint);
                this._io.writeU1(this.panningLoopEndPoint);
                this._io.writeU1(((Number) (this.volumeType.id())).intValue());
                this._io.writeU1(((Number) (this.panningType.id())).intValue());
                this._io.writeU1(this.vibratoType);
                this._io.writeU1(this.vibratoSweep);
                this._io.writeU1(this.vibratoDepth);
                this._io.writeU1(this.vibratoRate);
                this._io.writeU2le(this.volumeFadeout);
                this._io.writeU2le(this.reserved);
            }

            public void _check() {
                if (this.idxSamplePerNote.size() != 96)
                    throw new ConsistencyError("idx_sample_per_note", 96, this.idxSamplePerNote.size());
                for (int i = 0; i < this.idxSamplePerNote.size(); i++) {
                }
                if (this.volumePoints.size() != 12)
                    throw new ConsistencyError("volume_points", 12, this.volumePoints.size());
                for (int i = 0; i < this.volumePoints.size(); i++) {
                    if (!Objects.equals(this.volumePoints.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("volume_points", _root(), this.volumePoints.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.volumePoints.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("volume_points", this, this.volumePoints.get(((Number) (i)).intValue())._parent());
                }
                if (this.panningPoints.size() != 12)
                    throw new ConsistencyError("panning_points", 12, this.panningPoints.size());
                for (int i = 0; i < this.panningPoints.size(); i++) {
                    if (!Objects.equals(this.panningPoints.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("panning_points", _root(), this.panningPoints.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.panningPoints.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("panning_points", this, this.panningPoints.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }

            /**
             * Envelope frame-counters work in range 0..FFFFh (0..65535 dec).
             * BUT! FT2 only itself supports only range 0..FFh (0..255 dec).
             * Some other trackers (like SoundTracker for Unix), however, can use the full range 0..FFFF, so it should be supported.
             * !!TIP: This is also a good way to detect if the module has been made with FT2 or not. (In case the tracker name is brain- deadly left unchanged!)
             * Of course it does not help if all instruments have the values inside FT2 supported range.
             * The value-field of the envelope point is ranged between 00..3Fh (0..64 dec).
             */
            public static class EnvelopePoint extends KaitaiStruct.ReadWrite {
                public static EnvelopePoint fromFile(String fileName) throws IOException {
                    return new EnvelopePoint(new ByteBufferKaitaiStream(fileName));
                }
                public EnvelopePoint() {
                    this(null, null, null);
                }

                public EnvelopePoint(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public EnvelopePoint(KaitaiStream _io, FasttrackerXmModule.Instrument.ExtraHeader _parent) {
                    this(_io, _parent, null);
                }

                public EnvelopePoint(KaitaiStream _io, FasttrackerXmModule.Instrument.ExtraHeader _parent, FasttrackerXmModule _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.x = this._io.readU2le();
                    this.y = this._io.readU2le();
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU2le(this.x);
                    this._io.writeU2le(this.y);
                }

                public void _check() {
                    _dirty = false;
                }
                private int x;
                private int y;
                private FasttrackerXmModule _root;
                private FasttrackerXmModule.Instrument.ExtraHeader _parent;

                /**
                 * Frame number of the point
                 */
                public int x() { return x; }
                public void setX(int _v) { _dirty = true; x = _v; }

                /**
                 * Value of the point
                 */
                public int y() { return y; }
                public void setY(int _v) { _dirty = true; y = _v; }
                public FasttrackerXmModule _root() { return _root; }
                public void set_root(FasttrackerXmModule _v) { _dirty = true; _root = _v; }
                public FasttrackerXmModule.Instrument.ExtraHeader _parent() { return _parent; }
                public void set_parent(FasttrackerXmModule.Instrument.ExtraHeader _v) { _dirty = true; _parent = _v; }
            }
            private long lenSampleHeader;
            private List<Integer> idxSamplePerNote;
            private List<EnvelopePoint> volumePoints;
            private List<EnvelopePoint> panningPoints;
            private int numVolumePoints;
            private int numPanningPoints;
            private int volumeSustainPoint;
            private int volumeLoopStartPoint;
            private int volumeLoopEndPoint;
            private int panningSustainPoint;
            private int panningLoopStartPoint;
            private int panningLoopEndPoint;
            private Type volumeType;
            private Type panningType;
            private int vibratoType;
            private int vibratoSweep;
            private int vibratoDepth;
            private int vibratoRate;
            private int volumeFadeout;
            private int reserved;
            private FasttrackerXmModule _root;
            private FasttrackerXmModule.Instrument.Header _parent;
            public long lenSampleHeader() { return lenSampleHeader; }
            public void setLenSampleHeader(long _v) { _dirty = true; lenSampleHeader = _v; }

            /**
             * Index of sample that should be used for any particular
             * note. In the simplest case, where it's only one sample
             * is available, it's an array of full of zeroes.
             */
            public List<Integer> idxSamplePerNote() { return idxSamplePerNote; }
            public void setIdxSamplePerNote(List<Integer> _v) { _dirty = true; idxSamplePerNote = _v; }

            /**
             * Points for volume envelope. Only `num_volume_points` will be actually used.
             */
            public List<EnvelopePoint> volumePoints() { return volumePoints; }
            public void setVolumePoints(List<EnvelopePoint> _v) { _dirty = true; volumePoints = _v; }

            /**
             * Points for panning envelope. Only `num_panning_points` will be actually used.
             */
            public List<EnvelopePoint> panningPoints() { return panningPoints; }
            public void setPanningPoints(List<EnvelopePoint> _v) { _dirty = true; panningPoints = _v; }
            public int numVolumePoints() { return numVolumePoints; }
            public void setNumVolumePoints(int _v) { _dirty = true; numVolumePoints = _v; }
            public int numPanningPoints() { return numPanningPoints; }
            public void setNumPanningPoints(int _v) { _dirty = true; numPanningPoints = _v; }
            public int volumeSustainPoint() { return volumeSustainPoint; }
            public void setVolumeSustainPoint(int _v) { _dirty = true; volumeSustainPoint = _v; }
            public int volumeLoopStartPoint() { return volumeLoopStartPoint; }
            public void setVolumeLoopStartPoint(int _v) { _dirty = true; volumeLoopStartPoint = _v; }
            public int volumeLoopEndPoint() { return volumeLoopEndPoint; }
            public void setVolumeLoopEndPoint(int _v) { _dirty = true; volumeLoopEndPoint = _v; }
            public int panningSustainPoint() { return panningSustainPoint; }
            public void setPanningSustainPoint(int _v) { _dirty = true; panningSustainPoint = _v; }
            public int panningLoopStartPoint() { return panningLoopStartPoint; }
            public void setPanningLoopStartPoint(int _v) { _dirty = true; panningLoopStartPoint = _v; }
            public int panningLoopEndPoint() { return panningLoopEndPoint; }
            public void setPanningLoopEndPoint(int _v) { _dirty = true; panningLoopEndPoint = _v; }
            public Type volumeType() { return volumeType; }
            public void setVolumeType(Type _v) { _dirty = true; volumeType = _v; }
            public Type panningType() { return panningType; }
            public void setPanningType(Type _v) { _dirty = true; panningType = _v; }
            public int vibratoType() { return vibratoType; }
            public void setVibratoType(int _v) { _dirty = true; vibratoType = _v; }
            public int vibratoSweep() { return vibratoSweep; }
            public void setVibratoSweep(int _v) { _dirty = true; vibratoSweep = _v; }
            public int vibratoDepth() { return vibratoDepth; }
            public void setVibratoDepth(int _v) { _dirty = true; vibratoDepth = _v; }
            public int vibratoRate() { return vibratoRate; }
            public void setVibratoRate(int _v) { _dirty = true; vibratoRate = _v; }
            public int volumeFadeout() { return volumeFadeout; }
            public void setVolumeFadeout(int _v) { _dirty = true; volumeFadeout = _v; }
            public int reserved() { return reserved; }
            public void setReserved(int _v) { _dirty = true; reserved = _v; }
            public FasttrackerXmModule _root() { return _root; }
            public void set_root(FasttrackerXmModule _v) { _dirty = true; _root = _v; }
            public FasttrackerXmModule.Instrument.Header _parent() { return _parent; }
            public void set_parent(FasttrackerXmModule.Instrument.Header _v) { _dirty = true; _parent = _v; }
        }
        public static class Header extends KaitaiStruct.ReadWrite {
            public static Header fromFile(String fileName) throws IOException {
                return new Header(new ByteBufferKaitaiStream(fileName));
            }
            public Header() {
                this(null, null, null);
            }

            public Header(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Header(KaitaiStream _io, FasttrackerXmModule.Instrument _parent) {
                this(_io, _parent, null);
            }

            public Header(KaitaiStream _io, FasttrackerXmModule.Instrument _parent, FasttrackerXmModule _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(22), (byte) 0, false), StandardCharsets.UTF_8);
                this.type = this._io.readU1();
                this.numSamples = this._io.readU2le();
                if (numSamples() > 0) {
                    this.extraHeader = new ExtraHeader(this._io, this, _root);
                    this.extraHeader._read();
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                if (numSamples() > 0) {
                    this.extraHeader._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBytesLimit((this.name).getBytes(Charset.forName("UTF-8")), 22, (byte) 0, (byte) 0);
                this._io.writeU1(this.type);
                this._io.writeU2le(this.numSamples);
                if (numSamples() > 0) {
                    this.extraHeader._write_Seq(this._io);
                }
            }

            public void _check() {
                if ((this.name).getBytes(Charset.forName("UTF-8")).length > 22)
                    throw new ConsistencyError("name", 22, (this.name).getBytes(Charset.forName("UTF-8")).length);
                if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                    throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                if (numSamples() > 0) {
                    if (!Objects.equals(this.extraHeader._root(), _root()))
                        throw new ConsistencyError("extra_header", _root(), this.extraHeader._root());
                    if (!Objects.equals(this.extraHeader._parent(), this))
                        throw new ConsistencyError("extra_header", this, this.extraHeader._parent());
                }
                _dirty = false;
            }
            private String name;
            private int type;
            private int numSamples;
            private ExtraHeader extraHeader;
            private FasttrackerXmModule _root;
            private FasttrackerXmModule.Instrument _parent;
            public String name() { return name; }
            public void setName(String _v) { _dirty = true; name = _v; }

            /**
             * Usually zero, but this seems pretty random, don't assume it's zero
             */
            public int type() { return type; }
            public void setType(int _v) { _dirty = true; type = _v; }
            public int numSamples() { return numSamples; }
            public void setNumSamples(int _v) { _dirty = true; numSamples = _v; }
            public ExtraHeader extraHeader() { return extraHeader; }
            public void setExtraHeader(ExtraHeader _v) { _dirty = true; extraHeader = _v; }
            public FasttrackerXmModule _root() { return _root; }
            public void set_root(FasttrackerXmModule _v) { _dirty = true; _root = _v; }
            public FasttrackerXmModule.Instrument _parent() { return _parent; }
            public void set_parent(FasttrackerXmModule.Instrument _v) { _dirty = true; _parent = _v; }
        }
        public static class SampleHeader extends KaitaiStruct.ReadWrite {
            public static SampleHeader fromFile(String fileName) throws IOException {
                return new SampleHeader(new ByteBufferKaitaiStream(fileName));
            }
            public SampleHeader() {
                this(null, null, null);
            }

            public SampleHeader(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SampleHeader(KaitaiStream _io, FasttrackerXmModule.Instrument _parent) {
                this(_io, _parent, null);
            }

            public SampleHeader(KaitaiStream _io, FasttrackerXmModule.Instrument _parent, FasttrackerXmModule _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.sampleLength = this._io.readU4le();
                this.sampleLoopStart = this._io.readU4le();
                this.sampleLoopLength = this._io.readU4le();
                this.volume = this._io.readU1();
                this.fineTune = this._io.readS1();
                this.type = new LoopType(this._io, this, _root);
                this.type._read();
                this.panning = this._io.readU1();
                this.relativeNoteNumber = this._io.readS1();
                this.reserved = this._io.readU1();
                this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(22), (byte) 0, false), StandardCharsets.UTF_8);
                _dirty = false;
            }

            public void _fetchInstances() {
                this.type._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4le(this.sampleLength);
                this._io.writeU4le(this.sampleLoopStart);
                this._io.writeU4le(this.sampleLoopLength);
                this._io.writeU1(this.volume);
                this._io.writeS1(this.fineTune);
                this.type._write_Seq(this._io);
                this._io.writeU1(this.panning);
                this._io.writeS1(this.relativeNoteNumber);
                this._io.writeU1(this.reserved);
                this._io.writeBytesLimit((this.name).getBytes(Charset.forName("UTF-8")), 22, (byte) 0, (byte) 0);
            }

            public void _check() {
                if (!Objects.equals(this.type._root(), _root()))
                    throw new ConsistencyError("type", _root(), this.type._root());
                if (!Objects.equals(this.type._parent(), this))
                    throw new ConsistencyError("type", this, this.type._parent());
                if ((this.name).getBytes(Charset.forName("UTF-8")).length > 22)
                    throw new ConsistencyError("name", 22, (this.name).getBytes(Charset.forName("UTF-8")).length);
                if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                    throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                _dirty = false;
            }
            public static class LoopType extends KaitaiStruct.ReadWrite {
                public static LoopType fromFile(String fileName) throws IOException {
                    return new LoopType(new ByteBufferKaitaiStream(fileName));
                }

                public enum LoopType {
                    NONE(0),
                    FORWARD(1),
                    PING_PONG(2);

                    private final long id;
                    LoopType(long id) { this.id = id; }
                    public long id() { return id; }
                    private static final Map<Long, LoopType> byId = new HashMap<Long, LoopType>(3);
                    static {
                        for (LoopType e : LoopType.values())
                            byId.put(e.id(), e);
                    }
                    public static LoopType byId(long id) { return byId.get(id); }
                }
                public LoopType() {
                    this(null, null, null);
                }

                public LoopType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public LoopType(KaitaiStream _io, FasttrackerXmModule.Instrument.SampleHeader _parent) {
                    this(_io, _parent, null);
                }

                public LoopType(KaitaiStream _io, FasttrackerXmModule.Instrument.SampleHeader _parent, FasttrackerXmModule _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved0 = this._io.readBitsIntBe(3);
                    this.isSampleData16Bit = this._io.readBitsIntBe(1) != 0;
                    this.reserved1 = this._io.readBitsIntBe(2);
                    this.loopType = LoopType.byId(this._io.readBitsIntBe(2));
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBitsIntBe(3, this.reserved0);
                    this._io.writeBitsIntBe(1, (this.isSampleData16Bit ? 1 : 0));
                    this._io.writeBitsIntBe(2, this.reserved1);
                    this._io.writeBitsIntBe(2, ((Number) (this.loopType.id())).longValue());
                }

                public void _check() {
                    _dirty = false;
                }
                private long reserved0;
                private boolean isSampleData16Bit;
                private long reserved1;
                private LoopType loopType;
                private FasttrackerXmModule _root;
                private FasttrackerXmModule.Instrument.SampleHeader _parent;
                public long reserved0() { return reserved0; }
                public void setReserved0(long _v) { _dirty = true; reserved0 = _v; }
                public boolean isSampleData16Bit() { return isSampleData16Bit; }
                public void setIsSampleData16Bit(boolean _v) { _dirty = true; isSampleData16Bit = _v; }
                public long reserved1() { return reserved1; }
                public void setReserved1(long _v) { _dirty = true; reserved1 = _v; }
                public LoopType loopType() { return loopType; }
                public void setLoopType(LoopType _v) { _dirty = true; loopType = _v; }
                public FasttrackerXmModule _root() { return _root; }
                public void set_root(FasttrackerXmModule _v) { _dirty = true; _root = _v; }
                public FasttrackerXmModule.Instrument.SampleHeader _parent() { return _parent; }
                public void set_parent(FasttrackerXmModule.Instrument.SampleHeader _v) { _dirty = true; _parent = _v; }
            }
            private long sampleLength;
            private long sampleLoopStart;
            private long sampleLoopLength;
            private int volume;
            private byte fineTune;
            private LoopType type;
            private int panning;
            private byte relativeNoteNumber;
            private int reserved;
            private String name;
            private FasttrackerXmModule _root;
            private FasttrackerXmModule.Instrument _parent;
            public long sampleLength() { return sampleLength; }
            public void setSampleLength(long _v) { _dirty = true; sampleLength = _v; }
            public long sampleLoopStart() { return sampleLoopStart; }
            public void setSampleLoopStart(long _v) { _dirty = true; sampleLoopStart = _v; }
            public long sampleLoopLength() { return sampleLoopLength; }
            public void setSampleLoopLength(long _v) { _dirty = true; sampleLoopLength = _v; }
            public int volume() { return volume; }
            public void setVolume(int _v) { _dirty = true; volume = _v; }

            /**
             * -16..+15
             */
            public byte fineTune() { return fineTune; }
            public void setFineTune(byte _v) { _dirty = true; fineTune = _v; }
            public LoopType type() { return type; }
            public void setType(LoopType _v) { _dirty = true; type = _v; }

            /**
             * (0-255)
             */
            public int panning() { return panning; }
            public void setPanning(int _v) { _dirty = true; panning = _v; }
            public byte relativeNoteNumber() { return relativeNoteNumber; }
            public void setRelativeNoteNumber(byte _v) { _dirty = true; relativeNoteNumber = _v; }
            public int reserved() { return reserved; }
            public void setReserved(int _v) { _dirty = true; reserved = _v; }
            public String name() { return name; }
            public void setName(String _v) { _dirty = true; name = _v; }
            public FasttrackerXmModule _root() { return _root; }
            public void set_root(FasttrackerXmModule _v) { _dirty = true; _root = _v; }
            public FasttrackerXmModule.Instrument _parent() { return _parent; }
            public void set_parent(FasttrackerXmModule.Instrument _v) { _dirty = true; _parent = _v; }
        }

        /**
         * The saved data uses simple delta-encoding to achieve better compression ratios (when compressed with pkzip, etc.)
         * Pseudocode for converting the delta-coded data to normal data,
         * old = 0;
         * for i in range(data_len):
         *   new = sample[i] + old;
         *   sample[i] = new;
         *   old = new;
         */
        public static class SamplesData extends KaitaiStruct.ReadWrite {
            public SamplesData(SampleHeader header) {
                this(null, null, null, header);
            }

            public SamplesData(KaitaiStream _io, SampleHeader header) {
                this(_io, null, null, header);
            }

            public SamplesData(KaitaiStream _io, FasttrackerXmModule.Instrument _parent, SampleHeader header) {
                this(_io, _parent, null, header);
            }

            public SamplesData(KaitaiStream _io, FasttrackerXmModule.Instrument _parent, FasttrackerXmModule _root, SampleHeader header) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this.header = header;
            }
            public void _read() {
                this.data = this._io.readBytes(header().sampleLength() * (header().type().isSampleData16Bit() ? 2 : 1));
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBytes(this.data);
            }

            public void _check() {
                if (this.data.length != header().sampleLength() * (header().type().isSampleData16Bit() ? 2 : 1))
                    throw new ConsistencyError("data", header().sampleLength() * (header().type().isSampleData16Bit() ? 2 : 1), this.data.length);
                _dirty = false;
            }
            private byte[] data;
            private SampleHeader header;
            private FasttrackerXmModule _root;
            private FasttrackerXmModule.Instrument _parent;
            public byte[] data() { return data; }
            public void setData(byte[] _v) { _dirty = true; data = _v; }
            public SampleHeader header() { return header; }
            public void setHeader(SampleHeader _v) { _dirty = true; header = _v; }
            public FasttrackerXmModule _root() { return _root; }
            public void set_root(FasttrackerXmModule _v) { _dirty = true; _root = _v; }
            public FasttrackerXmModule.Instrument _parent() { return _parent; }
            public void set_parent(FasttrackerXmModule.Instrument _v) { _dirty = true; _parent = _v; }
        }
        private long headerSize;
        private Header header;
        private List<SampleHeader> samplesHeaders;
        private List<SamplesData> samples;
        private FasttrackerXmModule _root;
        private FasttrackerXmModule _parent;
        private byte[] _raw_header;

        /**
         * Instrument size << header that is >>
         * << "Instrument Size" field tends to be more than the actual size of the structure documented here (it includes also the extended instrument sample header above). So remember to check it and skip the additional bytes before the first sample header >>
         */
        public long headerSize() { return headerSize; }
        public void setHeaderSize(long _v) { _dirty = true; headerSize = _v; }
        public Header header() { return header; }
        public void setHeader(Header _v) { _dirty = true; header = _v; }
        public List<SampleHeader> samplesHeaders() { return samplesHeaders; }
        public void setSamplesHeaders(List<SampleHeader> _v) { _dirty = true; samplesHeaders = _v; }
        public List<SamplesData> samples() { return samples; }
        public void setSamples(List<SamplesData> _v) { _dirty = true; samples = _v; }
        public FasttrackerXmModule _root() { return _root; }
        public void set_root(FasttrackerXmModule _v) { _dirty = true; _root = _v; }
        public FasttrackerXmModule _parent() { return _parent; }
        public void set_parent(FasttrackerXmModule _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_header() { return _raw_header; }
        public void set_raw_Header(byte[] _v) { _dirty = true; _raw_header = _v; }
    }
    public static class Pattern extends KaitaiStruct.ReadWrite {
        public static Pattern fromFile(String fileName) throws IOException {
            return new Pattern(new ByteBufferKaitaiStream(fileName));
        }
        public Pattern() {
            this(null, null, null);
        }

        public Pattern(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Pattern(KaitaiStream _io, FasttrackerXmModule _parent) {
            this(_io, _parent, null);
        }

        public Pattern(KaitaiStream _io, FasttrackerXmModule _parent, FasttrackerXmModule _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.header = new Header(this._io, this, _root);
            this.header._read();
            this.packedData = this._io.readBytes(header().main().lenPackedPattern());
            _dirty = false;
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.header._write_Seq(this._io);
            this._io.writeBytes(this.packedData);
        }

        public void _check() {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
            if (this.packedData.length != header().main().lenPackedPattern())
                throw new ConsistencyError("packed_data", header().main().lenPackedPattern(), this.packedData.length);
            _dirty = false;
        }
        public static class Header extends KaitaiStruct.ReadWrite {
            public static Header fromFile(String fileName) throws IOException {
                return new Header(new ByteBufferKaitaiStream(fileName));
            }
            public Header() {
                this(null, null, null);
            }

            public Header(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Header(KaitaiStream _io, FasttrackerXmModule.Pattern _parent) {
                this(_io, _parent, null);
            }

            public Header(KaitaiStream _io, FasttrackerXmModule.Pattern _parent, FasttrackerXmModule _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.headerLength = this._io.readU4le();
                this._raw_main = this._io.readBytes(headerLength() - 4);
                KaitaiStream _io__raw_main = new ByteBufferKaitaiStream(this._raw_main);
                this.main = new HeaderMain(_io__raw_main, this, _root);
                this.main._read();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.main._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4le(this.headerLength);
                final KaitaiStream _io__raw_main = new ByteBufferKaitaiStream(headerLength() - 4);
                this._io.addChildStream(_io__raw_main);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (headerLength() - 4));
                    final Header _this = this;
                    _io__raw_main.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_main = _io__raw_main.toByteArray();
                            if (_this._raw_main.length != headerLength() - 4)
                                throw new ConsistencyError("raw(main)", headerLength() - 4, _this._raw_main.length);
                            parent.writeBytes(_this._raw_main);
                        }
                    });
                }
                this.main._write_Seq(_io__raw_main);
            }

            public void _check() {
                if (!Objects.equals(this.main._root(), _root()))
                    throw new ConsistencyError("main", _root(), this.main._root());
                if (!Objects.equals(this.main._parent(), this))
                    throw new ConsistencyError("main", this, this.main._parent());
                _dirty = false;
            }
            public static class HeaderMain extends KaitaiStruct.ReadWrite {
                public static HeaderMain fromFile(String fileName) throws IOException {
                    return new HeaderMain(new ByteBufferKaitaiStream(fileName));
                }
                public HeaderMain() {
                    this(null, null, null);
                }

                public HeaderMain(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public HeaderMain(KaitaiStream _io, FasttrackerXmModule.Pattern.Header _parent) {
                    this(_io, _parent, null);
                }

                public HeaderMain(KaitaiStream _io, FasttrackerXmModule.Pattern.Header _parent, FasttrackerXmModule _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.packingType = this._io.readU1();
                    switch (_root().preheader().versionNumber().value()) {
                    case 258: {
                        this.numRowsRaw = ((Number) (this._io.readU1())).intValue();
                        break;
                    }
                    default: {
                        this.numRowsRaw = this._io.readU2le();
                        break;
                    }
                    }
                    this.lenPackedPattern = this._io.readU2le();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    switch (_root().preheader().versionNumber().value()) {
                    case 258: {
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU1(this.packingType);
                    switch (_root().preheader().versionNumber().value()) {
                    case 258: {
                        this._io.writeU1(((Number) (this.numRowsRaw)).intValue());
                        break;
                    }
                    default: {
                        this._io.writeU2le(this.numRowsRaw);
                        break;
                    }
                    }
                    this._io.writeU2le(this.lenPackedPattern);
                }

                public void _check() {
                    switch (_root().preheader().versionNumber().value()) {
                    case 258: {
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                    _dirty = false;
                }
                private Integer numRows;
                public Integer numRows() {
                    if (this.numRows != null)
                        return this.numRows;
                    this.numRows = ((Number) (numRowsRaw() + (_root().preheader().versionNumber().value() == 258 ? 1 : 0))).intValue();
                    return this.numRows;
                }
                public void _invalidateNumRows() { this.numRows = null; }
                private int packingType;
                private int numRowsRaw;
                private int lenPackedPattern;
                private FasttrackerXmModule _root;
                private FasttrackerXmModule.Pattern.Header _parent;

                /**
                 * Packing type (always 0)
                 */
                public int packingType() { return packingType; }
                public void setPackingType(int _v) { _dirty = true; packingType = _v; }

                /**
                 * Number of rows in pattern (1..256)
                 */
                public int numRowsRaw() { return numRowsRaw; }
                public void setNumRowsRaw(int _v) { _dirty = true; numRowsRaw = _v; }

                /**
                 * Packed pattern data size
                 */
                public int lenPackedPattern() { return lenPackedPattern; }
                public void setLenPackedPattern(int _v) { _dirty = true; lenPackedPattern = _v; }
                public FasttrackerXmModule _root() { return _root; }
                public void set_root(FasttrackerXmModule _v) { _dirty = true; _root = _v; }
                public FasttrackerXmModule.Pattern.Header _parent() { return _parent; }
                public void set_parent(FasttrackerXmModule.Pattern.Header _v) { _dirty = true; _parent = _v; }
            }
            private long headerLength;
            private HeaderMain main;
            private FasttrackerXmModule _root;
            private FasttrackerXmModule.Pattern _parent;
            private byte[] _raw_main;

            /**
             * Pattern header length
             */
            public long headerLength() { return headerLength; }
            public void setHeaderLength(long _v) { _dirty = true; headerLength = _v; }
            public HeaderMain main() { return main; }
            public void setMain(HeaderMain _v) { _dirty = true; main = _v; }
            public FasttrackerXmModule _root() { return _root; }
            public void set_root(FasttrackerXmModule _v) { _dirty = true; _root = _v; }
            public FasttrackerXmModule.Pattern _parent() { return _parent; }
            public void set_parent(FasttrackerXmModule.Pattern _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_main() { return _raw_main; }
            public void set_raw_Main(byte[] _v) { _dirty = true; _raw_main = _v; }
        }
        private Header header;
        private byte[] packedData;
        private FasttrackerXmModule _root;
        private FasttrackerXmModule _parent;
        public Header header() { return header; }
        public void setHeader(Header _v) { _dirty = true; header = _v; }
        public byte[] packedData() { return packedData; }
        public void setPackedData(byte[] _v) { _dirty = true; packedData = _v; }
        public FasttrackerXmModule _root() { return _root; }
        public void set_root(FasttrackerXmModule _v) { _dirty = true; _root = _v; }
        public FasttrackerXmModule _parent() { return _parent; }
        public void set_parent(FasttrackerXmModule _v) { _dirty = true; _parent = _v; }
    }
    public static class Preheader extends KaitaiStruct.ReadWrite {
        public static Preheader fromFile(String fileName) throws IOException {
            return new Preheader(new ByteBufferKaitaiStream(fileName));
        }
        public Preheader() {
            this(null, null, null);
        }

        public Preheader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Preheader(KaitaiStream _io, FasttrackerXmModule _parent) {
            this(_io, _parent, null);
        }

        public Preheader(KaitaiStream _io, FasttrackerXmModule _parent, FasttrackerXmModule _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.signature0 = this._io.readBytes(17);
            if (!(Arrays.equals(this.signature0, new byte[] { 69, 120, 116, 101, 110, 100, 101, 100, 32, 77, 111, 100, 117, 108, 101, 58, 32 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 69, 120, 116, 101, 110, 100, 101, 100, 32, 77, 111, 100, 117, 108, 101, 58, 32 }, this.signature0, this._io, "/types/preheader/seq/0");
            }
            this.moduleName = new String(KaitaiStream.bytesTerminate(this._io.readBytes(20), (byte) 0, false), StandardCharsets.UTF_8);
            this.signature1 = this._io.readBytes(1);
            if (!(Arrays.equals(this.signature1, new byte[] { 26 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 26 }, this.signature1, this._io, "/types/preheader/seq/2");
            }
            this.trackerName = new String(KaitaiStream.bytesTerminate(this._io.readBytes(20), (byte) 0, false), StandardCharsets.UTF_8);
            this.versionNumber = new Version(this._io, this, _root);
            this.versionNumber._read();
            this.headerSize = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.versionNumber._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.signature0);
            this._io.writeBytesLimit((this.moduleName).getBytes(Charset.forName("UTF-8")), 20, (byte) 0, (byte) 0);
            this._io.writeBytes(this.signature1);
            this._io.writeBytesLimit((this.trackerName).getBytes(Charset.forName("UTF-8")), 20, (byte) 0, (byte) 0);
            this.versionNumber._write_Seq(this._io);
            this._io.writeU4le(this.headerSize);
        }

        public void _check() {
            if (this.signature0.length != 17)
                throw new ConsistencyError("signature0", 17, this.signature0.length);
            if (!(Arrays.equals(this.signature0, new byte[] { 69, 120, 116, 101, 110, 100, 101, 100, 32, 77, 111, 100, 117, 108, 101, 58, 32 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 69, 120, 116, 101, 110, 100, 101, 100, 32, 77, 111, 100, 117, 108, 101, 58, 32 }, this.signature0, null, "/types/preheader/seq/0");
            }
            if ((this.moduleName).getBytes(Charset.forName("UTF-8")).length > 20)
                throw new ConsistencyError("module_name", 20, (this.moduleName).getBytes(Charset.forName("UTF-8")).length);
            if (KaitaiStream.byteArrayIndexOf((this.moduleName).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                throw new ConsistencyError("module_name", -1, KaitaiStream.byteArrayIndexOf((this.moduleName).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            if (this.signature1.length != 1)
                throw new ConsistencyError("signature1", 1, this.signature1.length);
            if (!(Arrays.equals(this.signature1, new byte[] { 26 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 26 }, this.signature1, null, "/types/preheader/seq/2");
            }
            if ((this.trackerName).getBytes(Charset.forName("UTF-8")).length > 20)
                throw new ConsistencyError("tracker_name", 20, (this.trackerName).getBytes(Charset.forName("UTF-8")).length);
            if (KaitaiStream.byteArrayIndexOf((this.trackerName).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                throw new ConsistencyError("tracker_name", -1, KaitaiStream.byteArrayIndexOf((this.trackerName).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            if (!Objects.equals(this.versionNumber._root(), _root()))
                throw new ConsistencyError("version_number", _root(), this.versionNumber._root());
            if (!Objects.equals(this.versionNumber._parent(), this))
                throw new ConsistencyError("version_number", this, this.versionNumber._parent());
            _dirty = false;
        }
        public static class Version extends KaitaiStruct.ReadWrite {
            public static Version fromFile(String fileName) throws IOException {
                return new Version(new ByteBufferKaitaiStream(fileName));
            }
            public Version() {
                this(null, null, null);
            }

            public Version(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Version(KaitaiStream _io, FasttrackerXmModule.Preheader _parent) {
                this(_io, _parent, null);
            }

            public Version(KaitaiStream _io, FasttrackerXmModule.Preheader _parent, FasttrackerXmModule _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.minor = this._io.readU1();
                this.major = this._io.readU1();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.minor);
                this._io.writeU1(this.major);
            }

            public void _check() {
                _dirty = false;
            }
            private Integer value;
            public Integer value() {
                if (this.value != null)
                    return this.value;
                this.value = ((Number) (major() << 8 | minor())).intValue();
                return this.value;
            }
            public void _invalidateValue() { this.value = null; }
            private int minor;
            private int major;
            private FasttrackerXmModule _root;
            private FasttrackerXmModule.Preheader _parent;

            /**
             * currently 0x04
             */
            public int minor() { return minor; }
            public void setMinor(int _v) { _dirty = true; minor = _v; }

            /**
             * currently 0x01
             */
            public int major() { return major; }
            public void setMajor(int _v) { _dirty = true; major = _v; }
            public FasttrackerXmModule _root() { return _root; }
            public void set_root(FasttrackerXmModule _v) { _dirty = true; _root = _v; }
            public FasttrackerXmModule.Preheader _parent() { return _parent; }
            public void set_parent(FasttrackerXmModule.Preheader _v) { _dirty = true; _parent = _v; }
        }
        private byte[] signature0;
        private String moduleName;
        private byte[] signature1;
        private String trackerName;
        private Version versionNumber;
        private long headerSize;
        private FasttrackerXmModule _root;
        private FasttrackerXmModule _parent;
        public byte[] signature0() { return signature0; }
        public void setSignature0(byte[] _v) { _dirty = true; signature0 = _v; }

        /**
         * Module name, padded with zeroes
         */
        public String moduleName() { return moduleName; }
        public void setModuleName(String _v) { _dirty = true; moduleName = _v; }
        public byte[] signature1() { return signature1; }
        public void setSignature1(byte[] _v) { _dirty = true; signature1 = _v; }

        /**
         * Tracker name
         */
        public String trackerName() { return trackerName; }
        public void setTrackerName(String _v) { _dirty = true; trackerName = _v; }

        /**
         * Format versions below [0x01, 0x04] have a LOT of differences. Check this field!
         */
        public Version versionNumber() { return versionNumber; }
        public void setVersionNumber(Version _v) { _dirty = true; versionNumber = _v; }

        /**
         * Header size << Calculated FROM THIS OFFSET, not from the beginning of the file! >>
         */
        public long headerSize() { return headerSize; }
        public void setHeaderSize(long _v) { _dirty = true; headerSize = _v; }
        public FasttrackerXmModule _root() { return _root; }
        public void set_root(FasttrackerXmModule _v) { _dirty = true; _root = _v; }
        public FasttrackerXmModule _parent() { return _parent; }
        public void set_parent(FasttrackerXmModule _v) { _dirty = true; _parent = _v; }
    }
    private Preheader preheader;
    private Header header;
    private List<Pattern> patterns;
    private List<Instrument> instruments;
    private FasttrackerXmModule _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_header;
    public Preheader preheader() { return preheader; }
    public void setPreheader(Preheader _v) { _dirty = true; preheader = _v; }
    public Header header() { return header; }
    public void setHeader(Header _v) { _dirty = true; header = _v; }
    public List<Pattern> patterns() { return patterns; }
    public void setPatterns(List<Pattern> _v) { _dirty = true; patterns = _v; }
    public List<Instrument> instruments() { return instruments; }
    public void setInstruments(List<Instrument> _v) { _dirty = true; instruments = _v; }
    public FasttrackerXmModule _root() { return _root; }
    public void set_root(FasttrackerXmModule _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_header() { return _raw_header; }
    public void set_raw_Header(byte[] _v) { _dirty = true; _raw_header = _v; }
}

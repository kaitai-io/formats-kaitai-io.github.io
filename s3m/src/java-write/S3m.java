// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Map;
import java.util.HashMap;
import java.util.List;


/**
 * Scream Tracker 3 module is a tracker music file format that, as all
 * tracker music, bundles both sound samples and instructions on which
 * notes to play. It originates from a Scream Tracker 3 music editor
 * (1994) by Future Crew, derived from original Scream Tracker 2 (.stm)
 * module format.
 * 
 * Instrument descriptions in S3M format allow to use either digital
 * samples or setup and control AdLib (OPL2) synth.
 * 
 * Music is organized in so called `patterns`. "Pattern" is a generally
 * a 64-row long table, which instructs which notes to play on which
 * time measure. "Patterns" are played one-by-one in a sequence
 * determined by `orders`, which is essentially an array of pattern IDs
 * - this way it's possible to reuse certain patterns more than once
 * for repetitive musical phrases.
 * @see <a href="http://hackipedia.org/browse.cgi/File%20formats/Music%20tracker/S3M%2c%20ScreamTracker%203/Scream%20Tracker%203.20%20by%20Future%20Crew.txt">Source</a>
 */
public class S3m extends KaitaiStruct.ReadWrite {
    public static S3m fromFile(String fileName) throws IOException {
        return new S3m(new ByteBufferKaitaiStream(fileName));
    }
    public S3m() {
        this(null, null, null);
    }

    public S3m(KaitaiStream _io) {
        this(_io, null, null);
    }

    public S3m(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public S3m(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, S3m _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.songName = KaitaiStream.bytesTerminate(this._io.readBytes(28), (byte) 0, false);
        this.magic1 = this._io.readBytes(1);
        if (!(Arrays.equals(this.magic1, new byte[] { 26 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 26 }, this.magic1, this._io, "/seq/1");
        }
        this.fileType = this._io.readU1();
        this.reserved1 = this._io.readBytes(2);
        this.numOrders = this._io.readU2le();
        this.numInstruments = this._io.readU2le();
        this.numPatterns = this._io.readU2le();
        this.flags = this._io.readU2le();
        this.version = this._io.readU2le();
        this.samplesFormat = this._io.readU2le();
        this.magic2 = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic2, new byte[] { 83, 67, 82, 77 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, 67, 82, 77 }, this.magic2, this._io, "/seq/10");
        }
        this.globalVolume = this._io.readU1();
        this.initialSpeed = this._io.readU1();
        this.initialTempo = this._io.readU1();
        this.isStereo = this._io.readBitsIntBe(1) != 0;
        this.masterVolume = this._io.readBitsIntBe(7);
        this.ultraClickRemoval = this._io.readU1();
        this.hasCustomPan = this._io.readU1();
        this.reserved2 = this._io.readBytes(8);
        this.ofsSpecial = this._io.readU2le();
        this.channels = new ArrayList<Channel>();
        for (int i = 0; i < 32; i++) {
            Channel _t_channels = new Channel(this._io, this, _root);
            try {
                _t_channels._read();
            } finally {
                this.channels.add(_t_channels);
            }
        }
        this.orders = this._io.readBytes(numOrders());
        this.instruments = new ArrayList<InstrumentPtr>();
        for (int i = 0; i < numInstruments(); i++) {
            InstrumentPtr _t_instruments = new InstrumentPtr(this._io, this, _root);
            try {
                _t_instruments._read();
            } finally {
                this.instruments.add(_t_instruments);
            }
        }
        this.patterns = new ArrayList<PatternPtr>();
        for (int i = 0; i < numPatterns(); i++) {
            PatternPtr _t_patterns = new PatternPtr(this._io, this, _root);
            try {
                _t_patterns._read();
            } finally {
                this.patterns.add(_t_patterns);
            }
        }
        if (hasCustomPan() == 252) {
            this.channelPans = new ArrayList<ChannelPan>();
            for (int i = 0; i < 32; i++) {
                ChannelPan _t_channelPans = new ChannelPan(this._io, this, _root);
                try {
                    _t_channelPans._read();
                } finally {
                    this.channelPans.add(_t_channelPans);
                }
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.channels.size(); i++) {
            this.channels.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.instruments.size(); i++) {
            this.instruments.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.patterns.size(); i++) {
            this.patterns.get(((Number) (i)).intValue())._fetchInstances();
        }
        if (hasCustomPan() == 252) {
            for (int i = 0; i < this.channelPans.size(); i++) {
                this.channelPans.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytesLimit(this.songName, 28, (byte) 0, (byte) 0);
        this._io.writeBytes(this.magic1);
        this._io.writeU1(this.fileType);
        this._io.writeBytes(this.reserved1);
        this._io.writeU2le(this.numOrders);
        this._io.writeU2le(this.numInstruments);
        this._io.writeU2le(this.numPatterns);
        this._io.writeU2le(this.flags);
        this._io.writeU2le(this.version);
        this._io.writeU2le(this.samplesFormat);
        this._io.writeBytes(this.magic2);
        this._io.writeU1(this.globalVolume);
        this._io.writeU1(this.initialSpeed);
        this._io.writeU1(this.initialTempo);
        this._io.writeBitsIntBe(1, (this.isStereo ? 1 : 0));
        this._io.writeBitsIntBe(7, this.masterVolume);
        this._io.writeU1(this.ultraClickRemoval);
        this._io.writeU1(this.hasCustomPan);
        this._io.writeBytes(this.reserved2);
        this._io.writeU2le(this.ofsSpecial);
        for (int i = 0; i < this.channels.size(); i++) {
            this.channels.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.writeBytes(this.orders);
        for (int i = 0; i < this.instruments.size(); i++) {
            this.instruments.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        for (int i = 0; i < this.patterns.size(); i++) {
            this.patterns.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (hasCustomPan() == 252) {
            for (int i = 0; i < this.channelPans.size(); i++) {
                this.channelPans.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }
    }

    public void _check() {
        if (this.songName.length > 28)
            throw new ConsistencyError("song_name", 28, this.songName.length);
        if (KaitaiStream.byteArrayIndexOf(this.songName, ((byte) 0)) != -1)
            throw new ConsistencyError("song_name", -1, KaitaiStream.byteArrayIndexOf(this.songName, ((byte) 0)));
        if (this.magic1.length != 1)
            throw new ConsistencyError("magic1", 1, this.magic1.length);
        if (!(Arrays.equals(this.magic1, new byte[] { 26 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 26 }, this.magic1, null, "/seq/1");
        }
        if (this.reserved1.length != 2)
            throw new ConsistencyError("reserved1", 2, this.reserved1.length);
        if (this.magic2.length != 4)
            throw new ConsistencyError("magic2", 4, this.magic2.length);
        if (!(Arrays.equals(this.magic2, new byte[] { 83, 67, 82, 77 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, 67, 82, 77 }, this.magic2, null, "/seq/10");
        }
        if (this.reserved2.length != 8)
            throw new ConsistencyError("reserved2", 8, this.reserved2.length);
        if (this.channels.size() != 32)
            throw new ConsistencyError("channels", 32, this.channels.size());
        for (int i = 0; i < this.channels.size(); i++) {
            if (!Objects.equals(this.channels.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("channels", _root(), this.channels.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.channels.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("channels", this, this.channels.get(((Number) (i)).intValue())._parent());
        }
        if (this.orders.length != numOrders())
            throw new ConsistencyError("orders", numOrders(), this.orders.length);
        if (this.instruments.size() != numInstruments())
            throw new ConsistencyError("instruments", numInstruments(), this.instruments.size());
        for (int i = 0; i < this.instruments.size(); i++) {
            if (!Objects.equals(this.instruments.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("instruments", _root(), this.instruments.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.instruments.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("instruments", this, this.instruments.get(((Number) (i)).intValue())._parent());
        }
        if (this.patterns.size() != numPatterns())
            throw new ConsistencyError("patterns", numPatterns(), this.patterns.size());
        for (int i = 0; i < this.patterns.size(); i++) {
            if (!Objects.equals(this.patterns.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("patterns", _root(), this.patterns.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.patterns.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("patterns", this, this.patterns.get(((Number) (i)).intValue())._parent());
        }
        if (hasCustomPan() == 252) {
            if (this.channelPans.size() != 32)
                throw new ConsistencyError("channel_pans", 32, this.channelPans.size());
            for (int i = 0; i < this.channelPans.size(); i++) {
                if (!Objects.equals(this.channelPans.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("channel_pans", _root(), this.channelPans.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.channelPans.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("channel_pans", this, this.channelPans.get(((Number) (i)).intValue())._parent());
            }
        }
        _dirty = false;
    }
    public static class Channel extends KaitaiStruct.ReadWrite {
        public static Channel fromFile(String fileName) throws IOException {
            return new Channel(new ByteBufferKaitaiStream(fileName));
        }
        public Channel() {
            this(null, null, null);
        }

        public Channel(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Channel(KaitaiStream _io, S3m _parent) {
            this(_io, _parent, null);
        }

        public Channel(KaitaiStream _io, S3m _parent, S3m _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.isDisabled = this._io.readBitsIntBe(1) != 0;
            this.chType = this._io.readBitsIntBe(7);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(1, (this.isDisabled ? 1 : 0));
            this._io.writeBitsIntBe(7, this.chType);
        }

        public void _check() {
            _dirty = false;
        }
        private boolean isDisabled;
        private long chType;
        private S3m _root;
        private S3m _parent;
        public boolean isDisabled() { return isDisabled; }
        public void setIsDisabled(boolean _v) { _dirty = true; isDisabled = _v; }

        /**
         * Channel type (0..7 = left sample channels, 8..15 = right sample channels, 16..31 = AdLib synth channels)
         */
        public long chType() { return chType; }
        public void setChType(long _v) { _dirty = true; chType = _v; }
        public S3m _root() { return _root; }
        public void set_root(S3m _v) { _dirty = true; _root = _v; }
        public S3m _parent() { return _parent; }
        public void set_parent(S3m _v) { _dirty = true; _parent = _v; }
    }
    public static class ChannelPan extends KaitaiStruct.ReadWrite {
        public static ChannelPan fromFile(String fileName) throws IOException {
            return new ChannelPan(new ByteBufferKaitaiStream(fileName));
        }
        public ChannelPan() {
            this(null, null, null);
        }

        public ChannelPan(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChannelPan(KaitaiStream _io, S3m _parent) {
            this(_io, _parent, null);
        }

        public ChannelPan(KaitaiStream _io, S3m _parent, S3m _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.reserved1 = this._io.readBitsIntBe(2);
            this.hasCustomPan = this._io.readBitsIntBe(1) != 0;
            this.reserved2 = this._io.readBitsIntBe(1) != 0;
            this.pan = this._io.readBitsIntBe(4);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(2, this.reserved1);
            this._io.writeBitsIntBe(1, (this.hasCustomPan ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.reserved2 ? 1 : 0));
            this._io.writeBitsIntBe(4, this.pan);
        }

        public void _check() {
            _dirty = false;
        }
        private long reserved1;
        private boolean hasCustomPan;
        private boolean reserved2;
        private long pan;
        private S3m _root;
        private S3m _parent;
        public long reserved1() { return reserved1; }
        public void setReserved1(long _v) { _dirty = true; reserved1 = _v; }

        /**
         * If true, then use a custom pan setting provided in the `pan`
         * field. If false, the channel would use the default setting
         * (0x7 for mono, 0x3 or 0xc for stereo).
         */
        public boolean hasCustomPan() { return hasCustomPan; }
        public void setHasCustomPan(boolean _v) { _dirty = true; hasCustomPan = _v; }
        public boolean reserved2() { return reserved2; }
        public void setReserved2(boolean _v) { _dirty = true; reserved2 = _v; }
        public long pan() { return pan; }
        public void setPan(long _v) { _dirty = true; pan = _v; }
        public S3m _root() { return _root; }
        public void set_root(S3m _v) { _dirty = true; _root = _v; }
        public S3m _parent() { return _parent; }
        public void set_parent(S3m _v) { _dirty = true; _parent = _v; }
    }
    public static class Instrument extends KaitaiStruct.ReadWrite {
        public static Instrument fromFile(String fileName) throws IOException {
            return new Instrument(new ByteBufferKaitaiStream(fileName));
        }

        public enum InstTypes {
            SAMPLE(1),
            MELODIC(2),
            BASS_DRUM(3),
            SNARE_DRUM(4),
            TOM(5),
            CYMBAL(6),
            HIHAT(7);

            private final long id;
            InstTypes(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, InstTypes> byId = new HashMap<Long, InstTypes>(7);
            static {
                for (InstTypes e : InstTypes.values())
                    byId.put(e.id(), e);
            }
            public static InstTypes byId(long id) { return byId.get(id); }
        }
        public Instrument() {
            this(null, null, null);
        }

        public Instrument(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Instrument(KaitaiStream _io, S3m.InstrumentPtr _parent) {
            this(_io, _parent, null);
        }

        public Instrument(KaitaiStream _io, S3m.InstrumentPtr _parent, S3m _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.type = InstTypes.byId(this._io.readU1());
            this.filename = KaitaiStream.bytesTerminate(this._io.readBytes(12), (byte) 0, false);
            {
                InstTypes on = type();
                if (on != null) {
                    switch (type()) {
                    case SAMPLE: {
                        this.body = new Sampled(this._io, this, _root);
                        ((Sampled) (this.body))._read();
                        break;
                    }
                    default: {
                        this.body = new Adlib(this._io, this, _root);
                        ((Adlib) (this.body))._read();
                        break;
                    }
                    }
                } else {
                    this.body = new Adlib(this._io, this, _root);
                    ((Adlib) (this.body))._read();
                }
            }
            this.tuningHz = this._io.readU4le();
            this.reserved2 = this._io.readBytes(12);
            this.sampleName = KaitaiStream.bytesTerminate(this._io.readBytes(28), (byte) 0, false);
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 83, 67, 82, 83 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, 67, 82, 83 }, this.magic, this._io, "/types/instrument/seq/6");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                InstTypes on = type();
                if (on != null) {
                    switch (type()) {
                    case SAMPLE: {
                        ((Sampled) (this.body))._fetchInstances();
                        break;
                    }
                    default: {
                        ((Adlib) (this.body))._fetchInstances();
                        break;
                    }
                    }
                } else {
                    ((Adlib) (this.body))._fetchInstances();
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(((Number) (this.type.id())).intValue());
            this._io.writeBytesLimit(this.filename, 12, (byte) 0, (byte) 0);
            {
                InstTypes on = type();
                if (on != null) {
                    switch (type()) {
                    case SAMPLE: {
                        ((Sampled) (this.body))._write_Seq(this._io);
                        break;
                    }
                    default: {
                        ((Adlib) (this.body))._write_Seq(this._io);
                        break;
                    }
                    }
                } else {
                    ((Adlib) (this.body))._write_Seq(this._io);
                }
            }
            this._io.writeU4le(this.tuningHz);
            this._io.writeBytes(this.reserved2);
            this._io.writeBytesLimit(this.sampleName, 28, (byte) 0, (byte) 0);
            this._io.writeBytes(this.magic);
        }

        public void _check() {
            if (this.filename.length > 12)
                throw new ConsistencyError("filename", 12, this.filename.length);
            if (KaitaiStream.byteArrayIndexOf(this.filename, ((byte) 0)) != -1)
                throw new ConsistencyError("filename", -1, KaitaiStream.byteArrayIndexOf(this.filename, ((byte) 0)));
            {
                InstTypes on = type();
                if (on != null) {
                    switch (type()) {
                    case SAMPLE: {
                        if (!Objects.equals(((S3m.Instrument.Sampled) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((S3m.Instrument.Sampled) (this.body))._root());
                        if (!Objects.equals(((S3m.Instrument.Sampled) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((S3m.Instrument.Sampled) (this.body))._parent());
                        break;
                    }
                    default: {
                        if (!Objects.equals(((S3m.Instrument.Adlib) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((S3m.Instrument.Adlib) (this.body))._root());
                        if (!Objects.equals(((S3m.Instrument.Adlib) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((S3m.Instrument.Adlib) (this.body))._parent());
                        break;
                    }
                    }
                } else {
                    if (!Objects.equals(((S3m.Instrument.Adlib) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((S3m.Instrument.Adlib) (this.body))._root());
                    if (!Objects.equals(((S3m.Instrument.Adlib) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((S3m.Instrument.Adlib) (this.body))._parent());
                }
            }
            if (this.reserved2.length != 12)
                throw new ConsistencyError("reserved2", 12, this.reserved2.length);
            if (this.sampleName.length > 28)
                throw new ConsistencyError("sample_name", 28, this.sampleName.length);
            if (KaitaiStream.byteArrayIndexOf(this.sampleName, ((byte) 0)) != -1)
                throw new ConsistencyError("sample_name", -1, KaitaiStream.byteArrayIndexOf(this.sampleName, ((byte) 0)));
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 83, 67, 82, 83 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, 67, 82, 83 }, this.magic, null, "/types/instrument/seq/6");
            }
            _dirty = false;
        }
        public static class Adlib extends KaitaiStruct.ReadWrite {
            public static Adlib fromFile(String fileName) throws IOException {
                return new Adlib(new ByteBufferKaitaiStream(fileName));
            }
            public Adlib() {
                this(null, null, null);
            }

            public Adlib(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Adlib(KaitaiStream _io, S3m.Instrument _parent) {
                this(_io, _parent, null);
            }

            public Adlib(KaitaiStream _io, S3m.Instrument _parent, S3m _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.reserved1 = this._io.readBytes(3);
                if (!(Arrays.equals(this.reserved1, new byte[] { 0, 0, 0 }))) {
                    throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0 }, this.reserved1, this._io, "/types/instrument/types/adlib/seq/0");
                }
                this._unnamed1 = this._io.readBytes(16);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBytes(this.reserved1);
                this._io.writeBytes(this._unnamed1);
            }

            public void _check() {
                if (this.reserved1.length != 3)
                    throw new ConsistencyError("reserved1", 3, this.reserved1.length);
                if (!(Arrays.equals(this.reserved1, new byte[] { 0, 0, 0 }))) {
                    throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0 }, this.reserved1, null, "/types/instrument/types/adlib/seq/0");
                }
                if (this._unnamed1.length != 16)
                    throw new ConsistencyError("_unnamed1", 16, this._unnamed1.length);
                _dirty = false;
            }
            private byte[] reserved1;
            private byte[] _unnamed1;
            private S3m _root;
            private S3m.Instrument _parent;
            public byte[] reserved1() { return reserved1; }
            public void setReserved1(byte[] _v) { _dirty = true; reserved1 = _v; }
            public byte[] _unnamed1() { return _unnamed1; }
            public void set_unnamed1(byte[] _v) { _dirty = true; _unnamed1 = _v; }
            public S3m _root() { return _root; }
            public void set_root(S3m _v) { _dirty = true; _root = _v; }
            public S3m.Instrument _parent() { return _parent; }
            public void set_parent(S3m.Instrument _v) { _dirty = true; _parent = _v; }
        }
        public static class Sampled extends KaitaiStruct.ReadWrite {
            public static Sampled fromFile(String fileName) throws IOException {
                return new Sampled(new ByteBufferKaitaiStream(fileName));
            }
            public Sampled() {
                this(null, null, null);
            }

            public Sampled(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Sampled(KaitaiStream _io, S3m.Instrument _parent) {
                this(_io, _parent, null);
            }

            public Sampled(KaitaiStream _io, S3m.Instrument _parent, S3m _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.paraptrSample = new SwappedU3(this._io, this, _root);
                this.paraptrSample._read();
                this.lenSample = this._io.readU4le();
                this.loopBegin = this._io.readU4le();
                this.loopEnd = this._io.readU4le();
                this.defaultVolume = this._io.readU1();
                this.reserved1 = this._io.readU1();
                this.isPacked = this._io.readU1();
                this.flags = this._io.readU1();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.paraptrSample._fetchInstances();
                sample();
                if (this.sample != null) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteSample = _enabledSample;
                this.paraptrSample._write_Seq(this._io);
                this._io.writeU4le(this.lenSample);
                this._io.writeU4le(this.loopBegin);
                this._io.writeU4le(this.loopEnd);
                this._io.writeU1(this.defaultVolume);
                this._io.writeU1(this.reserved1);
                this._io.writeU1(this.isPacked);
                this._io.writeU1(this.flags);
            }

            public void _check() {
                if (!Objects.equals(this.paraptrSample._root(), _root()))
                    throw new ConsistencyError("paraptr_sample", _root(), this.paraptrSample._root());
                if (!Objects.equals(this.paraptrSample._parent(), this))
                    throw new ConsistencyError("paraptr_sample", this, this.paraptrSample._parent());
                if (_enabledSample) {
                    if (this.sample.length != lenSample())
                        throw new ConsistencyError("sample", lenSample(), this.sample.length);
                }
                _dirty = false;
            }
            private byte[] sample;
            private boolean _shouldWriteSample = false;
            private boolean _enabledSample = true;
            public byte[] sample() {
                if (_shouldWriteSample)
                    _writeSample();
                if (this.sample != null)
                    return this.sample;
                if (!_enabledSample)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(paraptrSample().value() * 16);
                this.sample = this._io.readBytes(lenSample());
                this._io.seek(_pos);
                return this.sample;
            }
            public void setSample(byte[] _v) { _dirty = true; sample = _v; }
            public void setSample_Enabled(boolean _v) { _dirty = true; _enabledSample = _v; }

            private void _writeSample() {
                _shouldWriteSample = false;
                long _pos = this._io.pos();
                this._io.seek(paraptrSample().value() * 16);
                this._io.writeBytes(this.sample);
                this._io.seek(_pos);
            }
            private SwappedU3 paraptrSample;
            private long lenSample;
            private long loopBegin;
            private long loopEnd;
            private int defaultVolume;
            private int reserved1;
            private int isPacked;
            private int flags;
            private S3m _root;
            private S3m.Instrument _parent;
            public SwappedU3 paraptrSample() { return paraptrSample; }
            public void setParaptrSample(SwappedU3 _v) { _dirty = true; paraptrSample = _v; }
            public long lenSample() { return lenSample; }
            public void setLenSample(long _v) { _dirty = true; lenSample = _v; }
            public long loopBegin() { return loopBegin; }
            public void setLoopBegin(long _v) { _dirty = true; loopBegin = _v; }
            public long loopEnd() { return loopEnd; }
            public void setLoopEnd(long _v) { _dirty = true; loopEnd = _v; }

            /**
             * Default volume
             */
            public int defaultVolume() { return defaultVolume; }
            public void setDefaultVolume(int _v) { _dirty = true; defaultVolume = _v; }
            public int reserved1() { return reserved1; }
            public void setReserved1(int _v) { _dirty = true; reserved1 = _v; }

            /**
             * 0 = unpacked, 1 = DP30ADPCM packing
             */
            public int isPacked() { return isPacked; }
            public void setIsPacked(int _v) { _dirty = true; isPacked = _v; }
            public int flags() { return flags; }
            public void setFlags(int _v) { _dirty = true; flags = _v; }
            public S3m _root() { return _root; }
            public void set_root(S3m _v) { _dirty = true; _root = _v; }
            public S3m.Instrument _parent() { return _parent; }
            public void set_parent(S3m.Instrument _v) { _dirty = true; _parent = _v; }
        }
        private InstTypes type;
        private byte[] filename;
        private KaitaiStruct.ReadWrite body;
        private long tuningHz;
        private byte[] reserved2;
        private byte[] sampleName;
        private byte[] magic;
        private S3m _root;
        private S3m.InstrumentPtr _parent;
        public InstTypes type() { return type; }
        public void setType(InstTypes _v) { _dirty = true; type = _v; }
        public byte[] filename() { return filename; }
        public void setFilename(byte[] _v) { _dirty = true; filename = _v; }
        public KaitaiStruct.ReadWrite body() { return body; }
        public void setBody(KaitaiStruct.ReadWrite _v) { _dirty = true; body = _v; }
        public long tuningHz() { return tuningHz; }
        public void setTuningHz(long _v) { _dirty = true; tuningHz = _v; }
        public byte[] reserved2() { return reserved2; }
        public void setReserved2(byte[] _v) { _dirty = true; reserved2 = _v; }
        public byte[] sampleName() { return sampleName; }
        public void setSampleName(byte[] _v) { _dirty = true; sampleName = _v; }
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public S3m _root() { return _root; }
        public void set_root(S3m _v) { _dirty = true; _root = _v; }
        public S3m.InstrumentPtr _parent() { return _parent; }
        public void set_parent(S3m.InstrumentPtr _v) { _dirty = true; _parent = _v; }
    }
    public static class InstrumentPtr extends KaitaiStruct.ReadWrite {
        public static InstrumentPtr fromFile(String fileName) throws IOException {
            return new InstrumentPtr(new ByteBufferKaitaiStream(fileName));
        }
        public InstrumentPtr() {
            this(null, null, null);
        }

        public InstrumentPtr(KaitaiStream _io) {
            this(_io, null, null);
        }

        public InstrumentPtr(KaitaiStream _io, S3m _parent) {
            this(_io, _parent, null);
        }

        public InstrumentPtr(KaitaiStream _io, S3m _parent, S3m _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.paraptr = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
            body();
            if (this.body != null) {
                this.body._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBody = _enabledBody;
            this._io.writeU2le(this.paraptr);
        }

        public void _check() {
            if (_enabledBody) {
                if (!Objects.equals(this.body._root(), _root()))
                    throw new ConsistencyError("body", _root(), this.body._root());
                if (!Objects.equals(this.body._parent(), this))
                    throw new ConsistencyError("body", this, this.body._parent());
            }
            _dirty = false;
        }
        private Instrument body;
        private boolean _shouldWriteBody = false;
        private boolean _enabledBody = true;
        public Instrument body() {
            if (_shouldWriteBody)
                _writeBody();
            if (this.body != null)
                return this.body;
            if (!_enabledBody)
                return null;
            long _pos = this._io.pos();
            this._io.seek(paraptr() * 16);
            this.body = new Instrument(this._io, this, _root);
            this.body._read();
            this._io.seek(_pos);
            return this.body;
        }
        public void setBody(Instrument _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            long _pos = this._io.pos();
            this._io.seek(paraptr() * 16);
            this.body._write_Seq(this._io);
            this._io.seek(_pos);
        }
        private int paraptr;
        private S3m _root;
        private S3m _parent;
        public int paraptr() { return paraptr; }
        public void setParaptr(int _v) { _dirty = true; paraptr = _v; }
        public S3m _root() { return _root; }
        public void set_root(S3m _v) { _dirty = true; _root = _v; }
        public S3m _parent() { return _parent; }
        public void set_parent(S3m _v) { _dirty = true; _parent = _v; }
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

        public Pattern(KaitaiStream _io, S3m.PatternPtr _parent) {
            this(_io, _parent, null);
        }

        public Pattern(KaitaiStream _io, S3m.PatternPtr _parent, S3m _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.size = this._io.readU2le();
            this._raw_body = this._io.readBytes(size() - 2);
            KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
            this.body = new PatternCells(_io__raw_body, this, _root);
            this.body._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.body._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.size);
            final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 2);
            this._io.addChildStream(_io__raw_body);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (size() - 2));
                final Pattern _this = this;
                _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_body = _io__raw_body.toByteArray();
                        if (_this._raw_body.length != size() - 2)
                            throw new ConsistencyError("raw(body)", size() - 2, _this._raw_body.length);
                        parent.writeBytes(_this._raw_body);
                    }
                });
            }
            this.body._write_Seq(_io__raw_body);
        }

        public void _check() {
            if (!Objects.equals(this.body._root(), _root()))
                throw new ConsistencyError("body", _root(), this.body._root());
            if (!Objects.equals(this.body._parent(), this))
                throw new ConsistencyError("body", this, this.body._parent());
            _dirty = false;
        }
        private int size;
        private PatternCells body;
        private S3m _root;
        private S3m.PatternPtr _parent;
        private byte[] _raw_body;
        public int size() { return size; }
        public void setSize(int _v) { _dirty = true; size = _v; }
        public PatternCells body() { return body; }
        public void setBody(PatternCells _v) { _dirty = true; body = _v; }
        public S3m _root() { return _root; }
        public void set_root(S3m _v) { _dirty = true; _root = _v; }
        public S3m.PatternPtr _parent() { return _parent; }
        public void set_parent(S3m.PatternPtr _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }
    public static class PatternCell extends KaitaiStruct.ReadWrite {
        public static PatternCell fromFile(String fileName) throws IOException {
            return new PatternCell(new ByteBufferKaitaiStream(fileName));
        }
        public PatternCell() {
            this(null, null, null);
        }

        public PatternCell(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PatternCell(KaitaiStream _io, S3m.PatternCells _parent) {
            this(_io, _parent, null);
        }

        public PatternCell(KaitaiStream _io, S3m.PatternCells _parent, S3m _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.hasFx = this._io.readBitsIntBe(1) != 0;
            this.hasVolume = this._io.readBitsIntBe(1) != 0;
            this.hasNoteAndInstrument = this._io.readBitsIntBe(1) != 0;
            this.channelNum = this._io.readBitsIntBe(5);
            if (hasNoteAndInstrument()) {
                this.note = this._io.readU1();
            }
            if (hasNoteAndInstrument()) {
                this.instrument = this._io.readU1();
            }
            if (hasVolume()) {
                this.volume = this._io.readU1();
            }
            if (hasFx()) {
                this.fxType = this._io.readU1();
            }
            if (hasFx()) {
                this.fxValue = this._io.readU1();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (hasNoteAndInstrument()) {
            }
            if (hasNoteAndInstrument()) {
            }
            if (hasVolume()) {
            }
            if (hasFx()) {
            }
            if (hasFx()) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(1, (this.hasFx ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.hasVolume ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.hasNoteAndInstrument ? 1 : 0));
            this._io.writeBitsIntBe(5, this.channelNum);
            if (hasNoteAndInstrument()) {
                this._io.writeU1(this.note);
            }
            if (hasNoteAndInstrument()) {
                this._io.writeU1(this.instrument);
            }
            if (hasVolume()) {
                this._io.writeU1(this.volume);
            }
            if (hasFx()) {
                this._io.writeU1(this.fxType);
            }
            if (hasFx()) {
                this._io.writeU1(this.fxValue);
            }
        }

        public void _check() {
            if (hasNoteAndInstrument()) {
            }
            if (hasNoteAndInstrument()) {
            }
            if (hasVolume()) {
            }
            if (hasFx()) {
            }
            if (hasFx()) {
            }
            _dirty = false;
        }
        private boolean hasFx;
        private boolean hasVolume;
        private boolean hasNoteAndInstrument;
        private long channelNum;
        private Integer note;
        private Integer instrument;
        private Integer volume;
        private Integer fxType;
        private Integer fxValue;
        private S3m _root;
        private S3m.PatternCells _parent;
        public boolean hasFx() { return hasFx; }
        public void setHasFx(boolean _v) { _dirty = true; hasFx = _v; }
        public boolean hasVolume() { return hasVolume; }
        public void setHasVolume(boolean _v) { _dirty = true; hasVolume = _v; }
        public boolean hasNoteAndInstrument() { return hasNoteAndInstrument; }
        public void setHasNoteAndInstrument(boolean _v) { _dirty = true; hasNoteAndInstrument = _v; }
        public long channelNum() { return channelNum; }
        public void setChannelNum(long _v) { _dirty = true; channelNum = _v; }
        public Integer note() { return note; }
        public void setNote(Integer _v) { _dirty = true; note = _v; }
        public Integer instrument() { return instrument; }
        public void setInstrument(Integer _v) { _dirty = true; instrument = _v; }
        public Integer volume() { return volume; }
        public void setVolume(Integer _v) { _dirty = true; volume = _v; }
        public Integer fxType() { return fxType; }
        public void setFxType(Integer _v) { _dirty = true; fxType = _v; }
        public Integer fxValue() { return fxValue; }
        public void setFxValue(Integer _v) { _dirty = true; fxValue = _v; }
        public S3m _root() { return _root; }
        public void set_root(S3m _v) { _dirty = true; _root = _v; }
        public S3m.PatternCells _parent() { return _parent; }
        public void set_parent(S3m.PatternCells _v) { _dirty = true; _parent = _v; }
    }
    public static class PatternCells extends KaitaiStruct.ReadWrite {
        public static PatternCells fromFile(String fileName) throws IOException {
            return new PatternCells(new ByteBufferKaitaiStream(fileName));
        }
        public PatternCells() {
            this(null, null, null);
        }

        public PatternCells(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PatternCells(KaitaiStream _io, S3m.Pattern _parent) {
            this(_io, _parent, null);
        }

        public PatternCells(KaitaiStream _io, S3m.Pattern _parent, S3m _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.cells = new ArrayList<PatternCell>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    PatternCell _t_cells = new PatternCell(this._io, this, _root);
                    try {
                        _t_cells._read();
                    } finally {
                        this.cells.add(_t_cells);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.cells.size(); i++) {
                this.cells.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.cells.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("cells", 0, this._io.size() - this._io.pos());
                this.cells.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("cells", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.cells.size(); i++) {
                if (!Objects.equals(this.cells.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("cells", _root(), this.cells.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.cells.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("cells", this, this.cells.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<PatternCell> cells;
        private S3m _root;
        private S3m.Pattern _parent;
        public List<PatternCell> cells() { return cells; }
        public void setCells(List<PatternCell> _v) { _dirty = true; cells = _v; }
        public S3m _root() { return _root; }
        public void set_root(S3m _v) { _dirty = true; _root = _v; }
        public S3m.Pattern _parent() { return _parent; }
        public void set_parent(S3m.Pattern _v) { _dirty = true; _parent = _v; }
    }
    public static class PatternPtr extends KaitaiStruct.ReadWrite {
        public static PatternPtr fromFile(String fileName) throws IOException {
            return new PatternPtr(new ByteBufferKaitaiStream(fileName));
        }
        public PatternPtr() {
            this(null, null, null);
        }

        public PatternPtr(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PatternPtr(KaitaiStream _io, S3m _parent) {
            this(_io, _parent, null);
        }

        public PatternPtr(KaitaiStream _io, S3m _parent, S3m _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.paraptr = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
            body();
            if (this.body != null) {
                this.body._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBody = _enabledBody;
            this._io.writeU2le(this.paraptr);
        }

        public void _check() {
            if (_enabledBody) {
                if (!Objects.equals(this.body._root(), _root()))
                    throw new ConsistencyError("body", _root(), this.body._root());
                if (!Objects.equals(this.body._parent(), this))
                    throw new ConsistencyError("body", this, this.body._parent());
            }
            _dirty = false;
        }
        private Pattern body;
        private boolean _shouldWriteBody = false;
        private boolean _enabledBody = true;
        public Pattern body() {
            if (_shouldWriteBody)
                _writeBody();
            if (this.body != null)
                return this.body;
            if (!_enabledBody)
                return null;
            long _pos = this._io.pos();
            this._io.seek(paraptr() * 16);
            this.body = new Pattern(this._io, this, _root);
            this.body._read();
            this._io.seek(_pos);
            return this.body;
        }
        public void setBody(Pattern _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            long _pos = this._io.pos();
            this._io.seek(paraptr() * 16);
            this.body._write_Seq(this._io);
            this._io.seek(_pos);
        }
        private int paraptr;
        private S3m _root;
        private S3m _parent;
        public int paraptr() { return paraptr; }
        public void setParaptr(int _v) { _dirty = true; paraptr = _v; }
        public S3m _root() { return _root; }
        public void set_root(S3m _v) { _dirty = true; _root = _v; }
        public S3m _parent() { return _parent; }
        public void set_parent(S3m _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Custom 3-byte integer, stored in mixed endian manner.
     */
    public static class SwappedU3 extends KaitaiStruct.ReadWrite {
        public static SwappedU3 fromFile(String fileName) throws IOException {
            return new SwappedU3(new ByteBufferKaitaiStream(fileName));
        }
        public SwappedU3() {
            this(null, null, null);
        }

        public SwappedU3(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SwappedU3(KaitaiStream _io, S3m.Instrument.Sampled _parent) {
            this(_io, _parent, null);
        }

        public SwappedU3(KaitaiStream _io, S3m.Instrument.Sampled _parent, S3m _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.hi = this._io.readU1();
            this.lo = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.hi);
            this._io.writeU2le(this.lo);
        }

        public void _check() {
            _dirty = false;
        }
        private Integer value;
        public Integer value() {
            if (this.value != null)
                return this.value;
            this.value = ((Number) (lo() | hi() << 16)).intValue();
            return this.value;
        }
        public void _invalidateValue() { this.value = null; }
        private int hi;
        private int lo;
        private S3m _root;
        private S3m.Instrument.Sampled _parent;
        public int hi() { return hi; }
        public void setHi(int _v) { _dirty = true; hi = _v; }
        public int lo() { return lo; }
        public void setLo(int _v) { _dirty = true; lo = _v; }
        public S3m _root() { return _root; }
        public void set_root(S3m _v) { _dirty = true; _root = _v; }
        public S3m.Instrument.Sampled _parent() { return _parent; }
        public void set_parent(S3m.Instrument.Sampled _v) { _dirty = true; _parent = _v; }
    }
    private byte[] songName;
    private byte[] magic1;
    private int fileType;
    private byte[] reserved1;
    private int numOrders;
    private int numInstruments;
    private int numPatterns;
    private int flags;
    private int version;
    private int samplesFormat;
    private byte[] magic2;
    private int globalVolume;
    private int initialSpeed;
    private int initialTempo;
    private boolean isStereo;
    private long masterVolume;
    private int ultraClickRemoval;
    private int hasCustomPan;
    private byte[] reserved2;
    private int ofsSpecial;
    private List<Channel> channels;
    private byte[] orders;
    private List<InstrumentPtr> instruments;
    private List<PatternPtr> patterns;
    private List<ChannelPan> channelPans;
    private S3m _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] songName() { return songName; }
    public void setSongName(byte[] _v) { _dirty = true; songName = _v; }
    public byte[] magic1() { return magic1; }
    public void setMagic1(byte[] _v) { _dirty = true; magic1 = _v; }
    public int fileType() { return fileType; }
    public void setFileType(int _v) { _dirty = true; fileType = _v; }
    public byte[] reserved1() { return reserved1; }
    public void setReserved1(byte[] _v) { _dirty = true; reserved1 = _v; }

    /**
     * Number of orders in a song
     */
    public int numOrders() { return numOrders; }
    public void setNumOrders(int _v) { _dirty = true; numOrders = _v; }

    /**
     * Number of instruments in a song
     */
    public int numInstruments() { return numInstruments; }
    public void setNumInstruments(int _v) { _dirty = true; numInstruments = _v; }

    /**
     * Number of patterns in a song
     */
    public int numPatterns() { return numPatterns; }
    public void setNumPatterns(int _v) { _dirty = true; numPatterns = _v; }
    public int flags() { return flags; }
    public void setFlags(int _v) { _dirty = true; flags = _v; }

    /**
     * Scream Tracker version that was used to save this file
     */
    public int version() { return version; }
    public void setVersion(int _v) { _dirty = true; version = _v; }

    /**
     * 1 = signed samples, 2 = unsigned samples
     */
    public int samplesFormat() { return samplesFormat; }
    public void setSamplesFormat(int _v) { _dirty = true; samplesFormat = _v; }
    public byte[] magic2() { return magic2; }
    public void setMagic2(byte[] _v) { _dirty = true; magic2 = _v; }
    public int globalVolume() { return globalVolume; }
    public void setGlobalVolume(int _v) { _dirty = true; globalVolume = _v; }
    public int initialSpeed() { return initialSpeed; }
    public void setInitialSpeed(int _v) { _dirty = true; initialSpeed = _v; }
    public int initialTempo() { return initialTempo; }
    public void setInitialTempo(int _v) { _dirty = true; initialTempo = _v; }
    public boolean isStereo() { return isStereo; }
    public void setIsStereo(boolean _v) { _dirty = true; isStereo = _v; }
    public long masterVolume() { return masterVolume; }
    public void setMasterVolume(long _v) { _dirty = true; masterVolume = _v; }
    public int ultraClickRemoval() { return ultraClickRemoval; }
    public void setUltraClickRemoval(int _v) { _dirty = true; ultraClickRemoval = _v; }
    public int hasCustomPan() { return hasCustomPan; }
    public void setHasCustomPan(int _v) { _dirty = true; hasCustomPan = _v; }
    public byte[] reserved2() { return reserved2; }
    public void setReserved2(byte[] _v) { _dirty = true; reserved2 = _v; }

    /**
     * Offset of special data, not used by Scream Tracker directly.
     */
    public int ofsSpecial() { return ofsSpecial; }
    public void setOfsSpecial(int _v) { _dirty = true; ofsSpecial = _v; }
    public List<Channel> channels() { return channels; }
    public void setChannels(List<Channel> _v) { _dirty = true; channels = _v; }
    public byte[] orders() { return orders; }
    public void setOrders(byte[] _v) { _dirty = true; orders = _v; }
    public List<InstrumentPtr> instruments() { return instruments; }
    public void setInstruments(List<InstrumentPtr> _v) { _dirty = true; instruments = _v; }
    public List<PatternPtr> patterns() { return patterns; }
    public void setPatterns(List<PatternPtr> _v) { _dirty = true; patterns = _v; }
    public List<ChannelPan> channelPans() { return channelPans; }
    public void setChannelPans(List<ChannelPan> _v) { _dirty = true; channelPans = _v; }
    public S3m _root() { return _root; }
    public void set_root(S3m _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

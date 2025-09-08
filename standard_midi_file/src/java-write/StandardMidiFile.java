// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;
import java.util.List;


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
public class StandardMidiFile extends KaitaiStruct.ReadWrite {
    public static StandardMidiFile fromFile(String fileName) throws IOException {
        return new StandardMidiFile(new ByteBufferKaitaiStream(fileName));
    }
    public StandardMidiFile() {
        this(null, null, null);
    }

    public StandardMidiFile(KaitaiStream _io) {
        this(_io, null, null);
    }

    public StandardMidiFile(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public StandardMidiFile(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, StandardMidiFile _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.hdr = new Header(this._io, this, _root);
        this.hdr._read();
        this.tracks = new ArrayList<Track>();
        for (int i = 0; i < hdr().numTracks(); i++) {
            Track _t_tracks = new Track(this._io, this, _root);
            try {
                _t_tracks._read();
            } finally {
                this.tracks.add(_t_tracks);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.hdr._fetchInstances();
        for (int i = 0; i < this.tracks.size(); i++) {
            this.tracks.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.hdr._write_Seq(this._io);
        for (int i = 0; i < this.tracks.size(); i++) {
            this.tracks.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (!Objects.equals(this.hdr._root(), _root()))
            throw new ConsistencyError("hdr", _root(), this.hdr._root());
        if (!Objects.equals(this.hdr._parent(), this))
            throw new ConsistencyError("hdr", this, this.hdr._parent());
        if (this.tracks.size() != hdr().numTracks())
            throw new ConsistencyError("tracks", hdr().numTracks(), this.tracks.size());
        for (int i = 0; i < this.tracks.size(); i++) {
            if (!Objects.equals(this.tracks.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("tracks", _root(), this.tracks.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.tracks.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("tracks", this, this.tracks.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class ChannelPressureEvent extends KaitaiStruct.ReadWrite {
        public static ChannelPressureEvent fromFile(String fileName) throws IOException {
            return new ChannelPressureEvent(new ByteBufferKaitaiStream(fileName));
        }
        public ChannelPressureEvent() {
            this(null, null, null);
        }

        public ChannelPressureEvent(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChannelPressureEvent(KaitaiStream _io, StandardMidiFile.TrackEvent _parent) {
            this(_io, _parent, null);
        }

        public ChannelPressureEvent(KaitaiStream _io, StandardMidiFile.TrackEvent _parent, StandardMidiFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.pressure = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.pressure);
        }

        public void _check() {
            _dirty = false;
        }
        private int pressure;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvent _parent;
        public int pressure() { return pressure; }
        public void setPressure(int _v) { _dirty = true; pressure = _v; }
        public StandardMidiFile _root() { return _root; }
        public void set_root(StandardMidiFile _v) { _dirty = true; _root = _v; }
        public StandardMidiFile.TrackEvent _parent() { return _parent; }
        public void set_parent(StandardMidiFile.TrackEvent _v) { _dirty = true; _parent = _v; }
    }
    public static class ControllerEvent extends KaitaiStruct.ReadWrite {
        public static ControllerEvent fromFile(String fileName) throws IOException {
            return new ControllerEvent(new ByteBufferKaitaiStream(fileName));
        }
        public ControllerEvent() {
            this(null, null, null);
        }

        public ControllerEvent(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ControllerEvent(KaitaiStream _io, StandardMidiFile.TrackEvent _parent) {
            this(_io, _parent, null);
        }

        public ControllerEvent(KaitaiStream _io, StandardMidiFile.TrackEvent _parent, StandardMidiFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.controller = this._io.readU1();
            this.value = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.controller);
            this._io.writeU1(this.value);
        }

        public void _check() {
            _dirty = false;
        }
        private int controller;
        private int value;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvent _parent;
        public int controller() { return controller; }
        public void setController(int _v) { _dirty = true; controller = _v; }
        public int value() { return value; }
        public void setValue(int _v) { _dirty = true; value = _v; }
        public StandardMidiFile _root() { return _root; }
        public void set_root(StandardMidiFile _v) { _dirty = true; _root = _v; }
        public StandardMidiFile.TrackEvent _parent() { return _parent; }
        public void set_parent(StandardMidiFile.TrackEvent _v) { _dirty = true; _parent = _v; }
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

        public Header(KaitaiStream _io, StandardMidiFile _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, StandardMidiFile _parent, StandardMidiFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 77, 84, 104, 100 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 77, 84, 104, 100 }, this.magic, this._io, "/types/header/seq/0");
            }
            this.lenHeader = this._io.readU4be();
            this.format = this._io.readU2be();
            this.numTracks = this._io.readU2be();
            this.division = this._io.readS2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU4be(this.lenHeader);
            this._io.writeU2be(this.format);
            this._io.writeU2be(this.numTracks);
            this._io.writeS2be(this.division);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 77, 84, 104, 100 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 77, 84, 104, 100 }, this.magic, null, "/types/header/seq/0");
            }
            _dirty = false;
        }
        private byte[] magic;
        private long lenHeader;
        private int format;
        private int numTracks;
        private short division;
        private StandardMidiFile _root;
        private StandardMidiFile _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public long lenHeader() { return lenHeader; }
        public void setLenHeader(long _v) { _dirty = true; lenHeader = _v; }
        public int format() { return format; }
        public void setFormat(int _v) { _dirty = true; format = _v; }
        public int numTracks() { return numTracks; }
        public void setNumTracks(int _v) { _dirty = true; numTracks = _v; }
        public short division() { return division; }
        public void setDivision(short _v) { _dirty = true; division = _v; }
        public StandardMidiFile _root() { return _root; }
        public void set_root(StandardMidiFile _v) { _dirty = true; _root = _v; }
        public StandardMidiFile _parent() { return _parent; }
        public void set_parent(StandardMidiFile _v) { _dirty = true; _parent = _v; }
    }
    public static class MetaEventBody extends KaitaiStruct.ReadWrite {
        public static MetaEventBody fromFile(String fileName) throws IOException {
            return new MetaEventBody(new ByteBufferKaitaiStream(fileName));
        }

        public enum MetaTypeEnum {
            SEQUENCE_NUMBER(0),
            TEXT_EVENT(1),
            COPYRIGHT(2),
            SEQUENCE_TRACK_NAME(3),
            INSTRUMENT_NAME(4),
            LYRIC_TEXT(5),
            MARKER_TEXT(6),
            CUE_POINT(7),
            MIDI_CHANNEL_PREFIX_ASSIGNMENT(32),
            END_OF_TRACK(47),
            TEMPO(81),
            SMPTE_OFFSET(84),
            TIME_SIGNATURE(88),
            KEY_SIGNATURE(89),
            SEQUENCER_SPECIFIC_EVENT(127);

            private final long id;
            MetaTypeEnum(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, MetaTypeEnum> byId = new HashMap<Long, MetaTypeEnum>(15);
            static {
                for (MetaTypeEnum e : MetaTypeEnum.values())
                    byId.put(e.id(), e);
            }
            public static MetaTypeEnum byId(long id) { return byId.get(id); }
        }
        public MetaEventBody() {
            this(null, null, null);
        }

        public MetaEventBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MetaEventBody(KaitaiStream _io, StandardMidiFile.TrackEvent _parent) {
            this(_io, _parent, null);
        }

        public MetaEventBody(KaitaiStream _io, StandardMidiFile.TrackEvent _parent, StandardMidiFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.metaType = MetaTypeEnum.byId(this._io.readU1());
            this.len = new VlqBase128Be(this._io);
            this.len._read();
            this.body = this._io.readBytes(len().value());
            _dirty = false;
        }

        public void _fetchInstances() {
            this.len._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(((Number) (this.metaType.id())).intValue());
            this.len._write_Seq(this._io);
            this._io.writeBytes(this.body);
        }

        public void _check() {
            if (this.body.length != len().value())
                throw new ConsistencyError("body", len().value(), this.body.length);
            _dirty = false;
        }
        private MetaTypeEnum metaType;
        private VlqBase128Be len;
        private byte[] body;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvent _parent;
        public MetaTypeEnum metaType() { return metaType; }
        public void setMetaType(MetaTypeEnum _v) { _dirty = true; metaType = _v; }
        public VlqBase128Be len() { return len; }
        public void setLen(VlqBase128Be _v) { _dirty = true; len = _v; }
        public byte[] body() { return body; }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public StandardMidiFile _root() { return _root; }
        public void set_root(StandardMidiFile _v) { _dirty = true; _root = _v; }
        public StandardMidiFile.TrackEvent _parent() { return _parent; }
        public void set_parent(StandardMidiFile.TrackEvent _v) { _dirty = true; _parent = _v; }
    }
    public static class NoteOffEvent extends KaitaiStruct.ReadWrite {
        public static NoteOffEvent fromFile(String fileName) throws IOException {
            return new NoteOffEvent(new ByteBufferKaitaiStream(fileName));
        }
        public NoteOffEvent() {
            this(null, null, null);
        }

        public NoteOffEvent(KaitaiStream _io) {
            this(_io, null, null);
        }

        public NoteOffEvent(KaitaiStream _io, StandardMidiFile.TrackEvent _parent) {
            this(_io, _parent, null);
        }

        public NoteOffEvent(KaitaiStream _io, StandardMidiFile.TrackEvent _parent, StandardMidiFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.note = this._io.readU1();
            this.velocity = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.note);
            this._io.writeU1(this.velocity);
        }

        public void _check() {
            _dirty = false;
        }
        private int note;
        private int velocity;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvent _parent;
        public int note() { return note; }
        public void setNote(int _v) { _dirty = true; note = _v; }
        public int velocity() { return velocity; }
        public void setVelocity(int _v) { _dirty = true; velocity = _v; }
        public StandardMidiFile _root() { return _root; }
        public void set_root(StandardMidiFile _v) { _dirty = true; _root = _v; }
        public StandardMidiFile.TrackEvent _parent() { return _parent; }
        public void set_parent(StandardMidiFile.TrackEvent _v) { _dirty = true; _parent = _v; }
    }
    public static class NoteOnEvent extends KaitaiStruct.ReadWrite {
        public static NoteOnEvent fromFile(String fileName) throws IOException {
            return new NoteOnEvent(new ByteBufferKaitaiStream(fileName));
        }
        public NoteOnEvent() {
            this(null, null, null);
        }

        public NoteOnEvent(KaitaiStream _io) {
            this(_io, null, null);
        }

        public NoteOnEvent(KaitaiStream _io, StandardMidiFile.TrackEvent _parent) {
            this(_io, _parent, null);
        }

        public NoteOnEvent(KaitaiStream _io, StandardMidiFile.TrackEvent _parent, StandardMidiFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.note = this._io.readU1();
            this.velocity = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.note);
            this._io.writeU1(this.velocity);
        }

        public void _check() {
            _dirty = false;
        }
        private int note;
        private int velocity;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvent _parent;
        public int note() { return note; }
        public void setNote(int _v) { _dirty = true; note = _v; }
        public int velocity() { return velocity; }
        public void setVelocity(int _v) { _dirty = true; velocity = _v; }
        public StandardMidiFile _root() { return _root; }
        public void set_root(StandardMidiFile _v) { _dirty = true; _root = _v; }
        public StandardMidiFile.TrackEvent _parent() { return _parent; }
        public void set_parent(StandardMidiFile.TrackEvent _v) { _dirty = true; _parent = _v; }
    }
    public static class PitchBendEvent extends KaitaiStruct.ReadWrite {
        public static PitchBendEvent fromFile(String fileName) throws IOException {
            return new PitchBendEvent(new ByteBufferKaitaiStream(fileName));
        }
        public PitchBendEvent() {
            this(null, null, null);
        }

        public PitchBendEvent(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PitchBendEvent(KaitaiStream _io, StandardMidiFile.TrackEvent _parent) {
            this(_io, _parent, null);
        }

        public PitchBendEvent(KaitaiStream _io, StandardMidiFile.TrackEvent _parent, StandardMidiFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.b1 = this._io.readU1();
            this.b2 = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.b1);
            this._io.writeU1(this.b2);
        }

        public void _check() {
            _dirty = false;
        }
        private Integer adjBendValue;
        public Integer adjBendValue() {
            if (this.adjBendValue != null)
                return this.adjBendValue;
            this.adjBendValue = ((Number) (bendValue() - 16384)).intValue();
            return this.adjBendValue;
        }
        public void _invalidateAdjBendValue() { this.adjBendValue = null; }
        private Integer bendValue;
        public Integer bendValue() {
            if (this.bendValue != null)
                return this.bendValue;
            this.bendValue = ((Number) (((b2() << 7) + b1()) - 16384)).intValue();
            return this.bendValue;
        }
        public void _invalidateBendValue() { this.bendValue = null; }
        private int b1;
        private int b2;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvent _parent;
        public int b1() { return b1; }
        public void setB1(int _v) { _dirty = true; b1 = _v; }
        public int b2() { return b2; }
        public void setB2(int _v) { _dirty = true; b2 = _v; }
        public StandardMidiFile _root() { return _root; }
        public void set_root(StandardMidiFile _v) { _dirty = true; _root = _v; }
        public StandardMidiFile.TrackEvent _parent() { return _parent; }
        public void set_parent(StandardMidiFile.TrackEvent _v) { _dirty = true; _parent = _v; }
    }
    public static class PolyphonicPressureEvent extends KaitaiStruct.ReadWrite {
        public static PolyphonicPressureEvent fromFile(String fileName) throws IOException {
            return new PolyphonicPressureEvent(new ByteBufferKaitaiStream(fileName));
        }
        public PolyphonicPressureEvent() {
            this(null, null, null);
        }

        public PolyphonicPressureEvent(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PolyphonicPressureEvent(KaitaiStream _io, StandardMidiFile.TrackEvent _parent) {
            this(_io, _parent, null);
        }

        public PolyphonicPressureEvent(KaitaiStream _io, StandardMidiFile.TrackEvent _parent, StandardMidiFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.note = this._io.readU1();
            this.pressure = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.note);
            this._io.writeU1(this.pressure);
        }

        public void _check() {
            _dirty = false;
        }
        private int note;
        private int pressure;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvent _parent;
        public int note() { return note; }
        public void setNote(int _v) { _dirty = true; note = _v; }
        public int pressure() { return pressure; }
        public void setPressure(int _v) { _dirty = true; pressure = _v; }
        public StandardMidiFile _root() { return _root; }
        public void set_root(StandardMidiFile _v) { _dirty = true; _root = _v; }
        public StandardMidiFile.TrackEvent _parent() { return _parent; }
        public void set_parent(StandardMidiFile.TrackEvent _v) { _dirty = true; _parent = _v; }
    }
    public static class ProgramChangeEvent extends KaitaiStruct.ReadWrite {
        public static ProgramChangeEvent fromFile(String fileName) throws IOException {
            return new ProgramChangeEvent(new ByteBufferKaitaiStream(fileName));
        }
        public ProgramChangeEvent() {
            this(null, null, null);
        }

        public ProgramChangeEvent(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ProgramChangeEvent(KaitaiStream _io, StandardMidiFile.TrackEvent _parent) {
            this(_io, _parent, null);
        }

        public ProgramChangeEvent(KaitaiStream _io, StandardMidiFile.TrackEvent _parent, StandardMidiFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.program = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.program);
        }

        public void _check() {
            _dirty = false;
        }
        private int program;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvent _parent;
        public int program() { return program; }
        public void setProgram(int _v) { _dirty = true; program = _v; }
        public StandardMidiFile _root() { return _root; }
        public void set_root(StandardMidiFile _v) { _dirty = true; _root = _v; }
        public StandardMidiFile.TrackEvent _parent() { return _parent; }
        public void set_parent(StandardMidiFile.TrackEvent _v) { _dirty = true; _parent = _v; }
    }
    public static class SysexEventBody extends KaitaiStruct.ReadWrite {
        public static SysexEventBody fromFile(String fileName) throws IOException {
            return new SysexEventBody(new ByteBufferKaitaiStream(fileName));
        }
        public SysexEventBody() {
            this(null, null, null);
        }

        public SysexEventBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SysexEventBody(KaitaiStream _io, StandardMidiFile.TrackEvent _parent) {
            this(_io, _parent, null);
        }

        public SysexEventBody(KaitaiStream _io, StandardMidiFile.TrackEvent _parent, StandardMidiFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = new VlqBase128Be(this._io);
            this.len._read();
            this.data = this._io.readBytes(len().value());
            _dirty = false;
        }

        public void _fetchInstances() {
            this.len._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.len._write_Seq(this._io);
            this._io.writeBytes(this.data);
        }

        public void _check() {
            if (this.data.length != len().value())
                throw new ConsistencyError("data", len().value(), this.data.length);
            _dirty = false;
        }
        private VlqBase128Be len;
        private byte[] data;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvent _parent;
        public VlqBase128Be len() { return len; }
        public void setLen(VlqBase128Be _v) { _dirty = true; len = _v; }
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public StandardMidiFile _root() { return _root; }
        public void set_root(StandardMidiFile _v) { _dirty = true; _root = _v; }
        public StandardMidiFile.TrackEvent _parent() { return _parent; }
        public void set_parent(StandardMidiFile.TrackEvent _v) { _dirty = true; _parent = _v; }
    }
    public static class Track extends KaitaiStruct.ReadWrite {
        public static Track fromFile(String fileName) throws IOException {
            return new Track(new ByteBufferKaitaiStream(fileName));
        }
        public Track() {
            this(null, null, null);
        }

        public Track(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Track(KaitaiStream _io, StandardMidiFile _parent) {
            this(_io, _parent, null);
        }

        public Track(KaitaiStream _io, StandardMidiFile _parent, StandardMidiFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 77, 84, 114, 107 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 77, 84, 114, 107 }, this.magic, this._io, "/types/track/seq/0");
            }
            this.lenEvents = this._io.readU4be();
            this._raw_events = this._io.readBytes(lenEvents());
            KaitaiStream _io__raw_events = new ByteBufferKaitaiStream(this._raw_events);
            this.events = new TrackEvents(_io__raw_events, this, _root);
            this.events._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.events._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU4be(this.lenEvents);
            final KaitaiStream _io__raw_events = new ByteBufferKaitaiStream(lenEvents());
            this._io.addChildStream(_io__raw_events);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenEvents()));
                final Track _this = this;
                _io__raw_events.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_events = _io__raw_events.toByteArray();
                        if (_this._raw_events.length != lenEvents())
                            throw new ConsistencyError("raw(events)", lenEvents(), _this._raw_events.length);
                        parent.writeBytes(_this._raw_events);
                    }
                });
            }
            this.events._write_Seq(_io__raw_events);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 77, 84, 114, 107 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 77, 84, 114, 107 }, this.magic, null, "/types/track/seq/0");
            }
            if (!Objects.equals(this.events._root(), _root()))
                throw new ConsistencyError("events", _root(), this.events._root());
            if (!Objects.equals(this.events._parent(), this))
                throw new ConsistencyError("events", this, this.events._parent());
            _dirty = false;
        }
        private byte[] magic;
        private long lenEvents;
        private TrackEvents events;
        private StandardMidiFile _root;
        private StandardMidiFile _parent;
        private byte[] _raw_events;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public long lenEvents() { return lenEvents; }
        public void setLenEvents(long _v) { _dirty = true; lenEvents = _v; }
        public TrackEvents events() { return events; }
        public void setEvents(TrackEvents _v) { _dirty = true; events = _v; }
        public StandardMidiFile _root() { return _root; }
        public void set_root(StandardMidiFile _v) { _dirty = true; _root = _v; }
        public StandardMidiFile _parent() { return _parent; }
        public void set_parent(StandardMidiFile _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_events() { return _raw_events; }
        public void set_raw_Events(byte[] _v) { _dirty = true; _raw_events = _v; }
    }
    public static class TrackEvent extends KaitaiStruct.ReadWrite {
        public static TrackEvent fromFile(String fileName) throws IOException {
            return new TrackEvent(new ByteBufferKaitaiStream(fileName));
        }
        public TrackEvent() {
            this(null, null, null);
        }

        public TrackEvent(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TrackEvent(KaitaiStream _io, StandardMidiFile.TrackEvents _parent) {
            this(_io, _parent, null);
        }

        public TrackEvent(KaitaiStream _io, StandardMidiFile.TrackEvents _parent, StandardMidiFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.vTime = new VlqBase128Be(this._io);
            this.vTime._read();
            this.eventHeader = this._io.readU1();
            if (eventHeader() == 255) {
                this.metaEventBody = new MetaEventBody(this._io, this, _root);
                this.metaEventBody._read();
            }
            if (eventHeader() == 240) {
                this.sysexBody = new SysexEventBody(this._io, this, _root);
                this.sysexBody._read();
            }
            switch (eventType()) {
            case 128: {
                this.eventBody = new NoteOffEvent(this._io, this, _root);
                ((NoteOffEvent) (this.eventBody))._read();
                break;
            }
            case 144: {
                this.eventBody = new NoteOnEvent(this._io, this, _root);
                ((NoteOnEvent) (this.eventBody))._read();
                break;
            }
            case 160: {
                this.eventBody = new PolyphonicPressureEvent(this._io, this, _root);
                ((PolyphonicPressureEvent) (this.eventBody))._read();
                break;
            }
            case 176: {
                this.eventBody = new ControllerEvent(this._io, this, _root);
                ((ControllerEvent) (this.eventBody))._read();
                break;
            }
            case 192: {
                this.eventBody = new ProgramChangeEvent(this._io, this, _root);
                ((ProgramChangeEvent) (this.eventBody))._read();
                break;
            }
            case 208: {
                this.eventBody = new ChannelPressureEvent(this._io, this, _root);
                ((ChannelPressureEvent) (this.eventBody))._read();
                break;
            }
            case 224: {
                this.eventBody = new PitchBendEvent(this._io, this, _root);
                ((PitchBendEvent) (this.eventBody))._read();
                break;
            }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.vTime._fetchInstances();
            if (eventHeader() == 255) {
                this.metaEventBody._fetchInstances();
            }
            if (eventHeader() == 240) {
                this.sysexBody._fetchInstances();
            }
            switch (eventType()) {
            case 128: {
                ((NoteOffEvent) (this.eventBody))._fetchInstances();
                break;
            }
            case 144: {
                ((NoteOnEvent) (this.eventBody))._fetchInstances();
                break;
            }
            case 160: {
                ((PolyphonicPressureEvent) (this.eventBody))._fetchInstances();
                break;
            }
            case 176: {
                ((ControllerEvent) (this.eventBody))._fetchInstances();
                break;
            }
            case 192: {
                ((ProgramChangeEvent) (this.eventBody))._fetchInstances();
                break;
            }
            case 208: {
                ((ChannelPressureEvent) (this.eventBody))._fetchInstances();
                break;
            }
            case 224: {
                ((PitchBendEvent) (this.eventBody))._fetchInstances();
                break;
            }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.vTime._write_Seq(this._io);
            this._io.writeU1(this.eventHeader);
            if (eventHeader() == 255) {
                this.metaEventBody._write_Seq(this._io);
            }
            if (eventHeader() == 240) {
                this.sysexBody._write_Seq(this._io);
            }
            switch (eventType()) {
            case 128: {
                ((NoteOffEvent) (this.eventBody))._write_Seq(this._io);
                break;
            }
            case 144: {
                ((NoteOnEvent) (this.eventBody))._write_Seq(this._io);
                break;
            }
            case 160: {
                ((PolyphonicPressureEvent) (this.eventBody))._write_Seq(this._io);
                break;
            }
            case 176: {
                ((ControllerEvent) (this.eventBody))._write_Seq(this._io);
                break;
            }
            case 192: {
                ((ProgramChangeEvent) (this.eventBody))._write_Seq(this._io);
                break;
            }
            case 208: {
                ((ChannelPressureEvent) (this.eventBody))._write_Seq(this._io);
                break;
            }
            case 224: {
                ((PitchBendEvent) (this.eventBody))._write_Seq(this._io);
                break;
            }
            }
        }

        public void _check() {
            if (eventHeader() == 255) {
                if (!Objects.equals(this.metaEventBody._root(), _root()))
                    throw new ConsistencyError("meta_event_body", _root(), this.metaEventBody._root());
                if (!Objects.equals(this.metaEventBody._parent(), this))
                    throw new ConsistencyError("meta_event_body", this, this.metaEventBody._parent());
            }
            if (eventHeader() == 240) {
                if (!Objects.equals(this.sysexBody._root(), _root()))
                    throw new ConsistencyError("sysex_body", _root(), this.sysexBody._root());
                if (!Objects.equals(this.sysexBody._parent(), this))
                    throw new ConsistencyError("sysex_body", this, this.sysexBody._parent());
            }
            switch (eventType()) {
            case 128: {
                if (!Objects.equals(((StandardMidiFile.NoteOffEvent) (this.eventBody))._root(), _root()))
                    throw new ConsistencyError("event_body", _root(), ((StandardMidiFile.NoteOffEvent) (this.eventBody))._root());
                if (!Objects.equals(((StandardMidiFile.NoteOffEvent) (this.eventBody))._parent(), this))
                    throw new ConsistencyError("event_body", this, ((StandardMidiFile.NoteOffEvent) (this.eventBody))._parent());
                break;
            }
            case 144: {
                if (!Objects.equals(((StandardMidiFile.NoteOnEvent) (this.eventBody))._root(), _root()))
                    throw new ConsistencyError("event_body", _root(), ((StandardMidiFile.NoteOnEvent) (this.eventBody))._root());
                if (!Objects.equals(((StandardMidiFile.NoteOnEvent) (this.eventBody))._parent(), this))
                    throw new ConsistencyError("event_body", this, ((StandardMidiFile.NoteOnEvent) (this.eventBody))._parent());
                break;
            }
            case 160: {
                if (!Objects.equals(((StandardMidiFile.PolyphonicPressureEvent) (this.eventBody))._root(), _root()))
                    throw new ConsistencyError("event_body", _root(), ((StandardMidiFile.PolyphonicPressureEvent) (this.eventBody))._root());
                if (!Objects.equals(((StandardMidiFile.PolyphonicPressureEvent) (this.eventBody))._parent(), this))
                    throw new ConsistencyError("event_body", this, ((StandardMidiFile.PolyphonicPressureEvent) (this.eventBody))._parent());
                break;
            }
            case 176: {
                if (!Objects.equals(((StandardMidiFile.ControllerEvent) (this.eventBody))._root(), _root()))
                    throw new ConsistencyError("event_body", _root(), ((StandardMidiFile.ControllerEvent) (this.eventBody))._root());
                if (!Objects.equals(((StandardMidiFile.ControllerEvent) (this.eventBody))._parent(), this))
                    throw new ConsistencyError("event_body", this, ((StandardMidiFile.ControllerEvent) (this.eventBody))._parent());
                break;
            }
            case 192: {
                if (!Objects.equals(((StandardMidiFile.ProgramChangeEvent) (this.eventBody))._root(), _root()))
                    throw new ConsistencyError("event_body", _root(), ((StandardMidiFile.ProgramChangeEvent) (this.eventBody))._root());
                if (!Objects.equals(((StandardMidiFile.ProgramChangeEvent) (this.eventBody))._parent(), this))
                    throw new ConsistencyError("event_body", this, ((StandardMidiFile.ProgramChangeEvent) (this.eventBody))._parent());
                break;
            }
            case 208: {
                if (!Objects.equals(((StandardMidiFile.ChannelPressureEvent) (this.eventBody))._root(), _root()))
                    throw new ConsistencyError("event_body", _root(), ((StandardMidiFile.ChannelPressureEvent) (this.eventBody))._root());
                if (!Objects.equals(((StandardMidiFile.ChannelPressureEvent) (this.eventBody))._parent(), this))
                    throw new ConsistencyError("event_body", this, ((StandardMidiFile.ChannelPressureEvent) (this.eventBody))._parent());
                break;
            }
            case 224: {
                if (!Objects.equals(((StandardMidiFile.PitchBendEvent) (this.eventBody))._root(), _root()))
                    throw new ConsistencyError("event_body", _root(), ((StandardMidiFile.PitchBendEvent) (this.eventBody))._root());
                if (!Objects.equals(((StandardMidiFile.PitchBendEvent) (this.eventBody))._parent(), this))
                    throw new ConsistencyError("event_body", this, ((StandardMidiFile.PitchBendEvent) (this.eventBody))._parent());
                break;
            }
            }
            _dirty = false;
        }
        private Integer channel;
        public Integer channel() {
            if (this.channel != null)
                return this.channel;
            if (eventType() != 240) {
                this.channel = ((Number) (eventHeader() & 15)).intValue();
            }
            return this.channel;
        }
        public void _invalidateChannel() { this.channel = null; }
        private Integer eventType;
        public Integer eventType() {
            if (this.eventType != null)
                return this.eventType;
            this.eventType = ((Number) (eventHeader() & 240)).intValue();
            return this.eventType;
        }
        public void _invalidateEventType() { this.eventType = null; }
        private VlqBase128Be vTime;
        private int eventHeader;
        private MetaEventBody metaEventBody;
        private SysexEventBody sysexBody;
        private KaitaiStruct.ReadWrite eventBody;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvents _parent;
        public VlqBase128Be vTime() { return vTime; }
        public void setVTime(VlqBase128Be _v) { _dirty = true; vTime = _v; }
        public int eventHeader() { return eventHeader; }
        public void setEventHeader(int _v) { _dirty = true; eventHeader = _v; }
        public MetaEventBody metaEventBody() { return metaEventBody; }
        public void setMetaEventBody(MetaEventBody _v) { _dirty = true; metaEventBody = _v; }
        public SysexEventBody sysexBody() { return sysexBody; }
        public void setSysexBody(SysexEventBody _v) { _dirty = true; sysexBody = _v; }
        public KaitaiStruct.ReadWrite eventBody() { return eventBody; }
        public void setEventBody(KaitaiStruct.ReadWrite _v) { _dirty = true; eventBody = _v; }
        public StandardMidiFile _root() { return _root; }
        public void set_root(StandardMidiFile _v) { _dirty = true; _root = _v; }
        public StandardMidiFile.TrackEvents _parent() { return _parent; }
        public void set_parent(StandardMidiFile.TrackEvents _v) { _dirty = true; _parent = _v; }
    }
    public static class TrackEvents extends KaitaiStruct.ReadWrite {
        public static TrackEvents fromFile(String fileName) throws IOException {
            return new TrackEvents(new ByteBufferKaitaiStream(fileName));
        }
        public TrackEvents() {
            this(null, null, null);
        }

        public TrackEvents(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TrackEvents(KaitaiStream _io, StandardMidiFile.Track _parent) {
            this(_io, _parent, null);
        }

        public TrackEvents(KaitaiStream _io, StandardMidiFile.Track _parent, StandardMidiFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.event = new ArrayList<TrackEvent>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    TrackEvent _t_event = new TrackEvent(this._io, this, _root);
                    try {
                        _t_event._read();
                    } finally {
                        this.event.add(_t_event);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.event.size(); i++) {
                this.event.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.event.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("event", 0, this._io.size() - this._io.pos());
                this.event.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("event", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.event.size(); i++) {
                if (!Objects.equals(this.event.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("event", _root(), this.event.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.event.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("event", this, this.event.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<TrackEvent> event;
        private StandardMidiFile _root;
        private StandardMidiFile.Track _parent;
        public List<TrackEvent> event() { return event; }
        public void setEvent(List<TrackEvent> _v) { _dirty = true; event = _v; }
        public StandardMidiFile _root() { return _root; }
        public void set_root(StandardMidiFile _v) { _dirty = true; _root = _v; }
        public StandardMidiFile.Track _parent() { return _parent; }
        public void set_parent(StandardMidiFile.Track _v) { _dirty = true; _parent = _v; }
    }
    private Header hdr;
    private List<Track> tracks;
    private StandardMidiFile _root;
    private KaitaiStruct.ReadWrite _parent;
    public Header hdr() { return hdr; }
    public void setHdr(Header _v) { _dirty = true; hdr = _v; }
    public List<Track> tracks() { return tracks; }
    public void setTracks(List<Track> _v) { _dirty = true; tracks = _v; }
    public StandardMidiFile _root() { return _root; }
    public void set_root(StandardMidiFile _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

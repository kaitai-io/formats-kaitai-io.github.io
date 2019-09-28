// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;


/**
 * Standard MIDI file, typically knows just as "MID", is a standard way
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
public class StandardMidiFile extends KaitaiStruct {
    public static StandardMidiFile fromFile(String fileName) throws IOException {
        return new StandardMidiFile(new ByteBufferKaitaiStream(fileName));
    }

    public StandardMidiFile(KaitaiStream _io) {
        this(_io, null, null);
    }

    public StandardMidiFile(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public StandardMidiFile(KaitaiStream _io, KaitaiStruct _parent, StandardMidiFile _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.hdr = new Header(this._io, this, _root);
        tracks = new ArrayList<Track>(((Number) (hdr().numTracks())).intValue());
        for (int i = 0; i < hdr().numTracks(); i++) {
            this.tracks.add(new Track(this._io, this, _root));
        }
    }
    public static class TrackEvents extends KaitaiStruct {
        public static TrackEvents fromFile(String fileName) throws IOException {
            return new TrackEvents(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.event = new ArrayList<TrackEvent>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.event.add(new TrackEvent(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<TrackEvent> event;
        private StandardMidiFile _root;
        private StandardMidiFile.Track _parent;
        public ArrayList<TrackEvent> event() { return event; }
        public StandardMidiFile _root() { return _root; }
        public StandardMidiFile.Track _parent() { return _parent; }
    }
    public static class TrackEvent extends KaitaiStruct {
        public static TrackEvent fromFile(String fileName) throws IOException {
            return new TrackEvent(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.vTime = new VlqBase128Be(this._io);
            this.eventHeader = this._io.readU1();
            if (eventHeader() == 255) {
                this.metaEventBody = new MetaEventBody(this._io, this, _root);
            }
            if (eventHeader() == 240) {
                this.sysexBody = new SysexEventBody(this._io, this, _root);
            }
            switch (eventType()) {
            case 224: {
                this.eventBody = new PitchBendEvent(this._io, this, _root);
                break;
            }
            case 144: {
                this.eventBody = new NoteOnEvent(this._io, this, _root);
                break;
            }
            case 208: {
                this.eventBody = new ChannelPressureEvent(this._io, this, _root);
                break;
            }
            case 192: {
                this.eventBody = new ProgramChangeEvent(this._io, this, _root);
                break;
            }
            case 160: {
                this.eventBody = new PolyphonicPressureEvent(this._io, this, _root);
                break;
            }
            case 176: {
                this.eventBody = new ControllerEvent(this._io, this, _root);
                break;
            }
            case 128: {
                this.eventBody = new NoteOffEvent(this._io, this, _root);
                break;
            }
            }
        }
        private Integer eventType;
        public Integer eventType() {
            if (this.eventType != null)
                return this.eventType;
            int _tmp = (int) ((eventHeader() & 240));
            this.eventType = _tmp;
            return this.eventType;
        }
        private Integer channel;
        public Integer channel() {
            if (this.channel != null)
                return this.channel;
            if (eventType() != 240) {
                int _tmp = (int) ((eventHeader() & 15));
                this.channel = _tmp;
            }
            return this.channel;
        }
        private VlqBase128Be vTime;
        private int eventHeader;
        private MetaEventBody metaEventBody;
        private SysexEventBody sysexBody;
        private KaitaiStruct eventBody;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvents _parent;
        public VlqBase128Be vTime() { return vTime; }
        public int eventHeader() { return eventHeader; }
        public MetaEventBody metaEventBody() { return metaEventBody; }
        public SysexEventBody sysexBody() { return sysexBody; }
        public KaitaiStruct eventBody() { return eventBody; }
        public StandardMidiFile _root() { return _root; }
        public StandardMidiFile.TrackEvents _parent() { return _parent; }
    }
    public static class PitchBendEvent extends KaitaiStruct {
        public static PitchBendEvent fromFile(String fileName) throws IOException {
            return new PitchBendEvent(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.b1 = this._io.readU1();
            this.b2 = this._io.readU1();
        }
        private Integer bendValue;
        public Integer bendValue() {
            if (this.bendValue != null)
                return this.bendValue;
            int _tmp = (int) ((((b2() << 7) + b1()) - 16384));
            this.bendValue = _tmp;
            return this.bendValue;
        }
        private Integer adjBendValue;
        public Integer adjBendValue() {
            if (this.adjBendValue != null)
                return this.adjBendValue;
            int _tmp = (int) ((bendValue() - 16384));
            this.adjBendValue = _tmp;
            return this.adjBendValue;
        }
        private int b1;
        private int b2;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvent _parent;
        public int b1() { return b1; }
        public int b2() { return b2; }
        public StandardMidiFile _root() { return _root; }
        public StandardMidiFile.TrackEvent _parent() { return _parent; }
    }
    public static class ProgramChangeEvent extends KaitaiStruct {
        public static ProgramChangeEvent fromFile(String fileName) throws IOException {
            return new ProgramChangeEvent(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.program = this._io.readU1();
        }
        private int program;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvent _parent;
        public int program() { return program; }
        public StandardMidiFile _root() { return _root; }
        public StandardMidiFile.TrackEvent _parent() { return _parent; }
    }
    public static class NoteOnEvent extends KaitaiStruct {
        public static NoteOnEvent fromFile(String fileName) throws IOException {
            return new NoteOnEvent(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.note = this._io.readU1();
            this.velocity = this._io.readU1();
        }
        private int note;
        private int velocity;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvent _parent;
        public int note() { return note; }
        public int velocity() { return velocity; }
        public StandardMidiFile _root() { return _root; }
        public StandardMidiFile.TrackEvent _parent() { return _parent; }
    }
    public static class PolyphonicPressureEvent extends KaitaiStruct {
        public static PolyphonicPressureEvent fromFile(String fileName) throws IOException {
            return new PolyphonicPressureEvent(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.note = this._io.readU1();
            this.pressure = this._io.readU1();
        }
        private int note;
        private int pressure;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvent _parent;
        public int note() { return note; }
        public int pressure() { return pressure; }
        public StandardMidiFile _root() { return _root; }
        public StandardMidiFile.TrackEvent _parent() { return _parent; }
    }
    public static class Track extends KaitaiStruct {
        public static Track fromFile(String fileName) throws IOException {
            return new Track(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.magic = this._io.ensureFixedContents(new byte[] { 77, 84, 114, 107 });
            this.lenEvents = this._io.readU4be();
            this._raw_events = this._io.readBytes(lenEvents());
            KaitaiStream _io__raw_events = new ByteBufferKaitaiStream(_raw_events);
            this.events = new TrackEvents(_io__raw_events, this, _root);
        }
        private byte[] magic;
        private long lenEvents;
        private TrackEvents events;
        private StandardMidiFile _root;
        private StandardMidiFile _parent;
        private byte[] _raw_events;
        public byte[] magic() { return magic; }
        public long lenEvents() { return lenEvents; }
        public TrackEvents events() { return events; }
        public StandardMidiFile _root() { return _root; }
        public StandardMidiFile _parent() { return _parent; }
        public byte[] _raw_events() { return _raw_events; }
    }
    public static class MetaEventBody extends KaitaiStruct {
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
            _read();
        }
        private void _read() {
            this.metaType = MetaTypeEnum.byId(this._io.readU1());
            this.len = new VlqBase128Be(this._io);
            this.body = this._io.readBytes(len().value());
        }
        private MetaTypeEnum metaType;
        private VlqBase128Be len;
        private byte[] body;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvent _parent;
        public MetaTypeEnum metaType() { return metaType; }
        public VlqBase128Be len() { return len; }
        public byte[] body() { return body; }
        public StandardMidiFile _root() { return _root; }
        public StandardMidiFile.TrackEvent _parent() { return _parent; }
    }
    public static class ControllerEvent extends KaitaiStruct {
        public static ControllerEvent fromFile(String fileName) throws IOException {
            return new ControllerEvent(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.controller = this._io.readU1();
            this.value = this._io.readU1();
        }
        private int controller;
        private int value;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvent _parent;
        public int controller() { return controller; }
        public int value() { return value; }
        public StandardMidiFile _root() { return _root; }
        public StandardMidiFile.TrackEvent _parent() { return _parent; }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.magic = this._io.ensureFixedContents(new byte[] { 77, 84, 104, 100 });
            this.lenHeader = this._io.readU4be();
            this.format = this._io.readU2be();
            this.numTracks = this._io.readU2be();
            this.division = this._io.readS2be();
        }
        private byte[] magic;
        private long lenHeader;
        private int format;
        private int numTracks;
        private short division;
        private StandardMidiFile _root;
        private StandardMidiFile _parent;
        public byte[] magic() { return magic; }
        public long lenHeader() { return lenHeader; }
        public int format() { return format; }
        public int numTracks() { return numTracks; }
        public short division() { return division; }
        public StandardMidiFile _root() { return _root; }
        public StandardMidiFile _parent() { return _parent; }
    }
    public static class SysexEventBody extends KaitaiStruct {
        public static SysexEventBody fromFile(String fileName) throws IOException {
            return new SysexEventBody(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.len = new VlqBase128Be(this._io);
            this.data = this._io.readBytes(len().value());
        }
        private VlqBase128Be len;
        private byte[] data;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvent _parent;
        public VlqBase128Be len() { return len; }
        public byte[] data() { return data; }
        public StandardMidiFile _root() { return _root; }
        public StandardMidiFile.TrackEvent _parent() { return _parent; }
    }
    public static class NoteOffEvent extends KaitaiStruct {
        public static NoteOffEvent fromFile(String fileName) throws IOException {
            return new NoteOffEvent(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.note = this._io.readU1();
            this.velocity = this._io.readU1();
        }
        private int note;
        private int velocity;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvent _parent;
        public int note() { return note; }
        public int velocity() { return velocity; }
        public StandardMidiFile _root() { return _root; }
        public StandardMidiFile.TrackEvent _parent() { return _parent; }
    }
    public static class ChannelPressureEvent extends KaitaiStruct {
        public static ChannelPressureEvent fromFile(String fileName) throws IOException {
            return new ChannelPressureEvent(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.pressure = this._io.readU1();
        }
        private int pressure;
        private StandardMidiFile _root;
        private StandardMidiFile.TrackEvent _parent;
        public int pressure() { return pressure; }
        public StandardMidiFile _root() { return _root; }
        public StandardMidiFile.TrackEvent _parent() { return _parent; }
    }
    private Header hdr;
    private ArrayList<Track> tracks;
    private StandardMidiFile _root;
    private KaitaiStruct _parent;
    public Header hdr() { return hdr; }
    public ArrayList<Track> tracks() { return tracks; }
    public StandardMidiFile _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

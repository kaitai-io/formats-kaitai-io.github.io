// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Standard MIDI file, typically knows just as &quot;MID&quot;, is a standard way
    /// to serialize series of MIDI events, which is a protocol used in many
    /// music synthesizers to transfer music data: notes being played,
    /// effects being applied, etc.
    /// 
    /// Internally, file consists of a header and series of tracks, every
    /// track listing MIDI events with certain header designating time these
    /// events are happening.
    /// 
    /// NOTE: Rarely, MIDI files employ certain stateful compression scheme
    /// to avoid storing certain elements of further elements, instead
    /// reusing them from events which happened earlier in the
    /// stream. Kaitai Struct (as of v0.9) is currently unable to parse
    /// these, but files employing this mechanism are relatively rare.
    /// </summary>
    public partial class StandardMidiFile : KaitaiStruct
    {
        public static StandardMidiFile FromFile(string fileName)
        {
            return new StandardMidiFile(new KaitaiStream(fileName));
        }

        public StandardMidiFile(KaitaiStream p__io, KaitaiStruct p__parent = null, StandardMidiFile p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _hdr = new Header(m_io, this, m_root);
            _tracks = new List<Track>((int) (Hdr.NumTracks));
            for (var i = 0; i < Hdr.NumTracks; i++)
            {
                _tracks.Add(new Track(m_io, this, m_root));
            }
        }
        public partial class TrackEvents : KaitaiStruct
        {
            public static TrackEvents FromFile(string fileName)
            {
                return new TrackEvents(new KaitaiStream(fileName));
            }

            public TrackEvents(KaitaiStream p__io, StandardMidiFile.Track p__parent = null, StandardMidiFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _event = new List<TrackEvent>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _event.Add(new TrackEvent(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<TrackEvent> _event;
            private StandardMidiFile m_root;
            private StandardMidiFile.Track m_parent;
            public List<TrackEvent> Event { get { return _event; } }
            public StandardMidiFile M_Root { get { return m_root; } }
            public StandardMidiFile.Track M_Parent { get { return m_parent; } }
        }
        public partial class TrackEvent : KaitaiStruct
        {
            public static TrackEvent FromFile(string fileName)
            {
                return new TrackEvent(new KaitaiStream(fileName));
            }

            public TrackEvent(KaitaiStream p__io, StandardMidiFile.TrackEvents p__parent = null, StandardMidiFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_eventType = false;
                f_channel = false;
                _read();
            }
            private void _read()
            {
                _vTime = new VlqBase128Be(m_io);
                _eventHeader = m_io.ReadU1();
                if (EventHeader == 255) {
                    _metaEventBody = new MetaEventBody(m_io, this, m_root);
                }
                if (EventHeader == 240) {
                    _sysexBody = new SysexEventBody(m_io, this, m_root);
                }
                switch (EventType) {
                case 224: {
                    _eventBody = new PitchBendEvent(m_io, this, m_root);
                    break;
                }
                case 144: {
                    _eventBody = new NoteOnEvent(m_io, this, m_root);
                    break;
                }
                case 208: {
                    _eventBody = new ChannelPressureEvent(m_io, this, m_root);
                    break;
                }
                case 192: {
                    _eventBody = new ProgramChangeEvent(m_io, this, m_root);
                    break;
                }
                case 160: {
                    _eventBody = new PolyphonicPressureEvent(m_io, this, m_root);
                    break;
                }
                case 176: {
                    _eventBody = new ControllerEvent(m_io, this, m_root);
                    break;
                }
                case 128: {
                    _eventBody = new NoteOffEvent(m_io, this, m_root);
                    break;
                }
                }
            }
            private bool f_eventType;
            private int _eventType;
            public int EventType
            {
                get
                {
                    if (f_eventType)
                        return _eventType;
                    _eventType = (int) ((EventHeader & 240));
                    f_eventType = true;
                    return _eventType;
                }
            }
            private bool f_channel;
            private int? _channel;
            public int? Channel
            {
                get
                {
                    if (f_channel)
                        return _channel;
                    if (EventType != 240) {
                        _channel = (int) ((EventHeader & 15));
                    }
                    f_channel = true;
                    return _channel;
                }
            }
            private VlqBase128Be _vTime;
            private byte _eventHeader;
            private MetaEventBody _metaEventBody;
            private SysexEventBody _sysexBody;
            private KaitaiStruct _eventBody;
            private StandardMidiFile m_root;
            private StandardMidiFile.TrackEvents m_parent;
            public VlqBase128Be VTime { get { return _vTime; } }
            public byte EventHeader { get { return _eventHeader; } }
            public MetaEventBody MetaEventBody { get { return _metaEventBody; } }
            public SysexEventBody SysexBody { get { return _sysexBody; } }
            public KaitaiStruct EventBody { get { return _eventBody; } }
            public StandardMidiFile M_Root { get { return m_root; } }
            public StandardMidiFile.TrackEvents M_Parent { get { return m_parent; } }
        }
        public partial class PitchBendEvent : KaitaiStruct
        {
            public static PitchBendEvent FromFile(string fileName)
            {
                return new PitchBendEvent(new KaitaiStream(fileName));
            }

            public PitchBendEvent(KaitaiStream p__io, StandardMidiFile.TrackEvent p__parent = null, StandardMidiFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_bendValue = false;
                f_adjBendValue = false;
                _read();
            }
            private void _read()
            {
                _b1 = m_io.ReadU1();
                _b2 = m_io.ReadU1();
            }
            private bool f_bendValue;
            private int _bendValue;
            public int BendValue
            {
                get
                {
                    if (f_bendValue)
                        return _bendValue;
                    _bendValue = (int) ((((B2 << 7) + B1) - 16384));
                    f_bendValue = true;
                    return _bendValue;
                }
            }
            private bool f_adjBendValue;
            private int _adjBendValue;
            public int AdjBendValue
            {
                get
                {
                    if (f_adjBendValue)
                        return _adjBendValue;
                    _adjBendValue = (int) ((BendValue - 16384));
                    f_adjBendValue = true;
                    return _adjBendValue;
                }
            }
            private byte _b1;
            private byte _b2;
            private StandardMidiFile m_root;
            private StandardMidiFile.TrackEvent m_parent;
            public byte B1 { get { return _b1; } }
            public byte B2 { get { return _b2; } }
            public StandardMidiFile M_Root { get { return m_root; } }
            public StandardMidiFile.TrackEvent M_Parent { get { return m_parent; } }
        }
        public partial class ProgramChangeEvent : KaitaiStruct
        {
            public static ProgramChangeEvent FromFile(string fileName)
            {
                return new ProgramChangeEvent(new KaitaiStream(fileName));
            }

            public ProgramChangeEvent(KaitaiStream p__io, StandardMidiFile.TrackEvent p__parent = null, StandardMidiFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _program = m_io.ReadU1();
            }
            private byte _program;
            private StandardMidiFile m_root;
            private StandardMidiFile.TrackEvent m_parent;
            public byte Program { get { return _program; } }
            public StandardMidiFile M_Root { get { return m_root; } }
            public StandardMidiFile.TrackEvent M_Parent { get { return m_parent; } }
        }
        public partial class NoteOnEvent : KaitaiStruct
        {
            public static NoteOnEvent FromFile(string fileName)
            {
                return new NoteOnEvent(new KaitaiStream(fileName));
            }

            public NoteOnEvent(KaitaiStream p__io, StandardMidiFile.TrackEvent p__parent = null, StandardMidiFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _note = m_io.ReadU1();
                _velocity = m_io.ReadU1();
            }
            private byte _note;
            private byte _velocity;
            private StandardMidiFile m_root;
            private StandardMidiFile.TrackEvent m_parent;
            public byte Note { get { return _note; } }
            public byte Velocity { get { return _velocity; } }
            public StandardMidiFile M_Root { get { return m_root; } }
            public StandardMidiFile.TrackEvent M_Parent { get { return m_parent; } }
        }
        public partial class PolyphonicPressureEvent : KaitaiStruct
        {
            public static PolyphonicPressureEvent FromFile(string fileName)
            {
                return new PolyphonicPressureEvent(new KaitaiStream(fileName));
            }

            public PolyphonicPressureEvent(KaitaiStream p__io, StandardMidiFile.TrackEvent p__parent = null, StandardMidiFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _note = m_io.ReadU1();
                _pressure = m_io.ReadU1();
            }
            private byte _note;
            private byte _pressure;
            private StandardMidiFile m_root;
            private StandardMidiFile.TrackEvent m_parent;
            public byte Note { get { return _note; } }
            public byte Pressure { get { return _pressure; } }
            public StandardMidiFile M_Root { get { return m_root; } }
            public StandardMidiFile.TrackEvent M_Parent { get { return m_parent; } }
        }
        public partial class Track : KaitaiStruct
        {
            public static Track FromFile(string fileName)
            {
                return new Track(new KaitaiStream(fileName));
            }

            public Track(KaitaiStream p__io, StandardMidiFile p__parent = null, StandardMidiFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.EnsureFixedContents(new byte[] { 77, 84, 114, 107 });
                _lenEvents = m_io.ReadU4be();
                __raw_events = m_io.ReadBytes(LenEvents);
                var io___raw_events = new KaitaiStream(__raw_events);
                _events = new TrackEvents(io___raw_events, this, m_root);
            }
            private byte[] _magic;
            private uint _lenEvents;
            private TrackEvents _events;
            private StandardMidiFile m_root;
            private StandardMidiFile m_parent;
            private byte[] __raw_events;
            public byte[] Magic { get { return _magic; } }
            public uint LenEvents { get { return _lenEvents; } }
            public TrackEvents Events { get { return _events; } }
            public StandardMidiFile M_Root { get { return m_root; } }
            public StandardMidiFile M_Parent { get { return m_parent; } }
            public byte[] M_RawEvents { get { return __raw_events; } }
        }
        public partial class MetaEventBody : KaitaiStruct
        {
            public static MetaEventBody FromFile(string fileName)
            {
                return new MetaEventBody(new KaitaiStream(fileName));
            }


            public enum MetaTypeEnum
            {
                SequenceNumber = 0,
                TextEvent = 1,
                Copyright = 2,
                SequenceTrackName = 3,
                InstrumentName = 4,
                LyricText = 5,
                MarkerText = 6,
                CuePoint = 7,
                MidiChannelPrefixAssignment = 32,
                EndOfTrack = 47,
                Tempo = 81,
                SmpteOffset = 84,
                TimeSignature = 88,
                KeySignature = 89,
                SequencerSpecificEvent = 127,
            }
            public MetaEventBody(KaitaiStream p__io, StandardMidiFile.TrackEvent p__parent = null, StandardMidiFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _metaType = ((MetaTypeEnum) m_io.ReadU1());
                _len = new VlqBase128Be(m_io);
                _body = m_io.ReadBytes(Len.Value);
            }
            private MetaTypeEnum _metaType;
            private VlqBase128Be _len;
            private byte[] _body;
            private StandardMidiFile m_root;
            private StandardMidiFile.TrackEvent m_parent;
            public MetaTypeEnum MetaType { get { return _metaType; } }
            public VlqBase128Be Len { get { return _len; } }
            public byte[] Body { get { return _body; } }
            public StandardMidiFile M_Root { get { return m_root; } }
            public StandardMidiFile.TrackEvent M_Parent { get { return m_parent; } }
        }
        public partial class ControllerEvent : KaitaiStruct
        {
            public static ControllerEvent FromFile(string fileName)
            {
                return new ControllerEvent(new KaitaiStream(fileName));
            }

            public ControllerEvent(KaitaiStream p__io, StandardMidiFile.TrackEvent p__parent = null, StandardMidiFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _controller = m_io.ReadU1();
                _value = m_io.ReadU1();
            }
            private byte _controller;
            private byte _value;
            private StandardMidiFile m_root;
            private StandardMidiFile.TrackEvent m_parent;
            public byte Controller { get { return _controller; } }
            public byte Value { get { return _value; } }
            public StandardMidiFile M_Root { get { return m_root; } }
            public StandardMidiFile.TrackEvent M_Parent { get { return m_parent; } }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, StandardMidiFile p__parent = null, StandardMidiFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.EnsureFixedContents(new byte[] { 77, 84, 104, 100 });
                _lenHeader = m_io.ReadU4be();
                _format = m_io.ReadU2be();
                _numTracks = m_io.ReadU2be();
                _division = m_io.ReadS2be();
            }
            private byte[] _magic;
            private uint _lenHeader;
            private ushort _format;
            private ushort _numTracks;
            private short _division;
            private StandardMidiFile m_root;
            private StandardMidiFile m_parent;
            public byte[] Magic { get { return _magic; } }
            public uint LenHeader { get { return _lenHeader; } }
            public ushort Format { get { return _format; } }
            public ushort NumTracks { get { return _numTracks; } }
            public short Division { get { return _division; } }
            public StandardMidiFile M_Root { get { return m_root; } }
            public StandardMidiFile M_Parent { get { return m_parent; } }
        }
        public partial class SysexEventBody : KaitaiStruct
        {
            public static SysexEventBody FromFile(string fileName)
            {
                return new SysexEventBody(new KaitaiStream(fileName));
            }

            public SysexEventBody(KaitaiStream p__io, StandardMidiFile.TrackEvent p__parent = null, StandardMidiFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = new VlqBase128Be(m_io);
                _data = m_io.ReadBytes(Len.Value);
            }
            private VlqBase128Be _len;
            private byte[] _data;
            private StandardMidiFile m_root;
            private StandardMidiFile.TrackEvent m_parent;
            public VlqBase128Be Len { get { return _len; } }
            public byte[] Data { get { return _data; } }
            public StandardMidiFile M_Root { get { return m_root; } }
            public StandardMidiFile.TrackEvent M_Parent { get { return m_parent; } }
        }
        public partial class NoteOffEvent : KaitaiStruct
        {
            public static NoteOffEvent FromFile(string fileName)
            {
                return new NoteOffEvent(new KaitaiStream(fileName));
            }

            public NoteOffEvent(KaitaiStream p__io, StandardMidiFile.TrackEvent p__parent = null, StandardMidiFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _note = m_io.ReadU1();
                _velocity = m_io.ReadU1();
            }
            private byte _note;
            private byte _velocity;
            private StandardMidiFile m_root;
            private StandardMidiFile.TrackEvent m_parent;
            public byte Note { get { return _note; } }
            public byte Velocity { get { return _velocity; } }
            public StandardMidiFile M_Root { get { return m_root; } }
            public StandardMidiFile.TrackEvent M_Parent { get { return m_parent; } }
        }
        public partial class ChannelPressureEvent : KaitaiStruct
        {
            public static ChannelPressureEvent FromFile(string fileName)
            {
                return new ChannelPressureEvent(new KaitaiStream(fileName));
            }

            public ChannelPressureEvent(KaitaiStream p__io, StandardMidiFile.TrackEvent p__parent = null, StandardMidiFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _pressure = m_io.ReadU1();
            }
            private byte _pressure;
            private StandardMidiFile m_root;
            private StandardMidiFile.TrackEvent m_parent;
            public byte Pressure { get { return _pressure; } }
            public StandardMidiFile M_Root { get { return m_root; } }
            public StandardMidiFile.TrackEvent M_Parent { get { return m_parent; } }
        }
        private Header _hdr;
        private List<Track> _tracks;
        private StandardMidiFile m_root;
        private KaitaiStruct m_parent;
        public Header Hdr { get { return _hdr; } }
        public List<Track> Tracks { get { return _tracks; } }
        public StandardMidiFile M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

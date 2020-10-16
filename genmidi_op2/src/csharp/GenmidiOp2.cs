// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// GENMIDI.OP2 is a sound bank file used by players based on DMX sound
    /// library to play MIDI files with General MIDI instruments using OPL2
    /// sound chip (which was commonly installed on popular AdLib and Sound
    /// Blaster sound cards).
    /// 
    /// Major users of DMX sound library include:
    /// 
    /// * Original Doom game engine (and games based on it: Heretic, Hexen, Strife, Chex Quest)
    /// * Raptor: Call of the Shadows 
    /// </summary>
    /// <remarks>
    /// Reference: <a href="http://www.fit.vutbr.cz/~arnost/muslib/op2_form.zip">http://doom.wikia.com/wiki/GENMIDI</a>
    /// </remarks>
    public partial class GenmidiOp2 : KaitaiStruct
    {
        public static GenmidiOp2 FromFile(string fileName)
        {
            return new GenmidiOp2(new KaitaiStream(fileName));
        }

        public GenmidiOp2(KaitaiStream p__io, KaitaiStruct p__parent = null, GenmidiOp2 p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(8);
            if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 35, 79, 80, 76, 95, 73, 73, 35 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 35, 79, 80, 76, 95, 73, 73, 35 }, Magic, M_Io, "/seq/0");
            }
            _instruments = new List<InstrumentEntry>((int) (175));
            for (var i = 0; i < 175; i++)
            {
                _instruments.Add(new InstrumentEntry(m_io, this, m_root));
            }
            _instrumentNames = new List<string>((int) (175));
            for (var i = 0; i < 175; i++)
            {
                _instrumentNames.Add(System.Text.Encoding.GetEncoding("ASCII").GetString(KaitaiStream.BytesTerminate(KaitaiStream.BytesStripRight(m_io.ReadBytes(32), 0), 0, false)));
            }
        }
        public partial class InstrumentEntry : KaitaiStruct
        {
            public static InstrumentEntry FromFile(string fileName)
            {
                return new InstrumentEntry(new KaitaiStream(fileName));
            }

            public InstrumentEntry(KaitaiStream p__io, GenmidiOp2 p__parent = null, GenmidiOp2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _flags = m_io.ReadU2le();
                _finetune = m_io.ReadU1();
                _note = m_io.ReadU1();
                _instruments = new List<Instrument>((int) (2));
                for (var i = 0; i < 2; i++)
                {
                    _instruments.Add(new Instrument(m_io, this, m_root));
                }
            }
            private ushort _flags;
            private byte _finetune;
            private byte _note;
            private List<Instrument> _instruments;
            private GenmidiOp2 m_root;
            private GenmidiOp2 m_parent;
            public ushort Flags { get { return _flags; } }
            public byte Finetune { get { return _finetune; } }

            /// <summary>
            /// MIDI note for fixed instruments, 0 otherwise
            /// </summary>
            public byte Note { get { return _note; } }
            public List<Instrument> Instruments { get { return _instruments; } }
            public GenmidiOp2 M_Root { get { return m_root; } }
            public GenmidiOp2 M_Parent { get { return m_parent; } }
        }
        public partial class Instrument : KaitaiStruct
        {
            public static Instrument FromFile(string fileName)
            {
                return new Instrument(new KaitaiStream(fileName));
            }

            public Instrument(KaitaiStream p__io, GenmidiOp2.InstrumentEntry p__parent = null, GenmidiOp2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _op1 = new OpSettings(m_io, this, m_root);
                _feedback = m_io.ReadU1();
                _op2 = new OpSettings(m_io, this, m_root);
                _unused = m_io.ReadU1();
                _baseNote = m_io.ReadS2le();
            }
            private OpSettings _op1;
            private byte _feedback;
            private OpSettings _op2;
            private byte _unused;
            private short _baseNote;
            private GenmidiOp2 m_root;
            private GenmidiOp2.InstrumentEntry m_parent;
            public OpSettings Op1 { get { return _op1; } }

            /// <summary>
            /// Feedback/AM-FM (both operators)
            /// </summary>
            public byte Feedback { get { return _feedback; } }
            public OpSettings Op2 { get { return _op2; } }
            public byte Unused { get { return _unused; } }

            /// <summary>
            /// Base note offset
            /// </summary>
            public short BaseNote { get { return _baseNote; } }
            public GenmidiOp2 M_Root { get { return m_root; } }
            public GenmidiOp2.InstrumentEntry M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// OPL2 settings for one operator (carrier or modulator)
        /// </summary>
        public partial class OpSettings : KaitaiStruct
        {
            public static OpSettings FromFile(string fileName)
            {
                return new OpSettings(new KaitaiStream(fileName));
            }

            public OpSettings(KaitaiStream p__io, GenmidiOp2.Instrument p__parent = null, GenmidiOp2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _tremVibr = m_io.ReadU1();
                _attDec = m_io.ReadU1();
                _sustRel = m_io.ReadU1();
                _wave = m_io.ReadU1();
                _scale = m_io.ReadU1();
                _level = m_io.ReadU1();
            }
            private byte _tremVibr;
            private byte _attDec;
            private byte _sustRel;
            private byte _wave;
            private byte _scale;
            private byte _level;
            private GenmidiOp2 m_root;
            private GenmidiOp2.Instrument m_parent;

            /// <summary>
            /// Tremolo/vibrato/sustain/KSR/multi
            /// </summary>
            public byte TremVibr { get { return _tremVibr; } }

            /// <summary>
            /// Attack rate/decay rate
            /// </summary>
            public byte AttDec { get { return _attDec; } }

            /// <summary>
            /// Sustain level/release rate
            /// </summary>
            public byte SustRel { get { return _sustRel; } }

            /// <summary>
            /// Waveform select
            /// </summary>
            public byte Wave { get { return _wave; } }

            /// <summary>
            /// Key scale level
            /// </summary>
            public byte Scale { get { return _scale; } }

            /// <summary>
            /// Output level
            /// </summary>
            public byte Level { get { return _level; } }
            public GenmidiOp2 M_Root { get { return m_root; } }
            public GenmidiOp2.Instrument M_Parent { get { return m_parent; } }
        }
        private byte[] _magic;
        private List<InstrumentEntry> _instruments;
        private List<string> _instrumentNames;
        private GenmidiOp2 m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic { get { return _magic; } }
        public List<InstrumentEntry> Instruments { get { return _instruments; } }
        public List<string> InstrumentNames { get { return _instrumentNames; } }
        public GenmidiOp2 M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

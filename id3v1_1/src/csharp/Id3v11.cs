// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// ID3v1.1 tag is a method to store simple metadata in .mp3 files. The
    /// tag is appended to the end of file and spans exactly 128 bytes.
    /// 
    /// This type is supposed to be used on full .mp3 files, seeking to
    /// proper position automatically. If you're interesting in parsing only
    /// the tag itself, please use `id3v1_1::id3_v1_1_tag` subtype.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="http://id3.org/ID3v1">Source</a>
    /// </remarks>
    public partial class Id3v11 : KaitaiStruct
    {
        public static Id3v11 FromFile(string fileName)
        {
            return new Id3v11(new KaitaiStream(fileName));
        }

        public Id3v11(KaitaiStream io, KaitaiStruct parent = null, Id3v11 root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            f_id3v1Tag = false;
            _read();
        }
        private void _read() {
            }

        /// <summary>
        /// ID3v1.1 tag itself, a fixed size 128 byte structure. Contains
        /// several metadata fields as fixed-size strings.
        /// 
        /// Note that string encoding is not specified by standard, so real
        /// encoding used would vary a lot from one implementation to
        /// another. Most Windows-based applications tend to use &quot;ANSI&quot;
        /// (i.e. locale-dependent encoding, usually one byte per
        /// character). Some embedded applications allow selection of
        /// charset.
        /// </summary>
        public partial class Id3V11Tag : KaitaiStruct
        {
            public static Id3V11Tag FromFile(string fileName)
            {
                return new Id3V11Tag(new KaitaiStream(fileName));
            }

            public enum GenreEnum
            {
                Blues = 0,
                ClassicRock = 1,
                Country = 2,
                Dance = 3,
                Disco = 4,
                Funk = 5,
                Grunge = 6,
                HipHop = 7,
                Jazz = 8,
                Metal = 9,
                NewAge = 10,
                Oldies = 11,
                Other = 12,
                Pop = 13,
                Rnb = 14,
                Rap = 15,
                Reggae = 16,
                Rock = 17,
                Techno = 18,
                Industrial = 19,
                Alternative = 20,
                Ska = 21,
                DeathMetal = 22,
                Pranks = 23,
                Soundtrack = 24,
                EuroTechno = 25,
                Ambient = 26,
                TripHop = 27,
                Vocal = 28,
                JazzFunk = 29,
                Fusion = 30,
                Trance = 31,
                Classical = 32,
                Instrumental = 33,
                Acid = 34,
                House = 35,
                Game = 36,
                SoundClip = 37,
                Gospel = 38,
                Noise = 39,
                Alternrock = 40,
                Bass = 41,
                Soul = 42,
                Punk = 43,
                Space = 44,
                Meditative = 45,
                InstrumentalPop = 46,
                InstrumentalRock = 47,
                Ethnic = 48,
                Gothic = 49,
                Darkwave = 50,
                TechnoIndustrial = 51,
                Electronic = 52,
                PopFolk = 53,
                Eurodance = 54,
                Dream = 55,
                SouthernRock = 56,
                Comedy = 57,
                Cult = 58,
                Gangsta = 59,
                Top40 = 60,
                ChristianRap = 61,
                PopFunk = 62,
                Jungle = 63,
                NativeAmerican = 64,
                Cabaret = 65,
                NewWave = 66,
                Psychadelic = 67,
                Rave = 68,
                Showtunes = 69,
                Trailer = 70,
                LoFi = 71,
                Tribal = 72,
                AcidPunk = 73,
                AcidJazz = 74,
                Polka = 75,
                Retro = 76,
                Musical = 77,
                RockNRoll = 78,
                HardRock = 79,
                Folk = 80,
                FolkRock = 81,
                NationalFolk = 82,
                Swing = 83,
                FastFusion = 84,
                Bebob = 85,
                Latin = 86,
                Revival = 87,
                Celtic = 88,
                Bluegrass = 89,
                Avantgarde = 90,
                GothicRock = 91,
                ProgressiveRock = 92,
                PsychedelicRock = 93,
                SymphonicRock = 94,
                SlowRock = 95,
                BigBand = 96,
                Chorus = 97,
                EasyListening = 98,
                Acoustic = 99,
                Humour = 100,
                Speech = 101,
                Chanson = 102,
                Opera = 103,
                ChamberMusic = 104,
                Sonata = 105,
                Symphony = 106,
                BootyBass = 107,
                Primus = 108,
                PornGroove = 109,
                Satire = 110,
                SlowJam = 111,
                Club = 112,
                Tango = 113,
                Samba = 114,
                Folklore = 115,
                Ballad = 116,
                PowerBallad = 117,
                RhythmicSoul = 118,
                Freestyle = 119,
                Duet = 120,
                PunkRock = 121,
                DrumSolo = 122,
                ACapella = 123,
                EuroHouse = 124,
                DanceHall = 125,
            }

            public Id3V11Tag(KaitaiStream io, Id3v11 parent = null, Id3v11 root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _magic = m_io.EnsureFixedContents(new byte[] { 84, 65, 71 });
                _title = m_io.ReadBytes(30);
                _artist = m_io.ReadBytes(30);
                _album = m_io.ReadBytes(30);
                _year = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
                _comment = m_io.ReadBytes(30);
                _genre = ((GenreEnum) m_io.ReadU1());
                }
            private byte[] _magic;
            private byte[] _title;
            private byte[] _artist;
            private byte[] _album;
            private string _year;
            private byte[] _comment;
            private GenreEnum _genre;
            private Id3v11 m_root;
            private Id3v11 m_parent;
            public byte[] Magic { get { return _magic; } }

            /// <summary>
            /// Song title
            /// </summary>
            public byte[] Title { get { return _title; } }

            /// <summary>
            /// Artist name
            /// </summary>
            public byte[] Artist { get { return _artist; } }

            /// <summary>
            /// Album title
            /// </summary>
            public byte[] Album { get { return _album; } }

            /// <summary>
            /// Year of release
            /// </summary>
            public string Year { get { return _year; } }

            /// <summary>
            /// Arbitary comment
            /// </summary>
            public byte[] Comment { get { return _comment; } }
            public GenreEnum Genre { get { return _genre; } }
            public Id3v11 M_Root { get { return m_root; } }
            public Id3v11 M_Parent { get { return m_parent; } }
        }
        private bool f_id3v1Tag;
        private Id3V11Tag _id3v1Tag;
        public Id3V11Tag Id3v1Tag
        {
            get
            {
                if (f_id3v1Tag)
                    return _id3v1Tag;
                long _pos = m_io.Pos;
                m_io.Seek((M_Io.Size - 128));
                _id3v1Tag = new Id3V11Tag(m_io, this, m_root);
                m_io.Seek(_pos);
                f_id3v1Tag = true;
                return _id3v1Tag;
            }
        }
        private Id3v11 m_root;
        private KaitaiStruct m_parent;
        public Id3v11 M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

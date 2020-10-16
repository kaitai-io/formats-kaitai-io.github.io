// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Warcraft II game engine uses this format for map files. External
    /// maps can be edited by official Warcraft II map editor and saved in
    /// .pud files. Maps supplied with the game (i.e. single player
    /// campaign) follow the same format, but are instead embedded inside
    /// the game container files.
    /// 
    /// There are two major versions: 0x11 (original one) and 0x13 (roughly
    /// corresponds to v1.33 of the game engine, although some of the
    /// features got limited support in v1.3).
    /// 
    /// File consists of a sequence of typed sections.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="http://cade.datamax.bg/war2x/pudspec.html">Source</a>
    /// </remarks>
    public partial class Warcraft2Pud : KaitaiStruct
    {
        public static Warcraft2Pud FromFile(string fileName)
        {
            return new Warcraft2Pud(new KaitaiStream(fileName));
        }


        public enum Controller
        {
            Computer = 1,
            PassiveComputer = 2,
            Nobody = 3,
            Computer = 4,
            Human = 5,
            RescuePassive = 6,
            RescueActive = 7,
        }

        public enum TerrainType
        {
            Forest = 0,
            Winter = 1,
            Wasteland = 2,
            Swamp = 3,
        }

        public enum UnitType
        {
            Infantry = 0,
            Grunt = 1,
            Peasant = 2,
            Peon = 3,
            Ballista = 4,
            Catapult = 5,
            Knight = 6,
            Ogre = 7,
            Archer = 8,
            Axethrower = 9,
            Mage = 10,
            DeathKnight = 11,
            Paladin = 12,
            OgreMage = 13,
            Dwarves = 14,
            GoblinSapper = 15,
            AttackPeasant = 16,
            AttackPeon = 17,
            Ranger = 18,
            Berserker = 19,
            Alleria = 20,
            TeronGorefiend = 21,
            KurdanAndSkyRee = 22,
            Dentarg = 23,
            Khadgar = 24,
            GromHellscream = 25,
            HumanTanker = 26,
            OrcTanker = 27,
            HumanTransport = 28,
            OrcTransport = 29,
            ElvenDestroyer = 30,
            TrollDestroyer = 31,
            Battleship = 32,
            Juggernaught = 33,
            Deathwing = 35,
            GnomishSubmarine = 38,
            GiantTurtle = 39,
            GnomishFlyingMachine = 40,
            GoblinZepplin = 41,
            GryphonRider = 42,
            Dragon = 43,
            Turalyon = 44,
            EyeOfKilrogg = 45,
            Danath = 46,
            KhorgathBladefist = 47,
            ChoGall = 49,
            Lothar = 50,
            GulDan = 51,
            UtherLightbringer = 52,
            Zuljin = 53,
            Skeleton = 55,
            Daemon = 56,
            Critter = 57,
            Farm = 58,
            PigFarm = 59,
            HumanBarracks = 60,
            OrcBarracks = 61,
            Church = 62,
            AltarOfStorms = 63,
            HumanScoutTower = 64,
            OrcScoutTower = 65,
            Stables = 66,
            OgreMound = 67,
            GnomishInventor = 68,
            GoblinAlchemist = 69,
            GryphonAviary = 70,
            DragonRoost = 71,
            HumanShipyard = 72,
            OrcShipyard = 73,
            TownHall = 74,
            GreatHall = 75,
            ElvenLumberMill = 76,
            TrollLumberMill = 77,
            HumanFoundry = 78,
            OrcFoundry = 79,
            MageTower = 80,
            TempleOfTheDamned = 81,
            HumanBlacksmith = 82,
            OrcBlacksmith = 83,
            HumanRefinery = 84,
            OrcRefinery = 85,
            HumanOilWell = 86,
            OrcOilWell = 87,
            Keep = 88,
            Stronghold = 89,
            Castle = 90,
            Fortress = 91,
            GoldMine = 92,
            OilPatch = 93,
            HumanStart = 94,
            OrcStart = 95,
            HumanGuardTower = 96,
            OrcGuardTower = 97,
            HumanCannonTower = 98,
            OrcCannonTower = 99,
            CircleOfPower = 100,
            DarkPortal = 101,
            Runestone = 102,
            HumanWall = 103,
            OrcWall = 104,
        }
        public Warcraft2Pud(KaitaiStream p__io, KaitaiStruct p__parent = null, Warcraft2Pud p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _sections = new List<Section>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _sections.Add(new Section(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class SectionStartingResource : KaitaiStruct
        {
            public static SectionStartingResource FromFile(string fileName)
            {
                return new SectionStartingResource(new KaitaiStream(fileName));
            }

            public SectionStartingResource(KaitaiStream p__io, Warcraft2Pud.Section p__parent = null, Warcraft2Pud p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _resourcesByPlayer = new List<ushort>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _resourcesByPlayer.Add(m_io.ReadU2le());
                        i++;
                    }
                }
            }
            private List<ushort> _resourcesByPlayer;
            private Warcraft2Pud m_root;
            private Warcraft2Pud.Section m_parent;
            public List<ushort> ResourcesByPlayer { get { return _resourcesByPlayer; } }
            public Warcraft2Pud M_Root { get { return m_root; } }
            public Warcraft2Pud.Section M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Section that specifies terrain type for this map.
        /// </summary>
        public partial class SectionEra : KaitaiStruct
        {
            public static SectionEra FromFile(string fileName)
            {
                return new SectionEra(new KaitaiStream(fileName));
            }

            public SectionEra(KaitaiStream p__io, Warcraft2Pud.Section p__parent = null, Warcraft2Pud p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _terrain = ((Warcraft2Pud.TerrainType) m_io.ReadU2le());
            }
            private TerrainType _terrain;
            private Warcraft2Pud m_root;
            private Warcraft2Pud.Section m_parent;
            public TerrainType Terrain { get { return _terrain; } }
            public Warcraft2Pud M_Root { get { return m_root; } }
            public Warcraft2Pud.Section M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Section that specifies format version.
        /// </summary>
        public partial class SectionVer : KaitaiStruct
        {
            public static SectionVer FromFile(string fileName)
            {
                return new SectionVer(new KaitaiStream(fileName));
            }

            public SectionVer(KaitaiStream p__io, Warcraft2Pud.Section p__parent = null, Warcraft2Pud p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _version = m_io.ReadU2le();
            }
            private ushort _version;
            private Warcraft2Pud m_root;
            private Warcraft2Pud.Section m_parent;
            public ushort Version { get { return _version; } }
            public Warcraft2Pud M_Root { get { return m_root; } }
            public Warcraft2Pud.Section M_Parent { get { return m_parent; } }
        }
        public partial class SectionDim : KaitaiStruct
        {
            public static SectionDim FromFile(string fileName)
            {
                return new SectionDim(new KaitaiStream(fileName));
            }

            public SectionDim(KaitaiStream p__io, Warcraft2Pud.Section p__parent = null, Warcraft2Pud p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _x = m_io.ReadU2le();
                _y = m_io.ReadU2le();
            }
            private ushort _x;
            private ushort _y;
            private Warcraft2Pud m_root;
            private Warcraft2Pud.Section m_parent;
            public ushort X { get { return _x; } }
            public ushort Y { get { return _y; } }
            public Warcraft2Pud M_Root { get { return m_root; } }
            public Warcraft2Pud.Section M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Section that confirms that this file is a &quot;map file&quot; by certain
        /// magic string and supplies a tag that could be used in
        /// multiplayer to check that all player use the same version of the
        /// map.
        /// </summary>
        public partial class SectionType : KaitaiStruct
        {
            public static SectionType FromFile(string fileName)
            {
                return new SectionType(new KaitaiStream(fileName));
            }

            public SectionType(KaitaiStream p__io, Warcraft2Pud.Section p__parent = null, Warcraft2Pud p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(10);
                if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 87, 65, 82, 50, 32, 77, 65, 80, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 87, 65, 82, 50, 32, 77, 65, 80, 0, 0 }, Magic, M_Io, "/types/section_type/seq/0");
                }
                _unused = m_io.ReadBytes(2);
                _idTag = m_io.ReadU4le();
            }
            private byte[] _magic;
            private byte[] _unused;
            private uint _idTag;
            private Warcraft2Pud m_root;
            private Warcraft2Pud.Section m_parent;
            public byte[] Magic { get { return _magic; } }

            /// <summary>
            /// unused (always set to $0a and $ff by editor, but can be anything for the game)
            /// </summary>
            public byte[] Unused { get { return _unused; } }

            /// <summary>
            /// id tag (for consistency check in multiplayer)
            /// </summary>
            public uint IdTag { get { return _idTag; } }
            public Warcraft2Pud M_Root { get { return m_root; } }
            public Warcraft2Pud.Section M_Parent { get { return m_parent; } }
        }
        public partial class SectionUnit : KaitaiStruct
        {
            public static SectionUnit FromFile(string fileName)
            {
                return new SectionUnit(new KaitaiStream(fileName));
            }

            public SectionUnit(KaitaiStream p__io, Warcraft2Pud.Section p__parent = null, Warcraft2Pud p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _units = new List<Unit>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _units.Add(new Unit(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<Unit> _units;
            private Warcraft2Pud m_root;
            private Warcraft2Pud.Section m_parent;
            public List<Unit> Units { get { return _units; } }
            public Warcraft2Pud M_Root { get { return m_root; } }
            public Warcraft2Pud.Section M_Parent { get { return m_parent; } }
        }
        public partial class Section : KaitaiStruct
        {
            public static Section FromFile(string fileName)
            {
                return new Section(new KaitaiStream(fileName));
            }

            public Section(KaitaiStream p__io, Warcraft2Pud p__parent = null, Warcraft2Pud p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _name = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
                _size = m_io.ReadU4le();
                switch (Name) {
                case "SLBR": {
                    __raw_body = m_io.ReadBytes(Size);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SectionStartingResource(io___raw_body, this, m_root);
                    break;
                }
                case "ERAX": {
                    __raw_body = m_io.ReadBytes(Size);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SectionEra(io___raw_body, this, m_root);
                    break;
                }
                case "OWNR": {
                    __raw_body = m_io.ReadBytes(Size);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SectionOwnr(io___raw_body, this, m_root);
                    break;
                }
                case "ERA ": {
                    __raw_body = m_io.ReadBytes(Size);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SectionEra(io___raw_body, this, m_root);
                    break;
                }
                case "SGLD": {
                    __raw_body = m_io.ReadBytes(Size);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SectionStartingResource(io___raw_body, this, m_root);
                    break;
                }
                case "VER ": {
                    __raw_body = m_io.ReadBytes(Size);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SectionVer(io___raw_body, this, m_root);
                    break;
                }
                case "SOIL": {
                    __raw_body = m_io.ReadBytes(Size);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SectionStartingResource(io___raw_body, this, m_root);
                    break;
                }
                case "UNIT": {
                    __raw_body = m_io.ReadBytes(Size);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SectionUnit(io___raw_body, this, m_root);
                    break;
                }
                case "DIM ": {
                    __raw_body = m_io.ReadBytes(Size);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SectionDim(io___raw_body, this, m_root);
                    break;
                }
                case "TYPE": {
                    __raw_body = m_io.ReadBytes(Size);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SectionType(io___raw_body, this, m_root);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes(Size);
                    break;
                }
                }
            }
            private string _name;
            private uint _size;
            private object _body;
            private Warcraft2Pud m_root;
            private Warcraft2Pud m_parent;
            private byte[] __raw_body;
            public string Name { get { return _name; } }
            public uint Size { get { return _size; } }
            public object Body { get { return _body; } }
            public Warcraft2Pud M_Root { get { return m_root; } }
            public Warcraft2Pud M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }

        /// <summary>
        /// Section that specifies who controls each player.
        /// </summary>
        public partial class SectionOwnr : KaitaiStruct
        {
            public static SectionOwnr FromFile(string fileName)
            {
                return new SectionOwnr(new KaitaiStream(fileName));
            }

            public SectionOwnr(KaitaiStream p__io, Warcraft2Pud.Section p__parent = null, Warcraft2Pud p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _controllerByPlayer = new List<Controller>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _controllerByPlayer.Add(((Warcraft2Pud.Controller) m_io.ReadU1()));
                        i++;
                    }
                }
            }
            private List<Controller> _controllerByPlayer;
            private Warcraft2Pud m_root;
            private Warcraft2Pud.Section m_parent;
            public List<Controller> ControllerByPlayer { get { return _controllerByPlayer; } }
            public Warcraft2Pud M_Root { get { return m_root; } }
            public Warcraft2Pud.Section M_Parent { get { return m_parent; } }
        }
        public partial class Unit : KaitaiStruct
        {
            public static Unit FromFile(string fileName)
            {
                return new Unit(new KaitaiStream(fileName));
            }

            public Unit(KaitaiStream p__io, Warcraft2Pud.SectionUnit p__parent = null, Warcraft2Pud p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_resource = false;
                _read();
            }
            private void _read()
            {
                _x = m_io.ReadU2le();
                _y = m_io.ReadU2le();
                _uType = ((Warcraft2Pud.UnitType) m_io.ReadU1());
                _owner = m_io.ReadU1();
                _options = m_io.ReadU2le();
            }
            private bool f_resource;
            private int? _resource;
            public int? Resource
            {
                get
                {
                    if (f_resource)
                        return _resource;
                    if ( ((UType == Warcraft2Pud.UnitType.GoldMine) || (UType == Warcraft2Pud.UnitType.HumanOilWell) || (UType == Warcraft2Pud.UnitType.OrcOilWell) || (UType == Warcraft2Pud.UnitType.OilPatch)) ) {
                        _resource = (int) ((Options * 2500));
                    }
                    f_resource = true;
                    return _resource;
                }
            }
            private ushort _x;
            private ushort _y;
            private UnitType _uType;
            private byte _owner;
            private ushort _options;
            private Warcraft2Pud m_root;
            private Warcraft2Pud.SectionUnit m_parent;
            public ushort X { get { return _x; } }
            public ushort Y { get { return _y; } }
            public UnitType UType { get { return _uType; } }
            public byte Owner { get { return _owner; } }

            /// <summary>
            /// if gold mine or oil well, contains 2500 * this, otherwise 0 passive 1 active
            /// </summary>
            public ushort Options { get { return _options; } }
            public Warcraft2Pud M_Root { get { return m_root; } }
            public Warcraft2Pud.SectionUnit M_Parent { get { return m_parent; } }
        }
        private List<Section> _sections;
        private Warcraft2Pud m_root;
        private KaitaiStruct m_parent;
        public List<Section> Sections { get { return _sections; } }
        public Warcraft2Pud M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

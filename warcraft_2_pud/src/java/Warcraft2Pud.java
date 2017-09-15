// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;


/**
 * Warcraft II game engine uses this format for map files. External
 * maps can be edited by official Warcraft II map editor and saved in
 * .pud files. Maps supplied with the game (i.e. single player
 * campaign) follow the same format, but are instead embedded inside
 * the game container files.
 * 
 * There are two major versions: 0x11 (original one) and 0x13 (roughly
 * corresponds to v1.33 of the game engine, although some of the
 * features got limited support in v1.3).
 * 
 * File consists of a sequence of typed sections.
 */
public class Warcraft2Pud extends KaitaiStruct {
    public static Warcraft2Pud fromFile(String fileName) throws IOException {
        return new Warcraft2Pud(new ByteBufferKaitaiStream(fileName));
    }

    public enum Controller {
        COMPUTER(1),
        PASSIVE_COMPUTER(2),
        NOBODY(3),
        COMPUTER(4),
        HUMAN(5),
        RESCUE_PASSIVE(6),
        RESCUE_ACTIVE(7);

        private final long id;
        Controller(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Controller> byId = new HashMap<Long, Controller>(7);
        static {
            for (Controller e : Controller.values())
                byId.put(e.id(), e);
        }
        public static Controller byId(long id) { return byId.get(id); }
    }

    public enum TerrainType {
        FOREST(0),
        WINTER(1),
        WASTELAND(2),
        SWAMP(3);

        private final long id;
        TerrainType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, TerrainType> byId = new HashMap<Long, TerrainType>(4);
        static {
            for (TerrainType e : TerrainType.values())
                byId.put(e.id(), e);
        }
        public static TerrainType byId(long id) { return byId.get(id); }
    }

    public enum UnitType {
        INFANTRY(0),
        GRUNT(1),
        PEASANT(2),
        PEON(3),
        BALLISTA(4),
        CATAPULT(5),
        KNIGHT(6),
        OGRE(7),
        ARCHER(8),
        AXETHROWER(9),
        MAGE(10),
        DEATH_KNIGHT(11),
        PALADIN(12),
        OGRE_MAGE(13),
        DWARVES(14),
        GOBLIN_SAPPER(15),
        ATTACK_PEASANT(16),
        ATTACK_PEON(17),
        RANGER(18),
        BERSERKER(19),
        ALLERIA(20),
        TERON_GOREFIEND(21),
        KURDAN_AND_SKY_REE(22),
        DENTARG(23),
        KHADGAR(24),
        GROM_HELLSCREAM(25),
        HUMAN_TANKER(26),
        ORC_TANKER(27),
        HUMAN_TRANSPORT(28),
        ORC_TRANSPORT(29),
        ELVEN_DESTROYER(30),
        TROLL_DESTROYER(31),
        BATTLESHIP(32),
        JUGGERNAUGHT(33),
        DEATHWING(35),
        GNOMISH_SUBMARINE(38),
        GIANT_TURTLE(39),
        GNOMISH_FLYING_MACHINE(40),
        GOBLIN_ZEPPLIN(41),
        GRYPHON_RIDER(42),
        DRAGON(43),
        TURALYON(44),
        EYE_OF_KILROGG(45),
        DANATH(46),
        KHORGATH_BLADEFIST(47),
        CHO_GALL(49),
        LOTHAR(50),
        GUL_DAN(51),
        UTHER_LIGHTBRINGER(52),
        ZULJIN(53),
        SKELETON(55),
        DAEMON(56),
        CRITTER(57),
        FARM(58),
        PIG_FARM(59),
        HUMAN_BARRACKS(60),
        ORC_BARRACKS(61),
        CHURCH(62),
        ALTAR_OF_STORMS(63),
        HUMAN_SCOUT_TOWER(64),
        ORC_SCOUT_TOWER(65),
        STABLES(66),
        OGRE_MOUND(67),
        GNOMISH_INVENTOR(68),
        GOBLIN_ALCHEMIST(69),
        GRYPHON_AVIARY(70),
        DRAGON_ROOST(71),
        HUMAN_SHIPYARD(72),
        ORC_SHIPYARD(73),
        TOWN_HALL(74),
        GREAT_HALL(75),
        ELVEN_LUMBER_MILL(76),
        TROLL_LUMBER_MILL(77),
        HUMAN_FOUNDRY(78),
        ORC_FOUNDRY(79),
        MAGE_TOWER(80),
        TEMPLE_OF_THE_DAMNED(81),
        HUMAN_BLACKSMITH(82),
        ORC_BLACKSMITH(83),
        HUMAN_REFINERY(84),
        ORC_REFINERY(85),
        HUMAN_OIL_WELL(86),
        ORC_OIL_WELL(87),
        KEEP(88),
        STRONGHOLD(89),
        CASTLE(90),
        FORTRESS(91),
        GOLD_MINE(92),
        OIL_PATCH(93),
        HUMAN_START(94),
        ORC_START(95),
        HUMAN_GUARD_TOWER(96),
        ORC_GUARD_TOWER(97),
        HUMAN_CANNON_TOWER(98),
        ORC_CANNON_TOWER(99),
        CIRCLE_OF_POWER(100),
        DARK_PORTAL(101),
        RUNESTONE(102),
        HUMAN_WALL(103),
        ORC_WALL(104);

        private final long id;
        UnitType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, UnitType> byId = new HashMap<Long, UnitType>(100);
        static {
            for (UnitType e : UnitType.values())
                byId.put(e.id(), e);
        }
        public static UnitType byId(long id) { return byId.get(id); }
    }

    public Warcraft2Pud(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Warcraft2Pud(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Warcraft2Pud(KaitaiStream _io, KaitaiStruct _parent, Warcraft2Pud _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.sections = new ArrayList<Section>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.sections.add(new Section(this._io, this, _root));
                i++;
            }
        }
    }
    public static class SectionStartingResource extends KaitaiStruct {
        public static SectionStartingResource fromFile(String fileName) throws IOException {
            return new SectionStartingResource(new ByteBufferKaitaiStream(fileName));
        }

        public SectionStartingResource(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SectionStartingResource(KaitaiStream _io, Warcraft2Pud.Section _parent) {
            this(_io, _parent, null);
        }

        public SectionStartingResource(KaitaiStream _io, Warcraft2Pud.Section _parent, Warcraft2Pud _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.resourcesByPlayer = new ArrayList<Integer>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.resourcesByPlayer.add(this._io.readU2le());
                    i++;
                }
            }
        }
        private ArrayList<Integer> resourcesByPlayer;
        private Warcraft2Pud _root;
        private Warcraft2Pud.Section _parent;
        public ArrayList<Integer> resourcesByPlayer() { return resourcesByPlayer; }
        public Warcraft2Pud _root() { return _root; }
        public Warcraft2Pud.Section _parent() { return _parent; }
    }

    /**
     * Section that specifies terrain type for this map.
     */
    public static class SectionEra extends KaitaiStruct {
        public static SectionEra fromFile(String fileName) throws IOException {
            return new SectionEra(new ByteBufferKaitaiStream(fileName));
        }

        public SectionEra(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SectionEra(KaitaiStream _io, Warcraft2Pud.Section _parent) {
            this(_io, _parent, null);
        }

        public SectionEra(KaitaiStream _io, Warcraft2Pud.Section _parent, Warcraft2Pud _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.terrain = Warcraft2Pud.TerrainType.byId(this._io.readU2le());
        }
        private TerrainType terrain;
        private Warcraft2Pud _root;
        private Warcraft2Pud.Section _parent;
        public TerrainType terrain() { return terrain; }
        public Warcraft2Pud _root() { return _root; }
        public Warcraft2Pud.Section _parent() { return _parent; }
    }

    /**
     * Section that specifies format version.
     */
    public static class SectionVer extends KaitaiStruct {
        public static SectionVer fromFile(String fileName) throws IOException {
            return new SectionVer(new ByteBufferKaitaiStream(fileName));
        }

        public SectionVer(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SectionVer(KaitaiStream _io, Warcraft2Pud.Section _parent) {
            this(_io, _parent, null);
        }

        public SectionVer(KaitaiStream _io, Warcraft2Pud.Section _parent, Warcraft2Pud _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.version = this._io.readU2le();
        }
        private int version;
        private Warcraft2Pud _root;
        private Warcraft2Pud.Section _parent;
        public int version() { return version; }
        public Warcraft2Pud _root() { return _root; }
        public Warcraft2Pud.Section _parent() { return _parent; }
    }
    public static class SectionDim extends KaitaiStruct {
        public static SectionDim fromFile(String fileName) throws IOException {
            return new SectionDim(new ByteBufferKaitaiStream(fileName));
        }

        public SectionDim(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SectionDim(KaitaiStream _io, Warcraft2Pud.Section _parent) {
            this(_io, _parent, null);
        }

        public SectionDim(KaitaiStream _io, Warcraft2Pud.Section _parent, Warcraft2Pud _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.x = this._io.readU2le();
            this.y = this._io.readU2le();
        }
        private int x;
        private int y;
        private Warcraft2Pud _root;
        private Warcraft2Pud.Section _parent;
        public int x() { return x; }
        public int y() { return y; }
        public Warcraft2Pud _root() { return _root; }
        public Warcraft2Pud.Section _parent() { return _parent; }
    }

    /**
     * Section that confirms that this file is a "map file" by certain
     * magic string and supplies a tag that could be used in
     * multiplayer to check that all player use the same version of the
     * map.
     */
    public static class SectionType extends KaitaiStruct {
        public static SectionType fromFile(String fileName) throws IOException {
            return new SectionType(new ByteBufferKaitaiStream(fileName));
        }

        public SectionType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SectionType(KaitaiStream _io, Warcraft2Pud.Section _parent) {
            this(_io, _parent, null);
        }

        public SectionType(KaitaiStream _io, Warcraft2Pud.Section _parent, Warcraft2Pud _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.ensureFixedContents(new byte[] { 87, 65, 82, 50, 32, 77, 65, 80, 0, 0 });
            this.unused = this._io.readBytes(2);
            this.idTag = this._io.readU4le();
        }
        private byte[] magic;
        private byte[] unused;
        private long idTag;
        private Warcraft2Pud _root;
        private Warcraft2Pud.Section _parent;
        public byte[] magic() { return magic; }

        /**
         * unused (always set to $0a and $ff by editor, but can be anything for the game)
         */
        public byte[] unused() { return unused; }

        /**
         * id tag (for consistence check in multiplayer)
         */
        public long idTag() { return idTag; }
        public Warcraft2Pud _root() { return _root; }
        public Warcraft2Pud.Section _parent() { return _parent; }
    }
    public static class SectionUnit extends KaitaiStruct {
        public static SectionUnit fromFile(String fileName) throws IOException {
            return new SectionUnit(new ByteBufferKaitaiStream(fileName));
        }

        public SectionUnit(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SectionUnit(KaitaiStream _io, Warcraft2Pud.Section _parent) {
            this(_io, _parent, null);
        }

        public SectionUnit(KaitaiStream _io, Warcraft2Pud.Section _parent, Warcraft2Pud _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.units = new ArrayList<Unit>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.units.add(new Unit(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<Unit> units;
        private Warcraft2Pud _root;
        private Warcraft2Pud.Section _parent;
        public ArrayList<Unit> units() { return units; }
        public Warcraft2Pud _root() { return _root; }
        public Warcraft2Pud.Section _parent() { return _parent; }
    }
    public static class Section extends KaitaiStruct {
        public static Section fromFile(String fileName) throws IOException {
            return new Section(new ByteBufferKaitaiStream(fileName));
        }

        public Section(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Section(KaitaiStream _io, Warcraft2Pud _parent) {
            this(_io, _parent, null);
        }

        public Section(KaitaiStream _io, Warcraft2Pud _parent, Warcraft2Pud _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.name = new String(this._io.readBytes(4), Charset.forName("ASCII"));
            this.size = this._io.readU4le();
            switch (name()) {
            case "SLBR": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new SectionStartingResource(_io__raw_body, this, _root);
                break;
            }
            case "ERAX": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new SectionEra(_io__raw_body, this, _root);
                break;
            }
            case "OWNR": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new SectionOwnr(_io__raw_body, this, _root);
                break;
            }
            case "ERA ": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new SectionEra(_io__raw_body, this, _root);
                break;
            }
            case "SGLD": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new SectionStartingResource(_io__raw_body, this, _root);
                break;
            }
            case "VER ": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new SectionVer(_io__raw_body, this, _root);
                break;
            }
            case "SOIL": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new SectionStartingResource(_io__raw_body, this, _root);
                break;
            }
            case "UNIT": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new SectionUnit(_io__raw_body, this, _root);
                break;
            }
            case "DIM ": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new SectionDim(_io__raw_body, this, _root);
                break;
            }
            case "TYPE": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new SectionType(_io__raw_body, this, _root);
                break;
            }
            default: {
                this.body = this._io.readBytes(size());
                break;
            }
            }
        }
        private String name;
        private long size;
        private Object body;
        private Warcraft2Pud _root;
        private Warcraft2Pud _parent;
        private byte[] _raw_body;
        public String name() { return name; }
        public long size() { return size; }
        public Object body() { return body; }
        public Warcraft2Pud _root() { return _root; }
        public Warcraft2Pud _parent() { return _parent; }
        public byte[] _raw_body() { return _raw_body; }
    }

    /**
     * Section that specifies who controls each player.
     */
    public static class SectionOwnr extends KaitaiStruct {
        public static SectionOwnr fromFile(String fileName) throws IOException {
            return new SectionOwnr(new ByteBufferKaitaiStream(fileName));
        }

        public SectionOwnr(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SectionOwnr(KaitaiStream _io, Warcraft2Pud.Section _parent) {
            this(_io, _parent, null);
        }

        public SectionOwnr(KaitaiStream _io, Warcraft2Pud.Section _parent, Warcraft2Pud _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.controllerByPlayer = new ArrayList<Controller>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.controllerByPlayer.add(Warcraft2Pud.Controller.byId(this._io.readU1()));
                    i++;
                }
            }
        }
        private ArrayList<Controller> controllerByPlayer;
        private Warcraft2Pud _root;
        private Warcraft2Pud.Section _parent;
        public ArrayList<Controller> controllerByPlayer() { return controllerByPlayer; }
        public Warcraft2Pud _root() { return _root; }
        public Warcraft2Pud.Section _parent() { return _parent; }
    }
    public static class Unit extends KaitaiStruct {
        public static Unit fromFile(String fileName) throws IOException {
            return new Unit(new ByteBufferKaitaiStream(fileName));
        }

        public Unit(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Unit(KaitaiStream _io, Warcraft2Pud.SectionUnit _parent) {
            this(_io, _parent, null);
        }

        public Unit(KaitaiStream _io, Warcraft2Pud.SectionUnit _parent, Warcraft2Pud _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.x = this._io.readU2le();
            this.y = this._io.readU2le();
            this.uType = Warcraft2Pud.UnitType.byId(this._io.readU1());
            this.owner = this._io.readU1();
            this.options = this._io.readU2le();
        }
        private Integer resource;
        public Integer resource() {
            if (this.resource != null)
                return this.resource;
            if ( ((uType() == Warcraft2Pud.UnitType.GOLD_MINE) || (uType() == Warcraft2Pud.UnitType.HUMAN_OIL_WELL) || (uType() == Warcraft2Pud.UnitType.ORC_OIL_WELL) || (uType() == Warcraft2Pud.UnitType.OIL_PATCH)) ) {
                int _tmp = (int) ((options() * 2500));
                this.resource = _tmp;
            }
            return this.resource;
        }
        private int x;
        private int y;
        private UnitType uType;
        private int owner;
        private int options;
        private Warcraft2Pud _root;
        private Warcraft2Pud.SectionUnit _parent;
        public int x() { return x; }
        public int y() { return y; }
        public UnitType uType() { return uType; }
        public int owner() { return owner; }

        /**
         * if gold mine or oil well, contains 2500 * this, otherwise 0 passive 1 active
         */
        public int options() { return options; }
        public Warcraft2Pud _root() { return _root; }
        public Warcraft2Pud.SectionUnit _parent() { return _parent; }
    }
    private ArrayList<Section> sections;
    private Warcraft2Pud _root;
    private KaitaiStruct _parent;
    public ArrayList<Section> sections() { return sections; }
    public Warcraft2Pud _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

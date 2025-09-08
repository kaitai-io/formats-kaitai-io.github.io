// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Arrays;


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
 * @see <a href="http://cade.datamax.bg/war2x/pudspec.html">Source</a>
 */
public class Warcraft2Pud extends KaitaiStruct.ReadWrite {
    public static Warcraft2Pud fromFile(String fileName) throws IOException {
        return new Warcraft2Pud(new ByteBufferKaitaiStream(fileName));
    }

    public enum Controller {
        COMPUTER1(1),
        PASSIVE_COMPUTER(2),
        NOBODY(3),
        COMPUTER4(4),
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
    public Warcraft2Pud() {
        this(null, null, null);
    }

    public Warcraft2Pud(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Warcraft2Pud(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Warcraft2Pud(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Warcraft2Pud _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.sections = new ArrayList<Section>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                Section _t_sections = new Section(this._io, this, _root);
                try {
                    _t_sections._read();
                } finally {
                    this.sections.add(_t_sections);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.sections.size(); i++) {
            this.sections.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.sections.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("sections", 0, this._io.size() - this._io.pos());
            this.sections.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("sections", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.sections.size(); i++) {
            if (!Objects.equals(this.sections.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("sections", _root(), this.sections.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.sections.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("sections", this, this.sections.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class Section extends KaitaiStruct.ReadWrite {
        public static Section fromFile(String fileName) throws IOException {
            return new Section(new ByteBufferKaitaiStream(fileName));
        }
        public Section() {
            this(null, null, null);
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
        }
        public void _read() {
            this.name = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
            this.size = this._io.readU4le();
            switch (name()) {
            case "DIM ": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new SectionDim(_io__raw_body, this, _root);
                ((SectionDim) (this.body))._read();
                break;
            }
            case "ERA ": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new SectionEra(_io__raw_body, this, _root);
                ((SectionEra) (this.body))._read();
                break;
            }
            case "ERAX": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new SectionEra(_io__raw_body, this, _root);
                ((SectionEra) (this.body))._read();
                break;
            }
            case "OWNR": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new SectionOwnr(_io__raw_body, this, _root);
                ((SectionOwnr) (this.body))._read();
                break;
            }
            case "SGLD": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new SectionStartingResource(_io__raw_body, this, _root);
                ((SectionStartingResource) (this.body))._read();
                break;
            }
            case "SLBR": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new SectionStartingResource(_io__raw_body, this, _root);
                ((SectionStartingResource) (this.body))._read();
                break;
            }
            case "SOIL": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new SectionStartingResource(_io__raw_body, this, _root);
                ((SectionStartingResource) (this.body))._read();
                break;
            }
            case "TYPE": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new SectionType(_io__raw_body, this, _root);
                ((SectionType) (this.body))._read();
                break;
            }
            case "UNIT": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new SectionUnit(_io__raw_body, this, _root);
                ((SectionUnit) (this.body))._read();
                break;
            }
            case "VER ": {
                this._raw_body = this._io.readBytes(size());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new SectionVer(_io__raw_body, this, _root);
                ((SectionVer) (this.body))._read();
                break;
            }
            default: {
                this.body = this._io.readBytes(size());
                break;
            }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            switch (name()) {
            case "DIM ": {
                ((SectionDim) (this.body))._fetchInstances();
                break;
            }
            case "ERA ": {
                ((SectionEra) (this.body))._fetchInstances();
                break;
            }
            case "ERAX": {
                ((SectionEra) (this.body))._fetchInstances();
                break;
            }
            case "OWNR": {
                ((SectionOwnr) (this.body))._fetchInstances();
                break;
            }
            case "SGLD": {
                ((SectionStartingResource) (this.body))._fetchInstances();
                break;
            }
            case "SLBR": {
                ((SectionStartingResource) (this.body))._fetchInstances();
                break;
            }
            case "SOIL": {
                ((SectionStartingResource) (this.body))._fetchInstances();
                break;
            }
            case "TYPE": {
                ((SectionType) (this.body))._fetchInstances();
                break;
            }
            case "UNIT": {
                ((SectionUnit) (this.body))._fetchInstances();
                break;
            }
            case "VER ": {
                ((SectionVer) (this.body))._fetchInstances();
                break;
            }
            default: {
                break;
            }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.name).getBytes(Charset.forName("ASCII")));
            this._io.writeU4le(this.size);
            switch (name()) {
            case "DIM ": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (size()));
                    final Section _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != size())
                                throw new ConsistencyError("raw(body)", size(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((SectionDim) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "ERA ": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (size()));
                    final Section _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != size())
                                throw new ConsistencyError("raw(body)", size(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((SectionEra) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "ERAX": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (size()));
                    final Section _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != size())
                                throw new ConsistencyError("raw(body)", size(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((SectionEra) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "OWNR": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (size()));
                    final Section _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != size())
                                throw new ConsistencyError("raw(body)", size(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((SectionOwnr) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "SGLD": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (size()));
                    final Section _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != size())
                                throw new ConsistencyError("raw(body)", size(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((SectionStartingResource) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "SLBR": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (size()));
                    final Section _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != size())
                                throw new ConsistencyError("raw(body)", size(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((SectionStartingResource) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "SOIL": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (size()));
                    final Section _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != size())
                                throw new ConsistencyError("raw(body)", size(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((SectionStartingResource) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "TYPE": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (size()));
                    final Section _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != size())
                                throw new ConsistencyError("raw(body)", size(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((SectionType) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "UNIT": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (size()));
                    final Section _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != size())
                                throw new ConsistencyError("raw(body)", size(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((SectionUnit) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "VER ": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (size()));
                    final Section _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != size())
                                throw new ConsistencyError("raw(body)", size(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((SectionVer) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            default: {
                this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                break;
            }
            }
        }

        public void _check() {
            if ((this.name).getBytes(Charset.forName("ASCII")).length != 4)
                throw new ConsistencyError("name", 4, (this.name).getBytes(Charset.forName("ASCII")).length);
            switch (name()) {
            case "DIM ": {
                if (!Objects.equals(((Warcraft2Pud.SectionDim) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Warcraft2Pud.SectionDim) (this.body))._root());
                if (!Objects.equals(((Warcraft2Pud.SectionDim) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Warcraft2Pud.SectionDim) (this.body))._parent());
                break;
            }
            case "ERA ": {
                if (!Objects.equals(((Warcraft2Pud.SectionEra) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Warcraft2Pud.SectionEra) (this.body))._root());
                if (!Objects.equals(((Warcraft2Pud.SectionEra) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Warcraft2Pud.SectionEra) (this.body))._parent());
                break;
            }
            case "ERAX": {
                if (!Objects.equals(((Warcraft2Pud.SectionEra) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Warcraft2Pud.SectionEra) (this.body))._root());
                if (!Objects.equals(((Warcraft2Pud.SectionEra) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Warcraft2Pud.SectionEra) (this.body))._parent());
                break;
            }
            case "OWNR": {
                if (!Objects.equals(((Warcraft2Pud.SectionOwnr) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Warcraft2Pud.SectionOwnr) (this.body))._root());
                if (!Objects.equals(((Warcraft2Pud.SectionOwnr) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Warcraft2Pud.SectionOwnr) (this.body))._parent());
                break;
            }
            case "SGLD": {
                if (!Objects.equals(((Warcraft2Pud.SectionStartingResource) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Warcraft2Pud.SectionStartingResource) (this.body))._root());
                if (!Objects.equals(((Warcraft2Pud.SectionStartingResource) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Warcraft2Pud.SectionStartingResource) (this.body))._parent());
                break;
            }
            case "SLBR": {
                if (!Objects.equals(((Warcraft2Pud.SectionStartingResource) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Warcraft2Pud.SectionStartingResource) (this.body))._root());
                if (!Objects.equals(((Warcraft2Pud.SectionStartingResource) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Warcraft2Pud.SectionStartingResource) (this.body))._parent());
                break;
            }
            case "SOIL": {
                if (!Objects.equals(((Warcraft2Pud.SectionStartingResource) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Warcraft2Pud.SectionStartingResource) (this.body))._root());
                if (!Objects.equals(((Warcraft2Pud.SectionStartingResource) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Warcraft2Pud.SectionStartingResource) (this.body))._parent());
                break;
            }
            case "TYPE": {
                if (!Objects.equals(((Warcraft2Pud.SectionType) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Warcraft2Pud.SectionType) (this.body))._root());
                if (!Objects.equals(((Warcraft2Pud.SectionType) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Warcraft2Pud.SectionType) (this.body))._parent());
                break;
            }
            case "UNIT": {
                if (!Objects.equals(((Warcraft2Pud.SectionUnit) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Warcraft2Pud.SectionUnit) (this.body))._root());
                if (!Objects.equals(((Warcraft2Pud.SectionUnit) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Warcraft2Pud.SectionUnit) (this.body))._parent());
                break;
            }
            case "VER ": {
                if (!Objects.equals(((Warcraft2Pud.SectionVer) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Warcraft2Pud.SectionVer) (this.body))._root());
                if (!Objects.equals(((Warcraft2Pud.SectionVer) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Warcraft2Pud.SectionVer) (this.body))._parent());
                break;
            }
            default: {
                if (((byte[]) (this.body)).length != size())
                    throw new ConsistencyError("body", size(), ((byte[]) (this.body)).length);
                break;
            }
            }
            _dirty = false;
        }
        private String name;
        private long size;
        private Object body;
        private Warcraft2Pud _root;
        private Warcraft2Pud _parent;
        private byte[] _raw_body;
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public Object body() { return body; }
        public void setBody(Object _v) { _dirty = true; body = _v; }
        public Warcraft2Pud _root() { return _root; }
        public void set_root(Warcraft2Pud _v) { _dirty = true; _root = _v; }
        public Warcraft2Pud _parent() { return _parent; }
        public void set_parent(Warcraft2Pud _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }
    public static class SectionDim extends KaitaiStruct.ReadWrite {
        public static SectionDim fromFile(String fileName) throws IOException {
            return new SectionDim(new ByteBufferKaitaiStream(fileName));
        }
        public SectionDim() {
            this(null, null, null);
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
        private Warcraft2Pud _root;
        private Warcraft2Pud.Section _parent;
        public int x() { return x; }
        public void setX(int _v) { _dirty = true; x = _v; }
        public int y() { return y; }
        public void setY(int _v) { _dirty = true; y = _v; }
        public Warcraft2Pud _root() { return _root; }
        public void set_root(Warcraft2Pud _v) { _dirty = true; _root = _v; }
        public Warcraft2Pud.Section _parent() { return _parent; }
        public void set_parent(Warcraft2Pud.Section _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Section that specifies terrain type for this map.
     */
    public static class SectionEra extends KaitaiStruct.ReadWrite {
        public static SectionEra fromFile(String fileName) throws IOException {
            return new SectionEra(new ByteBufferKaitaiStream(fileName));
        }
        public SectionEra() {
            this(null, null, null);
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
        }
        public void _read() {
            this.terrain = Warcraft2Pud.TerrainType.byId(this._io.readU2le());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(((Number) (this.terrain.id())).intValue());
        }

        public void _check() {
            _dirty = false;
        }
        private TerrainType terrain;
        private Warcraft2Pud _root;
        private Warcraft2Pud.Section _parent;
        public TerrainType terrain() { return terrain; }
        public void setTerrain(TerrainType _v) { _dirty = true; terrain = _v; }
        public Warcraft2Pud _root() { return _root; }
        public void set_root(Warcraft2Pud _v) { _dirty = true; _root = _v; }
        public Warcraft2Pud.Section _parent() { return _parent; }
        public void set_parent(Warcraft2Pud.Section _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Section that specifies who controls each player.
     */
    public static class SectionOwnr extends KaitaiStruct.ReadWrite {
        public static SectionOwnr fromFile(String fileName) throws IOException {
            return new SectionOwnr(new ByteBufferKaitaiStream(fileName));
        }
        public SectionOwnr() {
            this(null, null, null);
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
        }
        public void _read() {
            this.controllerByPlayer = new ArrayList<Controller>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.controllerByPlayer.add(Warcraft2Pud.Controller.byId(this._io.readU1()));
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.controllerByPlayer.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.controllerByPlayer.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("controller_by_player", 0, this._io.size() - this._io.pos());
                this._io.writeU1(((Number) (this.controllerByPlayer.get(((Number) (i)).intValue()).id())).intValue());
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("controller_by_player", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.controllerByPlayer.size(); i++) {
            }
            _dirty = false;
        }
        private List<Controller> controllerByPlayer;
        private Warcraft2Pud _root;
        private Warcraft2Pud.Section _parent;
        public List<Controller> controllerByPlayer() { return controllerByPlayer; }
        public void setControllerByPlayer(List<Controller> _v) { _dirty = true; controllerByPlayer = _v; }
        public Warcraft2Pud _root() { return _root; }
        public void set_root(Warcraft2Pud _v) { _dirty = true; _root = _v; }
        public Warcraft2Pud.Section _parent() { return _parent; }
        public void set_parent(Warcraft2Pud.Section _v) { _dirty = true; _parent = _v; }
    }
    public static class SectionStartingResource extends KaitaiStruct.ReadWrite {
        public static SectionStartingResource fromFile(String fileName) throws IOException {
            return new SectionStartingResource(new ByteBufferKaitaiStream(fileName));
        }
        public SectionStartingResource() {
            this(null, null, null);
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
        }
        public void _read() {
            this.resourcesByPlayer = new ArrayList<Integer>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.resourcesByPlayer.add(this._io.readU2le());
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.resourcesByPlayer.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.resourcesByPlayer.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("resources_by_player", 0, this._io.size() - this._io.pos());
                this._io.writeU2le(this.resourcesByPlayer.get(((Number) (i)).intValue()));
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("resources_by_player", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.resourcesByPlayer.size(); i++) {
            }
            _dirty = false;
        }
        private List<Integer> resourcesByPlayer;
        private Warcraft2Pud _root;
        private Warcraft2Pud.Section _parent;
        public List<Integer> resourcesByPlayer() { return resourcesByPlayer; }
        public void setResourcesByPlayer(List<Integer> _v) { _dirty = true; resourcesByPlayer = _v; }
        public Warcraft2Pud _root() { return _root; }
        public void set_root(Warcraft2Pud _v) { _dirty = true; _root = _v; }
        public Warcraft2Pud.Section _parent() { return _parent; }
        public void set_parent(Warcraft2Pud.Section _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Section that confirms that this file is a "map file" by certain
     * magic string and supplies a tag that could be used in
     * multiplayer to check that all player use the same version of the
     * map.
     */
    public static class SectionType extends KaitaiStruct.ReadWrite {
        public static SectionType fromFile(String fileName) throws IOException {
            return new SectionType(new ByteBufferKaitaiStream(fileName));
        }
        public SectionType() {
            this(null, null, null);
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
        }
        public void _read() {
            this.magic = this._io.readBytes(10);
            if (!(Arrays.equals(this.magic, new byte[] { 87, 65, 82, 50, 32, 77, 65, 80, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 87, 65, 82, 50, 32, 77, 65, 80, 0, 0 }, this.magic, this._io, "/types/section_type/seq/0");
            }
            this.unused = this._io.readBytes(2);
            this.idTag = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeBytes(this.unused);
            this._io.writeU4le(this.idTag);
        }

        public void _check() {
            if (this.magic.length != 10)
                throw new ConsistencyError("magic", 10, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 87, 65, 82, 50, 32, 77, 65, 80, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 87, 65, 82, 50, 32, 77, 65, 80, 0, 0 }, this.magic, null, "/types/section_type/seq/0");
            }
            if (this.unused.length != 2)
                throw new ConsistencyError("unused", 2, this.unused.length);
            _dirty = false;
        }
        private byte[] magic;
        private byte[] unused;
        private long idTag;
        private Warcraft2Pud _root;
        private Warcraft2Pud.Section _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

        /**
         * unused (always set to $0a and $ff by editor, but can be anything for the game)
         */
        public byte[] unused() { return unused; }
        public void setUnused(byte[] _v) { _dirty = true; unused = _v; }

        /**
         * id tag (for consistency check in multiplayer)
         */
        public long idTag() { return idTag; }
        public void setIdTag(long _v) { _dirty = true; idTag = _v; }
        public Warcraft2Pud _root() { return _root; }
        public void set_root(Warcraft2Pud _v) { _dirty = true; _root = _v; }
        public Warcraft2Pud.Section _parent() { return _parent; }
        public void set_parent(Warcraft2Pud.Section _v) { _dirty = true; _parent = _v; }
    }
    public static class SectionUnit extends KaitaiStruct.ReadWrite {
        public static SectionUnit fromFile(String fileName) throws IOException {
            return new SectionUnit(new ByteBufferKaitaiStream(fileName));
        }
        public SectionUnit() {
            this(null, null, null);
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
        }
        public void _read() {
            this.units = new ArrayList<Unit>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Unit _t_units = new Unit(this._io, this, _root);
                    try {
                        _t_units._read();
                    } finally {
                        this.units.add(_t_units);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.units.size(); i++) {
                this.units.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.units.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("units", 0, this._io.size() - this._io.pos());
                this.units.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("units", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.units.size(); i++) {
                if (!Objects.equals(this.units.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("units", _root(), this.units.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.units.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("units", this, this.units.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Unit> units;
        private Warcraft2Pud _root;
        private Warcraft2Pud.Section _parent;
        public List<Unit> units() { return units; }
        public void setUnits(List<Unit> _v) { _dirty = true; units = _v; }
        public Warcraft2Pud _root() { return _root; }
        public void set_root(Warcraft2Pud _v) { _dirty = true; _root = _v; }
        public Warcraft2Pud.Section _parent() { return _parent; }
        public void set_parent(Warcraft2Pud.Section _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Section that specifies format version.
     */
    public static class SectionVer extends KaitaiStruct.ReadWrite {
        public static SectionVer fromFile(String fileName) throws IOException {
            return new SectionVer(new ByteBufferKaitaiStream(fileName));
        }
        public SectionVer() {
            this(null, null, null);
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
        }
        public void _read() {
            this.version = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.version);
        }

        public void _check() {
            _dirty = false;
        }
        private int version;
        private Warcraft2Pud _root;
        private Warcraft2Pud.Section _parent;
        public int version() { return version; }
        public void setVersion(int _v) { _dirty = true; version = _v; }
        public Warcraft2Pud _root() { return _root; }
        public void set_root(Warcraft2Pud _v) { _dirty = true; _root = _v; }
        public Warcraft2Pud.Section _parent() { return _parent; }
        public void set_parent(Warcraft2Pud.Section _v) { _dirty = true; _parent = _v; }
    }
    public static class Unit extends KaitaiStruct.ReadWrite {
        public static Unit fromFile(String fileName) throws IOException {
            return new Unit(new ByteBufferKaitaiStream(fileName));
        }
        public Unit() {
            this(null, null, null);
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
        }
        public void _read() {
            this.x = this._io.readU2le();
            this.y = this._io.readU2le();
            this.uType = Warcraft2Pud.UnitType.byId(this._io.readU1());
            this.owner = this._io.readU1();
            this.options = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.x);
            this._io.writeU2le(this.y);
            this._io.writeU1(((Number) (this.uType.id())).intValue());
            this._io.writeU1(this.owner);
            this._io.writeU2le(this.options);
        }

        public void _check() {
            _dirty = false;
        }
        private Integer resource;
        public Integer resource() {
            if (this.resource != null)
                return this.resource;
            if ( ((uType() == Warcraft2Pud.UnitType.GOLD_MINE) || (uType() == Warcraft2Pud.UnitType.HUMAN_OIL_WELL) || (uType() == Warcraft2Pud.UnitType.ORC_OIL_WELL) || (uType() == Warcraft2Pud.UnitType.OIL_PATCH)) ) {
                this.resource = ((Number) (options() * 2500)).intValue();
            }
            return this.resource;
        }
        public void _invalidateResource() { this.resource = null; }
        private int x;
        private int y;
        private UnitType uType;
        private int owner;
        private int options;
        private Warcraft2Pud _root;
        private Warcraft2Pud.SectionUnit _parent;
        public int x() { return x; }
        public void setX(int _v) { _dirty = true; x = _v; }
        public int y() { return y; }
        public void setY(int _v) { _dirty = true; y = _v; }
        public UnitType uType() { return uType; }
        public void setUType(UnitType _v) { _dirty = true; uType = _v; }
        public int owner() { return owner; }
        public void setOwner(int _v) { _dirty = true; owner = _v; }

        /**
         * if gold mine or oil well, contains 2500 * this, otherwise 0 passive 1 active
         */
        public int options() { return options; }
        public void setOptions(int _v) { _dirty = true; options = _v; }
        public Warcraft2Pud _root() { return _root; }
        public void set_root(Warcraft2Pud _v) { _dirty = true; _root = _v; }
        public Warcraft2Pud.SectionUnit _parent() { return _parent; }
        public void set_parent(Warcraft2Pud.SectionUnit _v) { _dirty = true; _parent = _v; }
    }
    private List<Section> sections;
    private Warcraft2Pud _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<Section> sections() { return sections; }
    public void setSections(List<Section> _v) { _dirty = true; sections = _v; }
    public Warcraft2Pud _root() { return _root; }
    public void set_root(Warcraft2Pud _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

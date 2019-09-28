// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

public class DoomWad extends KaitaiStruct {
    public static DoomWad fromFile(String fileName) throws IOException {
        return new DoomWad(new ByteBufferKaitaiStream(fileName));
    }

    public DoomWad(KaitaiStream _io) {
        this(_io, null, null);
    }

    public DoomWad(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public DoomWad(KaitaiStream _io, KaitaiStruct _parent, DoomWad _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = new String(this._io.readBytes(4), Charset.forName("ASCII"));
        this.numIndexEntries = this._io.readS4le();
        this.indexOffset = this._io.readS4le();
    }
    public static class Sectors extends KaitaiStruct {
        public static Sectors fromFile(String fileName) throws IOException {
            return new Sectors(new ByteBufferKaitaiStream(fileName));
        }

        public Sectors(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Sectors(KaitaiStream _io, DoomWad.IndexEntry _parent) {
            this(_io, _parent, null);
        }

        public Sectors(KaitaiStream _io, DoomWad.IndexEntry _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<Sector>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new Sector(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<Sector> entries;
        private DoomWad _root;
        private DoomWad.IndexEntry _parent;
        public ArrayList<Sector> entries() { return entries; }
        public DoomWad _root() { return _root; }
        public DoomWad.IndexEntry _parent() { return _parent; }
    }
    public static class Vertex extends KaitaiStruct {
        public static Vertex fromFile(String fileName) throws IOException {
            return new Vertex(new ByteBufferKaitaiStream(fileName));
        }

        public Vertex(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Vertex(KaitaiStream _io, DoomWad.Vertexes _parent) {
            this(_io, _parent, null);
        }

        public Vertex(KaitaiStream _io, DoomWad.Vertexes _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.x = this._io.readS2le();
            this.y = this._io.readS2le();
        }
        private short x;
        private short y;
        private DoomWad _root;
        private DoomWad.Vertexes _parent;
        public short x() { return x; }
        public short y() { return y; }
        public DoomWad _root() { return _root; }
        public DoomWad.Vertexes _parent() { return _parent; }
    }

    /**
     * Used for TEXTURE1 and TEXTURE2 lumps, which designate how to
     * combine wall patches to make wall textures. This essentially
     * provides a very simple form of image compression, allowing
     * certain elements ("patches") to be reused / recombined on
     * different textures for more variety in the game.
     * @see <a href="http://doom.wikia.com/wiki/TEXTURE1">Source</a>
     */
    public static class Texture12 extends KaitaiStruct {
        public static Texture12 fromFile(String fileName) throws IOException {
            return new Texture12(new ByteBufferKaitaiStream(fileName));
        }

        public Texture12(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Texture12(KaitaiStream _io, DoomWad.IndexEntry _parent) {
            this(_io, _parent, null);
        }

        public Texture12(KaitaiStream _io, DoomWad.IndexEntry _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numTextures = this._io.readS4le();
            textures = new ArrayList<TextureIndex>(((Number) (numTextures())).intValue());
            for (int i = 0; i < numTextures(); i++) {
                this.textures.add(new TextureIndex(this._io, this, _root));
            }
        }
        public static class TextureIndex extends KaitaiStruct {
            public static TextureIndex fromFile(String fileName) throws IOException {
                return new TextureIndex(new ByteBufferKaitaiStream(fileName));
            }

            public TextureIndex(KaitaiStream _io) {
                this(_io, null, null);
            }

            public TextureIndex(KaitaiStream _io, DoomWad.Texture12 _parent) {
                this(_io, _parent, null);
            }

            public TextureIndex(KaitaiStream _io, DoomWad.Texture12 _parent, DoomWad _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.offset = this._io.readS4le();
            }
            private TextureBody body;
            public TextureBody body() {
                if (this.body != null)
                    return this.body;
                long _pos = this._io.pos();
                this._io.seek(offset());
                this.body = new TextureBody(this._io, this, _root);
                this._io.seek(_pos);
                return this.body;
            }
            private int offset;
            private DoomWad _root;
            private DoomWad.Texture12 _parent;
            public int offset() { return offset; }
            public DoomWad _root() { return _root; }
            public DoomWad.Texture12 _parent() { return _parent; }
        }
        public static class TextureBody extends KaitaiStruct {
            public static TextureBody fromFile(String fileName) throws IOException {
                return new TextureBody(new ByteBufferKaitaiStream(fileName));
            }

            public TextureBody(KaitaiStream _io) {
                this(_io, null, null);
            }

            public TextureBody(KaitaiStream _io, DoomWad.Texture12.TextureIndex _parent) {
                this(_io, _parent, null);
            }

            public TextureBody(KaitaiStream _io, DoomWad.Texture12.TextureIndex _parent, DoomWad _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.name = new String(KaitaiStream.bytesStripRight(this._io.readBytes(8), (byte) 0), Charset.forName("ASCII"));
                this.masked = this._io.readU4le();
                this.width = this._io.readU2le();
                this.height = this._io.readU2le();
                this.columnDirectory = this._io.readU4le();
                this.numPatches = this._io.readU2le();
                patches = new ArrayList<Patch>(((Number) (numPatches())).intValue());
                for (int i = 0; i < numPatches(); i++) {
                    this.patches.add(new Patch(this._io, this, _root));
                }
            }
            private String name;
            private long masked;
            private int width;
            private int height;
            private long columnDirectory;
            private int numPatches;
            private ArrayList<Patch> patches;
            private DoomWad _root;
            private DoomWad.Texture12.TextureIndex _parent;

            /**
             * Name of a texture, only `A-Z`, `0-9`, `[]_-` are valid
             */
            public String name() { return name; }
            public long masked() { return masked; }
            public int width() { return width; }
            public int height() { return height; }

            /**
             * Obsolete, ignored by all DOOM versions
             */
            public long columnDirectory() { return columnDirectory; }

            /**
             * Number of patches that are used in a texture
             */
            public int numPatches() { return numPatches; }
            public ArrayList<Patch> patches() { return patches; }
            public DoomWad _root() { return _root; }
            public DoomWad.Texture12.TextureIndex _parent() { return _parent; }
        }
        public static class Patch extends KaitaiStruct {
            public static Patch fromFile(String fileName) throws IOException {
                return new Patch(new ByteBufferKaitaiStream(fileName));
            }

            public Patch(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Patch(KaitaiStream _io, DoomWad.Texture12.TextureBody _parent) {
                this(_io, _parent, null);
            }

            public Patch(KaitaiStream _io, DoomWad.Texture12.TextureBody _parent, DoomWad _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.originX = this._io.readS2le();
                this.originY = this._io.readS2le();
                this.patchId = this._io.readU2le();
                this.stepDir = this._io.readU2le();
                this.colormap = this._io.readU2le();
            }
            private short originX;
            private short originY;
            private int patchId;
            private int stepDir;
            private int colormap;
            private DoomWad _root;
            private DoomWad.Texture12.TextureBody _parent;

            /**
             * X offset to draw a patch at (pixels from left boundary of a texture)
             */
            public short originX() { return originX; }

            /**
             * Y offset to draw a patch at (pixels from upper boundary of a texture)
             */
            public short originY() { return originY; }

            /**
             * Identifier of a patch (as listed in PNAMES lump) to draw
             */
            public int patchId() { return patchId; }
            public int stepDir() { return stepDir; }
            public int colormap() { return colormap; }
            public DoomWad _root() { return _root; }
            public DoomWad.Texture12.TextureBody _parent() { return _parent; }
        }
        private int numTextures;
        private ArrayList<TextureIndex> textures;
        private DoomWad _root;
        private DoomWad.IndexEntry _parent;

        /**
         * Number of wall textures
         */
        public int numTextures() { return numTextures; }
        public ArrayList<TextureIndex> textures() { return textures; }
        public DoomWad _root() { return _root; }
        public DoomWad.IndexEntry _parent() { return _parent; }
    }
    public static class Linedef extends KaitaiStruct {
        public static Linedef fromFile(String fileName) throws IOException {
            return new Linedef(new ByteBufferKaitaiStream(fileName));
        }

        public Linedef(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Linedef(KaitaiStream _io, DoomWad.Linedefs _parent) {
            this(_io, _parent, null);
        }

        public Linedef(KaitaiStream _io, DoomWad.Linedefs _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.vertexStartIdx = this._io.readU2le();
            this.vertexEndIdx = this._io.readU2le();
            this.flags = this._io.readU2le();
            this.lineType = this._io.readU2le();
            this.sectorTag = this._io.readU2le();
            this.sidedefRightIdx = this._io.readU2le();
            this.sidedefLeftIdx = this._io.readU2le();
        }
        private int vertexStartIdx;
        private int vertexEndIdx;
        private int flags;
        private int lineType;
        private int sectorTag;
        private int sidedefRightIdx;
        private int sidedefLeftIdx;
        private DoomWad _root;
        private DoomWad.Linedefs _parent;
        public int vertexStartIdx() { return vertexStartIdx; }
        public int vertexEndIdx() { return vertexEndIdx; }
        public int flags() { return flags; }
        public int lineType() { return lineType; }
        public int sectorTag() { return sectorTag; }
        public int sidedefRightIdx() { return sidedefRightIdx; }
        public int sidedefLeftIdx() { return sidedefLeftIdx; }
        public DoomWad _root() { return _root; }
        public DoomWad.Linedefs _parent() { return _parent; }
    }

    /**
     * @see <a href="http://doom.wikia.com/wiki/PNAMES">Source</a>
     */
    public static class Pnames extends KaitaiStruct {
        public static Pnames fromFile(String fileName) throws IOException {
            return new Pnames(new ByteBufferKaitaiStream(fileName));
        }

        public Pnames(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Pnames(KaitaiStream _io, DoomWad.IndexEntry _parent) {
            this(_io, _parent, null);
        }

        public Pnames(KaitaiStream _io, DoomWad.IndexEntry _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numPatches = this._io.readU4le();
            names = new ArrayList<String>(((Number) (numPatches())).intValue());
            for (int i = 0; i < numPatches(); i++) {
                this.names.add(new String(KaitaiStream.bytesStripRight(this._io.readBytes(8), (byte) 0), Charset.forName("ASCII")));
            }
        }
        private long numPatches;
        private ArrayList<String> names;
        private DoomWad _root;
        private DoomWad.IndexEntry _parent;

        /**
         * Number of patches registered in this global game directory
         */
        public long numPatches() { return numPatches; }
        public ArrayList<String> names() { return names; }
        public DoomWad _root() { return _root; }
        public DoomWad.IndexEntry _parent() { return _parent; }
    }
    public static class Thing extends KaitaiStruct {
        public static Thing fromFile(String fileName) throws IOException {
            return new Thing(new ByteBufferKaitaiStream(fileName));
        }

        public Thing(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Thing(KaitaiStream _io, DoomWad.Things _parent) {
            this(_io, _parent, null);
        }

        public Thing(KaitaiStream _io, DoomWad.Things _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.x = this._io.readS2le();
            this.y = this._io.readS2le();
            this.angle = this._io.readU2le();
            this.type = this._io.readU2le();
            this.flags = this._io.readU2le();
        }
        private short x;
        private short y;
        private int angle;
        private int type;
        private int flags;
        private DoomWad _root;
        private DoomWad.Things _parent;
        public short x() { return x; }
        public short y() { return y; }
        public int angle() { return angle; }
        public int type() { return type; }
        public int flags() { return flags; }
        public DoomWad _root() { return _root; }
        public DoomWad.Things _parent() { return _parent; }
    }
    public static class Sector extends KaitaiStruct {
        public static Sector fromFile(String fileName) throws IOException {
            return new Sector(new ByteBufferKaitaiStream(fileName));
        }

        public enum SpecialSector {
            NORMAL(0),
            D_LIGHT_FLICKER(1),
            D_LIGHT_STROBE_FAST(2),
            D_LIGHT_STROBE_SLOW(3),
            D_LIGHT_STROBE_HURT(4),
            D_DAMAGE_HELLSLIME(5),
            D_DAMAGE_NUKAGE(7),
            D_LIGHT_GLOW(8),
            SECRET(9),
            D_SECTOR_DOOR_CLOSE_IN_30(10),
            D_DAMAGE_END(11),
            D_LIGHT_STROBE_SLOW_SYNC(12),
            D_LIGHT_STROBE_FAST_SYNC(13),
            D_SECTOR_DOOR_RAISE_IN_5_MINS(14),
            D_FRICTION_LOW(15),
            D_DAMAGE_SUPER_HELLSLIME(16),
            D_LIGHT_FIRE_FLICKER(17),
            D_DAMAGE_LAVA_WIMPY(18),
            D_DAMAGE_LAVA_HEFTY(19),
            D_SCROLL_EAST_LAVA_DAMAGE(20),
            LIGHT_PHASED(21),
            LIGHT_SEQUENCE_START(22),
            LIGHT_SEQUENCE_SPECIAL1(23),
            LIGHT_SEQUENCE_SPECIAL2(24);

            private final long id;
            SpecialSector(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, SpecialSector> byId = new HashMap<Long, SpecialSector>(24);
            static {
                for (SpecialSector e : SpecialSector.values())
                    byId.put(e.id(), e);
            }
            public static SpecialSector byId(long id) { return byId.get(id); }
        }

        public Sector(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Sector(KaitaiStream _io, DoomWad.Sectors _parent) {
            this(_io, _parent, null);
        }

        public Sector(KaitaiStream _io, DoomWad.Sectors _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.floorZ = this._io.readS2le();
            this.ceilZ = this._io.readS2le();
            this.floorFlat = new String(this._io.readBytes(8), Charset.forName("ASCII"));
            this.ceilFlat = new String(this._io.readBytes(8), Charset.forName("ASCII"));
            this.light = this._io.readS2le();
            this.specialType = SpecialSector.byId(this._io.readU2le());
            this.tag = this._io.readU2le();
        }
        private short floorZ;
        private short ceilZ;
        private String floorFlat;
        private String ceilFlat;
        private short light;
        private SpecialSector specialType;
        private int tag;
        private DoomWad _root;
        private DoomWad.Sectors _parent;
        public short floorZ() { return floorZ; }
        public short ceilZ() { return ceilZ; }
        public String floorFlat() { return floorFlat; }
        public String ceilFlat() { return ceilFlat; }

        /**
         * Light level of the sector [0..255]. Original engine uses
         * COLORMAP to render lighting, so only 32 actual levels are
         * available (i.e. 0..7, 8..15, etc).
         */
        public short light() { return light; }
        public SpecialSector specialType() { return specialType; }

        /**
         * Tag number. When the linedef with the same tag number is
         * activated, some effect will be triggered in this sector.
         */
        public int tag() { return tag; }
        public DoomWad _root() { return _root; }
        public DoomWad.Sectors _parent() { return _parent; }
    }
    public static class Vertexes extends KaitaiStruct {
        public static Vertexes fromFile(String fileName) throws IOException {
            return new Vertexes(new ByteBufferKaitaiStream(fileName));
        }

        public Vertexes(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Vertexes(KaitaiStream _io, DoomWad.IndexEntry _parent) {
            this(_io, _parent, null);
        }

        public Vertexes(KaitaiStream _io, DoomWad.IndexEntry _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<Vertex>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new Vertex(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<Vertex> entries;
        private DoomWad _root;
        private DoomWad.IndexEntry _parent;
        public ArrayList<Vertex> entries() { return entries; }
        public DoomWad _root() { return _root; }
        public DoomWad.IndexEntry _parent() { return _parent; }
    }
    public static class Sidedef extends KaitaiStruct {
        public static Sidedef fromFile(String fileName) throws IOException {
            return new Sidedef(new ByteBufferKaitaiStream(fileName));
        }

        public Sidedef(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Sidedef(KaitaiStream _io, DoomWad.Sidedefs _parent) {
            this(_io, _parent, null);
        }

        public Sidedef(KaitaiStream _io, DoomWad.Sidedefs _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.offsetX = this._io.readS2le();
            this.offsetY = this._io.readS2le();
            this.upperTextureName = new String(this._io.readBytes(8), Charset.forName("ASCII"));
            this.lowerTextureName = new String(this._io.readBytes(8), Charset.forName("ASCII"));
            this.normalTextureName = new String(this._io.readBytes(8), Charset.forName("ASCII"));
            this.sectorId = this._io.readS2le();
        }
        private short offsetX;
        private short offsetY;
        private String upperTextureName;
        private String lowerTextureName;
        private String normalTextureName;
        private short sectorId;
        private DoomWad _root;
        private DoomWad.Sidedefs _parent;
        public short offsetX() { return offsetX; }
        public short offsetY() { return offsetY; }
        public String upperTextureName() { return upperTextureName; }
        public String lowerTextureName() { return lowerTextureName; }
        public String normalTextureName() { return normalTextureName; }
        public short sectorId() { return sectorId; }
        public DoomWad _root() { return _root; }
        public DoomWad.Sidedefs _parent() { return _parent; }
    }
    public static class Things extends KaitaiStruct {
        public static Things fromFile(String fileName) throws IOException {
            return new Things(new ByteBufferKaitaiStream(fileName));
        }

        public Things(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Things(KaitaiStream _io, DoomWad.IndexEntry _parent) {
            this(_io, _parent, null);
        }

        public Things(KaitaiStream _io, DoomWad.IndexEntry _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<Thing>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new Thing(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<Thing> entries;
        private DoomWad _root;
        private DoomWad.IndexEntry _parent;
        public ArrayList<Thing> entries() { return entries; }
        public DoomWad _root() { return _root; }
        public DoomWad.IndexEntry _parent() { return _parent; }
    }
    public static class Linedefs extends KaitaiStruct {
        public static Linedefs fromFile(String fileName) throws IOException {
            return new Linedefs(new ByteBufferKaitaiStream(fileName));
        }

        public Linedefs(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Linedefs(KaitaiStream _io, DoomWad.IndexEntry _parent) {
            this(_io, _parent, null);
        }

        public Linedefs(KaitaiStream _io, DoomWad.IndexEntry _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<Linedef>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new Linedef(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<Linedef> entries;
        private DoomWad _root;
        private DoomWad.IndexEntry _parent;
        public ArrayList<Linedef> entries() { return entries; }
        public DoomWad _root() { return _root; }
        public DoomWad.IndexEntry _parent() { return _parent; }
    }
    public static class IndexEntry extends KaitaiStruct {
        public static IndexEntry fromFile(String fileName) throws IOException {
            return new IndexEntry(new ByteBufferKaitaiStream(fileName));
        }

        public IndexEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IndexEntry(KaitaiStream _io, DoomWad _parent) {
            this(_io, _parent, null);
        }

        public IndexEntry(KaitaiStream _io, DoomWad _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.offset = this._io.readS4le();
            this.size = this._io.readS4le();
            this.name = new String(KaitaiStream.bytesStripRight(this._io.readBytes(8), (byte) 0), Charset.forName("ASCII"));
        }
        private Object contents;
        public Object contents() {
            if (this.contents != null)
                return this.contents;
            KaitaiStream io = _root._io();
            long _pos = io.pos();
            io.seek(offset());
            switch (name()) {
            case "SECTORS": {
                this._raw_contents = io.readBytes(size());
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(_raw_contents);
                this.contents = new Sectors(_io__raw_contents, this, _root);
                break;
            }
            case "TEXTURE1": {
                this._raw_contents = io.readBytes(size());
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(_raw_contents);
                this.contents = new Texture12(_io__raw_contents, this, _root);
                break;
            }
            case "VERTEXES": {
                this._raw_contents = io.readBytes(size());
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(_raw_contents);
                this.contents = new Vertexes(_io__raw_contents, this, _root);
                break;
            }
            case "BLOCKMAP": {
                this._raw_contents = io.readBytes(size());
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(_raw_contents);
                this.contents = new Blockmap(_io__raw_contents, this, _root);
                break;
            }
            case "PNAMES": {
                this._raw_contents = io.readBytes(size());
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(_raw_contents);
                this.contents = new Pnames(_io__raw_contents, this, _root);
                break;
            }
            case "TEXTURE2": {
                this._raw_contents = io.readBytes(size());
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(_raw_contents);
                this.contents = new Texture12(_io__raw_contents, this, _root);
                break;
            }
            case "THINGS": {
                this._raw_contents = io.readBytes(size());
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(_raw_contents);
                this.contents = new Things(_io__raw_contents, this, _root);
                break;
            }
            case "LINEDEFS": {
                this._raw_contents = io.readBytes(size());
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(_raw_contents);
                this.contents = new Linedefs(_io__raw_contents, this, _root);
                break;
            }
            case "SIDEDEFS": {
                this._raw_contents = io.readBytes(size());
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(_raw_contents);
                this.contents = new Sidedefs(_io__raw_contents, this, _root);
                break;
            }
            default: {
                this.contents = io.readBytes(size());
                break;
            }
            }
            io.seek(_pos);
            return this.contents;
        }
        private int offset;
        private int size;
        private String name;
        private DoomWad _root;
        private DoomWad _parent;
        private byte[] _raw_contents;
        public int offset() { return offset; }
        public int size() { return size; }
        public String name() { return name; }
        public DoomWad _root() { return _root; }
        public DoomWad _parent() { return _parent; }
        public byte[] _raw_contents() { return _raw_contents; }
    }
    public static class Sidedefs extends KaitaiStruct {
        public static Sidedefs fromFile(String fileName) throws IOException {
            return new Sidedefs(new ByteBufferKaitaiStream(fileName));
        }

        public Sidedefs(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Sidedefs(KaitaiStream _io, DoomWad.IndexEntry _parent) {
            this(_io, _parent, null);
        }

        public Sidedefs(KaitaiStream _io, DoomWad.IndexEntry _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<Sidedef>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new Sidedef(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<Sidedef> entries;
        private DoomWad _root;
        private DoomWad.IndexEntry _parent;
        public ArrayList<Sidedef> entries() { return entries; }
        public DoomWad _root() { return _root; }
        public DoomWad.IndexEntry _parent() { return _parent; }
    }
    public static class Blockmap extends KaitaiStruct {
        public static Blockmap fromFile(String fileName) throws IOException {
            return new Blockmap(new ByteBufferKaitaiStream(fileName));
        }

        public Blockmap(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Blockmap(KaitaiStream _io, DoomWad.IndexEntry _parent) {
            this(_io, _parent, null);
        }

        public Blockmap(KaitaiStream _io, DoomWad.IndexEntry _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.originX = this._io.readS2le();
            this.originY = this._io.readS2le();
            this.numCols = this._io.readS2le();
            this.numRows = this._io.readS2le();
            linedefsInBlock = new ArrayList<Blocklist>(((Number) ((numCols() * numRows()))).intValue());
            for (int i = 0; i < (numCols() * numRows()); i++) {
                this.linedefsInBlock.add(new Blocklist(this._io, this, _root));
            }
        }
        public static class Blocklist extends KaitaiStruct {
            public static Blocklist fromFile(String fileName) throws IOException {
                return new Blocklist(new ByteBufferKaitaiStream(fileName));
            }

            public Blocklist(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Blocklist(KaitaiStream _io, DoomWad.Blockmap _parent) {
                this(_io, _parent, null);
            }

            public Blocklist(KaitaiStream _io, DoomWad.Blockmap _parent, DoomWad _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.offset = this._io.readU2le();
            }
            private ArrayList<Short> linedefs;

            /**
             * List of linedefs found in this block
             */
            public ArrayList<Short> linedefs() {
                if (this.linedefs != null)
                    return this.linedefs;
                long _pos = this._io.pos();
                this._io.seek((offset() * 2));
                this.linedefs = new ArrayList<Short>();
                {
                    short _it;
                    int i = 0;
                    do {
                        _it = this._io.readS2le();
                        this.linedefs.add(_it);
                        i++;
                    } while (!(_it == -1));
                }
                this._io.seek(_pos);
                return this.linedefs;
            }
            private int offset;
            private DoomWad _root;
            private DoomWad.Blockmap _parent;

            /**
             * Offset to the list of linedefs
             */
            public int offset() { return offset; }
            public DoomWad _root() { return _root; }
            public DoomWad.Blockmap _parent() { return _parent; }
        }
        private short originX;
        private short originY;
        private short numCols;
        private short numRows;
        private ArrayList<Blocklist> linedefsInBlock;
        private DoomWad _root;
        private DoomWad.IndexEntry _parent;

        /**
         * Grid origin, X coord
         */
        public short originX() { return originX; }

        /**
         * Grid origin, Y coord
         */
        public short originY() { return originY; }

        /**
         * Number of columns
         */
        public short numCols() { return numCols; }

        /**
         * Number of rows
         */
        public short numRows() { return numRows; }

        /**
         * Lists of linedefs for every block
         */
        public ArrayList<Blocklist> linedefsInBlock() { return linedefsInBlock; }
        public DoomWad _root() { return _root; }
        public DoomWad.IndexEntry _parent() { return _parent; }
    }
    private ArrayList<IndexEntry> index;
    public ArrayList<IndexEntry> index() {
        if (this.index != null)
            return this.index;
        long _pos = this._io.pos();
        this._io.seek(indexOffset());
        index = new ArrayList<IndexEntry>(((Number) (numIndexEntries())).intValue());
        for (int i = 0; i < numIndexEntries(); i++) {
            this.index.add(new IndexEntry(this._io, this, _root));
        }
        this._io.seek(_pos);
        return this.index;
    }
    private String magic;
    private int numIndexEntries;
    private int indexOffset;
    private DoomWad _root;
    private KaitaiStruct _parent;
    public String magic() { return magic; }

    /**
     * Number of entries in the lump index
     */
    public int numIndexEntries() { return numIndexEntries; }

    /**
     * Offset to the start of the index
     */
    public int indexOffset() { return indexOffset; }
    public DoomWad _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

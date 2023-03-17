// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;
import java.util.Arrays;


/**
 * Blender is an open source suite for 3D modelling, sculpting,
 * animation, compositing, rendering, preparation of assets for its own
 * game engine and exporting to others, etc. `.blend` is its own binary
 * format that saves whole state of suite: current scene, animations,
 * all software settings, extensions, etc.
 * 
 * Internally, .blend format is a hybrid semi-self-descriptive
 * format. On top level, it contains a simple header and a sequence of
 * file blocks, which more or less follow typical [TLV
 * pattern](https://en.wikipedia.org/wiki/Type-length-value). Pre-last
 * block would be a structure with code `DNA1`, which is a essentially
 * a machine-readable schema of all other structures used in this file.
 */
public class BlenderBlend extends KaitaiStruct {
    public static BlenderBlend fromFile(String fileName) throws IOException {
        return new BlenderBlend(new ByteBufferKaitaiStream(fileName));
    }

    public enum PtrSize {
        BITS_64(45),
        BITS_32(95);

        private final long id;
        PtrSize(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PtrSize> byId = new HashMap<Long, PtrSize>(2);
        static {
            for (PtrSize e : PtrSize.values())
                byId.put(e.id(), e);
        }
        public static PtrSize byId(long id) { return byId.get(id); }
    }

    public enum Endian {
        BE(86),
        LE(118);

        private final long id;
        Endian(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Endian> byId = new HashMap<Long, Endian>(2);
        static {
            for (Endian e : Endian.values())
                byId.put(e.id(), e);
        }
        public static Endian byId(long id) { return byId.get(id); }
    }

    public BlenderBlend(KaitaiStream _io) {
        this(_io, null, null);
    }

    public BlenderBlend(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public BlenderBlend(KaitaiStream _io, KaitaiStruct _parent, BlenderBlend _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.hdr = new Header(this._io, this, _root);
        this.blocks = new ArrayList<FileBlock>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.blocks.add(new FileBlock(this._io, this, _root));
                i++;
            }
        }
    }

    /**
     * DNA struct contains a `type` (type name), which is specified as
     * an index in types table, and sequence of fields.
     */
    public static class DnaStruct extends KaitaiStruct {
        public static DnaStruct fromFile(String fileName) throws IOException {
            return new DnaStruct(new ByteBufferKaitaiStream(fileName));
        }

        public DnaStruct(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DnaStruct(KaitaiStream _io, BlenderBlend.Dna1Body _parent) {
            this(_io, _parent, null);
        }

        public DnaStruct(KaitaiStream _io, BlenderBlend.Dna1Body _parent, BlenderBlend _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.idxType = this._io.readU2le();
            this.numFields = this._io.readU2le();
            this.fields = new ArrayList<DnaField>();
            for (int i = 0; i < numFields(); i++) {
                this.fields.add(new DnaField(this._io, this, _root));
            }
        }
        private String type;
        public String type() {
            if (this.type != null)
                return this.type;
            this.type = _parent().types().get((int) idxType());
            return this.type;
        }
        private int idxType;
        private int numFields;
        private ArrayList<DnaField> fields;
        private BlenderBlend _root;
        private BlenderBlend.Dna1Body _parent;
        public int idxType() { return idxType; }
        public int numFields() { return numFields; }
        public ArrayList<DnaField> fields() { return fields; }
        public BlenderBlend _root() { return _root; }
        public BlenderBlend.Dna1Body _parent() { return _parent; }
    }
    public static class FileBlock extends KaitaiStruct {
        public static FileBlock fromFile(String fileName) throws IOException {
            return new FileBlock(new ByteBufferKaitaiStream(fileName));
        }

        public FileBlock(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileBlock(KaitaiStream _io, BlenderBlend _parent) {
            this(_io, _parent, null);
        }

        public FileBlock(KaitaiStream _io, BlenderBlend _parent, BlenderBlend _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.code = new String(this._io.readBytes(4), Charset.forName("ASCII"));
            this.lenBody = this._io.readU4le();
            this.memAddr = this._io.readBytes(_root().hdr().psize());
            this.sdnaIndex = this._io.readU4le();
            this.count = this._io.readU4le();
            switch (code()) {
            case "DNA1": {
                this._raw_body = this._io.readBytes(lenBody());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new Dna1Body(_io__raw_body, this, _root);
                break;
            }
            default: {
                this.body = this._io.readBytes(lenBody());
                break;
            }
            }
        }
        private DnaStruct sdnaStruct;
        public DnaStruct sdnaStruct() {
            if (this.sdnaStruct != null)
                return this.sdnaStruct;
            if (sdnaIndex() != 0) {
                this.sdnaStruct = _root().sdnaStructs().get((int) sdnaIndex());
            }
            return this.sdnaStruct;
        }
        private String code;
        private long lenBody;
        private byte[] memAddr;
        private long sdnaIndex;
        private long count;
        private Object body;
        private BlenderBlend _root;
        private BlenderBlend _parent;
        private byte[] _raw_body;

        /**
         * Identifier of the file block
         */
        public String code() { return code; }

        /**
         * Total length of the data after the header of file block
         */
        public long lenBody() { return lenBody; }

        /**
         * Memory address the structure was located when written to disk
         */
        public byte[] memAddr() { return memAddr; }

        /**
         * Index of the SDNA structure
         */
        public long sdnaIndex() { return sdnaIndex; }

        /**
         * Number of structure located in this file-block
         */
        public long count() { return count; }
        public Object body() { return body; }
        public BlenderBlend _root() { return _root; }
        public BlenderBlend _parent() { return _parent; }
        public byte[] _raw_body() { return _raw_body; }
    }

    /**
     * DNA1, also known as "Structure DNA", is a special block in
     * .blend file, which contains machine-readable specifications of
     * all other structures used in this .blend file.
     * 
     * Effectively, this block contains:
     * 
     * * a sequence of "names" (strings which represent field names)
     * * a sequence of "types" (strings which represent type name)
     * * a sequence of "type lengths"
     * * a sequence of "structs" (which describe contents of every
     *   structure, referring to types and names by index)
     * @see <a href="https://archive.blender.org/wiki/index.php/Dev:Source/Architecture/File_Format/#Structure_DNA">Source</a>
     */
    public static class Dna1Body extends KaitaiStruct {
        public static Dna1Body fromFile(String fileName) throws IOException {
            return new Dna1Body(new ByteBufferKaitaiStream(fileName));
        }

        public Dna1Body(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Dna1Body(KaitaiStream _io, BlenderBlend.FileBlock _parent) {
            this(_io, _parent, null);
        }

        public Dna1Body(KaitaiStream _io, BlenderBlend.FileBlock _parent, BlenderBlend _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.id = this._io.readBytes(4);
            if (!(Arrays.equals(id(), new byte[] { 83, 68, 78, 65 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, 68, 78, 65 }, id(), _io(), "/types/dna1_body/seq/0");
            }
            this.nameMagic = this._io.readBytes(4);
            if (!(Arrays.equals(nameMagic(), new byte[] { 78, 65, 77, 69 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 78, 65, 77, 69 }, nameMagic(), _io(), "/types/dna1_body/seq/1");
            }
            this.numNames = this._io.readU4le();
            this.names = new ArrayList<String>();
            for (int i = 0; i < numNames(); i++) {
                this.names.add(new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("UTF-8")));
            }
            this.padding1 = this._io.readBytes(KaitaiStream.mod((4 - _io().pos()), 4));
            this.typeMagic = this._io.readBytes(4);
            if (!(Arrays.equals(typeMagic(), new byte[] { 84, 89, 80, 69 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 84, 89, 80, 69 }, typeMagic(), _io(), "/types/dna1_body/seq/5");
            }
            this.numTypes = this._io.readU4le();
            this.types = new ArrayList<String>();
            for (int i = 0; i < numTypes(); i++) {
                this.types.add(new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("UTF-8")));
            }
            this.padding2 = this._io.readBytes(KaitaiStream.mod((4 - _io().pos()), 4));
            this.tlenMagic = this._io.readBytes(4);
            if (!(Arrays.equals(tlenMagic(), new byte[] { 84, 76, 69, 78 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 84, 76, 69, 78 }, tlenMagic(), _io(), "/types/dna1_body/seq/9");
            }
            this.lengths = new ArrayList<Integer>();
            for (int i = 0; i < numTypes(); i++) {
                this.lengths.add(this._io.readU2le());
            }
            this.padding3 = this._io.readBytes(KaitaiStream.mod((4 - _io().pos()), 4));
            this.strcMagic = this._io.readBytes(4);
            if (!(Arrays.equals(strcMagic(), new byte[] { 83, 84, 82, 67 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, 84, 82, 67 }, strcMagic(), _io(), "/types/dna1_body/seq/12");
            }
            this.numStructs = this._io.readU4le();
            this.structs = new ArrayList<DnaStruct>();
            for (int i = 0; i < numStructs(); i++) {
                this.structs.add(new DnaStruct(this._io, this, _root));
            }
        }
        private byte[] id;
        private byte[] nameMagic;
        private long numNames;
        private ArrayList<String> names;
        private byte[] padding1;
        private byte[] typeMagic;
        private long numTypes;
        private ArrayList<String> types;
        private byte[] padding2;
        private byte[] tlenMagic;
        private ArrayList<Integer> lengths;
        private byte[] padding3;
        private byte[] strcMagic;
        private long numStructs;
        private ArrayList<DnaStruct> structs;
        private BlenderBlend _root;
        private BlenderBlend.FileBlock _parent;
        public byte[] id() { return id; }
        public byte[] nameMagic() { return nameMagic; }
        public long numNames() { return numNames; }
        public ArrayList<String> names() { return names; }
        public byte[] padding1() { return padding1; }
        public byte[] typeMagic() { return typeMagic; }
        public long numTypes() { return numTypes; }
        public ArrayList<String> types() { return types; }
        public byte[] padding2() { return padding2; }
        public byte[] tlenMagic() { return tlenMagic; }
        public ArrayList<Integer> lengths() { return lengths; }
        public byte[] padding3() { return padding3; }
        public byte[] strcMagic() { return strcMagic; }
        public long numStructs() { return numStructs; }
        public ArrayList<DnaStruct> structs() { return structs; }
        public BlenderBlend _root() { return _root; }
        public BlenderBlend.FileBlock _parent() { return _parent; }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, BlenderBlend _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, BlenderBlend _parent, BlenderBlend _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(7);
            if (!(Arrays.equals(magic(), new byte[] { 66, 76, 69, 78, 68, 69, 82 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 66, 76, 69, 78, 68, 69, 82 }, magic(), _io(), "/types/header/seq/0");
            }
            this.ptrSizeId = BlenderBlend.PtrSize.byId(this._io.readU1());
            this.endian = BlenderBlend.Endian.byId(this._io.readU1());
            this.version = new String(this._io.readBytes(3), Charset.forName("ASCII"));
        }
        private Byte psize;

        /**
         * Number of bytes that a pointer occupies
         */
        public Byte psize() {
            if (this.psize != null)
                return this.psize;
            byte _tmp = (byte) ((ptrSizeId() == BlenderBlend.PtrSize.BITS_64 ? 8 : 4));
            this.psize = _tmp;
            return this.psize;
        }
        private byte[] magic;
        private PtrSize ptrSizeId;
        private Endian endian;
        private String version;
        private BlenderBlend _root;
        private BlenderBlend _parent;
        public byte[] magic() { return magic; }

        /**
         * Size of a pointer; all pointers in the file are stored in this format
         */
        public PtrSize ptrSizeId() { return ptrSizeId; }

        /**
         * Type of byte ordering used
         */
        public Endian endian() { return endian; }

        /**
         * Blender version used to save this file
         */
        public String version() { return version; }
        public BlenderBlend _root() { return _root; }
        public BlenderBlend _parent() { return _parent; }
    }
    public static class DnaField extends KaitaiStruct {
        public static DnaField fromFile(String fileName) throws IOException {
            return new DnaField(new ByteBufferKaitaiStream(fileName));
        }

        public DnaField(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DnaField(KaitaiStream _io, BlenderBlend.DnaStruct _parent) {
            this(_io, _parent, null);
        }

        public DnaField(KaitaiStream _io, BlenderBlend.DnaStruct _parent, BlenderBlend _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.idxType = this._io.readU2le();
            this.idxName = this._io.readU2le();
        }
        private String type;
        public String type() {
            if (this.type != null)
                return this.type;
            this.type = _parent()._parent().types().get((int) idxType());
            return this.type;
        }
        private String name;
        public String name() {
            if (this.name != null)
                return this.name;
            this.name = _parent()._parent().names().get((int) idxName());
            return this.name;
        }
        private int idxType;
        private int idxName;
        private BlenderBlend _root;
        private BlenderBlend.DnaStruct _parent;
        public int idxType() { return idxType; }
        public int idxName() { return idxName; }
        public BlenderBlend _root() { return _root; }
        public BlenderBlend.DnaStruct _parent() { return _parent; }
    }
    private ArrayList<DnaStruct> sdnaStructs;
    public ArrayList<DnaStruct> sdnaStructs() {
        if (this.sdnaStructs != null)
            return this.sdnaStructs;
        this.sdnaStructs = ((BlenderBlend.Dna1Body) (blocks().get((int) (blocks().size() - 2)).body())).structs();
        return this.sdnaStructs;
    }
    private Header hdr;
    private ArrayList<FileBlock> blocks;
    private BlenderBlend _root;
    private KaitaiStruct _parent;
    public Header hdr() { return hdr; }
    public ArrayList<FileBlock> blocks() { return blocks; }
    public BlenderBlend _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

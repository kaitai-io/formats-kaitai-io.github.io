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
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;


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
public class BlenderBlend extends KaitaiStruct.ReadWrite {
    public static BlenderBlend fromFile(String fileName) throws IOException {
        return new BlenderBlend(new ByteBufferKaitaiStream(fileName));
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
    public BlenderBlend() {
        this(null, null, null);
    }

    public BlenderBlend(KaitaiStream _io) {
        this(_io, null, null);
    }

    public BlenderBlend(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public BlenderBlend(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, BlenderBlend _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.hdr = new Header(this._io, this, _root);
        this.hdr._read();
        this.blocks = new ArrayList<FileBlock>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                FileBlock _t_blocks = new FileBlock(this._io, this, _root);
                try {
                    _t_blocks._read();
                } finally {
                    this.blocks.add(_t_blocks);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.hdr._fetchInstances();
        for (int i = 0; i < this.blocks.size(); i++) {
            this.blocks.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.hdr._write_Seq(this._io);
        for (int i = 0; i < this.blocks.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("blocks", 0, this._io.size() - this._io.pos());
            this.blocks.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("blocks", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        if (!Objects.equals(this.hdr._root(), _root()))
            throw new ConsistencyError("hdr", _root(), this.hdr._root());
        if (!Objects.equals(this.hdr._parent(), this))
            throw new ConsistencyError("hdr", this, this.hdr._parent());
        for (int i = 0; i < this.blocks.size(); i++) {
            if (!Objects.equals(this.blocks.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("blocks", _root(), this.blocks.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.blocks.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("blocks", this, this.blocks.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
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
    public static class Dna1Body extends KaitaiStruct.ReadWrite {
        public static Dna1Body fromFile(String fileName) throws IOException {
            return new Dna1Body(new ByteBufferKaitaiStream(fileName));
        }
        public Dna1Body() {
            this(null, null, null);
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
        }
        public void _read() {
            this.id = this._io.readBytes(4);
            if (!(Arrays.equals(this.id, new byte[] { 83, 68, 78, 65 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, 68, 78, 65 }, this.id, this._io, "/types/dna1_body/seq/0");
            }
            this.nameMagic = this._io.readBytes(4);
            if (!(Arrays.equals(this.nameMagic, new byte[] { 78, 65, 77, 69 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 78, 65, 77, 69 }, this.nameMagic, this._io, "/types/dna1_body/seq/1");
            }
            this.numNames = this._io.readU4le();
            this.names = new ArrayList<String>();
            for (int i = 0; i < numNames(); i++) {
                this.names.add(new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8));
            }
            this.padding1 = this._io.readBytes(KaitaiStream.mod(4 - _io().pos(), 4));
            this.typeMagic = this._io.readBytes(4);
            if (!(Arrays.equals(this.typeMagic, new byte[] { 84, 89, 80, 69 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 84, 89, 80, 69 }, this.typeMagic, this._io, "/types/dna1_body/seq/5");
            }
            this.numTypes = this._io.readU4le();
            this.types = new ArrayList<String>();
            for (int i = 0; i < numTypes(); i++) {
                this.types.add(new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8));
            }
            this.padding2 = this._io.readBytes(KaitaiStream.mod(4 - _io().pos(), 4));
            this.tlenMagic = this._io.readBytes(4);
            if (!(Arrays.equals(this.tlenMagic, new byte[] { 84, 76, 69, 78 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 84, 76, 69, 78 }, this.tlenMagic, this._io, "/types/dna1_body/seq/9");
            }
            this.lengths = new ArrayList<Integer>();
            for (int i = 0; i < numTypes(); i++) {
                this.lengths.add(this._io.readU2le());
            }
            this.padding3 = this._io.readBytes(KaitaiStream.mod(4 - _io().pos(), 4));
            this.strcMagic = this._io.readBytes(4);
            if (!(Arrays.equals(this.strcMagic, new byte[] { 83, 84, 82, 67 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, 84, 82, 67 }, this.strcMagic, this._io, "/types/dna1_body/seq/12");
            }
            this.numStructs = this._io.readU4le();
            this.structs = new ArrayList<DnaStruct>();
            for (int i = 0; i < numStructs(); i++) {
                DnaStruct _t_structs = new DnaStruct(this._io, this, _root);
                try {
                    _t_structs._read();
                } finally {
                    this.structs.add(_t_structs);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.names.size(); i++) {
            }
            for (int i = 0; i < this.types.size(); i++) {
            }
            for (int i = 0; i < this.lengths.size(); i++) {
            }
            for (int i = 0; i < this.structs.size(); i++) {
                this.structs.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.id);
            this._io.writeBytes(this.nameMagic);
            this._io.writeU4le(this.numNames);
            for (int i = 0; i < this.names.size(); i++) {
                this._io.writeBytes((this.names.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")));
                this._io.writeU1(0);
            }
            if (this.padding1.length != KaitaiStream.mod(4 - _io().pos(), 4))
                throw new ConsistencyError("padding_1", KaitaiStream.mod(4 - _io().pos(), 4), this.padding1.length);
            this._io.writeBytes(this.padding1);
            this._io.writeBytes(this.typeMagic);
            this._io.writeU4le(this.numTypes);
            for (int i = 0; i < this.types.size(); i++) {
                this._io.writeBytes((this.types.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")));
                this._io.writeU1(0);
            }
            if (this.padding2.length != KaitaiStream.mod(4 - _io().pos(), 4))
                throw new ConsistencyError("padding_2", KaitaiStream.mod(4 - _io().pos(), 4), this.padding2.length);
            this._io.writeBytes(this.padding2);
            this._io.writeBytes(this.tlenMagic);
            for (int i = 0; i < this.lengths.size(); i++) {
                this._io.writeU2le(this.lengths.get(((Number) (i)).intValue()));
            }
            if (this.padding3.length != KaitaiStream.mod(4 - _io().pos(), 4))
                throw new ConsistencyError("padding_3", KaitaiStream.mod(4 - _io().pos(), 4), this.padding3.length);
            this._io.writeBytes(this.padding3);
            this._io.writeBytes(this.strcMagic);
            this._io.writeU4le(this.numStructs);
            for (int i = 0; i < this.structs.size(); i++) {
                this.structs.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.id.length != 4)
                throw new ConsistencyError("id", 4, this.id.length);
            if (!(Arrays.equals(this.id, new byte[] { 83, 68, 78, 65 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, 68, 78, 65 }, this.id, null, "/types/dna1_body/seq/0");
            }
            if (this.nameMagic.length != 4)
                throw new ConsistencyError("name_magic", 4, this.nameMagic.length);
            if (!(Arrays.equals(this.nameMagic, new byte[] { 78, 65, 77, 69 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 78, 65, 77, 69 }, this.nameMagic, null, "/types/dna1_body/seq/1");
            }
            if (this.names.size() != numNames())
                throw new ConsistencyError("names", numNames(), this.names.size());
            for (int i = 0; i < this.names.size(); i++) {
                if (KaitaiStream.byteArrayIndexOf((this.names.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                    throw new ConsistencyError("names", -1, KaitaiStream.byteArrayIndexOf((this.names.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            }
            if (this.typeMagic.length != 4)
                throw new ConsistencyError("type_magic", 4, this.typeMagic.length);
            if (!(Arrays.equals(this.typeMagic, new byte[] { 84, 89, 80, 69 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 84, 89, 80, 69 }, this.typeMagic, null, "/types/dna1_body/seq/5");
            }
            if (this.types.size() != numTypes())
                throw new ConsistencyError("types", numTypes(), this.types.size());
            for (int i = 0; i < this.types.size(); i++) {
                if (KaitaiStream.byteArrayIndexOf((this.types.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                    throw new ConsistencyError("types", -1, KaitaiStream.byteArrayIndexOf((this.types.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            }
            if (this.tlenMagic.length != 4)
                throw new ConsistencyError("tlen_magic", 4, this.tlenMagic.length);
            if (!(Arrays.equals(this.tlenMagic, new byte[] { 84, 76, 69, 78 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 84, 76, 69, 78 }, this.tlenMagic, null, "/types/dna1_body/seq/9");
            }
            if (this.lengths.size() != numTypes())
                throw new ConsistencyError("lengths", numTypes(), this.lengths.size());
            for (int i = 0; i < this.lengths.size(); i++) {
            }
            if (this.strcMagic.length != 4)
                throw new ConsistencyError("strc_magic", 4, this.strcMagic.length);
            if (!(Arrays.equals(this.strcMagic, new byte[] { 83, 84, 82, 67 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, 84, 82, 67 }, this.strcMagic, null, "/types/dna1_body/seq/12");
            }
            if (this.structs.size() != numStructs())
                throw new ConsistencyError("structs", numStructs(), this.structs.size());
            for (int i = 0; i < this.structs.size(); i++) {
                if (!Objects.equals(this.structs.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("structs", _root(), this.structs.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.structs.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("structs", this, this.structs.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private byte[] id;
        private byte[] nameMagic;
        private long numNames;
        private List<String> names;
        private byte[] padding1;
        private byte[] typeMagic;
        private long numTypes;
        private List<String> types;
        private byte[] padding2;
        private byte[] tlenMagic;
        private List<Integer> lengths;
        private byte[] padding3;
        private byte[] strcMagic;
        private long numStructs;
        private List<DnaStruct> structs;
        private BlenderBlend _root;
        private BlenderBlend.FileBlock _parent;
        public byte[] id() { return id; }
        public void setId(byte[] _v) { _dirty = true; id = _v; }
        public byte[] nameMagic() { return nameMagic; }
        public void setNameMagic(byte[] _v) { _dirty = true; nameMagic = _v; }
        public long numNames() { return numNames; }
        public void setNumNames(long _v) { _dirty = true; numNames = _v; }
        public List<String> names() { return names; }
        public void setNames(List<String> _v) { _dirty = true; names = _v; }
        public byte[] padding1() { return padding1; }
        public void setPadding1(byte[] _v) { _dirty = true; padding1 = _v; }
        public byte[] typeMagic() { return typeMagic; }
        public void setTypeMagic(byte[] _v) { _dirty = true; typeMagic = _v; }
        public long numTypes() { return numTypes; }
        public void setNumTypes(long _v) { _dirty = true; numTypes = _v; }
        public List<String> types() { return types; }
        public void setTypes(List<String> _v) { _dirty = true; types = _v; }
        public byte[] padding2() { return padding2; }
        public void setPadding2(byte[] _v) { _dirty = true; padding2 = _v; }
        public byte[] tlenMagic() { return tlenMagic; }
        public void setTlenMagic(byte[] _v) { _dirty = true; tlenMagic = _v; }
        public List<Integer> lengths() { return lengths; }
        public void setLengths(List<Integer> _v) { _dirty = true; lengths = _v; }
        public byte[] padding3() { return padding3; }
        public void setPadding3(byte[] _v) { _dirty = true; padding3 = _v; }
        public byte[] strcMagic() { return strcMagic; }
        public void setStrcMagic(byte[] _v) { _dirty = true; strcMagic = _v; }
        public long numStructs() { return numStructs; }
        public void setNumStructs(long _v) { _dirty = true; numStructs = _v; }
        public List<DnaStruct> structs() { return structs; }
        public void setStructs(List<DnaStruct> _v) { _dirty = true; structs = _v; }
        public BlenderBlend _root() { return _root; }
        public void set_root(BlenderBlend _v) { _dirty = true; _root = _v; }
        public BlenderBlend.FileBlock _parent() { return _parent; }
        public void set_parent(BlenderBlend.FileBlock _v) { _dirty = true; _parent = _v; }
    }
    public static class DnaField extends KaitaiStruct.ReadWrite {
        public static DnaField fromFile(String fileName) throws IOException {
            return new DnaField(new ByteBufferKaitaiStream(fileName));
        }
        public DnaField() {
            this(null, null, null);
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
        }
        public void _read() {
            this.idxType = this._io.readU2le();
            this.idxName = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.idxType);
            this._io.writeU2le(this.idxName);
        }

        public void _check() {
            _dirty = false;
        }
        private String name;
        public String name() {
            if (this.name != null)
                return this.name;
            this.name = _parent()._parent().names().get(((Number) (idxName())).intValue());
            return this.name;
        }
        public void _invalidateName() { this.name = null; }
        private String type;
        public String type() {
            if (this.type != null)
                return this.type;
            this.type = _parent()._parent().types().get(((Number) (idxType())).intValue());
            return this.type;
        }
        public void _invalidateType() { this.type = null; }
        private int idxType;
        private int idxName;
        private BlenderBlend _root;
        private BlenderBlend.DnaStruct _parent;
        public int idxType() { return idxType; }
        public void setIdxType(int _v) { _dirty = true; idxType = _v; }
        public int idxName() { return idxName; }
        public void setIdxName(int _v) { _dirty = true; idxName = _v; }
        public BlenderBlend _root() { return _root; }
        public void set_root(BlenderBlend _v) { _dirty = true; _root = _v; }
        public BlenderBlend.DnaStruct _parent() { return _parent; }
        public void set_parent(BlenderBlend.DnaStruct _v) { _dirty = true; _parent = _v; }
    }

    /**
     * DNA struct contains a `type` (type name), which is specified as
     * an index in types table, and sequence of fields.
     */
    public static class DnaStruct extends KaitaiStruct.ReadWrite {
        public static DnaStruct fromFile(String fileName) throws IOException {
            return new DnaStruct(new ByteBufferKaitaiStream(fileName));
        }
        public DnaStruct() {
            this(null, null, null);
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
        }
        public void _read() {
            this.idxType = this._io.readU2le();
            this.numFields = this._io.readU2le();
            this.fields = new ArrayList<DnaField>();
            for (int i = 0; i < numFields(); i++) {
                DnaField _t_fields = new DnaField(this._io, this, _root);
                try {
                    _t_fields._read();
                } finally {
                    this.fields.add(_t_fields);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.fields.size(); i++) {
                this.fields.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.idxType);
            this._io.writeU2le(this.numFields);
            for (int i = 0; i < this.fields.size(); i++) {
                this.fields.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.fields.size() != numFields())
                throw new ConsistencyError("fields", numFields(), this.fields.size());
            for (int i = 0; i < this.fields.size(); i++) {
                if (!Objects.equals(this.fields.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("fields", _root(), this.fields.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.fields.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("fields", this, this.fields.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private String type;
        public String type() {
            if (this.type != null)
                return this.type;
            this.type = _parent().types().get(((Number) (idxType())).intValue());
            return this.type;
        }
        public void _invalidateType() { this.type = null; }
        private int idxType;
        private int numFields;
        private List<DnaField> fields;
        private BlenderBlend _root;
        private BlenderBlend.Dna1Body _parent;
        public int idxType() { return idxType; }
        public void setIdxType(int _v) { _dirty = true; idxType = _v; }
        public int numFields() { return numFields; }
        public void setNumFields(int _v) { _dirty = true; numFields = _v; }
        public List<DnaField> fields() { return fields; }
        public void setFields(List<DnaField> _v) { _dirty = true; fields = _v; }
        public BlenderBlend _root() { return _root; }
        public void set_root(BlenderBlend _v) { _dirty = true; _root = _v; }
        public BlenderBlend.Dna1Body _parent() { return _parent; }
        public void set_parent(BlenderBlend.Dna1Body _v) { _dirty = true; _parent = _v; }
    }
    public static class FileBlock extends KaitaiStruct.ReadWrite {
        public static FileBlock fromFile(String fileName) throws IOException {
            return new FileBlock(new ByteBufferKaitaiStream(fileName));
        }
        public FileBlock() {
            this(null, null, null);
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
        }
        public void _read() {
            this.code = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
            this.lenBody = this._io.readU4le();
            this.memAddr = this._io.readBytes(_root().hdr().psize());
            this.sdnaIndex = this._io.readU4le();
            this.count = this._io.readU4le();
            switch (code()) {
            case "DNA1": {
                this._raw_body = this._io.readBytes(lenBody());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new Dna1Body(_io__raw_body, this, _root);
                ((Dna1Body) (this.body))._read();
                break;
            }
            default: {
                this.body = this._io.readBytes(lenBody());
                break;
            }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            switch (code()) {
            case "DNA1": {
                ((Dna1Body) (this.body))._fetchInstances();
                break;
            }
            default: {
                break;
            }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.code).getBytes(Charset.forName("ASCII")));
            this._io.writeU4le(this.lenBody);
            this._io.writeBytes(this.memAddr);
            this._io.writeU4le(this.sdnaIndex);
            this._io.writeU4le(this.count);
            switch (code()) {
            case "DNA1": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (lenBody()));
                    final FileBlock _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != lenBody())
                                throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((Dna1Body) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            default: {
                this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                break;
            }
            }
        }

        public void _check() {
            if ((this.code).getBytes(Charset.forName("ASCII")).length != 4)
                throw new ConsistencyError("code", 4, (this.code).getBytes(Charset.forName("ASCII")).length);
            if (this.memAddr.length != _root().hdr().psize())
                throw new ConsistencyError("mem_addr", _root().hdr().psize(), this.memAddr.length);
            switch (code()) {
            case "DNA1": {
                if (!Objects.equals(((BlenderBlend.Dna1Body) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((BlenderBlend.Dna1Body) (this.body))._root());
                if (!Objects.equals(((BlenderBlend.Dna1Body) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((BlenderBlend.Dna1Body) (this.body))._parent());
                break;
            }
            default: {
                if (((byte[]) (this.body)).length != lenBody())
                    throw new ConsistencyError("body", lenBody(), ((byte[]) (this.body)).length);
                break;
            }
            }
            _dirty = false;
        }
        private DnaStruct sdnaStruct;
        public DnaStruct sdnaStruct() {
            if (this.sdnaStruct != null)
                return this.sdnaStruct;
            if (sdnaIndex() != 0) {
                this.sdnaStruct = _root().sdnaStructs().get(((Number) (sdnaIndex())).intValue());
            }
            return this.sdnaStruct;
        }
        public void _invalidateSdnaStruct() { this.sdnaStruct = null; }
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
        public void setCode(String _v) { _dirty = true; code = _v; }

        /**
         * Total length of the data after the header of file block
         */
        public long lenBody() { return lenBody; }
        public void setLenBody(long _v) { _dirty = true; lenBody = _v; }

        /**
         * Memory address the structure was located when written to disk
         */
        public byte[] memAddr() { return memAddr; }
        public void setMemAddr(byte[] _v) { _dirty = true; memAddr = _v; }

        /**
         * Index of the SDNA structure
         */
        public long sdnaIndex() { return sdnaIndex; }
        public void setSdnaIndex(long _v) { _dirty = true; sdnaIndex = _v; }

        /**
         * Number of structure located in this file-block
         */
        public long count() { return count; }
        public void setCount(long _v) { _dirty = true; count = _v; }
        public Object body() { return body; }
        public void setBody(Object _v) { _dirty = true; body = _v; }
        public BlenderBlend _root() { return _root; }
        public void set_root(BlenderBlend _v) { _dirty = true; _root = _v; }
        public BlenderBlend _parent() { return _parent; }
        public void set_parent(BlenderBlend _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
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

        public Header(KaitaiStream _io, BlenderBlend _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, BlenderBlend _parent, BlenderBlend _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(7);
            if (!(Arrays.equals(this.magic, new byte[] { 66, 76, 69, 78, 68, 69, 82 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 66, 76, 69, 78, 68, 69, 82 }, this.magic, this._io, "/types/header/seq/0");
            }
            this.ptrSizeId = BlenderBlend.PtrSize.byId(this._io.readU1());
            this.endian = BlenderBlend.Endian.byId(this._io.readU1());
            this.version = new String(this._io.readBytes(3), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU1(((Number) (this.ptrSizeId.id())).intValue());
            this._io.writeU1(((Number) (this.endian.id())).intValue());
            this._io.writeBytes((this.version).getBytes(Charset.forName("ASCII")));
        }

        public void _check() {
            if (this.magic.length != 7)
                throw new ConsistencyError("magic", 7, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 66, 76, 69, 78, 68, 69, 82 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 66, 76, 69, 78, 68, 69, 82 }, this.magic, null, "/types/header/seq/0");
            }
            if ((this.version).getBytes(Charset.forName("ASCII")).length != 3)
                throw new ConsistencyError("version", 3, (this.version).getBytes(Charset.forName("ASCII")).length);
            _dirty = false;
        }
        private Byte psize;

        /**
         * Number of bytes that a pointer occupies
         */
        public Byte psize() {
            if (this.psize != null)
                return this.psize;
            this.psize = ((Number) ((ptrSizeId() == BlenderBlend.PtrSize.BITS_64 ? 8 : 4))).byteValue();
            return this.psize;
        }
        public void _invalidatePsize() { this.psize = null; }
        private byte[] magic;
        private PtrSize ptrSizeId;
        private Endian endian;
        private String version;
        private BlenderBlend _root;
        private BlenderBlend _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

        /**
         * Size of a pointer; all pointers in the file are stored in this format
         */
        public PtrSize ptrSizeId() { return ptrSizeId; }
        public void setPtrSizeId(PtrSize _v) { _dirty = true; ptrSizeId = _v; }

        /**
         * Type of byte ordering used
         */
        public Endian endian() { return endian; }
        public void setEndian(Endian _v) { _dirty = true; endian = _v; }

        /**
         * Blender version used to save this file
         */
        public String version() { return version; }
        public void setVersion(String _v) { _dirty = true; version = _v; }
        public BlenderBlend _root() { return _root; }
        public void set_root(BlenderBlend _v) { _dirty = true; _root = _v; }
        public BlenderBlend _parent() { return _parent; }
        public void set_parent(BlenderBlend _v) { _dirty = true; _parent = _v; }
    }
    private List<DnaStruct> sdnaStructs;
    public List<DnaStruct> sdnaStructs() {
        if (this.sdnaStructs != null)
            return this.sdnaStructs;
        this.sdnaStructs = ((BlenderBlend.Dna1Body) (blocks().get(((Number) (blocks().size() - 2)).intValue()).body())).structs();
        return this.sdnaStructs;
    }
    public void _invalidateSdnaStructs() { this.sdnaStructs = null; }
    private Header hdr;
    private List<FileBlock> blocks;
    private BlenderBlend _root;
    private KaitaiStruct.ReadWrite _parent;
    public Header hdr() { return hdr; }
    public void setHdr(Header _v) { _dirty = true; hdr = _v; }
    public List<FileBlock> blocks() { return blocks; }
    public void setBlocks(List<FileBlock> _v) { _dirty = true; blocks = _v; }
    public BlenderBlend _root() { return _root; }
    public void set_root(BlenderBlend _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

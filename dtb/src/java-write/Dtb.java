// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;


/**
 * Also referred to as Devicetree Blob (DTB). It is a flat binary encoding
 * of data (primarily devicetree data, although other data is possible as well).
 * The data is internally stored as a tree of named nodes and properties. Nodes
 * contain properties and child nodes, while properties are name-value pairs.
 * 
 * The Devicetree Blobs (`.dtb` files) are compiled from the Devicetree Source
 * files (`.dts`) through the Devicetree compiler (DTC).
 * 
 * On Linux systems that support this, the blobs can be accessed in
 * `/sys/firmware/fdt`:
 * 
 * * <https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-ofw>
 * 
 * The encoding of strings used in the `strings_block` and `structure_block` is
 * actually a subset of ASCII:
 * 
 * <https://devicetree-specification.readthedocs.io/en/v0.3/devicetree-basics.html#node-names>
 * 
 * Example files:
 * 
 * * <https://github.com/qemu/qemu/tree/master/pc-bios>
 * @see <a href="https://devicetree-specification.readthedocs.io/en/v0.3/flattened-format.html">Source</a>
 * @see <a href="https://elinux.org/images/f/f4/Elc2013_Fernandes.pdf">Source</a>
 */
public class Dtb extends KaitaiStruct.ReadWrite {
    public static Dtb fromFile(String fileName) throws IOException {
        return new Dtb(new ByteBufferKaitaiStream(fileName));
    }

    public enum Fdt {
        BEGIN_NODE(1),
        END_NODE(2),
        PROP(3),
        NOP(4),
        END(9);

        private final long id;
        Fdt(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Fdt> byId = new HashMap<Long, Fdt>(5);
        static {
            for (Fdt e : Fdt.values())
                byId.put(e.id(), e);
        }
        public static Fdt byId(long id) { return byId.get(id); }
    }
    public Dtb() {
        this(null, null, null);
    }

    public Dtb(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Dtb(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Dtb(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Dtb _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { -48, 13, -2, -19 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -48, 13, -2, -19 }, this.magic, this._io, "/seq/0");
        }
        this.totalSize = this._io.readU4be();
        this.ofsStructureBlock = this._io.readU4be();
        this.ofsStringsBlock = this._io.readU4be();
        this.ofsMemoryReservationBlock = this._io.readU4be();
        this.version = this._io.readU4be();
        this.minCompatibleVersion = this._io.readU4be();
        if (!(this.minCompatibleVersion <= version())) {
            throw new KaitaiStream.ValidationGreaterThanError(version(), this.minCompatibleVersion, this._io, "/seq/6");
        }
        this.bootCpuidPhys = this._io.readU4be();
        this.lenStringsBlock = this._io.readU4be();
        this.lenStructureBlock = this._io.readU4be();
        _dirty = false;
    }

    public void _fetchInstances() {
        memoryReservationBlock();
        if (this.memoryReservationBlock != null) {
            this.memoryReservationBlock._fetchInstances();
        }
        stringsBlock();
        if (this.stringsBlock != null) {
            this.stringsBlock._fetchInstances();
        }
        structureBlock();
        if (this.structureBlock != null) {
            this.structureBlock._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteMemoryReservationBlock = _enabledMemoryReservationBlock;
        _shouldWriteStringsBlock = _enabledStringsBlock;
        _shouldWriteStructureBlock = _enabledStructureBlock;
        this._io.writeBytes(this.magic);
        this._io.writeU4be(this.totalSize);
        this._io.writeU4be(this.ofsStructureBlock);
        this._io.writeU4be(this.ofsStringsBlock);
        this._io.writeU4be(this.ofsMemoryReservationBlock);
        this._io.writeU4be(this.version);
        this._io.writeU4be(this.minCompatibleVersion);
        this._io.writeU4be(this.bootCpuidPhys);
        this._io.writeU4be(this.lenStringsBlock);
        this._io.writeU4be(this.lenStructureBlock);
    }

    public void _check() {
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { -48, 13, -2, -19 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -48, 13, -2, -19 }, this.magic, null, "/seq/0");
        }
        if (!(this.minCompatibleVersion <= version())) {
            throw new KaitaiStream.ValidationGreaterThanError(version(), this.minCompatibleVersion, null, "/seq/6");
        }
        if (_enabledMemoryReservationBlock) {
            if (!Objects.equals(this.memoryReservationBlock._root(), _root()))
                throw new ConsistencyError("memory_reservation_block", _root(), this.memoryReservationBlock._root());
            if (!Objects.equals(this.memoryReservationBlock._parent(), this))
                throw new ConsistencyError("memory_reservation_block", this, this.memoryReservationBlock._parent());
        }
        if (_enabledStringsBlock) {
            if (!Objects.equals(this.stringsBlock._root(), _root()))
                throw new ConsistencyError("strings_block", _root(), this.stringsBlock._root());
            if (!Objects.equals(this.stringsBlock._parent(), this))
                throw new ConsistencyError("strings_block", this, this.stringsBlock._parent());
        }
        if (_enabledStructureBlock) {
            if (!Objects.equals(this.structureBlock._root(), _root()))
                throw new ConsistencyError("structure_block", _root(), this.structureBlock._root());
            if (!Objects.equals(this.structureBlock._parent(), this))
                throw new ConsistencyError("structure_block", this, this.structureBlock._parent());
        }
        _dirty = false;
    }
    public static class FdtBeginNode extends KaitaiStruct.ReadWrite {
        public static FdtBeginNode fromFile(String fileName) throws IOException {
            return new FdtBeginNode(new ByteBufferKaitaiStream(fileName));
        }
        public FdtBeginNode() {
            this(null, null, null);
        }

        public FdtBeginNode(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FdtBeginNode(KaitaiStream _io, Dtb.FdtNode _parent) {
            this(_io, _parent, null);
        }

        public FdtBeginNode(KaitaiStream _io, Dtb.FdtNode _parent, Dtb _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.name = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
            this.padding = this._io.readBytes(KaitaiStream.mod(-(_io().pos()), 4));
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.name).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(0);
            if (this.padding.length != KaitaiStream.mod(-(_io().pos()), 4))
                throw new ConsistencyError("padding", KaitaiStream.mod(-(_io().pos()), 4), this.padding.length);
            this._io.writeBytes(this.padding);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            _dirty = false;
        }
        private String name;
        private byte[] padding;
        private Dtb _root;
        private Dtb.FdtNode _parent;
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public byte[] padding() { return padding; }
        public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
        public Dtb _root() { return _root; }
        public void set_root(Dtb _v) { _dirty = true; _root = _v; }
        public Dtb.FdtNode _parent() { return _parent; }
        public void set_parent(Dtb.FdtNode _v) { _dirty = true; _parent = _v; }
    }
    public static class FdtBlock extends KaitaiStruct.ReadWrite {
        public static FdtBlock fromFile(String fileName) throws IOException {
            return new FdtBlock(new ByteBufferKaitaiStream(fileName));
        }
        public FdtBlock() {
            this(null, null, null);
        }

        public FdtBlock(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FdtBlock(KaitaiStream _io, Dtb _parent) {
            this(_io, _parent, null);
        }

        public FdtBlock(KaitaiStream _io, Dtb _parent, Dtb _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.nodes = new ArrayList<FdtNode>();
            {
                FdtNode _it;
                int i = 0;
                do {
                    FdtNode _t_nodes = new FdtNode(this._io, this, _root);
                    try {
                        _t_nodes._read();
                    } finally {
                        _it = _t_nodes;
                        this.nodes.add(_it);
                    }
                    i++;
                } while (!(_it.type() == Dtb.Fdt.END));
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.nodes.size(); i++) {
                this.nodes.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.nodes.size(); i++) {
                this.nodes.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.nodes.size() == 0)
                throw new ConsistencyError("nodes", 0, this.nodes.size());
            for (int i = 0; i < this.nodes.size(); i++) {
                if (!Objects.equals(this.nodes.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("nodes", _root(), this.nodes.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.nodes.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("nodes", this, this.nodes.get(((Number) (i)).intValue())._parent());
                {
                    FdtNode _it = this.nodes.get(((Number) (i)).intValue());
                    if ((_it.type() == Dtb.Fdt.END) != (i == this.nodes.size() - 1))
                        throw new ConsistencyError("nodes", i == this.nodes.size() - 1, _it.type() == Dtb.Fdt.END);
                }
            }
            _dirty = false;
        }
        private List<FdtNode> nodes;
        private Dtb _root;
        private Dtb _parent;
        public List<FdtNode> nodes() { return nodes; }
        public void setNodes(List<FdtNode> _v) { _dirty = true; nodes = _v; }
        public Dtb _root() { return _root; }
        public void set_root(Dtb _v) { _dirty = true; _root = _v; }
        public Dtb _parent() { return _parent; }
        public void set_parent(Dtb _v) { _dirty = true; _parent = _v; }
    }
    public static class FdtNode extends KaitaiStruct.ReadWrite {
        public static FdtNode fromFile(String fileName) throws IOException {
            return new FdtNode(new ByteBufferKaitaiStream(fileName));
        }
        public FdtNode() {
            this(null, null, null);
        }

        public FdtNode(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FdtNode(KaitaiStream _io, Dtb.FdtBlock _parent) {
            this(_io, _parent, null);
        }

        public FdtNode(KaitaiStream _io, Dtb.FdtBlock _parent, Dtb _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.type = Dtb.Fdt.byId(this._io.readU4be());
            {
                Fdt on = type();
                if (on != null) {
                    switch (type()) {
                    case BEGIN_NODE: {
                        this.body = new FdtBeginNode(this._io, this, _root);
                        ((FdtBeginNode) (this.body))._read();
                        break;
                    }
                    case PROP: {
                        this.body = new FdtProp(this._io, this, _root);
                        ((FdtProp) (this.body))._read();
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                Fdt on = type();
                if (on != null) {
                    switch (type()) {
                    case BEGIN_NODE: {
                        ((FdtBeginNode) (this.body))._fetchInstances();
                        break;
                    }
                    case PROP: {
                        ((FdtProp) (this.body))._fetchInstances();
                        break;
                    }
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(((Number) (this.type.id())).longValue());
            {
                Fdt on = type();
                if (on != null) {
                    switch (type()) {
                    case BEGIN_NODE: {
                        ((FdtBeginNode) (this.body))._write_Seq(this._io);
                        break;
                    }
                    case PROP: {
                        ((FdtProp) (this.body))._write_Seq(this._io);
                        break;
                    }
                    }
                }
            }
        }

        public void _check() {
            {
                Fdt on = type();
                if (on != null) {
                    switch (type()) {
                    case BEGIN_NODE: {
                        if (!Objects.equals(((Dtb.FdtBeginNode) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Dtb.FdtBeginNode) (this.body))._root());
                        if (!Objects.equals(((Dtb.FdtBeginNode) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Dtb.FdtBeginNode) (this.body))._parent());
                        break;
                    }
                    case PROP: {
                        if (!Objects.equals(((Dtb.FdtProp) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Dtb.FdtProp) (this.body))._root());
                        if (!Objects.equals(((Dtb.FdtProp) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Dtb.FdtProp) (this.body))._parent());
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }
        private Fdt type;
        private KaitaiStruct.ReadWrite body;
        private Dtb _root;
        private Dtb.FdtBlock _parent;
        public Fdt type() { return type; }
        public void setType(Fdt _v) { _dirty = true; type = _v; }
        public KaitaiStruct.ReadWrite body() { return body; }
        public void setBody(KaitaiStruct.ReadWrite _v) { _dirty = true; body = _v; }
        public Dtb _root() { return _root; }
        public void set_root(Dtb _v) { _dirty = true; _root = _v; }
        public Dtb.FdtBlock _parent() { return _parent; }
        public void set_parent(Dtb.FdtBlock _v) { _dirty = true; _parent = _v; }
    }
    public static class FdtProp extends KaitaiStruct.ReadWrite {
        public static FdtProp fromFile(String fileName) throws IOException {
            return new FdtProp(new ByteBufferKaitaiStream(fileName));
        }
        public FdtProp() {
            this(null, null, null);
        }

        public FdtProp(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FdtProp(KaitaiStream _io, Dtb.FdtNode _parent) {
            this(_io, _parent, null);
        }

        public FdtProp(KaitaiStream _io, Dtb.FdtNode _parent, Dtb _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenProperty = this._io.readU4be();
            this.ofsName = this._io.readU4be();
            this.property = this._io.readBytes(lenProperty());
            this.padding = this._io.readBytes(KaitaiStream.mod(-(_io().pos()), 4));
            _dirty = false;
        }

        public void _fetchInstances() {
            name();
            if (this.name != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteName = _enabledName;
            this._io.writeU4be(this.lenProperty);
            this._io.writeU4be(this.ofsName);
            this._io.writeBytes(this.property);
            if (this.padding.length != KaitaiStream.mod(-(_io().pos()), 4))
                throw new ConsistencyError("padding", KaitaiStream.mod(-(_io().pos()), 4), this.padding.length);
            this._io.writeBytes(this.padding);
        }

        public void _check() {
            if (this.property.length != lenProperty())
                throw new ConsistencyError("property", lenProperty(), this.property.length);
            if (_enabledName) {
                if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                    throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            }
            _dirty = false;
        }
        private String name;
        private boolean _shouldWriteName = false;
        private boolean _enabledName = true;
        public String name() {
            if (_shouldWriteName)
                _writeName();
            if (this.name != null)
                return this.name;
            if (!_enabledName)
                return null;
            KaitaiStream io = _root().stringsBlock()._io();
            long _pos = io.pos();
            io.seek(ofsName());
            this.name = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
            io.seek(_pos);
            return this.name;
        }
        public void setName(String _v) { _dirty = true; name = _v; }
        public void setName_Enabled(boolean _v) { _dirty = true; _enabledName = _v; }

        private void _writeName() {
            _shouldWriteName = false;
            KaitaiStream io = _root().stringsBlock()._io();
            long _pos = io.pos();
            io.seek(ofsName());
            io.writeBytes((this.name).getBytes(Charset.forName("ASCII")));
            io.writeU1(0);
            io.seek(_pos);
        }
        private long lenProperty;
        private long ofsName;
        private byte[] property;
        private byte[] padding;
        private Dtb _root;
        private Dtb.FdtNode _parent;
        public long lenProperty() { return lenProperty; }
        public void setLenProperty(long _v) { _dirty = true; lenProperty = _v; }
        public long ofsName() { return ofsName; }
        public void setOfsName(long _v) { _dirty = true; ofsName = _v; }
        public byte[] property() { return property; }
        public void setProperty(byte[] _v) { _dirty = true; property = _v; }
        public byte[] padding() { return padding; }
        public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
        public Dtb _root() { return _root; }
        public void set_root(Dtb _v) { _dirty = true; _root = _v; }
        public Dtb.FdtNode _parent() { return _parent; }
        public void set_parent(Dtb.FdtNode _v) { _dirty = true; _parent = _v; }
    }
    public static class MemoryBlock extends KaitaiStruct.ReadWrite {
        public static MemoryBlock fromFile(String fileName) throws IOException {
            return new MemoryBlock(new ByteBufferKaitaiStream(fileName));
        }
        public MemoryBlock() {
            this(null, null, null);
        }

        public MemoryBlock(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MemoryBlock(KaitaiStream _io, Dtb _parent) {
            this(_io, _parent, null);
        }

        public MemoryBlock(KaitaiStream _io, Dtb _parent, Dtb _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<MemoryBlockEntry>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    MemoryBlockEntry _t_entries = new MemoryBlockEntry(this._io, this, _root);
                    try {
                        _t_entries._read();
                    } finally {
                        this.entries.add(_t_entries);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.entries.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.entries.size(); i++) {
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<MemoryBlockEntry> entries;
        private Dtb _root;
        private Dtb _parent;
        public List<MemoryBlockEntry> entries() { return entries; }
        public void setEntries(List<MemoryBlockEntry> _v) { _dirty = true; entries = _v; }
        public Dtb _root() { return _root; }
        public void set_root(Dtb _v) { _dirty = true; _root = _v; }
        public Dtb _parent() { return _parent; }
        public void set_parent(Dtb _v) { _dirty = true; _parent = _v; }
    }
    public static class MemoryBlockEntry extends KaitaiStruct.ReadWrite {
        public static MemoryBlockEntry fromFile(String fileName) throws IOException {
            return new MemoryBlockEntry(new ByteBufferKaitaiStream(fileName));
        }
        public MemoryBlockEntry() {
            this(null, null, null);
        }

        public MemoryBlockEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MemoryBlockEntry(KaitaiStream _io, Dtb.MemoryBlock _parent) {
            this(_io, _parent, null);
        }

        public MemoryBlockEntry(KaitaiStream _io, Dtb.MemoryBlock _parent, Dtb _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.address = this._io.readU8be();
            this.size = this._io.readU8be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8be(this.address);
            this._io.writeU8be(this.size);
        }

        public void _check() {
            _dirty = false;
        }
        private long address;
        private long size;
        private Dtb _root;
        private Dtb.MemoryBlock _parent;

        /**
         * physical address of a reserved memory region
         */
        public long address() { return address; }
        public void setAddress(long _v) { _dirty = true; address = _v; }

        /**
         * size of a reserved memory region
         */
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public Dtb _root() { return _root; }
        public void set_root(Dtb _v) { _dirty = true; _root = _v; }
        public Dtb.MemoryBlock _parent() { return _parent; }
        public void set_parent(Dtb.MemoryBlock _v) { _dirty = true; _parent = _v; }
    }
    public static class Strings extends KaitaiStruct.ReadWrite {
        public static Strings fromFile(String fileName) throws IOException {
            return new Strings(new ByteBufferKaitaiStream(fileName));
        }
        public Strings() {
            this(null, null, null);
        }

        public Strings(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Strings(KaitaiStream _io, Dtb _parent) {
            this(_io, _parent, null);
        }

        public Strings(KaitaiStream _io, Dtb _parent, Dtb _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.strings = new ArrayList<String>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.strings.add(new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII));
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.strings.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.strings.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("strings", 0, this._io.size() - this._io.pos());
                this._io.writeBytes((this.strings.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")));
                this._io.writeU1(0);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("strings", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.strings.size(); i++) {
                if (KaitaiStream.byteArrayIndexOf((this.strings.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                    throw new ConsistencyError("strings", -1, KaitaiStream.byteArrayIndexOf((this.strings.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            }
            _dirty = false;
        }
        private List<String> strings;
        private Dtb _root;
        private Dtb _parent;
        public List<String> strings() { return strings; }
        public void setStrings(List<String> _v) { _dirty = true; strings = _v; }
        public Dtb _root() { return _root; }
        public void set_root(Dtb _v) { _dirty = true; _root = _v; }
        public Dtb _parent() { return _parent; }
        public void set_parent(Dtb _v) { _dirty = true; _parent = _v; }
    }
    private MemoryBlock memoryReservationBlock;
    private boolean _shouldWriteMemoryReservationBlock = false;
    private boolean _enabledMemoryReservationBlock = true;
    public MemoryBlock memoryReservationBlock() {
        if (_shouldWriteMemoryReservationBlock)
            _writeMemoryReservationBlock();
        if (this.memoryReservationBlock != null)
            return this.memoryReservationBlock;
        if (!_enabledMemoryReservationBlock)
            return null;
        long _pos = this._io.pos();
        this._io.seek(ofsMemoryReservationBlock());
        this._raw_memoryReservationBlock = this._io.readBytes(ofsStructureBlock() - ofsMemoryReservationBlock());
        KaitaiStream _io__raw_memoryReservationBlock = new ByteBufferKaitaiStream(this._raw_memoryReservationBlock);
        this.memoryReservationBlock = new MemoryBlock(_io__raw_memoryReservationBlock, this, _root);
        this.memoryReservationBlock._read();
        this._io.seek(_pos);
        return this.memoryReservationBlock;
    }
    public void setMemoryReservationBlock(MemoryBlock _v) { _dirty = true; memoryReservationBlock = _v; }
    public void setMemoryReservationBlock_Enabled(boolean _v) { _dirty = true; _enabledMemoryReservationBlock = _v; }

    private void _writeMemoryReservationBlock() {
        _shouldWriteMemoryReservationBlock = false;
        long _pos = this._io.pos();
        this._io.seek(ofsMemoryReservationBlock());
        final KaitaiStream _io__raw_memoryReservationBlock = new ByteBufferKaitaiStream(ofsStructureBlock() - ofsMemoryReservationBlock());
        this._io.addChildStream(_io__raw_memoryReservationBlock);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (ofsStructureBlock() - ofsMemoryReservationBlock()));
            final Dtb _this = this;
            _io__raw_memoryReservationBlock.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_memoryReservationBlock = _io__raw_memoryReservationBlock.toByteArray();
                    if (_this._raw_memoryReservationBlock.length != ofsStructureBlock() - ofsMemoryReservationBlock())
                        throw new ConsistencyError("raw(memory_reservation_block)", ofsStructureBlock() - ofsMemoryReservationBlock(), _this._raw_memoryReservationBlock.length);
                    parent.writeBytes(_this._raw_memoryReservationBlock);
                }
            });
        }
        this.memoryReservationBlock._write_Seq(_io__raw_memoryReservationBlock);
        this._io.seek(_pos);
    }
    private Strings stringsBlock;
    private boolean _shouldWriteStringsBlock = false;
    private boolean _enabledStringsBlock = true;
    public Strings stringsBlock() {
        if (_shouldWriteStringsBlock)
            _writeStringsBlock();
        if (this.stringsBlock != null)
            return this.stringsBlock;
        if (!_enabledStringsBlock)
            return null;
        long _pos = this._io.pos();
        this._io.seek(ofsStringsBlock());
        this._raw_stringsBlock = this._io.readBytes(lenStringsBlock());
        KaitaiStream _io__raw_stringsBlock = new ByteBufferKaitaiStream(this._raw_stringsBlock);
        this.stringsBlock = new Strings(_io__raw_stringsBlock, this, _root);
        this.stringsBlock._read();
        this._io.seek(_pos);
        return this.stringsBlock;
    }
    public void setStringsBlock(Strings _v) { _dirty = true; stringsBlock = _v; }
    public void setStringsBlock_Enabled(boolean _v) { _dirty = true; _enabledStringsBlock = _v; }

    private void _writeStringsBlock() {
        _shouldWriteStringsBlock = false;
        long _pos = this._io.pos();
        this._io.seek(ofsStringsBlock());
        final KaitaiStream _io__raw_stringsBlock = new ByteBufferKaitaiStream(lenStringsBlock());
        this._io.addChildStream(_io__raw_stringsBlock);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (lenStringsBlock()));
            final Dtb _this = this;
            _io__raw_stringsBlock.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_stringsBlock = _io__raw_stringsBlock.toByteArray();
                    if (_this._raw_stringsBlock.length != lenStringsBlock())
                        throw new ConsistencyError("raw(strings_block)", lenStringsBlock(), _this._raw_stringsBlock.length);
                    parent.writeBytes(_this._raw_stringsBlock);
                }
            });
        }
        this.stringsBlock._write_Seq(_io__raw_stringsBlock);
        this._io.seek(_pos);
    }
    private FdtBlock structureBlock;
    private boolean _shouldWriteStructureBlock = false;
    private boolean _enabledStructureBlock = true;
    public FdtBlock structureBlock() {
        if (_shouldWriteStructureBlock)
            _writeStructureBlock();
        if (this.structureBlock != null)
            return this.structureBlock;
        if (!_enabledStructureBlock)
            return null;
        long _pos = this._io.pos();
        this._io.seek(ofsStructureBlock());
        this._raw_structureBlock = this._io.readBytes(lenStructureBlock());
        KaitaiStream _io__raw_structureBlock = new ByteBufferKaitaiStream(this._raw_structureBlock);
        this.structureBlock = new FdtBlock(_io__raw_structureBlock, this, _root);
        this.structureBlock._read();
        this._io.seek(_pos);
        return this.structureBlock;
    }
    public void setStructureBlock(FdtBlock _v) { _dirty = true; structureBlock = _v; }
    public void setStructureBlock_Enabled(boolean _v) { _dirty = true; _enabledStructureBlock = _v; }

    private void _writeStructureBlock() {
        _shouldWriteStructureBlock = false;
        long _pos = this._io.pos();
        this._io.seek(ofsStructureBlock());
        final KaitaiStream _io__raw_structureBlock = new ByteBufferKaitaiStream(lenStructureBlock());
        this._io.addChildStream(_io__raw_structureBlock);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (lenStructureBlock()));
            final Dtb _this = this;
            _io__raw_structureBlock.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_structureBlock = _io__raw_structureBlock.toByteArray();
                    if (_this._raw_structureBlock.length != lenStructureBlock())
                        throw new ConsistencyError("raw(structure_block)", lenStructureBlock(), _this._raw_structureBlock.length);
                    parent.writeBytes(_this._raw_structureBlock);
                }
            });
        }
        this.structureBlock._write_Seq(_io__raw_structureBlock);
        this._io.seek(_pos);
    }
    private byte[] magic;
    private long totalSize;
    private long ofsStructureBlock;
    private long ofsStringsBlock;
    private long ofsMemoryReservationBlock;
    private long version;
    private long minCompatibleVersion;
    private long bootCpuidPhys;
    private long lenStringsBlock;
    private long lenStructureBlock;
    private Dtb _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_memoryReservationBlock;
    private byte[] _raw_stringsBlock;
    private byte[] _raw_structureBlock;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public long totalSize() { return totalSize; }
    public void setTotalSize(long _v) { _dirty = true; totalSize = _v; }
    public long ofsStructureBlock() { return ofsStructureBlock; }
    public void setOfsStructureBlock(long _v) { _dirty = true; ofsStructureBlock = _v; }
    public long ofsStringsBlock() { return ofsStringsBlock; }
    public void setOfsStringsBlock(long _v) { _dirty = true; ofsStringsBlock = _v; }
    public long ofsMemoryReservationBlock() { return ofsMemoryReservationBlock; }
    public void setOfsMemoryReservationBlock(long _v) { _dirty = true; ofsMemoryReservationBlock = _v; }
    public long version() { return version; }
    public void setVersion(long _v) { _dirty = true; version = _v; }
    public long minCompatibleVersion() { return minCompatibleVersion; }
    public void setMinCompatibleVersion(long _v) { _dirty = true; minCompatibleVersion = _v; }
    public long bootCpuidPhys() { return bootCpuidPhys; }
    public void setBootCpuidPhys(long _v) { _dirty = true; bootCpuidPhys = _v; }
    public long lenStringsBlock() { return lenStringsBlock; }
    public void setLenStringsBlock(long _v) { _dirty = true; lenStringsBlock = _v; }
    public long lenStructureBlock() { return lenStructureBlock; }
    public void setLenStructureBlock(long _v) { _dirty = true; lenStructureBlock = _v; }
    public Dtb _root() { return _root; }
    public void set_root(Dtb _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_memoryReservationBlock() { return _raw_memoryReservationBlock; }
    public void set_raw_MemoryReservationBlock(byte[] _v) { _dirty = true; _raw_memoryReservationBlock = _v; }
    public byte[] _raw_stringsBlock() { return _raw_stringsBlock; }
    public void set_raw_StringsBlock(byte[] _v) { _dirty = true; _raw_stringsBlock = _v; }
    public byte[] _raw_structureBlock() { return _raw_structureBlock; }
    public void set_raw_StructureBlock(byte[] _v) { _dirty = true; _raw_structureBlock = _v; }
}

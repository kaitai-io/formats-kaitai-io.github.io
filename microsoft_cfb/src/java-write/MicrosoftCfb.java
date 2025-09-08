// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;

public class MicrosoftCfb extends KaitaiStruct.ReadWrite {
    public static MicrosoftCfb fromFile(String fileName) throws IOException {
        return new MicrosoftCfb(new ByteBufferKaitaiStream(fileName));
    }
    public MicrosoftCfb() {
        this(null, null, null);
    }

    public MicrosoftCfb(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MicrosoftCfb(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public MicrosoftCfb(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MicrosoftCfb _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new CfbHeader(this._io, this, _root);
        this.header._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        dir();
        if (this.dir != null) {
            this.dir._fetchInstances();
        }
        fat();
        if (this.fat != null) {
            this.fat._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteDir = _enabledDir;
        _shouldWriteFat = _enabledFat;
        this.header._write_Seq(this._io);
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (_enabledDir) {
            if (!Objects.equals(this.dir._root(), _root()))
                throw new ConsistencyError("dir", _root(), this.dir._root());
            if (!Objects.equals(this.dir._parent(), this))
                throw new ConsistencyError("dir", this, this.dir._parent());
        }
        if (_enabledFat) {
            if (!Objects.equals(this.fat._root(), _root()))
                throw new ConsistencyError("fat", _root(), this.fat._root());
            if (!Objects.equals(this.fat._parent(), this))
                throw new ConsistencyError("fat", this, this.fat._parent());
        }
        _dirty = false;
    }
    public static class CfbHeader extends KaitaiStruct.ReadWrite {
        public static CfbHeader fromFile(String fileName) throws IOException {
            return new CfbHeader(new ByteBufferKaitaiStream(fileName));
        }
        public CfbHeader() {
            this(null, null, null);
        }

        public CfbHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CfbHeader(KaitaiStream _io, MicrosoftCfb _parent) {
            this(_io, _parent, null);
        }

        public CfbHeader(KaitaiStream _io, MicrosoftCfb _parent, MicrosoftCfb _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.signature = this._io.readBytes(8);
            if (!(Arrays.equals(this.signature, new byte[] { -48, -49, 17, -32, -95, -79, 26, -31 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -48, -49, 17, -32, -95, -79, 26, -31 }, this.signature, this._io, "/types/cfb_header/seq/0");
            }
            this.clsid = this._io.readBytes(16);
            if (!(Arrays.equals(this.clsid, new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, this.clsid, this._io, "/types/cfb_header/seq/1");
            }
            this.versionMinor = this._io.readU2le();
            this.versionMajor = this._io.readU2le();
            this.byteOrder = this._io.readBytes(2);
            if (!(Arrays.equals(this.byteOrder, new byte[] { -2, -1 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -2, -1 }, this.byteOrder, this._io, "/types/cfb_header/seq/4");
            }
            this.sectorShift = this._io.readU2le();
            this.miniSectorShift = this._io.readU2le();
            this.reserved1 = this._io.readBytes(6);
            this.sizeDir = this._io.readS4le();
            this.sizeFat = this._io.readS4le();
            this.ofsDir = this._io.readS4le();
            this.transactionSeq = this._io.readS4le();
            this.miniStreamCutoffSize = this._io.readS4le();
            this.ofsMiniFat = this._io.readS4le();
            this.sizeMiniFat = this._io.readS4le();
            this.ofsDifat = this._io.readS4le();
            this.sizeDifat = this._io.readS4le();
            this.difat = new ArrayList<Integer>();
            for (int i = 0; i < 109; i++) {
                this.difat.add(this._io.readS4le());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.difat.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.signature);
            this._io.writeBytes(this.clsid);
            this._io.writeU2le(this.versionMinor);
            this._io.writeU2le(this.versionMajor);
            this._io.writeBytes(this.byteOrder);
            this._io.writeU2le(this.sectorShift);
            this._io.writeU2le(this.miniSectorShift);
            this._io.writeBytes(this.reserved1);
            this._io.writeS4le(this.sizeDir);
            this._io.writeS4le(this.sizeFat);
            this._io.writeS4le(this.ofsDir);
            this._io.writeS4le(this.transactionSeq);
            this._io.writeS4le(this.miniStreamCutoffSize);
            this._io.writeS4le(this.ofsMiniFat);
            this._io.writeS4le(this.sizeMiniFat);
            this._io.writeS4le(this.ofsDifat);
            this._io.writeS4le(this.sizeDifat);
            for (int i = 0; i < this.difat.size(); i++) {
                this._io.writeS4le(this.difat.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (this.signature.length != 8)
                throw new ConsistencyError("signature", 8, this.signature.length);
            if (!(Arrays.equals(this.signature, new byte[] { -48, -49, 17, -32, -95, -79, 26, -31 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -48, -49, 17, -32, -95, -79, 26, -31 }, this.signature, null, "/types/cfb_header/seq/0");
            }
            if (this.clsid.length != 16)
                throw new ConsistencyError("clsid", 16, this.clsid.length);
            if (!(Arrays.equals(this.clsid, new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, this.clsid, null, "/types/cfb_header/seq/1");
            }
            if (this.byteOrder.length != 2)
                throw new ConsistencyError("byte_order", 2, this.byteOrder.length);
            if (!(Arrays.equals(this.byteOrder, new byte[] { -2, -1 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -2, -1 }, this.byteOrder, null, "/types/cfb_header/seq/4");
            }
            if (this.reserved1.length != 6)
                throw new ConsistencyError("reserved1", 6, this.reserved1.length);
            if (this.difat.size() != 109)
                throw new ConsistencyError("difat", 109, this.difat.size());
            for (int i = 0; i < this.difat.size(); i++) {
            }
            _dirty = false;
        }
        private byte[] signature;
        private byte[] clsid;
        private int versionMinor;
        private int versionMajor;
        private byte[] byteOrder;
        private int sectorShift;
        private int miniSectorShift;
        private byte[] reserved1;
        private int sizeDir;
        private int sizeFat;
        private int ofsDir;
        private int transactionSeq;
        private int miniStreamCutoffSize;
        private int ofsMiniFat;
        private int sizeMiniFat;
        private int ofsDifat;
        private int sizeDifat;
        private List<Integer> difat;
        private MicrosoftCfb _root;
        private MicrosoftCfb _parent;

        /**
         * Magic bytes that confirm that this is a CFB file
         */
        public byte[] signature() { return signature; }
        public void setSignature(byte[] _v) { _dirty = true; signature = _v; }

        /**
         * Reserved class ID field, must be all 0
         */
        public byte[] clsid() { return clsid; }
        public void setClsid(byte[] _v) { _dirty = true; clsid = _v; }
        public int versionMinor() { return versionMinor; }
        public void setVersionMinor(int _v) { _dirty = true; versionMinor = _v; }
        public int versionMajor() { return versionMajor; }
        public void setVersionMajor(int _v) { _dirty = true; versionMajor = _v; }

        /**
         * In theory, specifies a byte order. In practice, no other values besides FE FF (which imply little endian order) are used.
         */
        public byte[] byteOrder() { return byteOrder; }
        public void setByteOrder(byte[] _v) { _dirty = true; byteOrder = _v; }

        /**
         * For major version 3, must be 0x9 (sector size = 512 bytes). For major version 4, must be 0xc (sector size = 4096 bytes).
         */
        public int sectorShift() { return sectorShift; }
        public void setSectorShift(int _v) { _dirty = true; sectorShift = _v; }
        public int miniSectorShift() { return miniSectorShift; }
        public void setMiniSectorShift(int _v) { _dirty = true; miniSectorShift = _v; }
        public byte[] reserved1() { return reserved1; }
        public void setReserved1(byte[] _v) { _dirty = true; reserved1 = _v; }

        /**
         * Number of directory sectors in this file. For major version 3, must be 0.
         */
        public int sizeDir() { return sizeDir; }
        public void setSizeDir(int _v) { _dirty = true; sizeDir = _v; }

        /**
         * Number of FAT sectors in this file.
         */
        public int sizeFat() { return sizeFat; }
        public void setSizeFat(int _v) { _dirty = true; sizeFat = _v; }

        /**
         * Starting sector number for directory stream.
         */
        public int ofsDir() { return ofsDir; }
        public void setOfsDir(int _v) { _dirty = true; ofsDir = _v; }

        /**
         * A transaction sequence number, which is incremented each time the file is saved if transactions are implemented, 0 otherwise.
         */
        public int transactionSeq() { return transactionSeq; }
        public void setTransactionSeq(int _v) { _dirty = true; transactionSeq = _v; }
        public int miniStreamCutoffSize() { return miniStreamCutoffSize; }
        public void setMiniStreamCutoffSize(int _v) { _dirty = true; miniStreamCutoffSize = _v; }

        /**
         * Starting sector number for mini FAT.
         */
        public int ofsMiniFat() { return ofsMiniFat; }
        public void setOfsMiniFat(int _v) { _dirty = true; ofsMiniFat = _v; }

        /**
         * Number of mini FAT sectors in this file.
         */
        public int sizeMiniFat() { return sizeMiniFat; }
        public void setSizeMiniFat(int _v) { _dirty = true; sizeMiniFat = _v; }

        /**
         * Starting sector number for DIFAT.
         */
        public int ofsDifat() { return ofsDifat; }
        public void setOfsDifat(int _v) { _dirty = true; ofsDifat = _v; }

        /**
         * Number of DIFAT sectors in this file.
         */
        public int sizeDifat() { return sizeDifat; }
        public void setSizeDifat(int _v) { _dirty = true; sizeDifat = _v; }
        public List<Integer> difat() { return difat; }
        public void setDifat(List<Integer> _v) { _dirty = true; difat = _v; }
        public MicrosoftCfb _root() { return _root; }
        public void set_root(MicrosoftCfb _v) { _dirty = true; _root = _v; }
        public MicrosoftCfb _parent() { return _parent; }
        public void set_parent(MicrosoftCfb _v) { _dirty = true; _parent = _v; }
    }
    public static class DirEntry extends KaitaiStruct.ReadWrite {
        public static DirEntry fromFile(String fileName) throws IOException {
            return new DirEntry(new ByteBufferKaitaiStream(fileName));
        }

        public enum ObjType {
            UNKNOWN(0),
            STORAGE(1),
            STREAM(2),
            ROOT_STORAGE(5);

            private final long id;
            ObjType(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, ObjType> byId = new HashMap<Long, ObjType>(4);
            static {
                for (ObjType e : ObjType.values())
                    byId.put(e.id(), e);
            }
            public static ObjType byId(long id) { return byId.get(id); }
        }

        public enum RbColor {
            RED(0),
            BLACK(1);

            private final long id;
            RbColor(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, RbColor> byId = new HashMap<Long, RbColor>(2);
            static {
                for (RbColor e : RbColor.values())
                    byId.put(e.id(), e);
            }
            public static RbColor byId(long id) { return byId.get(id); }
        }
        public DirEntry() {
            this(null, null, null);
        }

        public DirEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DirEntry(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public DirEntry(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MicrosoftCfb _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.name = new String(this._io.readBytes(64), StandardCharsets.UTF_16LE);
            this.nameLen = this._io.readU2le();
            this.objectType = ObjType.byId(this._io.readU1());
            this.colorFlag = RbColor.byId(this._io.readU1());
            this.leftSiblingId = this._io.readS4le();
            this.rightSiblingId = this._io.readS4le();
            this.childId = this._io.readS4le();
            this.clsid = this._io.readBytes(16);
            this.state = this._io.readU4le();
            this.timeCreate = this._io.readU8le();
            this.timeMod = this._io.readU8le();
            this.ofs = this._io.readS4le();
            this.size = this._io.readU8le();
            _dirty = false;
        }

        public void _fetchInstances() {
            child();
            if (this.child != null) {
                this.child._fetchInstances();
            }
            leftSibling();
            if (this.leftSibling != null) {
                this.leftSibling._fetchInstances();
            }
            miniStream();
            if (this.miniStream != null) {
            }
            rightSibling();
            if (this.rightSibling != null) {
                this.rightSibling._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteChild = _enabledChild;
            _shouldWriteLeftSibling = _enabledLeftSibling;
            _shouldWriteMiniStream = _enabledMiniStream;
            _shouldWriteRightSibling = _enabledRightSibling;
            this._io.writeBytes((this.name).getBytes(Charset.forName("UTF-16LE")));
            this._io.writeU2le(this.nameLen);
            this._io.writeU1(((Number) (this.objectType.id())).intValue());
            this._io.writeU1(((Number) (this.colorFlag.id())).intValue());
            this._io.writeS4le(this.leftSiblingId);
            this._io.writeS4le(this.rightSiblingId);
            this._io.writeS4le(this.childId);
            this._io.writeBytes(this.clsid);
            this._io.writeU4le(this.state);
            this._io.writeU8le(this.timeCreate);
            this._io.writeU8le(this.timeMod);
            this._io.writeS4le(this.ofs);
            this._io.writeU8le(this.size);
        }

        public void _check() {
            if ((this.name).getBytes(Charset.forName("UTF-16LE")).length != 64)
                throw new ConsistencyError("name", 64, (this.name).getBytes(Charset.forName("UTF-16LE")).length);
            if (this.clsid.length != 16)
                throw new ConsistencyError("clsid", 16, this.clsid.length);
            if (_enabledChild) {
                if (childId() != -1) {
                    if (!Objects.equals(this.child._root(), _root()))
                        throw new ConsistencyError("child", _root(), this.child._root());
                    if (!Objects.equals(this.child._parent(), this))
                        throw new ConsistencyError("child", this, this.child._parent());
                }
            }
            if (_enabledLeftSibling) {
                if (leftSiblingId() != -1) {
                    if (!Objects.equals(this.leftSibling._root(), _root()))
                        throw new ConsistencyError("left_sibling", _root(), this.leftSibling._root());
                    if (!Objects.equals(this.leftSibling._parent(), this))
                        throw new ConsistencyError("left_sibling", this, this.leftSibling._parent());
                }
            }
            if (_enabledMiniStream) {
                if (objectType() == ObjType.ROOT_STORAGE) {
                    if (this.miniStream.length != size())
                        throw new ConsistencyError("mini_stream", size(), this.miniStream.length);
                }
            }
            if (_enabledRightSibling) {
                if (rightSiblingId() != -1) {
                    if (!Objects.equals(this.rightSibling._root(), _root()))
                        throw new ConsistencyError("right_sibling", _root(), this.rightSibling._root());
                    if (!Objects.equals(this.rightSibling._parent(), this))
                        throw new ConsistencyError("right_sibling", this, this.rightSibling._parent());
                }
            }
            _dirty = false;
        }
        private DirEntry child;
        private boolean _shouldWriteChild = false;
        private boolean _enabledChild = true;
        public DirEntry child() {
            if (_shouldWriteChild)
                _writeChild();
            if (this.child != null)
                return this.child;
            if (!_enabledChild)
                return null;
            if (childId() != -1) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek((_root().header().ofsDir() + 1) * _root().sectorSize() + childId() * 128);
                this.child = new DirEntry(io, this, _root);
                this.child._read();
                io.seek(_pos);
            }
            return this.child;
        }
        public void setChild(DirEntry _v) { _dirty = true; child = _v; }
        public void setChild_Enabled(boolean _v) { _dirty = true; _enabledChild = _v; }

        private void _writeChild() {
            _shouldWriteChild = false;
            if (childId() != -1) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek((_root().header().ofsDir() + 1) * _root().sectorSize() + childId() * 128);
                this.child._write_Seq(io);
                io.seek(_pos);
            }
        }
        private DirEntry leftSibling;
        private boolean _shouldWriteLeftSibling = false;
        private boolean _enabledLeftSibling = true;
        public DirEntry leftSibling() {
            if (_shouldWriteLeftSibling)
                _writeLeftSibling();
            if (this.leftSibling != null)
                return this.leftSibling;
            if (!_enabledLeftSibling)
                return null;
            if (leftSiblingId() != -1) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek((_root().header().ofsDir() + 1) * _root().sectorSize() + leftSiblingId() * 128);
                this.leftSibling = new DirEntry(io, this, _root);
                this.leftSibling._read();
                io.seek(_pos);
            }
            return this.leftSibling;
        }
        public void setLeftSibling(DirEntry _v) { _dirty = true; leftSibling = _v; }
        public void setLeftSibling_Enabled(boolean _v) { _dirty = true; _enabledLeftSibling = _v; }

        private void _writeLeftSibling() {
            _shouldWriteLeftSibling = false;
            if (leftSiblingId() != -1) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek((_root().header().ofsDir() + 1) * _root().sectorSize() + leftSiblingId() * 128);
                this.leftSibling._write_Seq(io);
                io.seek(_pos);
            }
        }
        private byte[] miniStream;
        private boolean _shouldWriteMiniStream = false;
        private boolean _enabledMiniStream = true;
        public byte[] miniStream() {
            if (_shouldWriteMiniStream)
                _writeMiniStream();
            if (this.miniStream != null)
                return this.miniStream;
            if (!_enabledMiniStream)
                return null;
            if (objectType() == ObjType.ROOT_STORAGE) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek((ofs() + 1) * _root().sectorSize());
                this.miniStream = io.readBytes(size());
                io.seek(_pos);
            }
            return this.miniStream;
        }
        public void setMiniStream(byte[] _v) { _dirty = true; miniStream = _v; }
        public void setMiniStream_Enabled(boolean _v) { _dirty = true; _enabledMiniStream = _v; }

        private void _writeMiniStream() {
            _shouldWriteMiniStream = false;
            if (objectType() == ObjType.ROOT_STORAGE) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek((ofs() + 1) * _root().sectorSize());
                io.writeBytes(this.miniStream);
                io.seek(_pos);
            }
        }
        private DirEntry rightSibling;
        private boolean _shouldWriteRightSibling = false;
        private boolean _enabledRightSibling = true;
        public DirEntry rightSibling() {
            if (_shouldWriteRightSibling)
                _writeRightSibling();
            if (this.rightSibling != null)
                return this.rightSibling;
            if (!_enabledRightSibling)
                return null;
            if (rightSiblingId() != -1) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek((_root().header().ofsDir() + 1) * _root().sectorSize() + rightSiblingId() * 128);
                this.rightSibling = new DirEntry(io, this, _root);
                this.rightSibling._read();
                io.seek(_pos);
            }
            return this.rightSibling;
        }
        public void setRightSibling(DirEntry _v) { _dirty = true; rightSibling = _v; }
        public void setRightSibling_Enabled(boolean _v) { _dirty = true; _enabledRightSibling = _v; }

        private void _writeRightSibling() {
            _shouldWriteRightSibling = false;
            if (rightSiblingId() != -1) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek((_root().header().ofsDir() + 1) * _root().sectorSize() + rightSiblingId() * 128);
                this.rightSibling._write_Seq(io);
                io.seek(_pos);
            }
        }
        private String name;
        private int nameLen;
        private ObjType objectType;
        private RbColor colorFlag;
        private int leftSiblingId;
        private int rightSiblingId;
        private int childId;
        private byte[] clsid;
        private long state;
        private long timeCreate;
        private long timeMod;
        private int ofs;
        private long size;
        private MicrosoftCfb _root;
        private KaitaiStruct.ReadWrite _parent;
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public int nameLen() { return nameLen; }
        public void setNameLen(int _v) { _dirty = true; nameLen = _v; }
        public ObjType objectType() { return objectType; }
        public void setObjectType(ObjType _v) { _dirty = true; objectType = _v; }
        public RbColor colorFlag() { return colorFlag; }
        public void setColorFlag(RbColor _v) { _dirty = true; colorFlag = _v; }
        public int leftSiblingId() { return leftSiblingId; }
        public void setLeftSiblingId(int _v) { _dirty = true; leftSiblingId = _v; }
        public int rightSiblingId() { return rightSiblingId; }
        public void setRightSiblingId(int _v) { _dirty = true; rightSiblingId = _v; }
        public int childId() { return childId; }
        public void setChildId(int _v) { _dirty = true; childId = _v; }
        public byte[] clsid() { return clsid; }
        public void setClsid(byte[] _v) { _dirty = true; clsid = _v; }

        /**
         * User-defined flags for storage or root storage objects
         */
        public long state() { return state; }
        public void setState(long _v) { _dirty = true; state = _v; }

        /**
         * Creation time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC)
         */
        public long timeCreate() { return timeCreate; }
        public void setTimeCreate(long _v) { _dirty = true; timeCreate = _v; }

        /**
         * Modification time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC).
         */
        public long timeMod() { return timeMod; }
        public void setTimeMod(long _v) { _dirty = true; timeMod = _v; }

        /**
         * For stream object, number of starting sector. For a root storage object, first sector of the mini stream, if the mini stream exists.
         */
        public int ofs() { return ofs; }
        public void setOfs(int _v) { _dirty = true; ofs = _v; }

        /**
         * For stream object, size of user-defined data in bytes. For a root storage object, size of the mini stream.
         */
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public MicrosoftCfb _root() { return _root; }
        public void set_root(MicrosoftCfb _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class FatEntries extends KaitaiStruct.ReadWrite {
        public static FatEntries fromFile(String fileName) throws IOException {
            return new FatEntries(new ByteBufferKaitaiStream(fileName));
        }
        public FatEntries() {
            this(null, null, null);
        }

        public FatEntries(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FatEntries(KaitaiStream _io, MicrosoftCfb _parent) {
            this(_io, _parent, null);
        }

        public FatEntries(KaitaiStream _io, MicrosoftCfb _parent, MicrosoftCfb _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<Integer>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(this._io.readS4le());
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.entries.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                this._io.writeS4le(this.entries.get(((Number) (i)).intValue()));
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.entries.size(); i++) {
            }
            _dirty = false;
        }
        private List<Integer> entries;
        private MicrosoftCfb _root;
        private MicrosoftCfb _parent;
        public List<Integer> entries() { return entries; }
        public void setEntries(List<Integer> _v) { _dirty = true; entries = _v; }
        public MicrosoftCfb _root() { return _root; }
        public void set_root(MicrosoftCfb _v) { _dirty = true; _root = _v; }
        public MicrosoftCfb _parent() { return _parent; }
        public void set_parent(MicrosoftCfb _v) { _dirty = true; _parent = _v; }
    }
    private DirEntry dir;
    private boolean _shouldWriteDir = false;
    private boolean _enabledDir = true;
    public DirEntry dir() {
        if (_shouldWriteDir)
            _writeDir();
        if (this.dir != null)
            return this.dir;
        if (!_enabledDir)
            return null;
        long _pos = this._io.pos();
        this._io.seek((header().ofsDir() + 1) * sectorSize());
        this.dir = new DirEntry(this._io, this, _root);
        this.dir._read();
        this._io.seek(_pos);
        return this.dir;
    }
    public void setDir(DirEntry _v) { _dirty = true; dir = _v; }
    public void setDir_Enabled(boolean _v) { _dirty = true; _enabledDir = _v; }

    private void _writeDir() {
        _shouldWriteDir = false;
        long _pos = this._io.pos();
        this._io.seek((header().ofsDir() + 1) * sectorSize());
        this.dir._write_Seq(this._io);
        this._io.seek(_pos);
    }
    private FatEntries fat;
    private boolean _shouldWriteFat = false;
    private boolean _enabledFat = true;
    public FatEntries fat() {
        if (_shouldWriteFat)
            _writeFat();
        if (this.fat != null)
            return this.fat;
        if (!_enabledFat)
            return null;
        long _pos = this._io.pos();
        this._io.seek(sectorSize());
        this._raw_fat = this._io.readBytes(header().sizeFat() * sectorSize());
        KaitaiStream _io__raw_fat = new ByteBufferKaitaiStream(this._raw_fat);
        this.fat = new FatEntries(_io__raw_fat, this, _root);
        this.fat._read();
        this._io.seek(_pos);
        return this.fat;
    }
    public void setFat(FatEntries _v) { _dirty = true; fat = _v; }
    public void setFat_Enabled(boolean _v) { _dirty = true; _enabledFat = _v; }

    private void _writeFat() {
        _shouldWriteFat = false;
        long _pos = this._io.pos();
        this._io.seek(sectorSize());
        final KaitaiStream _io__raw_fat = new ByteBufferKaitaiStream(header().sizeFat() * sectorSize());
        this._io.addChildStream(_io__raw_fat);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (header().sizeFat() * sectorSize()));
            final MicrosoftCfb _this = this;
            _io__raw_fat.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_fat = _io__raw_fat.toByteArray();
                    if (_this._raw_fat.length != header().sizeFat() * sectorSize())
                        throw new ConsistencyError("raw(fat)", header().sizeFat() * sectorSize(), _this._raw_fat.length);
                    parent.writeBytes(_this._raw_fat);
                }
            });
        }
        this.fat._write_Seq(_io__raw_fat);
        this._io.seek(_pos);
    }
    private Integer sectorSize;
    public Integer sectorSize() {
        if (this.sectorSize != null)
            return this.sectorSize;
        this.sectorSize = ((Number) (1 << header().sectorShift())).intValue();
        return this.sectorSize;
    }
    public void _invalidateSectorSize() { this.sectorSize = null; }
    private CfbHeader header;
    private MicrosoftCfb _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_fat;
    public CfbHeader header() { return header; }
    public void setHeader(CfbHeader _v) { _dirty = true; header = _v; }
    public MicrosoftCfb _root() { return _root; }
    public void set_root(MicrosoftCfb _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_fat() { return _raw_fat; }
    public void set_raw_Fat(byte[] _v) { _dirty = true; _raw_fat = _v; }
}

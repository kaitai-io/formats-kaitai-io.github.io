// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Arrays;
import java.util.List;

public class CpioOldLe extends KaitaiStruct.ReadWrite {
    public static CpioOldLe fromFile(String fileName) throws IOException {
        return new CpioOldLe(new ByteBufferKaitaiStream(fileName));
    }
    public CpioOldLe() {
        this(null, null, null);
    }

    public CpioOldLe(KaitaiStream _io) {
        this(_io, null, null);
    }

    public CpioOldLe(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public CpioOldLe(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, CpioOldLe _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.files = new ArrayList<File>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                File _t_files = new File(this._io, this, _root);
                try {
                    _t_files._read();
                } finally {
                    this.files.add(_t_files);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.files.size(); i++) {
            this.files.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.files.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("files", 0, this._io.size() - this._io.pos());
            this.files.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("files", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.files.size(); i++) {
            if (!Objects.equals(this.files.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("files", _root(), this.files.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.files.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("files", this, this.files.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class File extends KaitaiStruct.ReadWrite {
        public static File fromFile(String fileName) throws IOException {
            return new File(new ByteBufferKaitaiStream(fileName));
        }
        public File() {
            this(null, null, null);
        }

        public File(KaitaiStream _io) {
            this(_io, null, null);
        }

        public File(KaitaiStream _io, CpioOldLe _parent) {
            this(_io, _parent, null);
        }

        public File(KaitaiStream _io, CpioOldLe _parent, CpioOldLe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.header = new FileHeader(this._io, this, _root);
            this.header._read();
            this.pathName = this._io.readBytes(header().pathNameSize() - 1);
            this.stringTerminator = this._io.readBytes(1);
            if (!(Arrays.equals(this.stringTerminator, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.stringTerminator, this._io, "/types/file/seq/2");
            }
            if (KaitaiStream.mod(header().pathNameSize(), 2) == 1) {
                this.pathNamePadding = this._io.readBytes(1);
                if (!(Arrays.equals(this.pathNamePadding, new byte[] { 0 }))) {
                    throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.pathNamePadding, this._io, "/types/file/seq/3");
                }
            }
            this.fileData = this._io.readBytes(header().fileSize().value());
            if (KaitaiStream.mod(header().fileSize().value(), 2) == 1) {
                this.fileDataPadding = this._io.readBytes(1);
                if (!(Arrays.equals(this.fileDataPadding, new byte[] { 0 }))) {
                    throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.fileDataPadding, this._io, "/types/file/seq/5");
                }
            }
            if ( ((Arrays.equals(pathName(), new byte[] { 84, 82, 65, 73, 76, 69, 82, 33, 33, 33 })) && (header().fileSize().value() == 0)) ) {
                this.endOfFilePadding = this._io.readBytesFull();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            if (KaitaiStream.mod(header().pathNameSize(), 2) == 1) {
            }
            if (KaitaiStream.mod(header().fileSize().value(), 2) == 1) {
            }
            if ( ((Arrays.equals(pathName(), new byte[] { 84, 82, 65, 73, 76, 69, 82, 33, 33, 33 })) && (header().fileSize().value() == 0)) ) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.header._write_Seq(this._io);
            this._io.writeBytes(this.pathName);
            this._io.writeBytes(this.stringTerminator);
            if (KaitaiStream.mod(header().pathNameSize(), 2) == 1) {
                this._io.writeBytes(this.pathNamePadding);
            }
            this._io.writeBytes(this.fileData);
            if (KaitaiStream.mod(header().fileSize().value(), 2) == 1) {
                this._io.writeBytes(this.fileDataPadding);
            }
            if ( ((Arrays.equals(pathName(), new byte[] { 84, 82, 65, 73, 76, 69, 82, 33, 33, 33 })) && (header().fileSize().value() == 0)) ) {
                this._io.writeBytes(this.endOfFilePadding);
                if (!(this._io.isEof()))
                    throw new ConsistencyError("end_of_file_padding", 0, this._io.size() - this._io.pos());
            }
        }

        public void _check() {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
            if (this.pathName.length != header().pathNameSize() - 1)
                throw new ConsistencyError("path_name", header().pathNameSize() - 1, this.pathName.length);
            if (this.stringTerminator.length != 1)
                throw new ConsistencyError("string_terminator", 1, this.stringTerminator.length);
            if (!(Arrays.equals(this.stringTerminator, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.stringTerminator, null, "/types/file/seq/2");
            }
            if (KaitaiStream.mod(header().pathNameSize(), 2) == 1) {
                if (this.pathNamePadding.length != 1)
                    throw new ConsistencyError("path_name_padding", 1, this.pathNamePadding.length);
                if (!(Arrays.equals(this.pathNamePadding, new byte[] { 0 }))) {
                    throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.pathNamePadding, null, "/types/file/seq/3");
                }
            }
            if (this.fileData.length != header().fileSize().value())
                throw new ConsistencyError("file_data", header().fileSize().value(), this.fileData.length);
            if (KaitaiStream.mod(header().fileSize().value(), 2) == 1) {
                if (this.fileDataPadding.length != 1)
                    throw new ConsistencyError("file_data_padding", 1, this.fileDataPadding.length);
                if (!(Arrays.equals(this.fileDataPadding, new byte[] { 0 }))) {
                    throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.fileDataPadding, null, "/types/file/seq/5");
                }
            }
            if ( ((Arrays.equals(pathName(), new byte[] { 84, 82, 65, 73, 76, 69, 82, 33, 33, 33 })) && (header().fileSize().value() == 0)) ) {
            }
            _dirty = false;
        }
        private FileHeader header;
        private byte[] pathName;
        private byte[] stringTerminator;
        private byte[] pathNamePadding;
        private byte[] fileData;
        private byte[] fileDataPadding;
        private byte[] endOfFilePadding;
        private CpioOldLe _root;
        private CpioOldLe _parent;
        public FileHeader header() { return header; }
        public void setHeader(FileHeader _v) { _dirty = true; header = _v; }
        public byte[] pathName() { return pathName; }
        public void setPathName(byte[] _v) { _dirty = true; pathName = _v; }
        public byte[] stringTerminator() { return stringTerminator; }
        public void setStringTerminator(byte[] _v) { _dirty = true; stringTerminator = _v; }
        public byte[] pathNamePadding() { return pathNamePadding; }
        public void setPathNamePadding(byte[] _v) { _dirty = true; pathNamePadding = _v; }
        public byte[] fileData() { return fileData; }
        public void setFileData(byte[] _v) { _dirty = true; fileData = _v; }
        public byte[] fileDataPadding() { return fileDataPadding; }
        public void setFileDataPadding(byte[] _v) { _dirty = true; fileDataPadding = _v; }
        public byte[] endOfFilePadding() { return endOfFilePadding; }
        public void setEndOfFilePadding(byte[] _v) { _dirty = true; endOfFilePadding = _v; }
        public CpioOldLe _root() { return _root; }
        public void set_root(CpioOldLe _v) { _dirty = true; _root = _v; }
        public CpioOldLe _parent() { return _parent; }
        public void set_parent(CpioOldLe _v) { _dirty = true; _parent = _v; }
    }
    public static class FileHeader extends KaitaiStruct.ReadWrite {
        public static FileHeader fromFile(String fileName) throws IOException {
            return new FileHeader(new ByteBufferKaitaiStream(fileName));
        }
        public FileHeader() {
            this(null, null, null);
        }

        public FileHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileHeader(KaitaiStream _io, CpioOldLe.File _parent) {
            this(_io, _parent, null);
        }

        public FileHeader(KaitaiStream _io, CpioOldLe.File _parent, CpioOldLe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(2);
            if (!(Arrays.equals(this.magic, new byte[] { -57, 113 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -57, 113 }, this.magic, this._io, "/types/file_header/seq/0");
            }
            this.deviceNumber = this._io.readU2le();
            this.inodeNumber = this._io.readU2le();
            this.mode = this._io.readU2le();
            this.userId = this._io.readU2le();
            this.groupId = this._io.readU2le();
            this.numberOfLinks = this._io.readU2le();
            this.rDeviceNumber = this._io.readU2le();
            this.modificationTime = new FourByteUnsignedInteger(this._io, this, _root);
            this.modificationTime._read();
            this.pathNameSize = this._io.readU2le();
            this.fileSize = new FourByteUnsignedInteger(this._io, this, _root);
            this.fileSize._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.modificationTime._fetchInstances();
            this.fileSize._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU2le(this.deviceNumber);
            this._io.writeU2le(this.inodeNumber);
            this._io.writeU2le(this.mode);
            this._io.writeU2le(this.userId);
            this._io.writeU2le(this.groupId);
            this._io.writeU2le(this.numberOfLinks);
            this._io.writeU2le(this.rDeviceNumber);
            this.modificationTime._write_Seq(this._io);
            this._io.writeU2le(this.pathNameSize);
            this.fileSize._write_Seq(this._io);
        }

        public void _check() {
            if (this.magic.length != 2)
                throw new ConsistencyError("magic", 2, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { -57, 113 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -57, 113 }, this.magic, null, "/types/file_header/seq/0");
            }
            if (!Objects.equals(this.modificationTime._root(), _root()))
                throw new ConsistencyError("modification_time", _root(), this.modificationTime._root());
            if (!Objects.equals(this.modificationTime._parent(), this))
                throw new ConsistencyError("modification_time", this, this.modificationTime._parent());
            if (!Objects.equals(this.fileSize._root(), _root()))
                throw new ConsistencyError("file_size", _root(), this.fileSize._root());
            if (!Objects.equals(this.fileSize._parent(), this))
                throw new ConsistencyError("file_size", this, this.fileSize._parent());
            _dirty = false;
        }
        private byte[] magic;
        private int deviceNumber;
        private int inodeNumber;
        private int mode;
        private int userId;
        private int groupId;
        private int numberOfLinks;
        private int rDeviceNumber;
        private FourByteUnsignedInteger modificationTime;
        private int pathNameSize;
        private FourByteUnsignedInteger fileSize;
        private CpioOldLe _root;
        private CpioOldLe.File _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public int deviceNumber() { return deviceNumber; }
        public void setDeviceNumber(int _v) { _dirty = true; deviceNumber = _v; }
        public int inodeNumber() { return inodeNumber; }
        public void setInodeNumber(int _v) { _dirty = true; inodeNumber = _v; }
        public int mode() { return mode; }
        public void setMode(int _v) { _dirty = true; mode = _v; }
        public int userId() { return userId; }
        public void setUserId(int _v) { _dirty = true; userId = _v; }
        public int groupId() { return groupId; }
        public void setGroupId(int _v) { _dirty = true; groupId = _v; }
        public int numberOfLinks() { return numberOfLinks; }
        public void setNumberOfLinks(int _v) { _dirty = true; numberOfLinks = _v; }
        public int rDeviceNumber() { return rDeviceNumber; }
        public void setRDeviceNumber(int _v) { _dirty = true; rDeviceNumber = _v; }
        public FourByteUnsignedInteger modificationTime() { return modificationTime; }
        public void setModificationTime(FourByteUnsignedInteger _v) { _dirty = true; modificationTime = _v; }
        public int pathNameSize() { return pathNameSize; }
        public void setPathNameSize(int _v) { _dirty = true; pathNameSize = _v; }
        public FourByteUnsignedInteger fileSize() { return fileSize; }
        public void setFileSize(FourByteUnsignedInteger _v) { _dirty = true; fileSize = _v; }
        public CpioOldLe _root() { return _root; }
        public void set_root(CpioOldLe _v) { _dirty = true; _root = _v; }
        public CpioOldLe.File _parent() { return _parent; }
        public void set_parent(CpioOldLe.File _v) { _dirty = true; _parent = _v; }
    }
    public static class FourByteUnsignedInteger extends KaitaiStruct.ReadWrite {
        public static FourByteUnsignedInteger fromFile(String fileName) throws IOException {
            return new FourByteUnsignedInteger(new ByteBufferKaitaiStream(fileName));
        }
        public FourByteUnsignedInteger() {
            this(null, null, null);
        }

        public FourByteUnsignedInteger(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FourByteUnsignedInteger(KaitaiStream _io, CpioOldLe.FileHeader _parent) {
            this(_io, _parent, null);
        }

        public FourByteUnsignedInteger(KaitaiStream _io, CpioOldLe.FileHeader _parent, CpioOldLe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.mostSignificantBits = this._io.readU2le();
            this.leastSignificantBits = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.mostSignificantBits);
            this._io.writeU2le(this.leastSignificantBits);
        }

        public void _check() {
            _dirty = false;
        }
        private Integer value;
        public Integer value() {
            if (this.value != null)
                return this.value;
            this.value = ((Number) (leastSignificantBits() + (mostSignificantBits() << 16))).intValue();
            return this.value;
        }
        public void _invalidateValue() { this.value = null; }
        private int mostSignificantBits;
        private int leastSignificantBits;
        private CpioOldLe _root;
        private CpioOldLe.FileHeader _parent;
        public int mostSignificantBits() { return mostSignificantBits; }
        public void setMostSignificantBits(int _v) { _dirty = true; mostSignificantBits = _v; }
        public int leastSignificantBits() { return leastSignificantBits; }
        public void setLeastSignificantBits(int _v) { _dirty = true; leastSignificantBits = _v; }
        public CpioOldLe _root() { return _root; }
        public void set_root(CpioOldLe _v) { _dirty = true; _root = _v; }
        public CpioOldLe.FileHeader _parent() { return _parent; }
        public void set_parent(CpioOldLe.FileHeader _v) { _dirty = true; _parent = _v; }
    }
    private List<File> files;
    private CpioOldLe _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<File> files() { return files; }
    public void setFiles(List<File> _v) { _dirty = true; files = _v; }
    public CpioOldLe _root() { return _root; }
    public void set_root(CpioOldLe _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

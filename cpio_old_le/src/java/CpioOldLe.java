// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class CpioOldLe extends KaitaiStruct {
    public static CpioOldLe fromFile(String fileName) throws IOException {
        return new CpioOldLe(new ByteBufferKaitaiStream(fileName));
    }

    public CpioOldLe(KaitaiStream _io) {
        this(_io, null, null);
    }

    public CpioOldLe(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public CpioOldLe(KaitaiStream _io, KaitaiStruct _parent, CpioOldLe _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.files = new ArrayList<File>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.files.add(new File(this._io, this, _root));
                i++;
            }
        }
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.files.size(); i++) {
            this.files.get(((Number) (i)).intValue())._fetchInstances();
        }
    }
    public static class File extends KaitaiStruct {
        public static File fromFile(String fileName) throws IOException {
            return new File(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.header = new FileHeader(this._io, this, _root);
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
        public byte[] pathName() { return pathName; }
        public byte[] stringTerminator() { return stringTerminator; }
        public byte[] pathNamePadding() { return pathNamePadding; }
        public byte[] fileData() { return fileData; }
        public byte[] fileDataPadding() { return fileDataPadding; }
        public byte[] endOfFilePadding() { return endOfFilePadding; }
        public CpioOldLe _root() { return _root; }
        public CpioOldLe _parent() { return _parent; }
    }
    public static class FileHeader extends KaitaiStruct {
        public static FileHeader fromFile(String fileName) throws IOException {
            return new FileHeader(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
            this.pathNameSize = this._io.readU2le();
            this.fileSize = new FourByteUnsignedInteger(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.modificationTime._fetchInstances();
            this.fileSize._fetchInstances();
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
        public int deviceNumber() { return deviceNumber; }
        public int inodeNumber() { return inodeNumber; }
        public int mode() { return mode; }
        public int userId() { return userId; }
        public int groupId() { return groupId; }
        public int numberOfLinks() { return numberOfLinks; }
        public int rDeviceNumber() { return rDeviceNumber; }
        public FourByteUnsignedInteger modificationTime() { return modificationTime; }
        public int pathNameSize() { return pathNameSize; }
        public FourByteUnsignedInteger fileSize() { return fileSize; }
        public CpioOldLe _root() { return _root; }
        public CpioOldLe.File _parent() { return _parent; }
    }
    public static class FourByteUnsignedInteger extends KaitaiStruct {
        public static FourByteUnsignedInteger fromFile(String fileName) throws IOException {
            return new FourByteUnsignedInteger(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.mostSignificantBits = this._io.readU2le();
            this.leastSignificantBits = this._io.readU2le();
        }

        public void _fetchInstances() {
        }
        private Integer value;
        public Integer value() {
            if (this.value != null)
                return this.value;
            this.value = ((Number) (leastSignificantBits() + (mostSignificantBits() << 16))).intValue();
            return this.value;
        }
        private int mostSignificantBits;
        private int leastSignificantBits;
        private CpioOldLe _root;
        private CpioOldLe.FileHeader _parent;
        public int mostSignificantBits() { return mostSignificantBits; }
        public int leastSignificantBits() { return leastSignificantBits; }
        public CpioOldLe _root() { return _root; }
        public CpioOldLe.FileHeader _parent() { return _parent; }
    }
    private List<File> files;
    private CpioOldLe _root;
    private KaitaiStruct _parent;
    public List<File> files() { return files; }
    public CpioOldLe _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

public class CpioOldLe extends KaitaiStruct {
    public static CpioOldLe fromFile(String fileName) throws IOException {
        return new CpioOldLe(new KaitaiStream(fileName));
    }

    public CpioOldLe(KaitaiStream _io) {
        super(_io);
        this._root = this;
        _init();
    }

    public CpioOldLe(KaitaiStream _io, KaitaiStruct _parent) {
        super(_io);
        this._parent = _parent;
        this._root = this;
        _init();
    }

    public CpioOldLe(KaitaiStream _io, KaitaiStruct _parent, CpioOldLe _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root;
        _init();
    }

    private void _init() {
        _read();
    }
    private void _read() {
        this.files = new ArrayList<File>();
        while (!this._io.isEof()) {
            this.files.add(new File(this._io, this, _root));
        }
    }
    public static class File extends KaitaiStruct {
        public static File fromFile(String fileName) throws IOException {
            return new File(new KaitaiStream(fileName));
        }

        public File(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public File(KaitaiStream _io, CpioOldLe _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public File(KaitaiStream _io, CpioOldLe _parent, CpioOldLe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.header = new FileHeader(this._io, this, _root);
            this.pathName = this._io.readBytes((header().pathNameSize() - 1));
            this.stringTerminator = this._io.ensureFixedContents(new byte[] { 0 });
            if (KaitaiStream.mod(header().pathNameSize(), 2) == 1) {
                this.pathNamePadding = this._io.ensureFixedContents(new byte[] { 0 });
            }
            this.fileData = this._io.readBytes(header().fileSize().value());
            if (KaitaiStream.mod(header().fileSize().value(), 2) == 1) {
                this.fileDataPadding = this._io.ensureFixedContents(new byte[] { 0 });
            }
            if ( ((Arrays.equals(pathName(), new byte[] { 84, 82, 65, 73, 76, 69, 82, 33, 33, 33 })) && (header().fileSize().value() == 0)) ) {
                this.endOfFilePadding = this._io.readBytesFull();
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
            return new FileHeader(new KaitaiStream(fileName));
        }

        public FileHeader(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public FileHeader(KaitaiStream _io, CpioOldLe.File _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public FileHeader(KaitaiStream _io, CpioOldLe.File _parent, CpioOldLe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.magic = this._io.ensureFixedContents(new byte[] { -57, 113 });
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
            return new FourByteUnsignedInteger(new KaitaiStream(fileName));
        }

        public FourByteUnsignedInteger(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public FourByteUnsignedInteger(KaitaiStream _io, CpioOldLe.FileHeader _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public FourByteUnsignedInteger(KaitaiStream _io, CpioOldLe.FileHeader _parent, CpioOldLe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.mostSignificantBits = this._io.readU2le();
            this.leastSignificantBits = this._io.readU2le();
        }
        private Integer value;
        public Integer value() {
            if (this.value != null)
                return this.value;
            int _tmp = (int) ((leastSignificantBits() + (mostSignificantBits() << 16)));
            this.value = _tmp;
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
    private ArrayList<File> files;
    private CpioOldLe _root;
    private KaitaiStruct _parent;
    public ArrayList<File> files() { return files; }
    public CpioOldLe _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

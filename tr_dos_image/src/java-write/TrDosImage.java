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
import java.util.List;


/**
 * .trd file is a raw dump of TR-DOS (ZX-Spectrum) floppy. .trd files are
 * headerless and contain consequent "logical tracks", each logical track
 * consists of 16 256-byte sectors.
 * 
 * Logical tracks are defined the same way as used by TR-DOS: for single-side
 * floppies it's just a physical track number, for two-side floppies sides are
 * interleaved, i.e. logical_track_num = (physical_track_num << 1) | side
 * 
 * So, this format definition is more for TR-DOS filesystem than for .trd files,
 * which are formatless.
 * 
 * Strings (file names, disk label, disk password) are padded with spaces and use
 * ZX Spectrum character set, including UDGs, block drawing chars and Basic
 * tokens. ASCII range is mostly standard ASCII, with few characters (^, `, DEL)
 * replaced with (up arrow, pound, copyright symbol).
 * 
 * .trd file can be smaller than actual floppy disk, if last logical tracks are
 * empty (contain no file data) they can be omitted.
 */
public class TrDosImage extends KaitaiStruct.ReadWrite {
    public static TrDosImage fromFile(String fileName) throws IOException {
        return new TrDosImage(new ByteBufferKaitaiStream(fileName));
    }

    public enum DiskType {
        TYPE_80_TRACKS_DOUBLE_SIDE(22),
        TYPE_40_TRACKS_DOUBLE_SIDE(23),
        TYPE_80_TRACKS_SINGLE_SIDE(24),
        TYPE_40_TRACKS_SINGLE_SIDE(25);

        private final long id;
        DiskType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, DiskType> byId = new HashMap<Long, DiskType>(4);
        static {
            for (DiskType e : DiskType.values())
                byId.put(e.id(), e);
        }
        public static DiskType byId(long id) { return byId.get(id); }
    }
    public TrDosImage() {
        this(null, null, null);
    }

    public TrDosImage(KaitaiStream _io) {
        this(_io, null, null);
    }

    public TrDosImage(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public TrDosImage(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, TrDosImage _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.files = new ArrayList<File>();
        {
            File _it;
            int i = 0;
            do {
                File _t_files = new File(this._io, this, _root);
                try {
                    _t_files._read();
                } finally {
                    _it = _t_files;
                    this.files.add(_it);
                }
                i++;
            } while (!(_it.isTerminator()));
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.files.size(); i++) {
            this.files.get(((Number) (i)).intValue())._fetchInstances();
        }
        volumeInfo();
        if (this.volumeInfo != null) {
            this.volumeInfo._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteVolumeInfo = _enabledVolumeInfo;
        for (int i = 0; i < this.files.size(); i++) {
            this.files.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.files.size() == 0)
            throw new ConsistencyError("files", 0, this.files.size());
        for (int i = 0; i < this.files.size(); i++) {
            if (!Objects.equals(this.files.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("files", _root(), this.files.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.files.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("files", this, this.files.get(((Number) (i)).intValue())._parent());
            {
                File _it = this.files.get(((Number) (i)).intValue());
                if (_it.isTerminator() != (i == this.files.size() - 1))
                    throw new ConsistencyError("files", i == this.files.size() - 1, _it.isTerminator());
            }
        }
        if (_enabledVolumeInfo) {
            if (!Objects.equals(this.volumeInfo._root(), _root()))
                throw new ConsistencyError("volume_info", _root(), this.volumeInfo._root());
            if (!Objects.equals(this.volumeInfo._parent(), this))
                throw new ConsistencyError("volume_info", this, this.volumeInfo._parent());
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

        public File(KaitaiStream _io, TrDosImage _parent) {
            this(_io, _parent, null);
        }

        public File(KaitaiStream _io, TrDosImage _parent, TrDosImage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this._raw_name = this._io.readBytes(8);
            KaitaiStream _io__raw_name = new ByteBufferKaitaiStream(this._raw_name);
            this.name = new Filename(_io__raw_name, this, _root);
            this.name._read();
            this.extension = this._io.readU1();
            switch (extension()) {
            case 35: {
                this.positionAndLength = new PositionAndLengthPrint(this._io, this, _root);
                ((PositionAndLengthPrint) (this.positionAndLength))._read();
                break;
            }
            case 66: {
                this.positionAndLength = new PositionAndLengthBasic(this._io, this, _root);
                ((PositionAndLengthBasic) (this.positionAndLength))._read();
                break;
            }
            case 67: {
                this.positionAndLength = new PositionAndLengthCode(this._io, this, _root);
                ((PositionAndLengthCode) (this.positionAndLength))._read();
                break;
            }
            default: {
                this.positionAndLength = new PositionAndLengthGeneric(this._io, this, _root);
                ((PositionAndLengthGeneric) (this.positionAndLength))._read();
                break;
            }
            }
            this.lengthSectors = this._io.readU1();
            this.startingSector = this._io.readU1();
            this.startingTrack = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.name._fetchInstances();
            switch (extension()) {
            case 35: {
                ((PositionAndLengthPrint) (this.positionAndLength))._fetchInstances();
                break;
            }
            case 66: {
                ((PositionAndLengthBasic) (this.positionAndLength))._fetchInstances();
                break;
            }
            case 67: {
                ((PositionAndLengthCode) (this.positionAndLength))._fetchInstances();
                break;
            }
            default: {
                ((PositionAndLengthGeneric) (this.positionAndLength))._fetchInstances();
                break;
            }
            }
            contents();
            if (this.contents != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteContents = _enabledContents;
            final KaitaiStream _io__raw_name = new ByteBufferKaitaiStream(8);
            this._io.addChildStream(_io__raw_name);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (8));
                final File _this = this;
                _io__raw_name.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_name = _io__raw_name.toByteArray();
                        if (_this._raw_name.length != 8)
                            throw new ConsistencyError("raw(name)", 8, _this._raw_name.length);
                        parent.writeBytes(_this._raw_name);
                    }
                });
            }
            this.name._write_Seq(_io__raw_name);
            this._io.writeU1(this.extension);
            switch (extension()) {
            case 35: {
                ((PositionAndLengthPrint) (this.positionAndLength))._write_Seq(this._io);
                break;
            }
            case 66: {
                ((PositionAndLengthBasic) (this.positionAndLength))._write_Seq(this._io);
                break;
            }
            case 67: {
                ((PositionAndLengthCode) (this.positionAndLength))._write_Seq(this._io);
                break;
            }
            default: {
                ((PositionAndLengthGeneric) (this.positionAndLength))._write_Seq(this._io);
                break;
            }
            }
            this._io.writeU1(this.lengthSectors);
            this._io.writeU1(this.startingSector);
            this._io.writeU1(this.startingTrack);
        }

        public void _check() {
            if (!Objects.equals(this.name._root(), _root()))
                throw new ConsistencyError("name", _root(), this.name._root());
            if (!Objects.equals(this.name._parent(), this))
                throw new ConsistencyError("name", this, this.name._parent());
            switch (extension()) {
            case 35: {
                if (!Objects.equals(((TrDosImage.PositionAndLengthPrint) (this.positionAndLength))._root(), _root()))
                    throw new ConsistencyError("position_and_length", _root(), ((TrDosImage.PositionAndLengthPrint) (this.positionAndLength))._root());
                if (!Objects.equals(((TrDosImage.PositionAndLengthPrint) (this.positionAndLength))._parent(), this))
                    throw new ConsistencyError("position_and_length", this, ((TrDosImage.PositionAndLengthPrint) (this.positionAndLength))._parent());
                break;
            }
            case 66: {
                if (!Objects.equals(((TrDosImage.PositionAndLengthBasic) (this.positionAndLength))._root(), _root()))
                    throw new ConsistencyError("position_and_length", _root(), ((TrDosImage.PositionAndLengthBasic) (this.positionAndLength))._root());
                if (!Objects.equals(((TrDosImage.PositionAndLengthBasic) (this.positionAndLength))._parent(), this))
                    throw new ConsistencyError("position_and_length", this, ((TrDosImage.PositionAndLengthBasic) (this.positionAndLength))._parent());
                break;
            }
            case 67: {
                if (!Objects.equals(((TrDosImage.PositionAndLengthCode) (this.positionAndLength))._root(), _root()))
                    throw new ConsistencyError("position_and_length", _root(), ((TrDosImage.PositionAndLengthCode) (this.positionAndLength))._root());
                if (!Objects.equals(((TrDosImage.PositionAndLengthCode) (this.positionAndLength))._parent(), this))
                    throw new ConsistencyError("position_and_length", this, ((TrDosImage.PositionAndLengthCode) (this.positionAndLength))._parent());
                break;
            }
            default: {
                if (!Objects.equals(((TrDosImage.PositionAndLengthGeneric) (this.positionAndLength))._root(), _root()))
                    throw new ConsistencyError("position_and_length", _root(), ((TrDosImage.PositionAndLengthGeneric) (this.positionAndLength))._root());
                if (!Objects.equals(((TrDosImage.PositionAndLengthGeneric) (this.positionAndLength))._parent(), this))
                    throw new ConsistencyError("position_and_length", this, ((TrDosImage.PositionAndLengthGeneric) (this.positionAndLength))._parent());
                break;
            }
            }
            if (_enabledContents) {
                if (this.contents.length != lengthSectors() * 256)
                    throw new ConsistencyError("contents", lengthSectors() * 256, this.contents.length);
            }
            _dirty = false;
        }
        private byte[] contents;
        private boolean _shouldWriteContents = false;
        private boolean _enabledContents = true;
        public byte[] contents() {
            if (_shouldWriteContents)
                _writeContents();
            if (this.contents != null)
                return this.contents;
            if (!_enabledContents)
                return null;
            long _pos = this._io.pos();
            this._io.seek((startingTrack() * 256) * 16 + startingSector() * 256);
            this.contents = this._io.readBytes(lengthSectors() * 256);
            this._io.seek(_pos);
            return this.contents;
        }
        public void setContents(byte[] _v) { _dirty = true; contents = _v; }
        public void setContents_Enabled(boolean _v) { _dirty = true; _enabledContents = _v; }

        private void _writeContents() {
            _shouldWriteContents = false;
            long _pos = this._io.pos();
            this._io.seek((startingTrack() * 256) * 16 + startingSector() * 256);
            this._io.writeBytes(this.contents);
            this._io.seek(_pos);
        }
        private Boolean isDeleted;
        public Boolean isDeleted() {
            if (this.isDeleted != null)
                return this.isDeleted;
            this.isDeleted = name().firstByte() == 1;
            return this.isDeleted;
        }
        public void _invalidateIsDeleted() { this.isDeleted = null; }
        private Boolean isTerminator;
        public Boolean isTerminator() {
            if (this.isTerminator != null)
                return this.isTerminator;
            this.isTerminator = name().firstByte() == 0;
            return this.isTerminator;
        }
        public void _invalidateIsTerminator() { this.isTerminator = null; }
        private Filename name;
        private int extension;
        private KaitaiStruct.ReadWrite positionAndLength;
        private int lengthSectors;
        private int startingSector;
        private int startingTrack;
        private TrDosImage _root;
        private TrDosImage _parent;
        private byte[] _raw_name;
        public Filename name() { return name; }
        public void setName(Filename _v) { _dirty = true; name = _v; }
        public int extension() { return extension; }
        public void setExtension(int _v) { _dirty = true; extension = _v; }
        public KaitaiStruct.ReadWrite positionAndLength() { return positionAndLength; }
        public void setPositionAndLength(KaitaiStruct.ReadWrite _v) { _dirty = true; positionAndLength = _v; }
        public int lengthSectors() { return lengthSectors; }
        public void setLengthSectors(int _v) { _dirty = true; lengthSectors = _v; }
        public int startingSector() { return startingSector; }
        public void setStartingSector(int _v) { _dirty = true; startingSector = _v; }
        public int startingTrack() { return startingTrack; }
        public void setStartingTrack(int _v) { _dirty = true; startingTrack = _v; }
        public TrDosImage _root() { return _root; }
        public void set_root(TrDosImage _v) { _dirty = true; _root = _v; }
        public TrDosImage _parent() { return _parent; }
        public void set_parent(TrDosImage _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_name() { return _raw_name; }
        public void set_raw_Name(byte[] _v) { _dirty = true; _raw_name = _v; }
    }
    public static class Filename extends KaitaiStruct.ReadWrite {
        public static Filename fromFile(String fileName) throws IOException {
            return new Filename(new ByteBufferKaitaiStream(fileName));
        }
        public Filename() {
            this(null, null, null);
        }

        public Filename(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Filename(KaitaiStream _io, TrDosImage.File _parent) {
            this(_io, _parent, null);
        }

        public Filename(KaitaiStream _io, TrDosImage.File _parent, TrDosImage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.name = this._io.readBytes(8);
            _dirty = false;
        }

        public void _fetchInstances() {
            firstByte();
            if (this.firstByte != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteFirstByte = _enabledFirstByte;
            this._io.writeBytes(this.name);
        }

        public void _check() {
            if (this.name.length != 8)
                throw new ConsistencyError("name", 8, this.name.length);
            if (_enabledFirstByte) {
            }
            _dirty = false;
        }
        private Integer firstByte;
        private boolean _shouldWriteFirstByte = false;
        private boolean _enabledFirstByte = true;
        public Integer firstByte() {
            if (_shouldWriteFirstByte)
                _writeFirstByte();
            if (this.firstByte != null)
                return this.firstByte;
            if (!_enabledFirstByte)
                return null;
            long _pos = this._io.pos();
            this._io.seek(0);
            this.firstByte = this._io.readU1();
            this._io.seek(_pos);
            return this.firstByte;
        }
        public void setFirstByte(int _v) { _dirty = true; firstByte = _v; }
        public void setFirstByte_Enabled(boolean _v) { _dirty = true; _enabledFirstByte = _v; }

        private void _writeFirstByte() {
            _shouldWriteFirstByte = false;
            long _pos = this._io.pos();
            this._io.seek(0);
            this._io.writeU1(this.firstByte);
            this._io.seek(_pos);
        }
        private byte[] name;
        private TrDosImage _root;
        private TrDosImage.File _parent;
        public byte[] name() { return name; }
        public void setName(byte[] _v) { _dirty = true; name = _v; }
        public TrDosImage _root() { return _root; }
        public void set_root(TrDosImage _v) { _dirty = true; _root = _v; }
        public TrDosImage.File _parent() { return _parent; }
        public void set_parent(TrDosImage.File _v) { _dirty = true; _parent = _v; }
    }
    public static class PositionAndLengthBasic extends KaitaiStruct.ReadWrite {
        public static PositionAndLengthBasic fromFile(String fileName) throws IOException {
            return new PositionAndLengthBasic(new ByteBufferKaitaiStream(fileName));
        }
        public PositionAndLengthBasic() {
            this(null, null, null);
        }

        public PositionAndLengthBasic(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PositionAndLengthBasic(KaitaiStream _io, TrDosImage.File _parent) {
            this(_io, _parent, null);
        }

        public PositionAndLengthBasic(KaitaiStream _io, TrDosImage.File _parent, TrDosImage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.programAndDataLength = this._io.readU2le();
            this.programLength = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.programAndDataLength);
            this._io.writeU2le(this.programLength);
        }

        public void _check() {
            _dirty = false;
        }
        private int programAndDataLength;
        private int programLength;
        private TrDosImage _root;
        private TrDosImage.File _parent;
        public int programAndDataLength() { return programAndDataLength; }
        public void setProgramAndDataLength(int _v) { _dirty = true; programAndDataLength = _v; }
        public int programLength() { return programLength; }
        public void setProgramLength(int _v) { _dirty = true; programLength = _v; }
        public TrDosImage _root() { return _root; }
        public void set_root(TrDosImage _v) { _dirty = true; _root = _v; }
        public TrDosImage.File _parent() { return _parent; }
        public void set_parent(TrDosImage.File _v) { _dirty = true; _parent = _v; }
    }
    public static class PositionAndLengthCode extends KaitaiStruct.ReadWrite {
        public static PositionAndLengthCode fromFile(String fileName) throws IOException {
            return new PositionAndLengthCode(new ByteBufferKaitaiStream(fileName));
        }
        public PositionAndLengthCode() {
            this(null, null, null);
        }

        public PositionAndLengthCode(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PositionAndLengthCode(KaitaiStream _io, TrDosImage.File _parent) {
            this(_io, _parent, null);
        }

        public PositionAndLengthCode(KaitaiStream _io, TrDosImage.File _parent, TrDosImage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.startAddress = this._io.readU2le();
            this.length = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.startAddress);
            this._io.writeU2le(this.length);
        }

        public void _check() {
            _dirty = false;
        }
        private int startAddress;
        private int length;
        private TrDosImage _root;
        private TrDosImage.File _parent;

        /**
         * Default memory address to load this byte array into
         */
        public int startAddress() { return startAddress; }
        public void setStartAddress(int _v) { _dirty = true; startAddress = _v; }
        public int length() { return length; }
        public void setLength(int _v) { _dirty = true; length = _v; }
        public TrDosImage _root() { return _root; }
        public void set_root(TrDosImage _v) { _dirty = true; _root = _v; }
        public TrDosImage.File _parent() { return _parent; }
        public void set_parent(TrDosImage.File _v) { _dirty = true; _parent = _v; }
    }
    public static class PositionAndLengthGeneric extends KaitaiStruct.ReadWrite {
        public static PositionAndLengthGeneric fromFile(String fileName) throws IOException {
            return new PositionAndLengthGeneric(new ByteBufferKaitaiStream(fileName));
        }
        public PositionAndLengthGeneric() {
            this(null, null, null);
        }

        public PositionAndLengthGeneric(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PositionAndLengthGeneric(KaitaiStream _io, TrDosImage.File _parent) {
            this(_io, _parent, null);
        }

        public PositionAndLengthGeneric(KaitaiStream _io, TrDosImage.File _parent, TrDosImage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.reserved = this._io.readU2le();
            this.length = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.reserved);
            this._io.writeU2le(this.length);
        }

        public void _check() {
            _dirty = false;
        }
        private int reserved;
        private int length;
        private TrDosImage _root;
        private TrDosImage.File _parent;
        public int reserved() { return reserved; }
        public void setReserved(int _v) { _dirty = true; reserved = _v; }
        public int length() { return length; }
        public void setLength(int _v) { _dirty = true; length = _v; }
        public TrDosImage _root() { return _root; }
        public void set_root(TrDosImage _v) { _dirty = true; _root = _v; }
        public TrDosImage.File _parent() { return _parent; }
        public void set_parent(TrDosImage.File _v) { _dirty = true; _parent = _v; }
    }
    public static class PositionAndLengthPrint extends KaitaiStruct.ReadWrite {
        public static PositionAndLengthPrint fromFile(String fileName) throws IOException {
            return new PositionAndLengthPrint(new ByteBufferKaitaiStream(fileName));
        }
        public PositionAndLengthPrint() {
            this(null, null, null);
        }

        public PositionAndLengthPrint(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PositionAndLengthPrint(KaitaiStream _io, TrDosImage.File _parent) {
            this(_io, _parent, null);
        }

        public PositionAndLengthPrint(KaitaiStream _io, TrDosImage.File _parent, TrDosImage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.extentNo = this._io.readU1();
            this.reserved = this._io.readU1();
            this.length = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.extentNo);
            this._io.writeU1(this.reserved);
            this._io.writeU2le(this.length);
        }

        public void _check() {
            _dirty = false;
        }
        private int extentNo;
        private int reserved;
        private int length;
        private TrDosImage _root;
        private TrDosImage.File _parent;
        public int extentNo() { return extentNo; }
        public void setExtentNo(int _v) { _dirty = true; extentNo = _v; }
        public int reserved() { return reserved; }
        public void setReserved(int _v) { _dirty = true; reserved = _v; }
        public int length() { return length; }
        public void setLength(int _v) { _dirty = true; length = _v; }
        public TrDosImage _root() { return _root; }
        public void set_root(TrDosImage _v) { _dirty = true; _root = _v; }
        public TrDosImage.File _parent() { return _parent; }
        public void set_parent(TrDosImage.File _v) { _dirty = true; _parent = _v; }
    }
    public static class VolumeInfo extends KaitaiStruct.ReadWrite {
        public static VolumeInfo fromFile(String fileName) throws IOException {
            return new VolumeInfo(new ByteBufferKaitaiStream(fileName));
        }
        public VolumeInfo() {
            this(null, null, null);
        }

        public VolumeInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public VolumeInfo(KaitaiStream _io, TrDosImage _parent) {
            this(_io, _parent, null);
        }

        public VolumeInfo(KaitaiStream _io, TrDosImage _parent, TrDosImage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.catalogEnd = this._io.readBytes(1);
            if (!(Arrays.equals(this.catalogEnd, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.catalogEnd, this._io, "/types/volume_info/seq/0");
            }
            this.unused = this._io.readBytes(224);
            this.firstFreeSectorSector = this._io.readU1();
            this.firstFreeSectorTrack = this._io.readU1();
            this.diskType = TrDosImage.DiskType.byId(this._io.readU1());
            this.numFiles = this._io.readU1();
            this.numFreeSectors = this._io.readU2le();
            this.trDosId = this._io.readBytes(1);
            if (!(Arrays.equals(this.trDosId, new byte[] { 16 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 16 }, this.trDosId, this._io, "/types/volume_info/seq/7");
            }
            this.unused2 = this._io.readBytes(2);
            this.password = this._io.readBytes(9);
            this.unused3 = this._io.readBytes(1);
            this.numDeletedFiles = this._io.readU1();
            this.label = this._io.readBytes(8);
            this.unused4 = this._io.readBytes(3);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.catalogEnd);
            this._io.writeBytes(this.unused);
            this._io.writeU1(this.firstFreeSectorSector);
            this._io.writeU1(this.firstFreeSectorTrack);
            this._io.writeU1(((Number) (this.diskType.id())).intValue());
            this._io.writeU1(this.numFiles);
            this._io.writeU2le(this.numFreeSectors);
            this._io.writeBytes(this.trDosId);
            this._io.writeBytes(this.unused2);
            this._io.writeBytes(this.password);
            this._io.writeBytes(this.unused3);
            this._io.writeU1(this.numDeletedFiles);
            this._io.writeBytes(this.label);
            this._io.writeBytes(this.unused4);
        }

        public void _check() {
            if (this.catalogEnd.length != 1)
                throw new ConsistencyError("catalog_end", 1, this.catalogEnd.length);
            if (!(Arrays.equals(this.catalogEnd, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.catalogEnd, null, "/types/volume_info/seq/0");
            }
            if (this.unused.length != 224)
                throw new ConsistencyError("unused", 224, this.unused.length);
            if (this.trDosId.length != 1)
                throw new ConsistencyError("tr_dos_id", 1, this.trDosId.length);
            if (!(Arrays.equals(this.trDosId, new byte[] { 16 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 16 }, this.trDosId, null, "/types/volume_info/seq/7");
            }
            if (this.unused2.length != 2)
                throw new ConsistencyError("unused_2", 2, this.unused2.length);
            if (this.password.length != 9)
                throw new ConsistencyError("password", 9, this.password.length);
            if (this.unused3.length != 1)
                throw new ConsistencyError("unused_3", 1, this.unused3.length);
            if (this.label.length != 8)
                throw new ConsistencyError("label", 8, this.label.length);
            if (this.unused4.length != 3)
                throw new ConsistencyError("unused_4", 3, this.unused4.length);
            _dirty = false;
        }
        private Byte numSides;
        public Byte numSides() {
            if (this.numSides != null)
                return this.numSides;
            this.numSides = ((Number) (((diskType().id() & 8) != 0 ? 1 : 2))).byteValue();
            return this.numSides;
        }
        public void _invalidateNumSides() { this.numSides = null; }
        private Byte numTracks;
        public Byte numTracks() {
            if (this.numTracks != null)
                return this.numTracks;
            this.numTracks = ((Number) (((diskType().id() & 1) != 0 ? 40 : 80))).byteValue();
            return this.numTracks;
        }
        public void _invalidateNumTracks() { this.numTracks = null; }
        private byte[] catalogEnd;
        private byte[] unused;
        private int firstFreeSectorSector;
        private int firstFreeSectorTrack;
        private DiskType diskType;
        private int numFiles;
        private int numFreeSectors;
        private byte[] trDosId;
        private byte[] unused2;
        private byte[] password;
        private byte[] unused3;
        private int numDeletedFiles;
        private byte[] label;
        private byte[] unused4;
        private TrDosImage _root;
        private TrDosImage _parent;
        public byte[] catalogEnd() { return catalogEnd; }
        public void setCatalogEnd(byte[] _v) { _dirty = true; catalogEnd = _v; }
        public byte[] unused() { return unused; }
        public void setUnused(byte[] _v) { _dirty = true; unused = _v; }
        public int firstFreeSectorSector() { return firstFreeSectorSector; }
        public void setFirstFreeSectorSector(int _v) { _dirty = true; firstFreeSectorSector = _v; }

        /**
         * track number is logical, for double-sided disks it's
         * (physical_track << 1) | side, the same way that tracks are stored
         * sequentially in .trd file
         */
        public int firstFreeSectorTrack() { return firstFreeSectorTrack; }
        public void setFirstFreeSectorTrack(int _v) { _dirty = true; firstFreeSectorTrack = _v; }
        public DiskType diskType() { return diskType; }
        public void setDiskType(DiskType _v) { _dirty = true; diskType = _v; }

        /**
         * Number of non-deleted files. Directory can have more than
         * number_of_files entries due to deleted files
         */
        public int numFiles() { return numFiles; }
        public void setNumFiles(int _v) { _dirty = true; numFiles = _v; }
        public int numFreeSectors() { return numFreeSectors; }
        public void setNumFreeSectors(int _v) { _dirty = true; numFreeSectors = _v; }
        public byte[] trDosId() { return trDosId; }
        public void setTrDosId(byte[] _v) { _dirty = true; trDosId = _v; }
        public byte[] unused2() { return unused2; }
        public void setUnused2(byte[] _v) { _dirty = true; unused2 = _v; }
        public byte[] password() { return password; }
        public void setPassword(byte[] _v) { _dirty = true; password = _v; }
        public byte[] unused3() { return unused3; }
        public void setUnused3(byte[] _v) { _dirty = true; unused3 = _v; }
        public int numDeletedFiles() { return numDeletedFiles; }
        public void setNumDeletedFiles(int _v) { _dirty = true; numDeletedFiles = _v; }
        public byte[] label() { return label; }
        public void setLabel(byte[] _v) { _dirty = true; label = _v; }
        public byte[] unused4() { return unused4; }
        public void setUnused4(byte[] _v) { _dirty = true; unused4 = _v; }
        public TrDosImage _root() { return _root; }
        public void set_root(TrDosImage _v) { _dirty = true; _root = _v; }
        public TrDosImage _parent() { return _parent; }
        public void set_parent(TrDosImage _v) { _dirty = true; _parent = _v; }
    }
    private VolumeInfo volumeInfo;
    private boolean _shouldWriteVolumeInfo = false;
    private boolean _enabledVolumeInfo = true;
    public VolumeInfo volumeInfo() {
        if (_shouldWriteVolumeInfo)
            _writeVolumeInfo();
        if (this.volumeInfo != null)
            return this.volumeInfo;
        if (!_enabledVolumeInfo)
            return null;
        long _pos = this._io.pos();
        this._io.seek(2048);
        this.volumeInfo = new VolumeInfo(this._io, this, _root);
        this.volumeInfo._read();
        this._io.seek(_pos);
        return this.volumeInfo;
    }
    public void setVolumeInfo(VolumeInfo _v) { _dirty = true; volumeInfo = _v; }
    public void setVolumeInfo_Enabled(boolean _v) { _dirty = true; _enabledVolumeInfo = _v; }

    private void _writeVolumeInfo() {
        _shouldWriteVolumeInfo = false;
        long _pos = this._io.pos();
        this._io.seek(2048);
        this.volumeInfo._write_Seq(this._io);
        this._io.seek(_pos);
    }
    private List<File> files;
    private TrDosImage _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<File> files() { return files; }
    public void setFiles(List<File> _v) { _dirty = true; files = _v; }
    public TrDosImage _root() { return _root; }
    public void set_root(TrDosImage _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

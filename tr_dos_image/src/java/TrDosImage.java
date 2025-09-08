// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
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
public class TrDosImage extends KaitaiStruct {
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

    public TrDosImage(KaitaiStream _io) {
        this(_io, null, null);
    }

    public TrDosImage(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public TrDosImage(KaitaiStream _io, KaitaiStruct _parent, TrDosImage _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.files = new ArrayList<File>();
        {
            File _it;
            int i = 0;
            do {
                _it = new File(this._io, this, _root);
                this.files.add(_it);
                i++;
            } while (!(_it.isTerminator()));
        }
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
    public static class File extends KaitaiStruct {
        public static File fromFile(String fileName) throws IOException {
            return new File(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            KaitaiStream _io_name = this._io.substream(8);
            this.name = new Filename(_io_name, this, _root);
            this.extension = this._io.readU1();
            switch (extension()) {
            case 35: {
                this.positionAndLength = new PositionAndLengthPrint(this._io, this, _root);
                break;
            }
            case 66: {
                this.positionAndLength = new PositionAndLengthBasic(this._io, this, _root);
                break;
            }
            case 67: {
                this.positionAndLength = new PositionAndLengthCode(this._io, this, _root);
                break;
            }
            default: {
                this.positionAndLength = new PositionAndLengthGeneric(this._io, this, _root);
                break;
            }
            }
            this.lengthSectors = this._io.readU1();
            this.startingSector = this._io.readU1();
            this.startingTrack = this._io.readU1();
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
        private byte[] contents;
        public byte[] contents() {
            if (this.contents != null)
                return this.contents;
            long _pos = this._io.pos();
            this._io.seek((startingTrack() * 256) * 16 + startingSector() * 256);
            this.contents = this._io.readBytes(lengthSectors() * 256);
            this._io.seek(_pos);
            return this.contents;
        }
        private Boolean isDeleted;
        public Boolean isDeleted() {
            if (this.isDeleted != null)
                return this.isDeleted;
            this.isDeleted = name().firstByte() == 1;
            return this.isDeleted;
        }
        private Boolean isTerminator;
        public Boolean isTerminator() {
            if (this.isTerminator != null)
                return this.isTerminator;
            this.isTerminator = name().firstByte() == 0;
            return this.isTerminator;
        }
        private Filename name;
        private int extension;
        private KaitaiStruct positionAndLength;
        private int lengthSectors;
        private int startingSector;
        private int startingTrack;
        private TrDosImage _root;
        private TrDosImage _parent;
        public Filename name() { return name; }
        public int extension() { return extension; }
        public KaitaiStruct positionAndLength() { return positionAndLength; }
        public int lengthSectors() { return lengthSectors; }
        public int startingSector() { return startingSector; }
        public int startingTrack() { return startingTrack; }
        public TrDosImage _root() { return _root; }
        public TrDosImage _parent() { return _parent; }
    }
    public static class Filename extends KaitaiStruct {
        public static Filename fromFile(String fileName) throws IOException {
            return new Filename(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.name = this._io.readBytes(8);
        }

        public void _fetchInstances() {
            firstByte();
            if (this.firstByte != null) {
            }
        }
        private Integer firstByte;
        public Integer firstByte() {
            if (this.firstByte != null)
                return this.firstByte;
            long _pos = this._io.pos();
            this._io.seek(0);
            this.firstByte = this._io.readU1();
            this._io.seek(_pos);
            return this.firstByte;
        }
        private byte[] name;
        private TrDosImage _root;
        private TrDosImage.File _parent;
        public byte[] name() { return name; }
        public TrDosImage _root() { return _root; }
        public TrDosImage.File _parent() { return _parent; }
    }
    public static class PositionAndLengthBasic extends KaitaiStruct {
        public static PositionAndLengthBasic fromFile(String fileName) throws IOException {
            return new PositionAndLengthBasic(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.programAndDataLength = this._io.readU2le();
            this.programLength = this._io.readU2le();
        }

        public void _fetchInstances() {
        }
        private int programAndDataLength;
        private int programLength;
        private TrDosImage _root;
        private TrDosImage.File _parent;
        public int programAndDataLength() { return programAndDataLength; }
        public int programLength() { return programLength; }
        public TrDosImage _root() { return _root; }
        public TrDosImage.File _parent() { return _parent; }
    }
    public static class PositionAndLengthCode extends KaitaiStruct {
        public static PositionAndLengthCode fromFile(String fileName) throws IOException {
            return new PositionAndLengthCode(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.startAddress = this._io.readU2le();
            this.length = this._io.readU2le();
        }

        public void _fetchInstances() {
        }
        private int startAddress;
        private int length;
        private TrDosImage _root;
        private TrDosImage.File _parent;

        /**
         * Default memory address to load this byte array into
         */
        public int startAddress() { return startAddress; }
        public int length() { return length; }
        public TrDosImage _root() { return _root; }
        public TrDosImage.File _parent() { return _parent; }
    }
    public static class PositionAndLengthGeneric extends KaitaiStruct {
        public static PositionAndLengthGeneric fromFile(String fileName) throws IOException {
            return new PositionAndLengthGeneric(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.reserved = this._io.readU2le();
            this.length = this._io.readU2le();
        }

        public void _fetchInstances() {
        }
        private int reserved;
        private int length;
        private TrDosImage _root;
        private TrDosImage.File _parent;
        public int reserved() { return reserved; }
        public int length() { return length; }
        public TrDosImage _root() { return _root; }
        public TrDosImage.File _parent() { return _parent; }
    }
    public static class PositionAndLengthPrint extends KaitaiStruct {
        public static PositionAndLengthPrint fromFile(String fileName) throws IOException {
            return new PositionAndLengthPrint(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.extentNo = this._io.readU1();
            this.reserved = this._io.readU1();
            this.length = this._io.readU2le();
        }

        public void _fetchInstances() {
        }
        private int extentNo;
        private int reserved;
        private int length;
        private TrDosImage _root;
        private TrDosImage.File _parent;
        public int extentNo() { return extentNo; }
        public int reserved() { return reserved; }
        public int length() { return length; }
        public TrDosImage _root() { return _root; }
        public TrDosImage.File _parent() { return _parent; }
    }
    public static class VolumeInfo extends KaitaiStruct {
        public static VolumeInfo fromFile(String fileName) throws IOException {
            return new VolumeInfo(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
        }

        public void _fetchInstances() {
        }
        private Byte numSides;
        public Byte numSides() {
            if (this.numSides != null)
                return this.numSides;
            this.numSides = ((Number) (((diskType().id() & 8) != 0 ? 1 : 2))).byteValue();
            return this.numSides;
        }
        private Byte numTracks;
        public Byte numTracks() {
            if (this.numTracks != null)
                return this.numTracks;
            this.numTracks = ((Number) (((diskType().id() & 1) != 0 ? 40 : 80))).byteValue();
            return this.numTracks;
        }
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
        public byte[] unused() { return unused; }
        public int firstFreeSectorSector() { return firstFreeSectorSector; }

        /**
         * track number is logical, for double-sided disks it's
         * (physical_track << 1) | side, the same way that tracks are stored
         * sequentially in .trd file
         */
        public int firstFreeSectorTrack() { return firstFreeSectorTrack; }
        public DiskType diskType() { return diskType; }

        /**
         * Number of non-deleted files. Directory can have more than
         * number_of_files entries due to deleted files
         */
        public int numFiles() { return numFiles; }
        public int numFreeSectors() { return numFreeSectors; }
        public byte[] trDosId() { return trDosId; }
        public byte[] unused2() { return unused2; }
        public byte[] password() { return password; }
        public byte[] unused3() { return unused3; }
        public int numDeletedFiles() { return numDeletedFiles; }
        public byte[] label() { return label; }
        public byte[] unused4() { return unused4; }
        public TrDosImage _root() { return _root; }
        public TrDosImage _parent() { return _parent; }
    }
    private VolumeInfo volumeInfo;
    public VolumeInfo volumeInfo() {
        if (this.volumeInfo != null)
            return this.volumeInfo;
        long _pos = this._io.pos();
        this._io.seek(2048);
        this.volumeInfo = new VolumeInfo(this._io, this, _root);
        this._io.seek(_pos);
        return this.volumeInfo;
    }
    private List<File> files;
    private TrDosImage _root;
    private KaitaiStruct _parent;
    public List<File> files() { return files; }
    public TrDosImage _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

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


/**
 * Ogg is a popular media container format, which provides basic
 * streaming / buffering mechanisms and is content-agnostic. Most
 * popular codecs that are used within Ogg streams are Vorbis (thus
 * making Ogg/Vorbis streams) and Theora (Ogg/Theora).
 * 
 * Ogg stream is a sequence Ogg pages. They can be read sequentially,
 * or one can jump into arbitrary stream location and scan for "OggS"
 * sync code to find the beginning of a new Ogg page and continue
 * decoding the stream contents from that one.
 */
public class Ogg extends KaitaiStruct.ReadWrite {
    public static Ogg fromFile(String fileName) throws IOException {
        return new Ogg(new ByteBufferKaitaiStream(fileName));
    }
    public Ogg() {
        this(null, null, null);
    }

    public Ogg(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ogg(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Ogg(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Ogg _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.pages = new ArrayList<Page>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                Page _t_pages = new Page(this._io, this, _root);
                try {
                    _t_pages._read();
                } finally {
                    this.pages.add(_t_pages);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.pages.size(); i++) {
            this.pages.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.pages.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("pages", 0, this._io.size() - this._io.pos());
            this.pages.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("pages", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.pages.size(); i++) {
            if (!Objects.equals(this.pages.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("pages", _root(), this.pages.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.pages.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("pages", this, this.pages.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }

    /**
     * Ogg page is a basic unit of data in an Ogg bitstream, usually
     * it's around 4-8 KB, with a maximum size of 65307 bytes.
     */
    public static class Page extends KaitaiStruct.ReadWrite {
        public static Page fromFile(String fileName) throws IOException {
            return new Page(new ByteBufferKaitaiStream(fileName));
        }
        public Page() {
            this(null, null, null);
        }

        public Page(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Page(KaitaiStream _io, Ogg _parent) {
            this(_io, _parent, null);
        }

        public Page(KaitaiStream _io, Ogg _parent, Ogg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.syncCode = this._io.readBytes(4);
            if (!(Arrays.equals(this.syncCode, new byte[] { 79, 103, 103, 83 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 79, 103, 103, 83 }, this.syncCode, this._io, "/types/page/seq/0");
            }
            this.version = this._io.readBytes(1);
            if (!(Arrays.equals(this.version, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.version, this._io, "/types/page/seq/1");
            }
            this.reserved1 = this._io.readBitsIntBe(5);
            this.isEndOfStream = this._io.readBitsIntBe(1) != 0;
            this.isBeginningOfStream = this._io.readBitsIntBe(1) != 0;
            this.isContinuation = this._io.readBitsIntBe(1) != 0;
            this.granulePos = this._io.readU8le();
            this.bitstreamSerial = this._io.readU4le();
            this.pageSeqNum = this._io.readU4le();
            this.crc32 = this._io.readU4le();
            this.numSegments = this._io.readU1();
            this.lenSegments = new ArrayList<Integer>();
            for (int i = 0; i < numSegments(); i++) {
                this.lenSegments.add(this._io.readU1());
            }
            this.segments = new ArrayList<byte[]>();
            for (int i = 0; i < numSegments(); i++) {
                this.segments.add(this._io.readBytes(lenSegments().get(((Number) (i)).intValue())));
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.lenSegments.size(); i++) {
            }
            for (int i = 0; i < this.segments.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.syncCode);
            this._io.writeBytes(this.version);
            this._io.writeBitsIntBe(5, this.reserved1);
            this._io.writeBitsIntBe(1, (this.isEndOfStream ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.isBeginningOfStream ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.isContinuation ? 1 : 0));
            this._io.writeU8le(this.granulePos);
            this._io.writeU4le(this.bitstreamSerial);
            this._io.writeU4le(this.pageSeqNum);
            this._io.writeU4le(this.crc32);
            this._io.writeU1(this.numSegments);
            for (int i = 0; i < this.lenSegments.size(); i++) {
                this._io.writeU1(this.lenSegments.get(((Number) (i)).intValue()));
            }
            for (int i = 0; i < this.segments.size(); i++) {
                this._io.writeBytes(this.segments.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (this.syncCode.length != 4)
                throw new ConsistencyError("sync_code", 4, this.syncCode.length);
            if (!(Arrays.equals(this.syncCode, new byte[] { 79, 103, 103, 83 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 79, 103, 103, 83 }, this.syncCode, null, "/types/page/seq/0");
            }
            if (this.version.length != 1)
                throw new ConsistencyError("version", 1, this.version.length);
            if (!(Arrays.equals(this.version, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.version, null, "/types/page/seq/1");
            }
            if (this.lenSegments.size() != numSegments())
                throw new ConsistencyError("len_segments", numSegments(), this.lenSegments.size());
            for (int i = 0; i < this.lenSegments.size(); i++) {
            }
            if (this.segments.size() != numSegments())
                throw new ConsistencyError("segments", numSegments(), this.segments.size());
            for (int i = 0; i < this.segments.size(); i++) {
                if (this.segments.get(((Number) (i)).intValue()).length != lenSegments().get(((Number) (i)).intValue()))
                    throw new ConsistencyError("segments", lenSegments().get(((Number) (i)).intValue()), this.segments.get(((Number) (i)).intValue()).length);
            }
            _dirty = false;
        }
        private byte[] syncCode;
        private byte[] version;
        private long reserved1;
        private boolean isEndOfStream;
        private boolean isBeginningOfStream;
        private boolean isContinuation;
        private long granulePos;
        private long bitstreamSerial;
        private long pageSeqNum;
        private long crc32;
        private int numSegments;
        private List<Integer> lenSegments;
        private List<byte[]> segments;
        private Ogg _root;
        private Ogg _parent;
        public byte[] syncCode() { return syncCode; }
        public void setSyncCode(byte[] _v) { _dirty = true; syncCode = _v; }

        /**
         * Version of the Ogg bitstream format. Currently must be 0.
         */
        public byte[] version() { return version; }
        public void setVersion(byte[] _v) { _dirty = true; version = _v; }
        public long reserved1() { return reserved1; }
        public void setReserved1(long _v) { _dirty = true; reserved1 = _v; }

        /**
         * EOS (End Of Stream) mark. This page is the last page in the
         * logical bitstream. The EOS flag must be set on the final page of
         * every logical bitstream, and must not be set on any other page.
         */
        public boolean isEndOfStream() { return isEndOfStream; }
        public void setIsEndOfStream(boolean _v) { _dirty = true; isEndOfStream = _v; }

        /**
         * BOS (Beginning Of Stream) mark. This page is the first page in
         * the logical bitstream. The BOS flag must be set on the first
         * page of every logical bitstream, and must not be set on any
         * other page.
         */
        public boolean isBeginningOfStream() { return isBeginningOfStream; }
        public void setIsBeginningOfStream(boolean _v) { _dirty = true; isBeginningOfStream = _v; }

        /**
         * The first packet on this page is a continuation of the previous
         * packet in the logical bitstream.
         */
        public boolean isContinuation() { return isContinuation; }
        public void setIsContinuation(boolean _v) { _dirty = true; isContinuation = _v; }

        /**
         * "Granule position" is the time marker in Ogg files. It is an
         * abstract value, whose meaning is determined by the codec. It
         * may, for example, be a count of the number of samples, the
         * number of frames or a more complex scheme.
         */
        public long granulePos() { return granulePos; }
        public void setGranulePos(long _v) { _dirty = true; granulePos = _v; }

        /**
         * Serial number that identifies a page as belonging to a
         * particular logical bitstream. Each logical bitstream in a file
         * has a unique value, and this field allows implementations to
         * deliver the pages to the appropriate decoder. In a typical
         * Vorbis and Theora file, one stream is the audio (Vorbis), and
         * the other is the video (Theora).
         */
        public long bitstreamSerial() { return bitstreamSerial; }
        public void setBitstreamSerial(long _v) { _dirty = true; bitstreamSerial = _v; }

        /**
         * Sequential number of page, guaranteed to be monotonically
         * increasing for each logical bitstream. The first page is 0, the
         * second 1, etc. This allows implementations to detect when data
         * has been lost.
         */
        public long pageSeqNum() { return pageSeqNum; }
        public void setPageSeqNum(long _v) { _dirty = true; pageSeqNum = _v; }

        /**
         * This field provides a CRC32 checksum of the data in the entire
         * page (including the page header, calculated with the checksum
         * field set to 0). This allows verification that the data has not
         * been corrupted since it was created. Pages that fail the
         * checksum should be discarded. The checksum is generated using a
         * polynomial value of 0x04C11DB7.
         */
        public long crc32() { return crc32; }
        public void setCrc32(long _v) { _dirty = true; crc32 = _v; }

        /**
         * The number of segments that exist in this page. There can be a
         * maximum of 255 segments in any one page.
         */
        public int numSegments() { return numSegments; }
        public void setNumSegments(int _v) { _dirty = true; numSegments = _v; }

        /**
         * Table of lengths of segments.
         */
        public List<Integer> lenSegments() { return lenSegments; }
        public void setLenSegments(List<Integer> _v) { _dirty = true; lenSegments = _v; }

        /**
         * Segment content bytes make up the rest of the Ogg page.
         */
        public List<byte[]> segments() { return segments; }
        public void setSegments(List<byte[]> _v) { _dirty = true; segments = _v; }
        public Ogg _root() { return _root; }
        public void set_root(Ogg _v) { _dirty = true; _root = _v; }
        public Ogg _parent() { return _parent; }
        public void set_parent(Ogg _v) { _dirty = true; _parent = _v; }
    }
    private List<Page> pages;
    private Ogg _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<Page> pages() { return pages; }
    public void setPages(List<Page> _v) { _dirty = true; pages = _v; }
    public Ogg _root() { return _root; }
    public void set_root(Ogg _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

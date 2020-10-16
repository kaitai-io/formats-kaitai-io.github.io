// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;


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
public class Ogg extends KaitaiStruct {
    public static Ogg fromFile(String fileName) throws IOException {
        return new Ogg(new ByteBufferKaitaiStream(fileName));
    }

    public Ogg(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ogg(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Ogg(KaitaiStream _io, KaitaiStruct _parent, Ogg _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.pages = new ArrayList<Page>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.pages.add(new Page(this._io, this, _root));
                i++;
            }
        }
    }

    /**
     * Ogg page is a basic unit of data in an Ogg bitstream, usually
     * it's around 4-8 KB, with a maximum size of 65307 bytes.
     */
    public static class Page extends KaitaiStruct {
        public static Page fromFile(String fileName) throws IOException {
            return new Page(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.syncCode = this._io.readBytes(4);
            if (!(Arrays.equals(syncCode(), new byte[] { 79, 103, 103, 83 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 79, 103, 103, 83 }, syncCode(), _io(), "/types/page/seq/0");
            }
            this.version = this._io.readBytes(1);
            if (!(Arrays.equals(version(), new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, version(), _io(), "/types/page/seq/1");
            }
            this.reserved1 = this._io.readBitsIntBe(5);
            this.isEndOfStream = this._io.readBitsIntBe(1) != 0;
            this.isBeginningOfStream = this._io.readBitsIntBe(1) != 0;
            this.isContinuation = this._io.readBitsIntBe(1) != 0;
            this._io.alignToByte();
            this.granulePos = this._io.readU8le();
            this.bitstreamSerial = this._io.readU4le();
            this.pageSeqNum = this._io.readU4le();
            this.crc32 = this._io.readU4le();
            this.numSegments = this._io.readU1();
            lenSegments = new ArrayList<Integer>(((Number) (numSegments())).intValue());
            for (int i = 0; i < numSegments(); i++) {
                this.lenSegments.add(this._io.readU1());
            }
            segments = new ArrayList<byte[]>(((Number) (numSegments())).intValue());
            for (int i = 0; i < numSegments(); i++) {
                this.segments.add(this._io.readBytes(lenSegments().get((int) i)));
            }
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
        private ArrayList<Integer> lenSegments;
        private ArrayList<byte[]> segments;
        private Ogg _root;
        private Ogg _parent;
        public byte[] syncCode() { return syncCode; }

        /**
         * Version of the Ogg bitstream format. Currently must be 0.
         */
        public byte[] version() { return version; }
        public long reserved1() { return reserved1; }

        /**
         * EOS (End Of Stream) mark. This page is the last page in the
         * logical bitstream. The EOS flag must be set on the final page of
         * every logical bitstream, and must not be set on any other page.
         */
        public boolean isEndOfStream() { return isEndOfStream; }

        /**
         * BOS (Beginning Of Stream) mark. This page is the first page in
         * the logical bitstream. The BOS flag must be set on the first
         * page of every logical bitstream, and must not be set on any
         * other page.    
         */
        public boolean isBeginningOfStream() { return isBeginningOfStream; }

        /**
         * The first packet on this page is a continuation of the previous
         * packet in the logical bitstream.
         */
        public boolean isContinuation() { return isContinuation; }

        /**
         * "Granule position" is the time marker in Ogg files. It is an
         * abstract value, whose meaning is determined by the codec. It
         * may, for example, be a count of the number of samples, the
         * number of frames or a more complex scheme.
         */
        public long granulePos() { return granulePos; }

        /**
         * Serial number that identifies a page as belonging to a
         * particular logical bitstream. Each logical bitstream in a file
         * has a unique value, and this field allows implementations to
         * deliver the pages to the appropriate decoder. In a typical
         * Vorbis and Theora file, one stream is the audio (Vorbis), and
         * the other is the video (Theora).
         */
        public long bitstreamSerial() { return bitstreamSerial; }

        /**
         * Sequential number of page, guaranteed to be monotonically
         * increasing for each logical bitstream. The first page is 0, the
         * second 1, etc. This allows implementations to detect when data
         * has been lost.
         */
        public long pageSeqNum() { return pageSeqNum; }

        /**
         * This field provides a CRC32 checksum of the data in the entire
         * page (including the page header, calculated with the checksum
         * field set to 0). This allows verification that the data has not
         * been corrupted since it was created. Pages that fail the
         * checksum should be discarded. The checksum is generated using a
         * polynomial value of 0x04C11DB7.
         */
        public long crc32() { return crc32; }

        /**
         * The number of segments that exist in this page. There can be a
         * maximum of 255 segments in any one page.
         */
        public int numSegments() { return numSegments; }

        /**
         * Table of lengths of segments.
         */
        public ArrayList<Integer> lenSegments() { return lenSegments; }

        /**
         * Segment content bytes make up the rest of the Ogg page.
         */
        public ArrayList<byte[]> segments() { return segments; }
        public Ogg _root() { return _root; }
        public Ogg _parent() { return _parent; }
    }
    private ArrayList<Page> pages;
    private Ogg _root;
    private KaitaiStruct _parent;
    public ArrayList<Page> pages() { return pages; }
    public Ogg _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

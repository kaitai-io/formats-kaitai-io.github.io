// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;


/**
 * The NeXT/Sun audio file format.
 * 
 * Sample files:
 * 
 * * <https://github.com/python/cpython/tree/b8a7daf077da/Lib/test/sndhdrdata>
 * * <ftp://ftp-ccrma.stanford.edu/pub/Lisp/sf.tar.gz>
 * * <https://www.mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/Samples.html>
 * @see <a href="https://www.mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/AU.html">Source</a>
 * @see <a href="http://soundfile.sapp.org/doc/NextFormat/">Source</a>
 * @see <a href="http://soundfile.sapp.org/doc/NextFormat/soundstruct.h">Source</a>
 * @see <a href="https://github.com/andreiw/polaris/blob/deb47cb/usr/src/head/audio/au.h#L87-L112">Source</a>
 * @see <a href="https://github.com/libsndfile/libsndfile/blob/86c9f9eb/src/au.c#L39-L74">Source</a>
 * @see <a href="https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L34-L49">Source</a>
 * @see <a href="https://github.com/mpruett/audiofile/blob/b62c902/libaudiofile/NeXT.cpp#L65-L96">Source</a>
 */
public class Au extends KaitaiStruct {
    public static Au fromFile(String fileName) throws IOException {
        return new Au(new ByteBufferKaitaiStream(fileName));
    }

    public enum Encodings {
        MULAW_8(1),
        LINEAR_8(2),
        LINEAR_16(3),
        LINEAR_24(4),
        LINEAR_32(5),
        FLOAT(6),
        DOUBLE(7),
        FRAGMENTED(8),
        NESTED(9),
        DSP_CORE(10),
        FIXED_POINT_8(11),
        FIXED_POINT_16(12),
        FIXED_POINT_24(13),
        FIXED_POINT_32(14),
        DISPLAY(16),
        MULAW_SQUELCH(17),
        EMPHASIZED(18),
        COMPRESSED(19),
        COMPRESSED_EMPHASIZED(20),
        DSP_COMMANDS(21),
        DSP_COMMANDS_SAMPLES(22),
        ADPCM_G721(23),
        ADPCM_G722(24),
        ADPCM_G723_3(25),
        ADPCM_G723_5(26),
        ALAW_8(27),
        AES(28),
        DELTA_MULAW_8(29);

        private final long id;
        Encodings(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Encodings> byId = new HashMap<Long, Encodings>(28);
        static {
            for (Encodings e : Encodings.values())
                byId.put(e.id(), e);
        }
        public static Encodings byId(long id) { return byId.get(id); }
    }

    public Au(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Au(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Au(KaitaiStream _io, KaitaiStruct _parent, Au _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 46, 115, 110, 100 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 46, 115, 110, 100 }, this.magic, this._io, "/seq/0");
        }
        this.ofsData = this._io.readU4be();
        KaitaiStream _io_header = this._io.substream((ofsData() - 4) - 4);
        this.header = new Header(_io_header, this, _root);
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Au _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Au _parent, Au _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.dataSize = this._io.readU4be();
            this.encoding = Au.Encodings.byId(this._io.readU4be());
            this.sampleRate = this._io.readU4be();
            this.numChannels = this._io.readU4be();
            if (!(this.numChannels >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.numChannels, this._io, "/types/header/seq/3");
            }
            this.comment = new String(KaitaiStream.bytesTerminate(this._io.readBytesFull(), (byte) 0, false), StandardCharsets.US_ASCII);
        }

        public void _fetchInstances() {
        }
        private long dataSize;
        private Encodings encoding;
        private long sampleRate;
        private long numChannels;
        private String comment;
        private Au _root;
        private Au _parent;

        /**
         * don't read this field, access `_root.len_data` instead
         * 
         * value `0xffff_ffff` means unspecified size
         */
        public long dataSize() { return dataSize; }
        public Encodings encoding() { return encoding; }
        public long sampleRate() { return sampleRate; }

        /**
         * number of interleaved channels
         */
        public long numChannels() { return numChannels; }

        /**
         * Most resources claim that this field must be at least 4 bytes long.
         * However, most programs don't enforce it, and [Audacity](
         * https://www.audacityteam.org/) even generates .au files with this field
         * being 0-byte long. According to <https://nixdoc.net/man-pages/IRIX/man4/dmedia/next.4.html>,
         * "NeXT files require that this chunk be at least 4 bytes (chars) long,
         * whereas this chunk may be zerolength in a Sun .au file."
         * 
         * By convention, size should be a multiple of 4 -
         * see <https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L132-L133>.
         * Page <http://soundfile.sapp.org/doc/NextFormat/> also mentions that for some
         * sound playing programs, this field must have an even byte size. So a multiple
         * of 4 is probably best for compatibility.
         * 
         * Must be null-terminated. It is usually an ASCII text string, but this space
         * might be also used to store application-specific binary (i.e. non-ASCII) data.
         */
        public String comment() { return comment; }
        public Au _root() { return _root; }
        public Au _parent() { return _parent; }
    }
    private Integer lenData;
    public Integer lenData() {
        if (this.lenData != null)
            return this.lenData;
        this.lenData = ((Number) ((header().dataSize() == 4294967295L ? _io().size() - ofsData() : header().dataSize()))).intValue();
        return this.lenData;
    }
    private byte[] magic;
    private long ofsData;
    private Header header;
    private Au _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public long ofsData() { return ofsData; }
    public Header header() { return header; }
    public Au _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

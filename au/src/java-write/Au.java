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
public class Au extends KaitaiStruct.ReadWrite {
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
    public Au() {
        this(null, null, null);
    }

    public Au(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Au(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Au(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Au _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 46, 115, 110, 100 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 46, 115, 110, 100 }, this.magic, this._io, "/seq/0");
        }
        this.ofsData = this._io.readU4be();
        this._raw_header = this._io.readBytes((ofsData() - 4) - 4);
        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
        this.header = new Header(_io__raw_header, this, _root);
        this.header._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        this._io.writeU4be(this.ofsData);
        final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream((ofsData() - 4) - 4);
        this._io.addChildStream(_io__raw_header);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + ((ofsData() - 4) - 4));
            final Au _this = this;
            _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_header = _io__raw_header.toByteArray();
                    if (_this._raw_header.length != (ofsData() - 4) - 4)
                        throw new ConsistencyError("raw(header)", (ofsData() - 4) - 4, _this._raw_header.length);
                    parent.writeBytes(_this._raw_header);
                }
            });
        }
        this.header._write_Seq(_io__raw_header);
    }

    public void _check() {
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 46, 115, 110, 100 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 46, 115, 110, 100 }, this.magic, null, "/seq/0");
        }
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        _dirty = false;
    }
    public static class Header extends KaitaiStruct.ReadWrite {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }
        public Header() {
            this(null, null, null);
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
        }
        public void _read() {
            this.dataSize = this._io.readU4be();
            this.encoding = Au.Encodings.byId(this._io.readU4be());
            this.sampleRate = this._io.readU4be();
            this.numChannels = this._io.readU4be();
            if (!(this.numChannels >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.numChannels, this._io, "/types/header/seq/3");
            }
            this.comment = new String(KaitaiStream.bytesTerminate(this._io.readBytesFull(), (byte) 0, false), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.dataSize);
            this._io.writeU4be(((Number) (this.encoding.id())).longValue());
            this._io.writeU4be(this.sampleRate);
            this._io.writeU4be(this.numChannels);
            this._io.writeBytesLimit((this.comment).getBytes(Charset.forName("ASCII")), this._io.size() - this._io.pos(), (byte) 0, (byte) 0);
            if (!(this._io.isEof()))
                throw new ConsistencyError("comment", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (!(this.numChannels >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.numChannels, null, "/types/header/seq/3");
            }
            _dirty = false;
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
        public void setDataSize(long _v) { _dirty = true; dataSize = _v; }
        public Encodings encoding() { return encoding; }
        public void setEncoding(Encodings _v) { _dirty = true; encoding = _v; }
        public long sampleRate() { return sampleRate; }
        public void setSampleRate(long _v) { _dirty = true; sampleRate = _v; }

        /**
         * number of interleaved channels
         */
        public long numChannels() { return numChannels; }
        public void setNumChannels(long _v) { _dirty = true; numChannels = _v; }

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
        public void setComment(String _v) { _dirty = true; comment = _v; }
        public Au _root() { return _root; }
        public void set_root(Au _v) { _dirty = true; _root = _v; }
        public Au _parent() { return _parent; }
        public void set_parent(Au _v) { _dirty = true; _parent = _v; }
    }
    private Integer lenData;
    public Integer lenData() {
        if (this.lenData != null)
            return this.lenData;
        this.lenData = ((Number) ((header().dataSize() == 4294967295L ? _io().size() - ofsData() : header().dataSize()))).intValue();
        return this.lenData;
    }
    public void _invalidateLenData() { this.lenData = null; }
    private byte[] magic;
    private long ofsData;
    private Header header;
    private Au _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_header;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public long ofsData() { return ofsData; }
    public void setOfsData(long _v) { _dirty = true; ofsData = _v; }
    public Header header() { return header; }
    public void setHeader(Header _v) { _dirty = true; header = _v; }
    public Au _root() { return _root; }
    public void set_root(Au _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_header() { return _raw_header; }
    public void set_raw_Header(byte[] _v) { _dirty = true; _raw_header = _v; }
}

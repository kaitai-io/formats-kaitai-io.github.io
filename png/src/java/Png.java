// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;
import java.nio.charset.StandardCharsets;
import java.util.List;


/**
 * NOTICE: Many of the documentation comments (or docstrings) in this file were
 * copied from or derived from the [Portable Network Graphics (PNG) Specification
 * (Third Edition)](https://www.w3.org/TR/2025/REC-png-3-20250624/).
 * Copyright © 1996-2025 [World Wide Web Consortium](https://www.w3.org/).
 * <https://www.w3.org/copyright/software-license-2023/>
 * 
 * The full text of the license for the original W3C PNG specification is
 * provided below:
 * 
 * > ## Software and Document license - 2023 version
 * >
 * > This work is being provided by the copyright holders under the following
 * > license.
 * >
 * > ### License
 * >
 * > By obtaining and/or copying this work, you (the licensee) agree that you
 * > have read, understood, and will comply with the following terms and
 * > conditions.
 * >
 * > Permission to copy, modify, and distribute this work, with or without
 * > modification, for any purpose and without fee or royalty is hereby granted,
 * > provided that you include the following on ALL copies of the work or
 * > portions thereof, including modifications:
 * >
 * > * The full text of this NOTICE in a location viewable to users of the
 * >   redistributed or derivative work.
 * > * Any pre-existing intellectual property disclaimers, notices, or terms and
 * >   conditions. If none exist, the [W3C software and document short
 * >   notice](https://www.w3.org/Consortium/Legal/2023/copyright-software-short-notice.html)
 * >   should be included.
 * > * Notice of any changes or modifications, through a copyright statement on
 * >   the new code or document such as "This software or document includes
 * >   material copied from or derived from [title and URI of the W3C document].
 * >   Copyright © [$year-of-document] [World Wide Web
 * >   Consortium](https://www.w3.org/).
 * >   <https://www.w3.org/copyright/software-license-2023/>"
 * >
 * > ### Disclaimers
 * >
 * > THIS WORK IS PROVIDED "AS IS," AND COPYRIGHT HOLDERS MAKE NO REPRESENTATIONS
 * > OR WARRANTIES, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO, WARRANTIES
 * > OF MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF
 * > THE SOFTWARE OR DOCUMENT WILL NOT INFRINGE ANY THIRD PARTY PATENTS,
 * > COPYRIGHTS, TRADEMARKS OR OTHER RIGHTS.
 * >
 * > COPYRIGHT HOLDERS WILL NOT BE LIABLE FOR ANY DIRECT, INDIRECT, SPECIAL OR
 * > CONSEQUENTIAL DAMAGES ARISING OUT OF ANY USE OF THE SOFTWARE OR DOCUMENT.
 * >
 * > The name and trademarks of copyright holders may NOT be used in advertising
 * > or publicity pertaining to the work without specific, written prior
 * > permission. Title to copyright in this work will at all times remain with
 * > copyright holders.
 * 
 * ---
 * 
 * Test files for APNG can be found at the following locations:
 * 
 *   * <https://philip.html5.org/tests/apng/tests.html>
 *   * <http://littlesvr.ca/apng/>
 * @see <a href="https://www.w3.org/TR/png/">Source</a>
 */
public class Png extends KaitaiStruct {
    public static Png fromFile(String fileName) throws IOException {
        return new Png(new ByteBufferKaitaiStream(fileName));
    }

    public enum BlendOpValues {
        SOURCE(0),
        OVER(1);

        private final long id;
        BlendOpValues(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, BlendOpValues> byId = new HashMap<Long, BlendOpValues>(2);
        static {
            for (BlendOpValues e : BlendOpValues.values())
                byId.put(e.id(), e);
        }
        public static BlendOpValues byId(long id) { return byId.get(id); }
    }

    public enum ColorType {
        GREYSCALE(0),
        TRUECOLOR(2),
        INDEXED(3),
        GREYSCALE_ALPHA(4),
        TRUECOLOR_ALPHA(6);

        private final long id;
        ColorType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ColorType> byId = new HashMap<Long, ColorType>(5);
        static {
            for (ColorType e : ColorType.values())
                byId.put(e.id(), e);
        }
        public static ColorType byId(long id) { return byId.get(id); }
    }

    public enum CompressionMethods {
        ZLIB(0);

        private final long id;
        CompressionMethods(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, CompressionMethods> byId = new HashMap<Long, CompressionMethods>(1);
        static {
            for (CompressionMethods e : CompressionMethods.values())
                byId.put(e.id(), e);
        }
        public static CompressionMethods byId(long id) { return byId.get(id); }
    }

    public enum DisposeOpValues {
        NONE(0),
        BACKGROUND(1),
        PREVIOUS(2);

        private final long id;
        DisposeOpValues(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, DisposeOpValues> byId = new HashMap<Long, DisposeOpValues>(3);
        static {
            for (DisposeOpValues e : DisposeOpValues.values())
                byId.put(e.id(), e);
        }
        public static DisposeOpValues byId(long id) { return byId.get(id); }
    }

    public enum FilterMethod {
        BASE(0);

        private final long id;
        FilterMethod(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, FilterMethod> byId = new HashMap<Long, FilterMethod>(1);
        static {
            for (FilterMethod e : FilterMethod.values())
                byId.put(e.id(), e);
        }
        public static FilterMethod byId(long id) { return byId.get(id); }
    }

    public enum InterlaceMethod {
        NONE(0),
        ADAM7(1);

        private final long id;
        InterlaceMethod(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, InterlaceMethod> byId = new HashMap<Long, InterlaceMethod>(2);
        static {
            for (InterlaceMethod e : InterlaceMethod.values())
                byId.put(e.id(), e);
        }
        public static InterlaceMethod byId(long id) { return byId.get(id); }
    }

    public enum PhysUnit {
        UNKNOWN(0),
        METER(1);

        private final long id;
        PhysUnit(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PhysUnit> byId = new HashMap<Long, PhysUnit>(2);
        static {
            for (PhysUnit e : PhysUnit.values())
                byId.put(e.id(), e);
        }
        public static PhysUnit byId(long id) { return byId.get(id); }
    }

    public Png(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Png(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Png(KaitaiStream _io, KaitaiStruct _parent, Png _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(8);
        if (!(Arrays.equals(this.magic, new byte[] { -119, 80, 78, 71, 13, 10, 26, 10 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -119, 80, 78, 71, 13, 10, 26, 10 }, this.magic, this._io, "/seq/0");
        }
        this.ihdrLen = this._io.readU4be();
        if (!(this.ihdrLen == 13)) {
            throw new KaitaiStream.ValidationNotEqualError(13, this.ihdrLen, this._io, "/seq/1");
        }
        this.ihdrType = this._io.readBytes(4);
        if (!(Arrays.equals(this.ihdrType, new byte[] { 73, 72, 68, 82 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 73, 72, 68, 82 }, this.ihdrType, this._io, "/seq/2");
        }
        this.ihdr = new IhdrChunk(this._io, this, _root);
        this.ihdrCrc = this._io.readU4be();
        this.chunks = new ArrayList<Chunk>();
        {
            Chunk _it;
            int i = 0;
            do {
                _it = new Chunk(this._io, this, _root);
                this.chunks.add(_it);
                i++;
            } while (!( ((_it.type().equals("IEND")) || (_io().isEof())) ));
        }
    }

    public void _fetchInstances() {
        this.ihdr._fetchInstances();
        for (int i = 0; i < this.chunks.size(); i++) {
            this.chunks.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    /**
     * @see <a href="https://stackoverflow.com/questions/4242402/the-fireworks-png-format-any-insight-any-libs/51683285#51683285">Source</a>
     */
    public static class AdobeFireworksChunk extends KaitaiStruct {
        public static AdobeFireworksChunk fromFile(String fileName) throws IOException {
            return new AdobeFireworksChunk(new ByteBufferKaitaiStream(fileName));
        }

        public AdobeFireworksChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AdobeFireworksChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public AdobeFireworksChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this._raw_previewData = this._io.readBytesFull();
            this.previewData = KaitaiStream.processZlib(this._raw_previewData);
        }

        public void _fetchInstances() {
        }
        private byte[] previewData;
        private Png _root;
        private Png.Chunk _parent;
        private byte[] _raw_previewData;
        public byte[] previewData() { return previewData; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
        public byte[] _raw_previewData() { return _raw_previewData; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#acTL-chunk">Source</a>
     */
    public static class AnimationControlChunk extends KaitaiStruct {
        public static AnimationControlChunk fromFile(String fileName) throws IOException {
            return new AnimationControlChunk(new ByteBufferKaitaiStream(fileName));
        }

        public AnimationControlChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AnimationControlChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public AnimationControlChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numFrames = this._io.readU4be();
            this.numPlays = this._io.readU4be();
        }

        public void _fetchInstances() {
        }
        private long numFrames;
        private long numPlays;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * Number of frames, must be equal to the number of `fcTL` chunks (i.e.
         * `frame_control_chunk` objects)
         */
        public long numFrames() { return numFrames; }

        /**
         * Number of times to loop, 0 indicates infinite looping.
         */
        public long numPlays() { return numPlays; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/skeeto/scratch/tree/58470254f4a95cdf7a53888e405c851c21eb2cae/pngattach">Source</a>
     * @see <a href="https://nullprogram.com/blog/2021/12/31/">A new protocol and tool for PNG file attachments</a>
     */
    public static class AtchChunk extends KaitaiStruct {
        public static AtchChunk fromFile(String fileName) throws IOException {
            return new AtchChunk(new ByteBufferKaitaiStream(fileName));
        }

        public enum CompressionAttachMethods {
            NONE(0),
            ZLIB(1);

            private final long id;
            CompressionAttachMethods(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, CompressionAttachMethods> byId = new HashMap<Long, CompressionAttachMethods>(2);
            static {
                for (CompressionAttachMethods e : CompressionAttachMethods.values())
                    byId.put(e.id(), e);
            }
            public static CompressionAttachMethods byId(long id) { return byId.get(id); }
        }

        public AtchChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AtchChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public AtchChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fileName = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
            {
                String _it = this.fileName;
                if (!( ((_it.length() != 0) && (!_it.substring(0, 1).equals("."))) )) {
                    throw new KaitaiStream.ValidationExprError(this.fileName, this._io, "/types/atch_chunk/seq/0");
                }
            }
            this.compression = CompressionAttachMethods.byId(this._io.readU1());
            if (this.compression == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.compression, this._io, "/types/atch_chunk/seq/1");
            }
            if (compression() == CompressionAttachMethods.NONE) {
                this.dataPlain = this._io.readBytesFull();
            }
            if (compression() == CompressionAttachMethods.ZLIB) {
                this._raw_dataZlib = this._io.readBytesFull();
                this.dataZlib = KaitaiStream.processZlib(this._raw_dataZlib);
            }
        }

        public void _fetchInstances() {
            if (compression() == CompressionAttachMethods.NONE) {
            }
            if (compression() == CompressionAttachMethods.ZLIB) {
            }
        }
        private byte[] data;
        public byte[] data() {
            if (this.data != null)
                return this.data;
            this.data = (compression() == CompressionAttachMethods.NONE ? dataPlain() : dataZlib());
            return this.data;
        }
        private String fileName;
        private CompressionAttachMethods compression;
        private byte[] dataPlain;
        private byte[] dataZlib;
        private Png _root;
        private Png.Chunk _parent;
        private byte[] _raw_dataZlib;

        /**
         * From the [official
         * specification](https://github.com/skeeto/scratch/tree/58470254f4a95cdf7a53888e405c851c21eb2cae/pngattach#atch-chunk-specification):
         * 
         * > The name can be any length that fits in the chunk, and should be
         * > encoded with UTF-8. It's up to each implementation to determine how
         * > to appropriately interpret the bytestring for the local system.
         * 
         * > The name must be at least one byte long, not counting the null
         * > terminator. It cannot begin with a period (`0x2e`), nor contain
         * > control bytes (anything less than `0x20`), nor slash (`0x2f`), nor
         * > backslash (`0x5c`), i.e. no directory hierarchies.
         * 
         * As of Kaitai Struct 0.11, we cannot easily check whether a string
         * contains certain characters, so we only enforce that the file name is
         * not empty and that it doesn't start with a period.
         */
        public String fileName() { return fileName; }
        public CompressionAttachMethods compression() { return compression; }
        public byte[] dataPlain() { return dataPlain; }
        public byte[] dataZlib() { return dataZlib; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
        public byte[] _raw_dataZlib() { return _raw_dataZlib; }
    }

    /**
     * Background chunk stores default background color to display this
     * image against. Contents depend on `color_type` of the image.
     * @see <a href="https://www.w3.org/TR/png/#11bKGD">Source</a>
     */
    public static class BkgdChunk extends KaitaiStruct {
        public static BkgdChunk fromFile(String fileName) throws IOException {
            return new BkgdChunk(new ByteBufferKaitaiStream(fileName));
        }

        public BkgdChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BkgdChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public BkgdChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            {
                ColorType on = _root().ihdr().colorType();
                if (on != null) {
                    switch (_root().ihdr().colorType()) {
                    case GREYSCALE: {
                        this.bkgd = new BkgdGreyscale(this._io, this, _root);
                        break;
                    }
                    case GREYSCALE_ALPHA: {
                        this.bkgd = new BkgdGreyscale(this._io, this, _root);
                        break;
                    }
                    case INDEXED: {
                        this.bkgd = new BkgdIndexed(this._io, this, _root);
                        break;
                    }
                    case TRUECOLOR: {
                        this.bkgd = new BkgdTruecolor(this._io, this, _root);
                        break;
                    }
                    case TRUECOLOR_ALPHA: {
                        this.bkgd = new BkgdTruecolor(this._io, this, _root);
                        break;
                    }
                    }
                }
            }
        }

        public void _fetchInstances() {
            {
                ColorType on = _root().ihdr().colorType();
                if (on != null) {
                    switch (_root().ihdr().colorType()) {
                    case GREYSCALE: {
                        ((BkgdGreyscale) (this.bkgd))._fetchInstances();
                        break;
                    }
                    case GREYSCALE_ALPHA: {
                        ((BkgdGreyscale) (this.bkgd))._fetchInstances();
                        break;
                    }
                    case INDEXED: {
                        ((BkgdIndexed) (this.bkgd))._fetchInstances();
                        break;
                    }
                    case TRUECOLOR: {
                        ((BkgdTruecolor) (this.bkgd))._fetchInstances();
                        break;
                    }
                    case TRUECOLOR_ALPHA: {
                        ((BkgdTruecolor) (this.bkgd))._fetchInstances();
                        break;
                    }
                    }
                }
            }
        }
        private KaitaiStruct bkgd;
        private Png _root;
        private Png.Chunk _parent;
        public KaitaiStruct bkgd() { return bkgd; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * Background chunk for greyscale images.
     */
    public static class BkgdGreyscale extends KaitaiStruct {
        public static BkgdGreyscale fromFile(String fileName) throws IOException {
            return new BkgdGreyscale(new ByteBufferKaitaiStream(fileName));
        }

        public BkgdGreyscale(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BkgdGreyscale(KaitaiStream _io, Png.BkgdChunk _parent) {
            this(_io, _parent, null);
        }

        public BkgdGreyscale(KaitaiStream _io, Png.BkgdChunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.value = this._io.readU2be();
        }

        public void _fetchInstances() {
        }
        private int value;
        private Png _root;
        private Png.BkgdChunk _parent;
        public int value() { return value; }
        public Png _root() { return _root; }
        public Png.BkgdChunk _parent() { return _parent; }
    }

    /**
     * Background chunk for images with indexed palette.
     */
    public static class BkgdIndexed extends KaitaiStruct {
        public static BkgdIndexed fromFile(String fileName) throws IOException {
            return new BkgdIndexed(new ByteBufferKaitaiStream(fileName));
        }

        public BkgdIndexed(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BkgdIndexed(KaitaiStream _io, Png.BkgdChunk _parent) {
            this(_io, _parent, null);
        }

        public BkgdIndexed(KaitaiStream _io, Png.BkgdChunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.paletteIndex = this._io.readU1();
        }

        public void _fetchInstances() {
        }
        private int paletteIndex;
        private Png _root;
        private Png.BkgdChunk _parent;
        public int paletteIndex() { return paletteIndex; }
        public Png _root() { return _root; }
        public Png.BkgdChunk _parent() { return _parent; }
    }

    /**
     * Background chunk for truecolor images.
     */
    public static class BkgdTruecolor extends KaitaiStruct {
        public static BkgdTruecolor fromFile(String fileName) throws IOException {
            return new BkgdTruecolor(new ByteBufferKaitaiStream(fileName));
        }

        public BkgdTruecolor(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BkgdTruecolor(KaitaiStream _io, Png.BkgdChunk _parent) {
            this(_io, _parent, null);
        }

        public BkgdTruecolor(KaitaiStream _io, Png.BkgdChunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.red = this._io.readU2be();
            this.green = this._io.readU2be();
            this.blue = this._io.readU2be();
        }

        public void _fetchInstances() {
        }
        private int red;
        private int green;
        private int blue;
        private Png _root;
        private Png.BkgdChunk _parent;
        public int red() { return red; }
        public int green() { return green; }
        public int blue() { return blue; }
        public Png _root() { return _root; }
        public Png.BkgdChunk _parent() { return _parent; }
    }
    public static class ChrmChromaticity extends KaitaiStruct {
        public static ChrmChromaticity fromFile(String fileName) throws IOException {
            return new ChrmChromaticity(new ByteBufferKaitaiStream(fileName));
        }

        public ChrmChromaticity(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChrmChromaticity(KaitaiStream _io, Png.ChrmChunk _parent) {
            this(_io, _parent, null);
        }

        public ChrmChromaticity(KaitaiStream _io, Png.ChrmChunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.xInt = this._io.readU4be();
            this.yInt = this._io.readU4be();
        }

        public void _fetchInstances() {
        }
        private Double x;
        public Double x() {
            if (this.x != null)
                return this.x;
            this.x = ((Number) (xInt() / 100000.0)).doubleValue();
            return this.x;
        }
        private Double y;
        public Double y() {
            if (this.y != null)
                return this.y;
            this.y = ((Number) (yInt() / 100000.0)).doubleValue();
            return this.y;
        }
        private long xInt;
        private long yInt;
        private Png _root;
        private Png.ChrmChunk _parent;
        public long xInt() { return xInt; }
        public long yInt() { return yInt; }
        public Png _root() { return _root; }
        public Png.ChrmChunk _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#11cHRM">Source</a>
     */
    public static class ChrmChunk extends KaitaiStruct {
        public static ChrmChunk fromFile(String fileName) throws IOException {
            return new ChrmChunk(new ByteBufferKaitaiStream(fileName));
        }

        public ChrmChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChrmChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public ChrmChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.whitePoint = new ChrmChromaticity(this._io, this, _root);
            this.red = new ChrmChromaticity(this._io, this, _root);
            this.green = new ChrmChromaticity(this._io, this, _root);
            this.blue = new ChrmChromaticity(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.whitePoint._fetchInstances();
            this.red._fetchInstances();
            this.green._fetchInstances();
            this.blue._fetchInstances();
        }
        private ChrmChromaticity whitePoint;
        private ChrmChromaticity red;
        private ChrmChromaticity green;
        private ChrmChromaticity blue;
        private Png _root;
        private Png.Chunk _parent;
        public ChrmChromaticity whitePoint() { return whitePoint; }
        public ChrmChromaticity red() { return red; }
        public ChrmChromaticity green() { return green; }
        public ChrmChromaticity blue() { return blue; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }
    public static class Chunk extends KaitaiStruct {
        public static Chunk fromFile(String fileName) throws IOException {
            return new Chunk(new ByteBufferKaitaiStream(fileName));
        }

        public Chunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Chunk(KaitaiStream _io, Png _parent) {
            this(_io, _parent, null);
        }

        public Chunk(KaitaiStream _io, Png _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.len = this._io.readU4be();
            this.typeRaw = this._io.readBytes(4);
            {
                byte[] _it = this.typeRaw;
                if (!( (( (( (((_it[((int) 0)] & 0xff) >= 65) && ((_it[((int) 0)] & 0xff) <= 90)) ) || ( (((_it[((int) 0)] & 0xff) >= 97) && ((_it[((int) 0)] & 0xff) <= 122)) )) ) && ( (( (((_it[((int) 1)] & 0xff) >= 65) && ((_it[((int) 1)] & 0xff) <= 90)) ) || ( (((_it[((int) 1)] & 0xff) >= 97) && ((_it[((int) 1)] & 0xff) <= 122)) )) ) && ( (( (((_it[((int) 2)] & 0xff) >= 65) && ((_it[((int) 2)] & 0xff) <= 90)) ) || ( (((_it[((int) 2)] & 0xff) >= 97) && ((_it[((int) 2)] & 0xff) <= 122)) )) ) && ( (( (((_it[((int) 3)] & 0xff) >= 65) && ((_it[((int) 3)] & 0xff) <= 90)) ) || ( (((_it[((int) 3)] & 0xff) >= 97) && ((_it[((int) 3)] & 0xff) <= 122)) )) )) )) {
                    throw new KaitaiStream.ValidationExprError(this.typeRaw, this._io, "/types/chunk/seq/1");
                }
            }
            switch (type()) {
            case "PLTE": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new PlteChunk(_io_body, this, _root);
                break;
            }
            case "acTL": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new AnimationControlChunk(_io_body, this, _root);
                break;
            }
            case "atCh": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new AtchChunk(_io_body, this, _root);
                break;
            }
            case "bKGD": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new BkgdChunk(_io_body, this, _root);
                break;
            }
            case "cHRM": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new ChrmChunk(_io_body, this, _root);
                break;
            }
            case "cICP": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new CicpChunk(_io_body, this, _root);
                break;
            }
            case "cLLI": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new ClliChunk(_io_body, this, _root);
                break;
            }
            case "eXIf": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new ExifChunk(_io_body, this, _root);
                break;
            }
            case "fcTL": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new FrameControlChunk(_io_body, this, _root);
                break;
            }
            case "fdAT": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new FrameDataChunk(_io_body, this, _root);
                break;
            }
            case "gAMA": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new GamaChunk(_io_body, this, _root);
                break;
            }
            case "hIST": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new HistChunk(_io_body, this, _root);
                break;
            }
            case "iCCP": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new IccpChunk(_io_body, this, _root);
                break;
            }
            case "iTXt": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new InternationalTextChunk(_io_body, this, _root);
                break;
            }
            case "mDCV": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new MdcvChunk(_io_body, this, _root);
                break;
            }
            case "mkBS": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new AdobeFireworksChunk(_io_body, this, _root);
                break;
            }
            case "mkTS": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new AdobeFireworksChunk(_io_body, this, _root);
                break;
            }
            case "pHYs": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new PhysChunk(_io_body, this, _root);
                break;
            }
            case "prVW": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new AdobeFireworksChunk(_io_body, this, _root);
                break;
            }
            case "sBIT": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new SbitChunk(_io_body, this, _root);
                break;
            }
            case "sPLT": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new SpltChunk(_io_body, this, _root);
                break;
            }
            case "sRGB": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new SrgbChunk(_io_body, this, _root);
                break;
            }
            case "skMf": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new EvernoteSkmfChunk(_io_body, this, _root);
                break;
            }
            case "skRf": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new EvernoteSkrfChunk(_io_body, this, _root);
                break;
            }
            case "tEXt": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new TextChunk(_io_body, this, _root);
                break;
            }
            case "tIME": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new TimeChunk(_io_body, this, _root);
                break;
            }
            case "tRNS": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new TrnsChunk(_io_body, this, _root);
                break;
            }
            case "zTXt": {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new CompressedTextChunk(_io_body, this, _root);
                break;
            }
            default: {
                this.body = this._io.readBytes(len());
                break;
            }
            }
            this.crc = this._io.readU4be();
        }

        public void _fetchInstances() {
            switch (type()) {
            case "PLTE": {
                ((PlteChunk) (this.body))._fetchInstances();
                break;
            }
            case "acTL": {
                ((AnimationControlChunk) (this.body))._fetchInstances();
                break;
            }
            case "atCh": {
                ((AtchChunk) (this.body))._fetchInstances();
                break;
            }
            case "bKGD": {
                ((BkgdChunk) (this.body))._fetchInstances();
                break;
            }
            case "cHRM": {
                ((ChrmChunk) (this.body))._fetchInstances();
                break;
            }
            case "cICP": {
                ((CicpChunk) (this.body))._fetchInstances();
                break;
            }
            case "cLLI": {
                ((ClliChunk) (this.body))._fetchInstances();
                break;
            }
            case "eXIf": {
                ((ExifChunk) (this.body))._fetchInstances();
                break;
            }
            case "fcTL": {
                ((FrameControlChunk) (this.body))._fetchInstances();
                break;
            }
            case "fdAT": {
                ((FrameDataChunk) (this.body))._fetchInstances();
                break;
            }
            case "gAMA": {
                ((GamaChunk) (this.body))._fetchInstances();
                break;
            }
            case "hIST": {
                ((HistChunk) (this.body))._fetchInstances();
                break;
            }
            case "iCCP": {
                ((IccpChunk) (this.body))._fetchInstances();
                break;
            }
            case "iTXt": {
                ((InternationalTextChunk) (this.body))._fetchInstances();
                break;
            }
            case "mDCV": {
                ((MdcvChunk) (this.body))._fetchInstances();
                break;
            }
            case "mkBS": {
                ((AdobeFireworksChunk) (this.body))._fetchInstances();
                break;
            }
            case "mkTS": {
                ((AdobeFireworksChunk) (this.body))._fetchInstances();
                break;
            }
            case "pHYs": {
                ((PhysChunk) (this.body))._fetchInstances();
                break;
            }
            case "prVW": {
                ((AdobeFireworksChunk) (this.body))._fetchInstances();
                break;
            }
            case "sBIT": {
                ((SbitChunk) (this.body))._fetchInstances();
                break;
            }
            case "sPLT": {
                ((SpltChunk) (this.body))._fetchInstances();
                break;
            }
            case "sRGB": {
                ((SrgbChunk) (this.body))._fetchInstances();
                break;
            }
            case "skMf": {
                ((EvernoteSkmfChunk) (this.body))._fetchInstances();
                break;
            }
            case "skRf": {
                ((EvernoteSkrfChunk) (this.body))._fetchInstances();
                break;
            }
            case "tEXt": {
                ((TextChunk) (this.body))._fetchInstances();
                break;
            }
            case "tIME": {
                ((TimeChunk) (this.body))._fetchInstances();
                break;
            }
            case "tRNS": {
                ((TrnsChunk) (this.body))._fetchInstances();
                break;
            }
            case "zTXt": {
                ((CompressedTextChunk) (this.body))._fetchInstances();
                break;
            }
            default: {
                break;
            }
            }
        }
        private Boolean isAncillary;

        /**
         * false = critical chunk, true = ancillary chunk
         */
        public Boolean isAncillary() {
            if (this.isAncillary != null)
                return this.isAncillary;
            this.isAncillary = ((typeRaw()[((int) 0)] & 0xff) & 32) != 0;
            return this.isAncillary;
        }
        private Boolean isPrivate;

        /**
         * false = public chunk (defined by the W3C), true = private chunk (can
         * be defined by anyone)
         */
        public Boolean isPrivate() {
            if (this.isPrivate != null)
                return this.isPrivate;
            this.isPrivate = ((typeRaw()[((int) 1)] & 0xff) & 32) != 0;
            return this.isPrivate;
        }
        private Boolean isSafeToCopy;

        /**
         * Defines whether the chunk may be copied if the image data (i.e.
         * pixels) is modified. This tells PNG editors how to handle unknown
         * chunks - see section [14.2 Behavior of PNG
         * editors](https://www.w3.org/TR/2025/REC-png-3-20250624/#14Ordering) in
         * the official specification.
         */
        public Boolean isSafeToCopy() {
            if (this.isSafeToCopy != null)
                return this.isSafeToCopy;
            this.isSafeToCopy = ((typeRaw()[((int) 3)] & 0xff) & 32) != 0;
            return this.isSafeToCopy;
        }
        private Boolean reservedBit;

        /**
         * Should be `false`, i.e. all chunk types should have uppercase third
         * letters (the lowercase third letter is reserved for possible future
         * extensions to the PNG standard)
         */
        public Boolean reservedBit() {
            if (this.reservedBit != null)
                return this.reservedBit;
            this.reservedBit = ((typeRaw()[((int) 2)] & 0xff) & 32) != 0;
            return this.reservedBit;
        }
        private String type;
        public String type() {
            if (this.type != null)
                return this.type;
            this.type = new String(typeRaw(), StandardCharsets.US_ASCII);
            return this.type;
        }
        private long len;
        private byte[] typeRaw;
        private Object body;
        private long crc;
        private Png _root;
        private Png _parent;
        public long len() { return len; }

        /**
         * Each byte of a chunk type is restricted to the hexadecimal values
         * 0x41..0x5a and 0x61..0x7a, i.e. uppercase and lowercase ASCII letters
         * (`A-Z` and `a-z`).
         * @see <a href="https://www.w3.org/TR/2025/REC-png-3-20250624/#table51">Source</a>
         */
        public byte[] typeRaw() { return typeRaw; }
        public Object body() { return body; }
        public long crc() { return crc; }
        public Png _root() { return _root; }
        public Png _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#cICP-chunk">Source</a>
     * @see <a href="https://w3c.github.io/png/Implementation_Report_3e/#cicp">Source</a>
     */
    public static class CicpChunk extends KaitaiStruct {
        public static CicpChunk fromFile(String fileName) throws IOException {
            return new CicpChunk(new ByteBufferKaitaiStream(fileName));
        }

        public CicpChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CicpChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public CicpChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.colorPrimaries = this._io.readU1();
            this.transferFunction = this._io.readU1();
            this.matrixCoefficients = this._io.readU1();
            if (!(this.matrixCoefficients == 0)) {
                throw new KaitaiStream.ValidationNotEqualError(0, this.matrixCoefficients, this._io, "/types/cicp_chunk/seq/2");
            }
            this.videoFullRangeFlag = this._io.readU1();
            if (!( ((this.videoFullRangeFlag == 0) || (this.videoFullRangeFlag == 1)) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(this.videoFullRangeFlag, this._io, "/types/cicp_chunk/seq/3");
            }
        }

        public void _fetchInstances() {
        }
        private int colorPrimaries;
        private int transferFunction;
        private int matrixCoefficients;
        private int videoFullRangeFlag;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * values above 22 are reserved, see
         * <https://github.com/pnggroup/pngcheck/blob/bd33ad6490269df07cac81e5305f4ebf56c2b637/pngcheck.c#L3322-L3325>
         */
        public int colorPrimaries() { return colorPrimaries; }

        /**
         * values above 18 are reserved, see
         * <https://github.com/pnggroup/pngcheck/blob/bd33ad6490269df07cac81e5305f4ebf56c2b637/pngcheck.c#L3326-L3329>
         */
        public int transferFunction() { return transferFunction; }

        /**
         * From the [official
         * specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#cICP-chunk):
         * 
         * > RGB is currently the only supported color model in PNG, and as such
         * > `Matrix Coefficients` shall be set to `0`.
         */
        public int matrixCoefficients() { return matrixCoefficients; }

        /**
         * From the [official
         * specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#cICP-chunk):
         * 
         * > If `Video Full Range Flag` value is `1`, then the image is a
         * > full-range image. Typically, images in the RGB color representation
         * > are stored in the full-range signal quantization, therefore the vast
         * > majority of computer graphics and web images, including those used
         * > in traditional PNG workflows, are full-range images.
         * 
         * > If `Video Full Range Flag` value is `0`, then the image is a
         * > narrow-range image.
         */
        public int videoFullRangeFlag() { return videoFullRangeFlag; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#cLLI-chunk">Source</a>
     * @see <a href="https://w3c.github.io/png/Implementation_Report_3e/#light">Source</a>
     */
    public static class ClliChunk extends KaitaiStruct {
        public static ClliChunk fromFile(String fileName) throws IOException {
            return new ClliChunk(new ByteBufferKaitaiStream(fileName));
        }

        public ClliChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ClliChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public ClliChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.maxContentLightLevelInt = this._io.readU4be();
            this.maxFrameAverageLightLevelInt = this._io.readU4be();
        }

        public void _fetchInstances() {
        }
        private Double maxContentLightLevel;

        /**
         * Maximum Content Light Level (MaxCLL), in cd/m^2
         */
        public Double maxContentLightLevel() {
            if (this.maxContentLightLevel != null)
                return this.maxContentLightLevel;
            this.maxContentLightLevel = ((Number) (maxContentLightLevelInt() * 0.0001)).doubleValue();
            return this.maxContentLightLevel;
        }
        private Double maxFrameAverageLightLevel;

        /**
         * Maximum Frame Average Light Level (MaxFALL), in cd/m^2
         */
        public Double maxFrameAverageLightLevel() {
            if (this.maxFrameAverageLightLevel != null)
                return this.maxFrameAverageLightLevel;
            this.maxFrameAverageLightLevel = ((Number) (maxFrameAverageLightLevelInt() * 0.0001)).doubleValue();
            return this.maxFrameAverageLightLevel;
        }
        private long maxContentLightLevelInt;
        private long maxFrameAverageLightLevelInt;
        private Png _root;
        private Png.Chunk _parent;
        public long maxContentLightLevelInt() { return maxContentLightLevelInt; }
        public long maxFrameAverageLightLevelInt() { return maxFrameAverageLightLevelInt; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }
    public static class CompressedText extends KaitaiStruct {
        public static CompressedText fromFile(String fileName) throws IOException {
            return new CompressedText(new ByteBufferKaitaiStream(fileName));
        }

        public CompressedText(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CompressedText(KaitaiStream _io, Png.CompressedTextChunk _parent) {
            this(_io, _parent, null);
        }

        public CompressedText(KaitaiStream _io, Png.CompressedTextChunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.value = new String(this._io.readBytesFull(), StandardCharsets.ISO_8859_1);
        }

        public void _fetchInstances() {
        }
        private String value;
        private Png _root;
        private Png.CompressedTextChunk _parent;

        /**
         * Text string (the "value" of this key-value pair).
         * 
         * Although it is not null-terminated (unlike the keyword), it must not
         * contain a zero byte (U+0000 NULL character). A newline should be
         * represented by a single U+000A LINE FEED (LF) character (aka `\n`).
         * The remaining control characters (U+0001..U+0009, U+000B..0+001F,
         * U+007F..U+009F) are discouraged.
         */
        public String value() { return value; }
        public Png _root() { return _root; }
        public Png.CompressedTextChunk _parent() { return _parent; }
    }

    /**
     * Compressed textual data (`zTXt`) chunk effectively allows you to store
     * key-value string pairs in the PNG container, compressing the "value" part
     * (which can be quite lengthy) with zlib compression.
     * 
     * The `zTXt` and `tEXt` chunks are semantically equivalent, but the `zTXt`
     * chunk is recommended for storing large blocks of text.
     * @see <a href="https://www.w3.org/TR/png/#11zTXt">Source</a>
     */
    public static class CompressedTextChunk extends KaitaiStruct {
        public static CompressedTextChunk fromFile(String fileName) throws IOException {
            return new CompressedTextChunk(new ByteBufferKaitaiStream(fileName));
        }

        public CompressedTextChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CompressedTextChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public CompressedTextChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.keyword = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.ISO_8859_1);
            this.compressionMethod = Png.CompressionMethods.byId(this._io.readU1());
            if (!(this.compressionMethod == Png.CompressionMethods.ZLIB)) {
                throw new KaitaiStream.ValidationNotEqualError(Png.CompressionMethods.ZLIB, this.compressionMethod, this._io, "/types/compressed_text_chunk/seq/1");
            }
            this._raw__raw_text = this._io.readBytesFull();
            this._raw_text = KaitaiStream.processZlib(this._raw__raw_text);
            KaitaiStream _io__raw_text = new ByteBufferKaitaiStream(this._raw_text);
            this.text = new CompressedText(_io__raw_text, this, _root);
        }

        public void _fetchInstances() {
            this.text._fetchInstances();
        }
        private String keyword;
        private CompressionMethods compressionMethod;
        private CompressedText text;
        private Png _root;
        private Png.Chunk _parent;
        private byte[] _raw_text;
        private byte[] _raw__raw_text;

        /**
         * Indicates the type of information represented by the text string.
         * 
         * Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
         * characters and spaces; that is, only code points 0x20-0x7E and
         * 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
         * keyword, leading spaces, trailing spaces, and consecutive spaces are
         * not permitted.
         * @see <a href="https://www.w3.org/TR/2025/REC-png-3-20250624/#11keywords">Source</a>
         */
        public String keyword() { return keyword; }
        public CompressionMethods compressionMethod() { return compressionMethod; }
        public CompressedText text() { return text; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
        public byte[] _raw_text() { return _raw_text; }
        public byte[] _raw__raw_text() { return _raw__raw_text; }
    }

    /**
     * @see <a href="https://web.archive.org/web/20210302212148/https://discussion.evernote.com/forums/topic/88532-how-to-extract-annotation-information-from-annotated-evernoteskitch-images/#comment-451501">Source</a>
     */
    public static class EvernoteSkmfChunk extends KaitaiStruct {
        public static EvernoteSkmfChunk fromFile(String fileName) throws IOException {
            return new EvernoteSkmfChunk(new ByteBufferKaitaiStream(fileName));
        }

        public EvernoteSkmfChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EvernoteSkmfChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public EvernoteSkmfChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.json = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
        }
        private String json;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * JSON document with information about editable annotations (text,
         * lines, paths, etc.) in Evernote/Skitch.
         * 
         * It refers to the original image stored in the `skRf` chunk (which
         * usually follows immediately after `skMf`) via the
         * `.children[0].children[0].uri` JSON property. This has the format
         * `"skitch+uuid:///$UUID"`, where `$UUID` is a random UUIDv4 value that
         * matches the `uuid` field in `evernote_skrf_chunk` (i.e. in the first
         * 16 bytes of the `skRf` chunk).
         */
        public String json() { return json; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * @see <a href="https://web.archive.org/web/20210302212148/https://discussion.evernote.com/forums/topic/88532-how-to-extract-annotation-information-from-annotated-evernoteskitch-images/#comment-451501">Source</a>
     */
    public static class EvernoteSkrfChunk extends KaitaiStruct {
        public static EvernoteSkrfChunk fromFile(String fileName) throws IOException {
            return new EvernoteSkrfChunk(new ByteBufferKaitaiStream(fileName));
        }

        public EvernoteSkrfChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EvernoteSkrfChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public EvernoteSkrfChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.uuid = this._io.readBytes(16);
            this.origImg = this._io.readBytesFull();
        }

        public void _fetchInstances() {
        }
        private byte[] uuid;
        private byte[] origImg;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * Random UUIDv4 value used to identify the image. It is referenced by
         * the `skMf` chunk - see the documentation for the `json` field in
         * `evernote_skmf_chunk`.
         */
        public byte[] uuid() { return uuid; }

        /**
         * The original source image without annotations. It's usually a PNG
         * image as well, but it can also be a JPEG or possibly other formats.
         */
        public byte[] origImg() { return origImg; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * Exchangeable Image File (Exif) Profile (`eXIf`) chunk.
     * 
     * Only one `eXIf` chunk is allowed in a PNG datastream.
     * 
     * The `eXIf` chunk contains metadata concerning the original image data. If
     * the image has been edited subsequent to creation of the Exif profile, this
     * data might no longer apply to the PNG image data.
     * @see <a href="https://www.w3.org/TR/png/#eXIf">Source</a>
     */
    public static class ExifChunk extends KaitaiStruct {
        public static ExifChunk fromFile(String fileName) throws IOException {
            return new ExifChunk(new ByteBufferKaitaiStream(fileName));
        }

        public ExifChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ExifChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public ExifChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.exif = new Exif(this._io);
        }

        public void _fetchInstances() {
            this.exif._fetchInstances();
        }
        private Exif exif;
        private Png _root;
        private Png.Chunk _parent;
        public Exif exif() { return exif; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#fcTL-chunk">Source</a>
     */
    public static class FrameControlChunk extends KaitaiStruct {
        public static FrameControlChunk fromFile(String fileName) throws IOException {
            return new FrameControlChunk(new ByteBufferKaitaiStream(fileName));
        }

        public FrameControlChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FrameControlChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public FrameControlChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.sequenceNumber = this._io.readU4be();
            this.width = this._io.readU4be();
            if (!(this.width >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.width, this._io, "/types/frame_control_chunk/seq/1");
            }
            if (!(this.width <= _root().ihdr().width())) {
                throw new KaitaiStream.ValidationGreaterThanError(_root().ihdr().width(), this.width, this._io, "/types/frame_control_chunk/seq/1");
            }
            this.height = this._io.readU4be();
            if (!(this.height >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.height, this._io, "/types/frame_control_chunk/seq/2");
            }
            if (!(this.height <= _root().ihdr().height())) {
                throw new KaitaiStream.ValidationGreaterThanError(_root().ihdr().height(), this.height, this._io, "/types/frame_control_chunk/seq/2");
            }
            this.xOffset = this._io.readU4be();
            if (!(this.xOffset <= _root().ihdr().width() - width())) {
                throw new KaitaiStream.ValidationGreaterThanError(_root().ihdr().width() - width(), this.xOffset, this._io, "/types/frame_control_chunk/seq/3");
            }
            this.yOffset = this._io.readU4be();
            if (!(this.yOffset <= _root().ihdr().height() - height())) {
                throw new KaitaiStream.ValidationGreaterThanError(_root().ihdr().height() - height(), this.yOffset, this._io, "/types/frame_control_chunk/seq/4");
            }
            this.delayNum = this._io.readU2be();
            this.delayDen = this._io.readU2be();
            this.disposeOp = Png.DisposeOpValues.byId(this._io.readU1());
            if (this.disposeOp == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.disposeOp, this._io, "/types/frame_control_chunk/seq/7");
            }
            this.blendOp = Png.BlendOpValues.byId(this._io.readU1());
            if (this.blendOp == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.blendOp, this._io, "/types/frame_control_chunk/seq/8");
            }
        }

        public void _fetchInstances() {
        }
        private Double delay;

        /**
         * Time to display this frame, in seconds
         */
        public Double delay() {
            if (this.delay != null)
                return this.delay;
            this.delay = ((Number) (delayNum() / (delayDen() == 0 ? 100.0 : delayDen()))).doubleValue();
            return this.delay;
        }
        private long sequenceNumber;
        private long width;
        private long height;
        private long xOffset;
        private long yOffset;
        private int delayNum;
        private int delayDen;
        private DisposeOpValues disposeOp;
        private BlendOpValues blendOp;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * Sequence number of the animation chunk, starting from 0.
         * 
         * The `fcTL` and `fdAT` chunks have a 4-byte sequence number. Both chunk
         * types share the sequence. The purpose of this number is to detect (and
         * optionally correct) sequence errors in an Animated PNG, since the PNG
         * specification does not impose ordering restrictions on ancillary
         * chunks (which means that a PNG editor is technically allowed to
         * reorder them arbitrarily, see [14.2 Behavior of PNG
         * editors](https://www.w3.org/TR/png/#14Ordering) in the spec).
         * 
         * The first `fcTL` chunk must contain sequence number 0, and the
         * sequence numbers in the remaining `fcTL` and `fdAT` chunks must be in
         * ascending order, with no gaps or duplicates.
         */
        public long sequenceNumber() { return sequenceNumber; }

        /**
         * Width of the following frame
         */
        public long width() { return width; }

        /**
         * Height of the following frame
         */
        public long height() { return height; }

        /**
         * X position at which to render the following frame
         */
        public long xOffset() { return xOffset; }

        /**
         * Y position at which to render the following frame
         */
        public long yOffset() { return yOffset; }

        /**
         * Frame delay fraction numerator
         */
        public int delayNum() { return delayNum; }

        /**
         * Frame delay fraction denominator
         */
        public int delayDen() { return delayDen; }

        /**
         * Type of frame area disposal to be done after rendering this frame
         */
        public DisposeOpValues disposeOp() { return disposeOp; }

        /**
         * Type of frame area rendering for this frame
         */
        public BlendOpValues blendOp() { return blendOp; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#fdAT-chunk">Source</a>
     */
    public static class FrameDataChunk extends KaitaiStruct {
        public static FrameDataChunk fromFile(String fileName) throws IOException {
            return new FrameDataChunk(new ByteBufferKaitaiStream(fileName));
        }

        public FrameDataChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FrameDataChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public FrameDataChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.sequenceNumber = this._io.readU4be();
            this.frameData = this._io.readBytesFull();
        }

        public void _fetchInstances() {
        }
        private long sequenceNumber;
        private byte[] frameData;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * Sequence number of the animation chunk, starting from 0.
         * 
         * The `fcTL` and `fdAT` chunks have a 4-byte sequence number. Both chunk
         * types share the sequence. The purpose of this number is to detect (and
         * optionally correct) sequence errors in an Animated PNG, since the PNG
         * specification does not impose ordering restrictions on ancillary
         * chunks (which means that a PNG editor is technically allowed to
         * reorder them arbitrarily, see [14.2 Behavior of PNG
         * editors](https://www.w3.org/TR/png/#14Ordering) in the spec).
         * 
         * The first `fcTL` chunk must contain sequence number 0, and the
         * sequence numbers in the remaining `fcTL` and `fdAT` chunks must be in
         * ascending order, with no gaps or duplicates.
         */
        public long sequenceNumber() { return sequenceNumber; }

        /**
         * Frame data for the frame. At least one `fdAT` chunk is required for
         * each frame, except for the first frame, if that frame is represented
         * by an `IDAT` chunk. The compressed datastream for each frame is the
         * concatenation of the contents of the data fields of all the `fdAT`
         * chunks within a frame.
         */
        public byte[] frameData() { return frameData; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#11gAMA">Source</a>
     */
    public static class GamaChunk extends KaitaiStruct {
        public static GamaChunk fromFile(String fileName) throws IOException {
            return new GamaChunk(new ByteBufferKaitaiStream(fileName));
        }

        public GamaChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public GamaChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public GamaChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.gammaInt = this._io.readU4be();
            {
                long _it = this.gammaInt;
                if (!(_it != 0)) {
                    throw new KaitaiStream.ValidationExprError(this.gammaInt, this._io, "/types/gama_chunk/seq/0");
                }
            }
        }

        public void _fetchInstances() {
        }
        private Double gamma;

        /**
         * Image gamma, typically 0.45455 = 1/2.2
         */
        public Double gamma() {
            if (this.gamma != null)
                return this.gamma;
            this.gamma = ((Number) (gammaInt() / 100000.0)).doubleValue();
            return this.gamma;
        }
        private Double invGamma;

        /**
         * Inverse of the image gamma (1 / gamma), typically 2.2 (not considering
         * rounding)
         */
        public Double invGamma() {
            if (this.invGamma != null)
                return this.invGamma;
            this.invGamma = ((Number) (100000.0 / gammaInt())).doubleValue();
            return this.invGamma;
        }
        private long gammaInt;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * Image gamma multiplied by 100000 (a gamma value of 1/2.2 is stored as
         * 45455)
         */
        public long gammaInt() { return gammaInt; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * Image histogram (`hIST`) chunk gives the approximate usage frequency of
     * each color in the palette. A histogram chunk can appear only when a `PLTE`
     * chunk appears.
     * @see <a href="https://www.w3.org/TR/png/#11hIST">Source</a>
     */
    public static class HistChunk extends KaitaiStruct {
        public static HistChunk fromFile(String fileName) throws IOException {
            return new HistChunk(new ByteBufferKaitaiStream(fileName));
        }

        public HistChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HistChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public HistChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.usageFreqs = new ArrayList<Integer>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.usageFreqs.add(this._io.readU2be());
                    i++;
                }
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.usageFreqs.size(); i++) {
            }
        }
        private List<Integer> usageFreqs;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * Usage frequencies of each color in the palette.
         * 
         * There must be exactly one entry for each entry in the `PLTE` chunk. Each
         * entry is proportional to the fraction of pixels in the image that have
         * that palette index; the exact scale factor is chosen by the encoder.
         * 
         * Histogram entries are approximate, with the exception that a zero
         * entry specifies that the corresponding palette entry is not used at
         * all in the image. A histogram entry must be nonzero if there are any
         * pixels of that color.
         */
        public List<Integer> usageFreqs() { return usageFreqs; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * Embedded ICC profile (`iCCP`) chunk.
     * 
     * If the `iCCP` chunk is present, the image samples conform to the color
     * space represented by the embedded ICC profile as defined by the
     * International Color Consortium.
     * 
     * This chunk is ignored unless it is the [highest-precedence color
     * chunk](https://www.w3.org/TR/png/#color-chunk-precendence) understood by
     * the decoder. Unless a `cICP` chunk exists, a PNG datastream should contain
     * at most one embedded profile, whether specified explicitly with an `iCCP`
     * or implicitly with an `sRGB` chunk.
     * 
     * It is recommended that the `sRGB` and `iCCP` chunks do not appear
     * simultaneously in a PNG datastream.
     * @see <a href="https://www.w3.org/TR/png/#11iCCP">Source</a>
     */
    public static class IccpChunk extends KaitaiStruct {
        public static IccpChunk fromFile(String fileName) throws IOException {
            return new IccpChunk(new ByteBufferKaitaiStream(fileName));
        }

        public IccpChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IccpChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public IccpChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.profileName = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.ISO_8859_1);
            this.compressionMethod = Png.CompressionMethods.byId(this._io.readU1());
            if (!(this.compressionMethod == Png.CompressionMethods.ZLIB)) {
                throw new KaitaiStream.ValidationNotEqualError(Png.CompressionMethods.ZLIB, this.compressionMethod, this._io, "/types/iccp_chunk/seq/1");
            }
            this._raw__raw_profile = this._io.readBytesFull();
            this._raw_profile = KaitaiStream.processZlib(this._raw__raw_profile);
            KaitaiStream _io__raw_profile = new ByteBufferKaitaiStream(this._raw_profile);
            this.profile = new Icc4(_io__raw_profile);
        }

        public void _fetchInstances() {
            this.profile._fetchInstances();
        }
        private String profileName;
        private CompressionMethods compressionMethod;
        private Icc4 profile;
        private Png _root;
        private Png.Chunk _parent;
        private byte[] _raw_profile;
        private byte[] _raw__raw_profile;

        /**
         * Any convenient name for referring to the profile. It is
         * case-sensitive.
         * 
         * Profile names must contain only printable ISO-8859-1 (Latin-1)
         * characters and spaces; that is, only code points 0x20-0x7E and
         * 0xA1-0xFF are allowed. Leading, trailing, and consecutive spaces are
         * not permitted.
         */
        public String profileName() { return profileName; }
        public CompressionMethods compressionMethod() { return compressionMethod; }

        /**
         * Embedded ICC profile.
         * 
         * The color space of the ICC profile must be:
         * 
         * * an RGB color space for color images (color types
         *   `color_type::truecolor` = 2, `color_type::indexed` = 3, and
         *   `color_type::truecolor_alpha` = 6), or
         * * a greyscale color space for greyscale images (color types
         *   `color_type::greyscale` = 0 and `color_type::greyscale_alpha` = 4).
         * 
         * Note that the imported `icc_4.ksy` spec currently in use here supports
         * only the ICC.1 v4 specification (as the name suggests), not ICC.1 v2.
         * This means that PNG files with an embedded v2 profile (for example
         * https://github.com/web-platform-tests/wpt/blob/495d9d7716298588ff49d6e701bf27c5134bde06/css/css-color/support/swap-990000-iCCP.png)
         * will fail to parse.
         * 
         * TODO: extend `icc_4.ksy` to support both v4 and v2 profiles, rename it
         * to `icc.ksy`, and use it here.
         */
        public Icc4 profile() { return profile; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
        public byte[] _raw_profile() { return _raw_profile; }
        public byte[] _raw__raw_profile() { return _raw__raw_profile; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#11IHDR">Source</a>
     */
    public static class IhdrChunk extends KaitaiStruct {
        public static IhdrChunk fromFile(String fileName) throws IOException {
            return new IhdrChunk(new ByteBufferKaitaiStream(fileName));
        }

        public IhdrChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IhdrChunk(KaitaiStream _io, Png _parent) {
            this(_io, _parent, null);
        }

        public IhdrChunk(KaitaiStream _io, Png _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.width = this._io.readU4be();
            if (!(this.width >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.width, this._io, "/types/ihdr_chunk/seq/0");
            }
            this.height = this._io.readU4be();
            if (!(this.height >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.height, this._io, "/types/ihdr_chunk/seq/1");
            }
            this.bitDepth = this._io.readU1();
            if (!( ((this.bitDepth == 1) || (this.bitDepth == 2) || (this.bitDepth == 4) || (this.bitDepth == 8) || (this.bitDepth == 16)) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(this.bitDepth, this._io, "/types/ihdr_chunk/seq/2");
            }
            this.colorType = Png.ColorType.byId(this._io.readU1());
            if (this.colorType == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.colorType, this._io, "/types/ihdr_chunk/seq/3");
            }
            this.compressionMethod = Png.CompressionMethods.byId(this._io.readU1());
            if (this.compressionMethod == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.compressionMethod, this._io, "/types/ihdr_chunk/seq/4");
            }
            this.filterMethod = Png.FilterMethod.byId(this._io.readU1());
            if (this.filterMethod == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.filterMethod, this._io, "/types/ihdr_chunk/seq/5");
            }
            this.interlaceMethod = Png.InterlaceMethod.byId(this._io.readU1());
            if (this.interlaceMethod == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.interlaceMethod, this._io, "/types/ihdr_chunk/seq/6");
            }
        }

        public void _fetchInstances() {
        }
        private long width;
        private long height;
        private int bitDepth;
        private ColorType colorType;
        private CompressionMethods compressionMethod;
        private FilterMethod filterMethod;
        private InterlaceMethod interlaceMethod;
        private Png _root;
        private Png _parent;
        public long width() { return width; }
        public long height() { return height; }
        public int bitDepth() { return bitDepth; }
        public ColorType colorType() { return colorType; }
        public CompressionMethods compressionMethod() { return compressionMethod; }
        public FilterMethod filterMethod() { return filterMethod; }
        public InterlaceMethod interlaceMethod() { return interlaceMethod; }
        public Png _root() { return _root; }
        public Png _parent() { return _parent; }
    }
    public static class InternationalText extends KaitaiStruct {
        public static InternationalText fromFile(String fileName) throws IOException {
            return new InternationalText(new ByteBufferKaitaiStream(fileName));
        }

        public InternationalText(KaitaiStream _io) {
            this(_io, null, null);
        }

        public InternationalText(KaitaiStream _io, Png.InternationalTextChunk _parent) {
            this(_io, _parent, null);
        }

        public InternationalText(KaitaiStream _io, Png.InternationalTextChunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.value = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
        }
        private String value;
        private Png _root;
        private Png.InternationalTextChunk _parent;

        /**
         * Text string (the "value" of this key-value pair), written in language
         * specified in `_parent.language_tag`.
         * 
         * Although it is not null-terminated (unlike other textual data in the
         * `iTXt` chunk), it must not contain a zero byte
         * (U+0000 NULL character). A newline should be represented by a single
         * U+000A LINE FEED (LF) character (aka `\n`). The remaining control
         * characters (U+0001..U+0009, U+000B..0+001F, U+007F..U+009F) are
         * discouraged.
         */
        public String value() { return value; }
        public Png _root() { return _root; }
        public Png.InternationalTextChunk _parent() { return _parent; }
    }

    /**
     * International textual data (`iTXt`) chunk effectively allows you to store
     * key-value string pairs in the PNG container.
     * 
     * The "key" part (`keyword`) is restricted to printable ISO-8859-1 (Latin-1)
     * characters and spaces. The translated keyword and the "value" part
     * (`text`) are stored in UTF-8 and thus can store text in any language -
     * this language can be indicated via the language tag (`language_tag`).
     * @see <a href="https://www.w3.org/TR/png/#11iTXt">Source</a>
     */
    public static class InternationalTextChunk extends KaitaiStruct {
        public static InternationalTextChunk fromFile(String fileName) throws IOException {
            return new InternationalTextChunk(new ByteBufferKaitaiStream(fileName));
        }

        public InternationalTextChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public InternationalTextChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public InternationalTextChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.keyword = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.ISO_8859_1);
            this.compressionFlag = this._io.readU1();
            if (!( ((this.compressionFlag == 0) || (this.compressionFlag == 1)) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(this.compressionFlag, this._io, "/types/international_text_chunk/seq/1");
            }
            this.compressionMethod = Png.CompressionMethods.byId(this._io.readU1());
            if (!(this.compressionMethod == (compressionFlag() == 1 ? Png.CompressionMethods.ZLIB : compressionMethod()))) {
                throw new KaitaiStream.ValidationNotEqualError((compressionFlag() == 1 ? Png.CompressionMethods.ZLIB : compressionMethod()), this.compressionMethod, this._io, "/types/international_text_chunk/seq/2");
            }
            this.languageTag = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
            this.translatedKeyword = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
            if (compressionFlag() == 0) {
                this._raw_textPlain = this._io.readBytesFull();
                KaitaiStream _io__raw_textPlain = new ByteBufferKaitaiStream(this._raw_textPlain);
                this.textPlain = new InternationalText(_io__raw_textPlain, this, _root);
            }
            if (compressionFlag() == 1) {
                this._raw__raw_textZlib = this._io.readBytesFull();
                this._raw_textZlib = KaitaiStream.processZlib(this._raw__raw_textZlib);
                KaitaiStream _io__raw_textZlib = new ByteBufferKaitaiStream(this._raw_textZlib);
                this.textZlib = new InternationalText(_io__raw_textZlib, this, _root);
            }
        }

        public void _fetchInstances() {
            if (compressionFlag() == 0) {
                this.textPlain._fetchInstances();
            }
            if (compressionFlag() == 1) {
                this.textZlib._fetchInstances();
            }
        }
        private String text;

        /**
         * Text string (the "value" of this key-value pair), written in language
         * specified in `language_tag`.
         * 
         * Although it is not null-terminated (unlike other textual data in the
         * `iTXt` chunk), it must not contain a zero byte
         * (U+0000 NULL character). A newline should be represented by a single
         * U+000A LINE FEED (LF) character (aka `\n`). The remaining control
         * characters (U+0001..U+0009, U+000B..0+001F, U+007F..U+009F) are
         * discouraged.
         */
        public String text() {
            if (this.text != null)
                return this.text;
            this.text = (compressionFlag() == 0 ? textPlain() : textZlib()).value();
            return this.text;
        }
        private String keyword;
        private int compressionFlag;
        private CompressionMethods compressionMethod;
        private String languageTag;
        private String translatedKeyword;
        private InternationalText textPlain;
        private InternationalText textZlib;
        private Png _root;
        private Png.Chunk _parent;
        private byte[] _raw_textPlain;
        private byte[] _raw_textZlib;
        private byte[] _raw__raw_textZlib;

        /**
         * Indicates the type of information represented by the text string.
         * 
         * Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
         * characters and spaces; that is, only code points 0x20-0x7E and
         * 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
         * keyword, leading spaces, trailing spaces, and consecutive spaces are
         * not permitted.
         * @see <a href="https://www.w3.org/TR/2025/REC-png-3-20250624/#11keywords">Source</a>
         */
        public String keyword() { return keyword; }

        /**
         * 0 = text is uncompressed, 1 = text is compressed with a
         * method specified in `compression_method`.
         */
        public int compressionFlag() { return compressionFlag; }
        public CompressionMethods compressionMethod() { return compressionMethod; }

        /**
         * Human language used in the `translated_keyword` and `text` fields.
         * 
         * From the [official
         * specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#11iTXt):
         * 
         * > The language tag is a well-formed language tag defined by [RFC 5646:
         * > BCP 47: Tags for Identifying
         * > Languages](https://www.rfc-editor.org/info/rfc5646/). Unlike the
         * > keyword, the language tag is case-insensitive. Subtags must appear
         * > in the [IANA language subtag
         * > registry](https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry).
         * > If the language tag is empty, the language is unspecified. Examples
         * > of language tags include: `en`, `en-GB`, `es-419`, `zh-Hans`,
         * > `zh-Hans-CN`, `tlh-Cyrl-AQ`, `ar-AE-u-nu-latn`, and `x-private`.
         */
        public String languageTag() { return languageTag; }

        /**
         * The keyword (`keyword`) translated into the language specified in
         * `language_tag`.
         * 
         * It must not contain a zero byte (U+0000 NULL character). Line breaks
         * should not appear. The remaining control characters (U+0001..U+0009,
         * U+000B..0+001F, U+007F..U+009F) are discouraged.
         */
        public String translatedKeyword() { return translatedKeyword; }
        public InternationalText textPlain() { return textPlain; }
        public InternationalText textZlib() { return textZlib; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
        public byte[] _raw_textPlain() { return _raw_textPlain; }
        public byte[] _raw_textZlib() { return _raw_textZlib; }
        public byte[] _raw__raw_textZlib() { return _raw__raw_textZlib; }
    }
    public static class MdcvChromaticity extends KaitaiStruct {
        public static MdcvChromaticity fromFile(String fileName) throws IOException {
            return new MdcvChromaticity(new ByteBufferKaitaiStream(fileName));
        }

        public MdcvChromaticity(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MdcvChromaticity(KaitaiStream _io, Png.MdcvChunk _parent) {
            this(_io, _parent, null);
        }

        public MdcvChromaticity(KaitaiStream _io, Png.MdcvChunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.xInt = this._io.readU2be();
            this.yInt = this._io.readU2be();
        }

        public void _fetchInstances() {
        }
        private Double x;
        public Double x() {
            if (this.x != null)
                return this.x;
            this.x = ((Number) (xInt() * 0.00002)).doubleValue();
            return this.x;
        }
        private Double y;
        public Double y() {
            if (this.y != null)
                return this.y;
            this.y = ((Number) (yInt() * 0.00002)).doubleValue();
            return this.y;
        }
        private int xInt;
        private int yInt;
        private Png _root;
        private Png.MdcvChunk _parent;
        public int xInt() { return xInt; }
        public int yInt() { return yInt; }
        public Png _root() { return _root; }
        public Png.MdcvChunk _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#mDCV-chunk">Source</a>
     * @see <a href="https://w3c.github.io/png/Implementation_Report_3e/#mastering">Source</a>
     */
    public static class MdcvChunk extends KaitaiStruct {
        public static MdcvChunk fromFile(String fileName) throws IOException {
            return new MdcvChunk(new ByteBufferKaitaiStream(fileName));
        }

        public MdcvChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MdcvChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public MdcvChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.red = new MdcvChromaticity(this._io, this, _root);
            this.green = new MdcvChromaticity(this._io, this, _root);
            this.blue = new MdcvChromaticity(this._io, this, _root);
            this.whitePoint = new MdcvChromaticity(this._io, this, _root);
            this.maxLuminanceInt = this._io.readU4be();
            this.minLuminanceInt = this._io.readU4be();
        }

        public void _fetchInstances() {
            this.red._fetchInstances();
            this.green._fetchInstances();
            this.blue._fetchInstances();
            this.whitePoint._fetchInstances();
        }
        private Double maxLuminance;

        /**
         * Maximum luminance in cd/m^2
         */
        public Double maxLuminance() {
            if (this.maxLuminance != null)
                return this.maxLuminance;
            this.maxLuminance = ((Number) (maxLuminanceInt() * 0.0001)).doubleValue();
            return this.maxLuminance;
        }
        private Double minLuminance;

        /**
         * Minimum luminance in cd/m^2
         */
        public Double minLuminance() {
            if (this.minLuminance != null)
                return this.minLuminance;
            this.minLuminance = ((Number) (minLuminanceInt() * 0.0001)).doubleValue();
            return this.minLuminance;
        }
        private MdcvChromaticity red;
        private MdcvChromaticity green;
        private MdcvChromaticity blue;
        private MdcvChromaticity whitePoint;
        private long maxLuminanceInt;
        private long minLuminanceInt;
        private Png _root;
        private Png.Chunk _parent;
        public MdcvChromaticity red() { return red; }
        public MdcvChromaticity green() { return green; }
        public MdcvChromaticity blue() { return blue; }
        public MdcvChromaticity whitePoint() { return whitePoint; }
        public long maxLuminanceInt() { return maxLuminanceInt; }
        public long minLuminanceInt() { return minLuminanceInt; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * Physical pixel dimensions (`pHYs`) chunk specifies the intended physical
     * size of the pixels (in meters) or pixel aspect ratio for display of the
     * image.
     * @see <a href="https://www.w3.org/TR/png/#11pHYs">Source</a>
     */
    public static class PhysChunk extends KaitaiStruct {
        public static PhysChunk fromFile(String fileName) throws IOException {
            return new PhysChunk(new ByteBufferKaitaiStream(fileName));
        }

        public PhysChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PhysChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public PhysChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.pixelsPerUnitX = this._io.readU4be();
            this.pixelsPerUnitY = this._io.readU4be();
            this.unit = Png.PhysUnit.byId(this._io.readU1());
            if (this.unit == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.unit, this._io, "/types/phys_chunk/seq/2");
            }
        }

        public void _fetchInstances() {
        }
        private Double dotsPerInchX;

        /**
         * Horizontal resolution (DPI)
         */
        public Double dotsPerInchX() {
            if (this.dotsPerInchX != null)
                return this.dotsPerInchX;
            if (unit() == Png.PhysUnit.METER) {
                this.dotsPerInchX = ((Number) (pixelsPerUnitX() * 0.0254)).doubleValue();
            }
            return this.dotsPerInchX;
        }
        private Double dotsPerInchY;

        /**
         * Vertical resolution (DPI)
         */
        public Double dotsPerInchY() {
            if (this.dotsPerInchY != null)
                return this.dotsPerInchY;
            if (unit() == Png.PhysUnit.METER) {
                this.dotsPerInchY = ((Number) (pixelsPerUnitY() * 0.0254)).doubleValue();
            }
            return this.dotsPerInchY;
        }
        private long pixelsPerUnitX;
        private long pixelsPerUnitY;
        private PhysUnit unit;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * Number of pixels per physical unit (typically, 1 meter) by X
         * axis.
         */
        public long pixelsPerUnitX() { return pixelsPerUnitX; }

        /**
         * Number of pixels per physical unit (typically, 1 meter) by Y
         * axis.
         */
        public long pixelsPerUnitY() { return pixelsPerUnitY; }
        public PhysUnit unit() { return unit; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#11PLTE">Source</a>
     */
    public static class PlteChunk extends KaitaiStruct {
        public static PlteChunk fromFile(String fileName) throws IOException {
            return new PlteChunk(new ByteBufferKaitaiStream(fileName));
        }

        public PlteChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PlteChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public PlteChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<Rgb>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new Rgb(this._io, this, _root));
                    i++;
                }
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private List<Rgb> entries;
        private Png _root;
        private Png.Chunk _parent;
        public List<Rgb> entries() { return entries; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }
    public static class Rgb extends KaitaiStruct {
        public static Rgb fromFile(String fileName) throws IOException {
            return new Rgb(new ByteBufferKaitaiStream(fileName));
        }

        public Rgb(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Rgb(KaitaiStream _io, Png.PlteChunk _parent) {
            this(_io, _parent, null);
        }

        public Rgb(KaitaiStream _io, Png.PlteChunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.r = this._io.readU1();
            this.g = this._io.readU1();
            this.b = this._io.readU1();
        }

        public void _fetchInstances() {
        }
        private int r;
        private int g;
        private int b;
        private Png _root;
        private Png.PlteChunk _parent;
        public int r() { return r; }
        public int g() { return g; }
        public int b() { return b; }
        public Png _root() { return _root; }
        public Png.PlteChunk _parent() { return _parent; }
    }

    /**
     * Significant bits (`sBIT`) chunk stores the original number of significant
     * bits of the sample values (which can be less than or equal to the sample
     * depth). This allows PNG decoders to recover the original data losslessly
     * even if the data had a sample depth not directly supported by PNG.
     * @see <a href="https://www.w3.org/TR/png/#11sBIT">Source</a>
     */
    public static class SbitChunk extends KaitaiStruct {
        public static SbitChunk fromFile(String fileName) throws IOException {
            return new SbitChunk(new ByteBufferKaitaiStream(fileName));
        }

        public SbitChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SbitChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public SbitChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            {
                ColorType on = _root().ihdr().colorType();
                if (on != null) {
                    switch (_root().ihdr().colorType()) {
                    case GREYSCALE: {
                        this.significantBits = new SbitGreyscale(this._io, this, _root, false);
                        break;
                    }
                    case GREYSCALE_ALPHA: {
                        this.significantBits = new SbitGreyscale(this._io, this, _root, true);
                        break;
                    }
                    case INDEXED: {
                        this.significantBits = new SbitTruecolor(this._io, this, _root, false);
                        break;
                    }
                    case TRUECOLOR: {
                        this.significantBits = new SbitTruecolor(this._io, this, _root, false);
                        break;
                    }
                    case TRUECOLOR_ALPHA: {
                        this.significantBits = new SbitTruecolor(this._io, this, _root, true);
                        break;
                    }
                    }
                }
            }
        }

        public void _fetchInstances() {
            {
                ColorType on = _root().ihdr().colorType();
                if (on != null) {
                    switch (_root().ihdr().colorType()) {
                    case GREYSCALE: {
                        ((SbitGreyscale) (this.significantBits))._fetchInstances();
                        break;
                    }
                    case GREYSCALE_ALPHA: {
                        ((SbitGreyscale) (this.significantBits))._fetchInstances();
                        break;
                    }
                    case INDEXED: {
                        ((SbitTruecolor) (this.significantBits))._fetchInstances();
                        break;
                    }
                    case TRUECOLOR: {
                        ((SbitTruecolor) (this.significantBits))._fetchInstances();
                        break;
                    }
                    case TRUECOLOR_ALPHA: {
                        ((SbitTruecolor) (this.significantBits))._fetchInstances();
                        break;
                    }
                    }
                }
            }
        }
        private Integer sampleDepth;
        public Integer sampleDepth() {
            if (this.sampleDepth != null)
                return this.sampleDepth;
            this.sampleDepth = ((Number) ((_root().ihdr().colorType() == Png.ColorType.INDEXED ? 8 : _root().ihdr().bitDepth()))).intValue();
            return this.sampleDepth;
        }
        private KaitaiStruct significantBits;
        private Png _root;
        private Png.Chunk _parent;
        public KaitaiStruct significantBits() { return significantBits; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }
    public static class SbitGreyscale extends KaitaiStruct {

        public SbitGreyscale(KaitaiStream _io, boolean hasAlpha) {
            this(_io, null, null, hasAlpha);
        }

        public SbitGreyscale(KaitaiStream _io, Png.SbitChunk _parent, boolean hasAlpha) {
            this(_io, _parent, null, hasAlpha);
        }

        public SbitGreyscale(KaitaiStream _io, Png.SbitChunk _parent, Png _root, boolean hasAlpha) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.hasAlpha = hasAlpha;
            _read();
        }
        private void _read() {
            this.grey = this._io.readU1();
            if (!(this.grey >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.grey, this._io, "/types/sbit_greyscale/seq/0");
            }
            if (!(this.grey <= _parent().sampleDepth())) {
                throw new KaitaiStream.ValidationGreaterThanError(_parent().sampleDepth(), this.grey, this._io, "/types/sbit_greyscale/seq/0");
            }
            if (hasAlpha()) {
                this.alpha = this._io.readU1();
                if (!(this.alpha >= 1)) {
                    throw new KaitaiStream.ValidationLessThanError(1, this.alpha, this._io, "/types/sbit_greyscale/seq/1");
                }
                if (!(this.alpha <= _parent().sampleDepth())) {
                    throw new KaitaiStream.ValidationGreaterThanError(_parent().sampleDepth(), this.alpha, this._io, "/types/sbit_greyscale/seq/1");
                }
            }
        }

        public void _fetchInstances() {
            if (hasAlpha()) {
            }
        }
        private int grey;
        private Integer alpha;
        private boolean hasAlpha;
        private Png _root;
        private Png.SbitChunk _parent;
        public int grey() { return grey; }
        public Integer alpha() { return alpha; }
        public boolean hasAlpha() { return hasAlpha; }
        public Png _root() { return _root; }
        public Png.SbitChunk _parent() { return _parent; }
    }
    public static class SbitTruecolor extends KaitaiStruct {

        public SbitTruecolor(KaitaiStream _io, boolean hasAlpha) {
            this(_io, null, null, hasAlpha);
        }

        public SbitTruecolor(KaitaiStream _io, Png.SbitChunk _parent, boolean hasAlpha) {
            this(_io, _parent, null, hasAlpha);
        }

        public SbitTruecolor(KaitaiStream _io, Png.SbitChunk _parent, Png _root, boolean hasAlpha) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.hasAlpha = hasAlpha;
            _read();
        }
        private void _read() {
            this.red = this._io.readU1();
            if (!(this.red >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.red, this._io, "/types/sbit_truecolor/seq/0");
            }
            if (!(this.red <= _parent().sampleDepth())) {
                throw new KaitaiStream.ValidationGreaterThanError(_parent().sampleDepth(), this.red, this._io, "/types/sbit_truecolor/seq/0");
            }
            this.green = this._io.readU1();
            if (!(this.green >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.green, this._io, "/types/sbit_truecolor/seq/1");
            }
            if (!(this.green <= _parent().sampleDepth())) {
                throw new KaitaiStream.ValidationGreaterThanError(_parent().sampleDepth(), this.green, this._io, "/types/sbit_truecolor/seq/1");
            }
            this.blue = this._io.readU1();
            if (!(this.blue >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.blue, this._io, "/types/sbit_truecolor/seq/2");
            }
            if (!(this.blue <= _parent().sampleDepth())) {
                throw new KaitaiStream.ValidationGreaterThanError(_parent().sampleDepth(), this.blue, this._io, "/types/sbit_truecolor/seq/2");
            }
            if (hasAlpha()) {
                this.alpha = this._io.readU1();
                if (!(this.alpha >= 1)) {
                    throw new KaitaiStream.ValidationLessThanError(1, this.alpha, this._io, "/types/sbit_truecolor/seq/3");
                }
                if (!(this.alpha <= _parent().sampleDepth())) {
                    throw new KaitaiStream.ValidationGreaterThanError(_parent().sampleDepth(), this.alpha, this._io, "/types/sbit_truecolor/seq/3");
                }
            }
        }

        public void _fetchInstances() {
            if (hasAlpha()) {
            }
        }
        private int red;
        private int green;
        private int blue;
        private Integer alpha;
        private boolean hasAlpha;
        private Png _root;
        private Png.SbitChunk _parent;
        public int red() { return red; }
        public int green() { return green; }
        public int blue() { return blue; }
        public Integer alpha() { return alpha; }
        public boolean hasAlpha() { return hasAlpha; }
        public Png _root() { return _root; }
        public Png.SbitChunk _parent() { return _parent; }
    }

    /**
     * Suggested palette (`sPLT`) chunk.
     * 
     * Multiple `sPLT` chunks are permitted, but each must have a different
     * palette name.
     * @see <a href="https://www.w3.org/TR/png/#11sPLT">Source</a>
     * @see <a href="https://www.w3.org/TR/png/#12Suggested-palettes">Source</a>
     */
    public static class SpltChunk extends KaitaiStruct {
        public static SpltChunk fromFile(String fileName) throws IOException {
            return new SpltChunk(new ByteBufferKaitaiStream(fileName));
        }

        public SpltChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SpltChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public SpltChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.paletteName = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.ISO_8859_1);
            this.sampleDepth = this._io.readU1();
            if (!( ((this.sampleDepth == 8) || (this.sampleDepth == 16)) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(this.sampleDepth, this._io, "/types/splt_chunk/seq/1");
            }
            this.entries = new ArrayList<SpltEntry>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new SpltEntry(this._io, this, _root));
                    i++;
                }
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private String paletteName;
        private int sampleDepth;
        private List<SpltEntry> entries;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * Any convenient name for referring to the palette. It is
         * case-sensitive. The palette name may aid the choice of the appropriate
         * suggested palette when more than one appears in a PNG datastream.
         * 
         * Palette names must contain only printable ISO-8859-1 (Latin-1)
         * characters and spaces; that is, only code points 0x20-0x7E and
         * 0xA1-0xFF are allowed. Leading, trailing, and consecutive spaces are
         * not permitted.
         */
        public String paletteName() { return paletteName; }
        public int sampleDepth() { return sampleDepth; }

        /**
         * There may be any number of entries. Entries must appear "in decreasing
         * order of frequency" (note: strictly speaking, I think the W3C
         * specification actually meant "non-increasing"). There is no
         * requirement that the entries all be used by the image, nor that they
         * all be different.
         * 
         * The color samples are not premultiplied by alpha, nor are they
         * precomposited against any background.
         * 
         * Entries in `sPLT` use the same gamma value and chromaticity values as
         * the PNG image, but may fall outside the range of values used in the
         * color space of the PNG image; for example, in a greyscale PNG image,
         * each `sPLT` entry would typically have equal red, green, and blue
         * values, but this is not required. Similarly, `sPLT` entries can have
         * non-opaque alpha values even when the PNG image does not use
         * transparency.
         */
        public List<SpltEntry> entries() { return entries; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }
    public static class SpltEntry extends KaitaiStruct {
        public static SpltEntry fromFile(String fileName) throws IOException {
            return new SpltEntry(new ByteBufferKaitaiStream(fileName));
        }

        public SpltEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SpltEntry(KaitaiStream _io, Png.SpltChunk _parent) {
            this(_io, _parent, null);
        }

        public SpltEntry(KaitaiStream _io, Png.SpltChunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            switch (_parent().sampleDepth()) {
            case 8: {
                this.red = ((Number) (this._io.readU1())).intValue();
                break;
            }
            default: {
                this.red = this._io.readU2be();
                break;
            }
            }
            switch (_parent().sampleDepth()) {
            case 8: {
                this.green = ((Number) (this._io.readU1())).intValue();
                break;
            }
            default: {
                this.green = this._io.readU2be();
                break;
            }
            }
            switch (_parent().sampleDepth()) {
            case 8: {
                this.blue = ((Number) (this._io.readU1())).intValue();
                break;
            }
            default: {
                this.blue = this._io.readU2be();
                break;
            }
            }
            switch (_parent().sampleDepth()) {
            case 8: {
                this.alpha = ((Number) (this._io.readU1())).intValue();
                break;
            }
            default: {
                this.alpha = this._io.readU2be();
                break;
            }
            }
            this.freq = this._io.readU2be();
        }

        public void _fetchInstances() {
            switch (_parent().sampleDepth()) {
            case 8: {
                break;
            }
            default: {
                break;
            }
            }
            switch (_parent().sampleDepth()) {
            case 8: {
                break;
            }
            default: {
                break;
            }
            }
            switch (_parent().sampleDepth()) {
            case 8: {
                break;
            }
            default: {
                break;
            }
            }
            switch (_parent().sampleDepth()) {
            case 8: {
                break;
            }
            default: {
                break;
            }
            }
        }
        private int red;
        private int green;
        private int blue;
        private int alpha;
        private int freq;
        private Png _root;
        private Png.SpltChunk _parent;
        public int red() { return red; }
        public int green() { return green; }
        public int blue() { return blue; }

        /**
         * An alpha value of 0 means fully transparent. An alpha value of 255
         * (when `_parent.sample_depth` is 8) or 65535 (when
         * `_parent.sample_depth` is 16) means fully opaque.
         */
        public int alpha() { return alpha; }

        /**
         * Each frequency value is proportional to the fraction of the pixels in
         * the image for which that palette entry is the closest match in RGBA
         * space, before the image has been composited against any background.
         * 
         * The exact scale factor is chosen by the PNG encoder; it is recommended
         * that the resulting range of individual values reasonably fills the
         * range 0 to 65535.
         * 
         * Zero is a valid frequency meaning that the color is "least important"
         * or that it is rarely, if ever, used. When all the frequencies are
         * zero, they are meaningless, that is to say, nothing may be inferred
         * about the actual frequencies with which the colors appear in the PNG
         * image.
         */
        public int freq() { return freq; }
        public Png _root() { return _root; }
        public Png.SpltChunk _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#11sRGB">Source</a>
     */
    public static class SrgbChunk extends KaitaiStruct {
        public static SrgbChunk fromFile(String fileName) throws IOException {
            return new SrgbChunk(new ByteBufferKaitaiStream(fileName));
        }

        public enum Intent {
            PERCEPTUAL(0),
            RELATIVE_COLORIMETRIC(1),
            SATURATION(2),
            ABSOLUTE_COLORIMETRIC(3);

            private final long id;
            Intent(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, Intent> byId = new HashMap<Long, Intent>(4);
            static {
                for (Intent e : Intent.values())
                    byId.put(e.id(), e);
            }
            public static Intent byId(long id) { return byId.get(id); }
        }

        public SrgbChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SrgbChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public SrgbChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.renderIntent = Intent.byId(this._io.readU1());
            if (this.renderIntent == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.renderIntent, this._io, "/types/srgb_chunk/seq/0");
            }
        }

        public void _fetchInstances() {
        }
        private Intent renderIntent;
        private Png _root;
        private Png.Chunk _parent;
        public Intent renderIntent() { return renderIntent; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * Textual data (`tEXt`) chunk effectively allows you to store key-value
     * string pairs in the PNG container.
     * 
     * Both the "key" (`keyword`) and "value" (`text`) parts are restricted to
     * printable ISO-8859-1 (Latin-1) characters and ASCII spaces, with the
     * exception that `text` can also contain newlines (U+000A LINE FEED (LF)
     * characters) and U+00A0 NON-BREAKING SPACE characters.
     * @see <a href="https://www.w3.org/TR/png/#11tEXt">Source</a>
     */
    public static class TextChunk extends KaitaiStruct {
        public static TextChunk fromFile(String fileName) throws IOException {
            return new TextChunk(new ByteBufferKaitaiStream(fileName));
        }

        public TextChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TextChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public TextChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.keyword = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.ISO_8859_1);
            this.text = new String(this._io.readBytesFull(), StandardCharsets.ISO_8859_1);
        }

        public void _fetchInstances() {
        }
        private String keyword;
        private String text;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * Indicates the type of information represented by the text string.
         * 
         * Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
         * characters and spaces; that is, only code points 0x20-0x7E and
         * 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
         * keyword, leading spaces, trailing spaces, and consecutive spaces are
         * not permitted.
         * @see <a href="https://www.w3.org/TR/2025/REC-png-3-20250624/#11keywords">Source</a>
         */
        public String keyword() { return keyword; }

        /**
         * Text string (the "value" of this key-value pair).
         * 
         * Although it is not null-terminated (unlike the keyword), it must not
         * contain a zero byte (U+0000 NULL character). A newline should be
         * represented by a single U+000A LINE FEED (LF) character (aka `\n`).
         * The remaining control characters (U+0001..U+0009, U+000B..0+001F,
         * U+007F..U+009F) are discouraged.
         */
        public String text() { return text; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * Time chunk stores time stamp of last modification of this image,
     * up to 1 second precision in UTC timezone.
     * @see <a href="https://www.w3.org/TR/png/#11tIME">Source</a>
     */
    public static class TimeChunk extends KaitaiStruct {
        public static TimeChunk fromFile(String fileName) throws IOException {
            return new TimeChunk(new ByteBufferKaitaiStream(fileName));
        }

        public TimeChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TimeChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public TimeChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.year = this._io.readU2be();
            this.month = this._io.readU1();
            this.day = this._io.readU1();
            this.hour = this._io.readU1();
            this.minute = this._io.readU1();
            this.second = this._io.readU1();
        }

        public void _fetchInstances() {
        }
        private int year;
        private int month;
        private int day;
        private int hour;
        private int minute;
        private int second;
        private Png _root;
        private Png.Chunk _parent;
        public int year() { return year; }
        public int month() { return month; }
        public int day() { return day; }
        public int hour() { return hour; }
        public int minute() { return minute; }
        public int second() { return second; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * Transparency (`tRNS`) chunk specifies either alpha values that are
     * associated with palette entries (for indexed-color images) or a single
     * transparent color (for greyscale and truecolor images).
     * 
     * A `tRNS` chunk must not appear for color types
     * `color_type::greyscale_alpha` = 4 and `color_type::truecolor_alpha` = 6,
     * since a full alpha channel is already present in those cases.
     * @see <a href="https://www.w3.org/TR/png/#11tRNS">Source</a>
     */
    public static class TrnsChunk extends KaitaiStruct {
        public static TrnsChunk fromFile(String fileName) throws IOException {
            return new TrnsChunk(new ByteBufferKaitaiStream(fileName));
        }

        public TrnsChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TrnsChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public TrnsChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            if (_root().ihdr().colorType() == Png.ColorType.INDEXED) {
                this.paletteAlphas = new ArrayList<Integer>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.paletteAlphas.add(this._io.readU1());
                        i++;
                    }
                }
            }
            {
                ColorType on = _root().ihdr().colorType();
                if (on != null) {
                    switch (_root().ihdr().colorType()) {
                    case GREYSCALE: {
                        this.transparentColor = new TrnsGreyscaleColor(this._io, this, _root);
                        break;
                    }
                    case TRUECOLOR: {
                        this.transparentColor = new TrnsTruecolorColor(this._io, this, _root);
                        break;
                    }
                    }
                }
            }
        }

        public void _fetchInstances() {
            if (_root().ihdr().colorType() == Png.ColorType.INDEXED) {
                for (int i = 0; i < this.paletteAlphas.size(); i++) {
                }
            }
            {
                ColorType on = _root().ihdr().colorType();
                if (on != null) {
                    switch (_root().ihdr().colorType()) {
                    case GREYSCALE: {
                        ((TrnsGreyscaleColor) (this.transparentColor))._fetchInstances();
                        break;
                    }
                    case TRUECOLOR: {
                        ((TrnsTruecolorColor) (this.transparentColor))._fetchInstances();
                        break;
                    }
                    }
                }
            }
        }
        private Integer sampleMask;
        public Integer sampleMask() {
            if (this.sampleMask != null)
                return this.sampleMask;
            this.sampleMask = ((Number) ((1 << _root().ihdr().bitDepth()) - 1)).intValue();
            return this.sampleMask;
        }
        private List<Integer> paletteAlphas;
        private KaitaiStruct transparentColor;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * Alpha values associated with palette entries in the `PLTE` chunk.
         * 
         * Each entry indicates that pixels of the corresponding palette index
         * shall be treated as having the specified alpha value. Alpha values
         * have the same interpretation as in an 8-bit full alpha channel: 0 is
         * fully transparent, 255 is fully opaque, regardless of image bit depth.
         * 
         * The `tRNS` chunk must not contain more alpha values than there are
         * palette entries, but it may contain fewer values than there are
         * palette entries. In this case, the alpha value for all remaining
         * palette entries is assumed to be 255. If all palette indices are
         * opaque, the `tRNS` chunk may be omitted.
         */
        public List<Integer> paletteAlphas() { return paletteAlphas; }

        /**
         * Pixels of the specified grey sample value or RGB sample values are
         * treated as transparent (equivalent to alpha value 0); all other pixels
         * are to be treated as fully opaque (alpha value `2^{bitdepth} - 1`).
         * 
         * If the image bit depth is less than 16, the least significant bits of
         * these sample values are used. Encoders should set the other bits to 0,
         * and decoders must mask the other bits to 0 before the value is used.
         * 
         * Note: in this Kaitai Struct implementation, the bitmask used to
         * implement this masking is stored in the value instance `sample_mask`.
         */
        public KaitaiStruct transparentColor() { return transparentColor; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }
    public static class TrnsGreyscaleColor extends KaitaiStruct {
        public static TrnsGreyscaleColor fromFile(String fileName) throws IOException {
            return new TrnsGreyscaleColor(new ByteBufferKaitaiStream(fileName));
        }

        public TrnsGreyscaleColor(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TrnsGreyscaleColor(KaitaiStream _io, Png.TrnsChunk _parent) {
            this(_io, _parent, null);
        }

        public TrnsGreyscaleColor(KaitaiStream _io, Png.TrnsChunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.greyRaw = this._io.readU2be();
        }

        public void _fetchInstances() {
        }
        private Integer grey;
        public Integer grey() {
            if (this.grey != null)
                return this.grey;
            this.grey = ((Number) (greyRaw() & _parent().sampleMask())).intValue();
            return this.grey;
        }
        private int greyRaw;
        private Png _root;
        private Png.TrnsChunk _parent;
        public int greyRaw() { return greyRaw; }
        public Png _root() { return _root; }
        public Png.TrnsChunk _parent() { return _parent; }
    }
    public static class TrnsTruecolorColor extends KaitaiStruct {
        public static TrnsTruecolorColor fromFile(String fileName) throws IOException {
            return new TrnsTruecolorColor(new ByteBufferKaitaiStream(fileName));
        }

        public TrnsTruecolorColor(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TrnsTruecolorColor(KaitaiStream _io, Png.TrnsChunk _parent) {
            this(_io, _parent, null);
        }

        public TrnsTruecolorColor(KaitaiStream _io, Png.TrnsChunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.redRaw = this._io.readU2be();
            this.greenRaw = this._io.readU2be();
            this.blueRaw = this._io.readU2be();
        }

        public void _fetchInstances() {
        }
        private Integer blue;
        public Integer blue() {
            if (this.blue != null)
                return this.blue;
            this.blue = ((Number) (blueRaw() & _parent().sampleMask())).intValue();
            return this.blue;
        }
        private Integer green;
        public Integer green() {
            if (this.green != null)
                return this.green;
            this.green = ((Number) (greenRaw() & _parent().sampleMask())).intValue();
            return this.green;
        }
        private Integer red;
        public Integer red() {
            if (this.red != null)
                return this.red;
            this.red = ((Number) (redRaw() & _parent().sampleMask())).intValue();
            return this.red;
        }
        private int redRaw;
        private int greenRaw;
        private int blueRaw;
        private Png _root;
        private Png.TrnsChunk _parent;
        public int redRaw() { return redRaw; }
        public int greenRaw() { return greenRaw; }
        public int blueRaw() { return blueRaw; }
        public Png _root() { return _root; }
        public Png.TrnsChunk _parent() { return _parent; }
    }
    private byte[] magic;
    private long ihdrLen;
    private byte[] ihdrType;
    private IhdrChunk ihdr;
    private long ihdrCrc;
    private List<Chunk> chunks;
    private Png _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public long ihdrLen() { return ihdrLen; }
    public byte[] ihdrType() { return ihdrType; }
    public IhdrChunk ihdr() { return ihdr; }
    public long ihdrCrc() { return ihdrCrc; }
    public List<Chunk> chunks() { return chunks; }
    public Png _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;


/**
 * The Portable Image Format (PIF) is a basic, bitmap-like image format with the
 * focus on ease of use (implementation) and small size for embedded
 * applications.
 * 
 * See <https://github.com/gfcwfzkm/PIF-Image-Format> for more info.
 * @see <a href="https://github.com/gfcwfzkm/PIF-Image-Format/blob/cc256d5/Specification/PIF%20Format%20Specification.pdf">Source</a>
 * @see <a href="https://github.com/gfcwfzkm/PIF-Image-Format/blob/cc256d5/C%20Library/pifdec.c#L300">Source</a>
 */
public class Pif extends KaitaiStruct {
    public static Pif fromFile(String fileName) throws IOException {
        return new Pif(new ByteBufferKaitaiStream(fileName));
    }

    public enum ImageType {
        RGB332(7763),
        RGB888(17212),
        INDEXED_RGB332(18754),
        INDEXED_RGB565(18759),
        INDEXED_RGB888(18770),
        BLACK_WHITE(32170),
        RGB16C(47253),
        RGB565(58821);

        private final long id;
        ImageType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ImageType> byId = new HashMap<Long, ImageType>(8);
        static {
            for (ImageType e : ImageType.values())
                byId.put(e.id(), e);
        }
        public static ImageType byId(long id) { return byId.get(id); }
    }

    public enum CompressionType {
        NONE(0),
        RLE(32222);

        private final long id;
        CompressionType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, CompressionType> byId = new HashMap<Long, CompressionType>(2);
        static {
            for (CompressionType e : CompressionType.values())
                byId.put(e.id(), e);
        }
        public static CompressionType byId(long id) { return byId.get(id); }
    }

    public Pif(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Pif(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Pif(KaitaiStream _io, KaitaiStruct _parent, Pif _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.fileHeader = new PifHeader(this._io, this, _root);
        this.infoHeader = new InformationHeader(this._io, this, _root);
        if (infoHeader().usesIndexedMode()) {
            this._raw_colorTable = this._io.readBytes(infoHeader().lenColorTable());
            KaitaiStream _io__raw_colorTable = new ByteBufferKaitaiStream(_raw_colorTable);
            this.colorTable = new ColorTableData(_io__raw_colorTable, this, _root);
        }
    }
    public static class PifHeader extends KaitaiStruct {
        public static PifHeader fromFile(String fileName) throws IOException {
            return new PifHeader(new ByteBufferKaitaiStream(fileName));
        }

        public PifHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PifHeader(KaitaiStream _io, Pif _parent) {
            this(_io, _parent, null);
        }

        public PifHeader(KaitaiStream _io, Pif _parent, Pif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(magic(), new byte[] { 80, 73, 70, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 80, 73, 70, 0 }, magic(), _io(), "/types/pif_header/seq/0");
            }
            this.lenFile = this._io.readU4le();
            if (!(lenFile() >= ofsImageDataMin())) {
                throw new KaitaiStream.ValidationLessThanError(ofsImageDataMin(), lenFile(), _io(), "/types/pif_header/seq/1");
            }
            this.ofsImageData = this._io.readU4le();
            if (!(ofsImageData() >= ofsImageDataMin())) {
                throw new KaitaiStream.ValidationLessThanError(ofsImageDataMin(), ofsImageData(), _io(), "/types/pif_header/seq/2");
            }
            if (!(ofsImageData() <= lenFile())) {
                throw new KaitaiStream.ValidationGreaterThanError(lenFile(), ofsImageData(), _io(), "/types/pif_header/seq/2");
            }
        }
        private Integer ofsImageDataMin;
        public Integer ofsImageDataMin() {
            if (this.ofsImageDataMin != null)
                return this.ofsImageDataMin;
            int _tmp = (int) ((12 + 16));
            this.ofsImageDataMin = _tmp;
            return this.ofsImageDataMin;
        }
        private byte[] magic;
        private long lenFile;
        private long ofsImageData;
        private Pif _root;
        private Pif _parent;
        public byte[] magic() { return magic; }
        public long lenFile() { return lenFile; }
        public long ofsImageData() { return ofsImageData; }
        public Pif _root() { return _root; }
        public Pif _parent() { return _parent; }
    }
    public static class InformationHeader extends KaitaiStruct {
        public static InformationHeader fromFile(String fileName) throws IOException {
            return new InformationHeader(new ByteBufferKaitaiStream(fileName));
        }

        public InformationHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public InformationHeader(KaitaiStream _io, Pif _parent) {
            this(_io, _parent, null);
        }

        public InformationHeader(KaitaiStream _io, Pif _parent, Pif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.imageType = Pif.ImageType.byId(this._io.readU2le());
            if (!( ((imageType() == Pif.ImageType.RGB888) || (imageType() == Pif.ImageType.RGB565) || (imageType() == Pif.ImageType.RGB332) || (imageType() == Pif.ImageType.RGB16C) || (imageType() == Pif.ImageType.BLACK_WHITE) || (imageType() == Pif.ImageType.INDEXED_RGB888) || (imageType() == Pif.ImageType.INDEXED_RGB565) || (imageType() == Pif.ImageType.INDEXED_RGB332)) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(imageType(), _io(), "/types/information_header/seq/0");
            }
            this.bitsPerPixel = this._io.readU2le();
            {
                int _it = bitsPerPixel();
                if (!((imageType() == Pif.ImageType.RGB888 ? _it == 24 : (imageType() == Pif.ImageType.RGB565 ? _it == 16 : (imageType() == Pif.ImageType.RGB332 ? _it == 8 : (imageType() == Pif.ImageType.RGB16C ? _it == 4 : (imageType() == Pif.ImageType.BLACK_WHITE ? _it == 1 : (usesIndexedMode() ? _it <= 8 : true)))))))) {
                    throw new KaitaiStream.ValidationExprError(bitsPerPixel(), _io(), "/types/information_header/seq/1");
                }
            }
            this.width = this._io.readU2le();
            this.height = this._io.readU2le();
            this.lenImageData = this._io.readU4le();
            if (!(lenImageData() <= (_root().fileHeader().lenFile() - _root().fileHeader().ofsImageData()))) {
                throw new KaitaiStream.ValidationGreaterThanError((_root().fileHeader().lenFile() - _root().fileHeader().ofsImageData()), lenImageData(), _io(), "/types/information_header/seq/4");
            }
            this.lenColorTable = this._io.readU2le();
            if (!(lenColorTable() >= (usesIndexedMode() ? (lenColorTableEntry() * 1) : 0))) {
                throw new KaitaiStream.ValidationLessThanError((usesIndexedMode() ? (lenColorTableEntry() * 1) : 0), lenColorTable(), _io(), "/types/information_header/seq/5");
            }
            if (!(lenColorTable() <= (usesIndexedMode() ? (lenColorTableMax() < lenColorTableFull() ? lenColorTableMax() : lenColorTableFull()) : 0))) {
                throw new KaitaiStream.ValidationGreaterThanError((usesIndexedMode() ? (lenColorTableMax() < lenColorTableFull() ? lenColorTableMax() : lenColorTableFull()) : 0), lenColorTable(), _io(), "/types/information_header/seq/5");
            }
            this.compression = Pif.CompressionType.byId(this._io.readU2le());
            if (!( ((compression() == Pif.CompressionType.NONE) || (compression() == Pif.CompressionType.RLE)) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(compression(), _io(), "/types/information_header/seq/6");
            }
        }
        private Integer lenColorTableFull;
        public Integer lenColorTableFull() {
            if (this.lenColorTableFull != null)
                return this.lenColorTableFull;
            int _tmp = (int) ((lenColorTableEntry() * (1 << bitsPerPixel())));
            this.lenColorTableFull = _tmp;
            return this.lenColorTableFull;
        }
        private Integer lenColorTableMax;
        public Integer lenColorTableMax() {
            if (this.lenColorTableMax != null)
                return this.lenColorTableMax;
            int _tmp = (int) ((_root().fileHeader().ofsImageData() - _root().fileHeader().ofsImageDataMin()));
            this.lenColorTableMax = _tmp;
            return this.lenColorTableMax;
        }
        private Integer numColorTableEntries;
        public Integer numColorTableEntries() {
            if (this.numColorTableEntries != null)
                return this.numColorTableEntries;
            if (usesIndexedMode()) {
                int _tmp = (int) ((lenColorTable() / lenColorTableEntry()));
                this.numColorTableEntries = _tmp;
            }
            return this.numColorTableEntries;
        }
        private Byte lenColorTableEntry;
        public Byte lenColorTableEntry() {
            if (this.lenColorTableEntry != null)
                return this.lenColorTableEntry;
            byte _tmp = (byte) ((imageType() == Pif.ImageType.INDEXED_RGB888 ? 3 : (imageType() == Pif.ImageType.INDEXED_RGB565 ? 2 : (imageType() == Pif.ImageType.INDEXED_RGB332 ? 1 : 0))));
            this.lenColorTableEntry = _tmp;
            return this.lenColorTableEntry;
        }
        private Boolean usesIndexedMode;
        public Boolean usesIndexedMode() {
            if (this.usesIndexedMode != null)
                return this.usesIndexedMode;
            boolean _tmp = (boolean) (lenColorTableEntry() != 0);
            this.usesIndexedMode = _tmp;
            return this.usesIndexedMode;
        }
        private ImageType imageType;
        private int bitsPerPixel;
        private int width;
        private int height;
        private long lenImageData;
        private int lenColorTable;
        private CompressionType compression;
        private Pif _root;
        private Pif _parent;
        public ImageType imageType() { return imageType; }

        /**
         * See <https://github.com/gfcwfzkm/PIF-Image-Format/blob/cc256d5/Specification/PIF%20Format%20Specification.pdf>:
         * 
         * > Bits per Pixel: Bit size that each Pixel occupies. Bit size for an
         * > Indexed Image cannot go beyond 8 bits.
         */
        public int bitsPerPixel() { return bitsPerPixel; }
        public int width() { return width; }
        public int height() { return height; }
        public long lenImageData() { return lenImageData; }

        /**
         * See <https://github.com/gfcwfzkm/PIF-Image-Format/blob/cc256d5/Specification/PIF%20Format%20Specification.pdf>:
         * 
         * > Color Table Size: (...), only used in Indexed mode, otherwise zero.
         * ---
         * > **Note**: The presence of the Color Table is mandatory when Bits per
         * > Pixel <= 8, unless Image Type states RGB332, RGB16C or B/W
         * ---
         * > **Color Table** (semi-optional)
         * >
         * > (...) The amount of Colors has to be same or less than [Bits per
         * > Pixel] allow, otherwise the image is invalid.
         */
        public int lenColorTable() { return lenColorTable; }
        public CompressionType compression() { return compression; }
        public Pif _root() { return _root; }
        public Pif _parent() { return _parent; }
    }
    public static class ColorTableData extends KaitaiStruct {
        public static ColorTableData fromFile(String fileName) throws IOException {
            return new ColorTableData(new ByteBufferKaitaiStream(fileName));
        }

        public ColorTableData(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ColorTableData(KaitaiStream _io, Pif _parent) {
            this(_io, _parent, null);
        }

        public ColorTableData(KaitaiStream _io, Pif _parent, Pif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<Integer>();
            for (int i = 0; i < _root().infoHeader().numColorTableEntries(); i++) {
                {
                    ImageType on = _root().infoHeader().imageType();
                    if (on != null) {
                        switch (_root().infoHeader().imageType()) {
                        case INDEXED_RGB888: {
                            this.entries.add((int) (this._io.readBitsIntLe(24)));
                            break;
                        }
                        case INDEXED_RGB565: {
                            this.entries.add((int) (this._io.readBitsIntLe(16)));
                            break;
                        }
                        case INDEXED_RGB332: {
                            this.entries.add((int) (this._io.readBitsIntLe(8)));
                            break;
                        }
                        }
                    }
                }
            }
        }
        private ArrayList<Integer> entries;
        private Pif _root;
        private Pif _parent;
        public ArrayList<Integer> entries() { return entries; }
        public Pif _root() { return _root; }
        public Pif _parent() { return _parent; }
    }
    private byte[] imageData;
    public byte[] imageData() {
        if (this.imageData != null)
            return this.imageData;
        long _pos = this._io.pos();
        this._io.seek(fileHeader().ofsImageData());
        this.imageData = this._io.readBytes(infoHeader().lenImageData());
        this._io.seek(_pos);
        return this.imageData;
    }
    private PifHeader fileHeader;
    private InformationHeader infoHeader;
    private ColorTableData colorTable;
    private Pif _root;
    private KaitaiStruct _parent;
    private byte[] _raw_colorTable;
    public PifHeader fileHeader() { return fileHeader; }
    public InformationHeader infoHeader() { return infoHeader; }
    public ColorTableData colorTable() { return colorTable; }
    public Pif _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_colorTable() { return _raw_colorTable; }
}

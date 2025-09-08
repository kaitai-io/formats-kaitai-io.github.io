// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;


/**
 * The Portable Image Format (PIF) is a basic, bitmap-like image format with the
 * focus on ease of use (implementation) and small size for embedded
 * applications.
 * 
 * See <https://github.com/gfcwfzkm/PIF-Image-Format> for more info.
 * @see <a href="https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf">Source</a>
 * @see <a href="https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/C%20Library/pifdec.c#L300">Source</a>
 */
public class Pif extends KaitaiStruct {
    public static Pif fromFile(String fileName) throws IOException {
        return new Pif(new ByteBufferKaitaiStream(fileName));
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
            KaitaiStream _io_colorTable = this._io.substream(infoHeader().lenColorTable());
            this.colorTable = new ColorTableData(_io_colorTable, this, _root);
        }
    }

    public void _fetchInstances() {
        this.fileHeader._fetchInstances();
        this.infoHeader._fetchInstances();
        if (infoHeader().usesIndexedMode()) {
            this.colorTable._fetchInstances();
        }
        imageData();
        if (this.imageData != null) {
        }
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
            {
                int i = 0;
                while (!this._io.isEof()) {
                    {
                        ImageType on = _root().infoHeader().imageType();
                        if (on != null) {
                            switch (_root().infoHeader().imageType()) {
                            case INDEXED_RGB332: {
                                this.entries.add(((Number) (this._io.readBitsIntLe(8))).intValue());
                                break;
                            }
                            case INDEXED_RGB565: {
                                this.entries.add(((Number) (this._io.readBitsIntLe(16))).intValue());
                                break;
                            }
                            case INDEXED_RGB888: {
                                this.entries.add(((Number) (this._io.readBitsIntLe(24))).intValue());
                                break;
                            }
                            }
                        }
                    }
                    i++;
                }
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                {
                    ImageType on = _root().infoHeader().imageType();
                    if (on != null) {
                        switch (_root().infoHeader().imageType()) {
                        case INDEXED_RGB332: {
                            break;
                        }
                        case INDEXED_RGB565: {
                            break;
                        }
                        case INDEXED_RGB888: {
                            break;
                        }
                        }
                    }
                }
            }
        }
        private List<Integer> entries;
        private Pif _root;
        private Pif _parent;
        public List<Integer> entries() { return entries; }
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
            if (!( ((this.imageType == Pif.ImageType.RGB888) || (this.imageType == Pif.ImageType.RGB565) || (this.imageType == Pif.ImageType.RGB332) || (this.imageType == Pif.ImageType.RGB16C) || (this.imageType == Pif.ImageType.BLACK_WHITE) || (this.imageType == Pif.ImageType.INDEXED_RGB888) || (this.imageType == Pif.ImageType.INDEXED_RGB565) || (this.imageType == Pif.ImageType.INDEXED_RGB332)) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(this.imageType, this._io, "/types/information_header/seq/0");
            }
            this.bitsPerPixel = this._io.readU2le();
            {
                int _it = this.bitsPerPixel;
                if (!((imageType() == Pif.ImageType.RGB888 ? _it == 24 : (imageType() == Pif.ImageType.RGB565 ? _it == 16 : (imageType() == Pif.ImageType.RGB332 ? _it == 8 : (imageType() == Pif.ImageType.RGB16C ? _it == 4 : (imageType() == Pif.ImageType.BLACK_WHITE ? _it == 1 : (usesIndexedMode() ? _it <= 8 : true)))))))) {
                    throw new KaitaiStream.ValidationExprError(this.bitsPerPixel, this._io, "/types/information_header/seq/1");
                }
            }
            this.width = this._io.readU2le();
            this.height = this._io.readU2le();
            this.lenImageData = this._io.readU4le();
            if (!(this.lenImageData <= _root().fileHeader().lenFile() - _root().fileHeader().ofsImageData())) {
                throw new KaitaiStream.ValidationGreaterThanError(_root().fileHeader().lenFile() - _root().fileHeader().ofsImageData(), this.lenImageData, this._io, "/types/information_header/seq/4");
            }
            this.lenColorTable = this._io.readU2le();
            if (!(this.lenColorTable >= (usesIndexedMode() ? lenColorTableEntry() * 1 : 0))) {
                throw new KaitaiStream.ValidationLessThanError((usesIndexedMode() ? lenColorTableEntry() * 1 : 0), this.lenColorTable, this._io, "/types/information_header/seq/5");
            }
            if (!(this.lenColorTable <= (usesIndexedMode() ? (lenColorTableMax() < lenColorTableFull() ? lenColorTableMax() : lenColorTableFull()) : 0))) {
                throw new KaitaiStream.ValidationGreaterThanError((usesIndexedMode() ? (lenColorTableMax() < lenColorTableFull() ? lenColorTableMax() : lenColorTableFull()) : 0), this.lenColorTable, this._io, "/types/information_header/seq/5");
            }
            this.compression = Pif.CompressionType.byId(this._io.readU2le());
            if (!( ((this.compression == Pif.CompressionType.NONE) || (this.compression == Pif.CompressionType.RLE)) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(this.compression, this._io, "/types/information_header/seq/6");
            }
        }

        public void _fetchInstances() {
        }
        private Byte lenColorTableEntry;
        public Byte lenColorTableEntry() {
            if (this.lenColorTableEntry != null)
                return this.lenColorTableEntry;
            this.lenColorTableEntry = ((Number) ((imageType() == Pif.ImageType.INDEXED_RGB888 ? 3 : (imageType() == Pif.ImageType.INDEXED_RGB565 ? 2 : (imageType() == Pif.ImageType.INDEXED_RGB332 ? 1 : 0))))).byteValue();
            return this.lenColorTableEntry;
        }
        private Integer lenColorTableFull;
        public Integer lenColorTableFull() {
            if (this.lenColorTableFull != null)
                return this.lenColorTableFull;
            this.lenColorTableFull = ((Number) (lenColorTableEntry() * (1 << bitsPerPixel()))).intValue();
            return this.lenColorTableFull;
        }
        private Integer lenColorTableMax;
        public Integer lenColorTableMax() {
            if (this.lenColorTableMax != null)
                return this.lenColorTableMax;
            this.lenColorTableMax = ((Number) (_root().fileHeader().ofsImageData() - _root().fileHeader().ofsImageDataMin())).intValue();
            return this.lenColorTableMax;
        }
        private Boolean usesIndexedMode;
        public Boolean usesIndexedMode() {
            if (this.usesIndexedMode != null)
                return this.usesIndexedMode;
            this.usesIndexedMode = lenColorTableEntry() != 0;
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
         * See <https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf>:
         * 
         * > Bits per Pixel: Bit size that each Pixel occupies. Bit size for an
         * > Indexed Image cannot go beyond 8 bits.
         */
        public int bitsPerPixel() { return bitsPerPixel; }
        public int width() { return width; }
        public int height() { return height; }
        public long lenImageData() { return lenImageData; }

        /**
         * See <https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf>:
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
            if (!(Arrays.equals(this.magic, new byte[] { 80, 73, 70, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 80, 73, 70, 0 }, this.magic, this._io, "/types/pif_header/seq/0");
            }
            this.lenFile = this._io.readU4le();
            if (!(this.lenFile >= ofsImageDataMin())) {
                throw new KaitaiStream.ValidationLessThanError(ofsImageDataMin(), this.lenFile, this._io, "/types/pif_header/seq/1");
            }
            this.ofsImageData = this._io.readU4le();
            if (!(this.ofsImageData >= ofsImageDataMin())) {
                throw new KaitaiStream.ValidationLessThanError(ofsImageDataMin(), this.ofsImageData, this._io, "/types/pif_header/seq/2");
            }
            if (!(this.ofsImageData <= lenFile())) {
                throw new KaitaiStream.ValidationGreaterThanError(lenFile(), this.ofsImageData, this._io, "/types/pif_header/seq/2");
            }
        }

        public void _fetchInstances() {
        }
        private Integer ofsImageDataMin;
        public Integer ofsImageDataMin() {
            if (this.ofsImageDataMin != null)
                return this.ofsImageDataMin;
            this.ofsImageDataMin = ((Number) (12 + 16)).intValue();
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
    public PifHeader fileHeader() { return fileHeader; }
    public InformationHeader infoHeader() { return infoHeader; }
    public ColorTableData colorTable() { return colorTable; }
    public Pif _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

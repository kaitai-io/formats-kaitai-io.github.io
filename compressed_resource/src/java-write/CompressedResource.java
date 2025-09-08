// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Arrays;


/**
 * Compressed Macintosh resource data,
 * as stored in resources with the "compressed" attribute.
 * 
 * Resource decompression is not documented by Apple.
 * It is mostly used internally in System 7,
 * some of Apple's own applications (such as ResEdit),
 * and also by some third-party applications.
 * Later versions of Classic Mac OS make less use of resource compression,
 * but still support it fully for backwards compatibility.
 * Carbon in Mac OS X no longer supports resource compression in any way.
 * 
 * The data of all compressed resources starts with a common header,
 * followed by the compressed data.
 * The data is decompressed using code in a `'dcmp'` resource.
 * Some decompressors used by Apple are included in the System file,
 * but applications can also include custom decompressors.
 * The header of the compressed data indicates the ID of the `'dcmp'` resource used to decompress the data,
 * along with some parameters for the decompressor.
 * @see <a href="http://www.alysis.us/arctechnology.htm">Source</a>
 * @see <a href="http://preserve.mactech.com/articles/mactech/Vol.09/09.01/ResCompression/index.html">Source</a>
 * @see <a href="https://github.com/dgelessus/python-rsrcfork/tree/f891a6e/src/rsrcfork/compress">Source</a>
 */
public class CompressedResource extends KaitaiStruct.ReadWrite {
    public static CompressedResource fromFile(String fileName) throws IOException {
        return new CompressedResource(new ByteBufferKaitaiStream(fileName));
    }
    public CompressedResource() {
        this(null, null, null);
    }

    public CompressedResource(KaitaiStream _io) {
        this(_io, null, null);
    }

    public CompressedResource(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public CompressedResource(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, CompressedResource _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new Header(this._io, this, _root);
        this.header._read();
        this.compressedData = this._io.readBytesFull();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.header._write_Seq(this._io);
        this._io.writeBytes(this.compressedData);
        if (!(this._io.isEof()))
            throw new ConsistencyError("compressed_data", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        _dirty = false;
    }

    /**
     * Compressed resource data header,
     * as stored at the start of all compressed resources.
     */
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

        public Header(KaitaiStream _io, CompressedResource _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, CompressedResource _parent, CompressedResource _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.commonPart = new CommonPart(this._io, this, _root);
            this.commonPart._read();
            this._raw_typeSpecificPartRawWithIo = this._io.readBytes(commonPart().lenHeader() - 12);
            KaitaiStream _io__raw_typeSpecificPartRawWithIo = new ByteBufferKaitaiStream(this._raw_typeSpecificPartRawWithIo);
            this.typeSpecificPartRawWithIo = new BytesWithIo(_io__raw_typeSpecificPartRawWithIo);
            this.typeSpecificPartRawWithIo._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.commonPart._fetchInstances();
            this.typeSpecificPartRawWithIo._fetchInstances();
            typeSpecificPart();
            if (this.typeSpecificPart != null) {
                switch (commonPart().headerType()) {
                case 8: {
                    ((TypeSpecificPartType8) (this.typeSpecificPart))._fetchInstances();
                    break;
                }
                case 9: {
                    ((TypeSpecificPartType9) (this.typeSpecificPart))._fetchInstances();
                    break;
                }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteTypeSpecificPart = _enabledTypeSpecificPart;
            this.commonPart._write_Seq(this._io);
            final KaitaiStream _io__raw_typeSpecificPartRawWithIo = new ByteBufferKaitaiStream(commonPart().lenHeader() - 12);
            this._io.addChildStream(_io__raw_typeSpecificPartRawWithIo);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (commonPart().lenHeader() - 12));
                final Header _this = this;
                _io__raw_typeSpecificPartRawWithIo.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_typeSpecificPartRawWithIo = _io__raw_typeSpecificPartRawWithIo.toByteArray();
                        if (_this._raw_typeSpecificPartRawWithIo.length != commonPart().lenHeader() - 12)
                            throw new ConsistencyError("raw(type_specific_part_raw_with_io)", commonPart().lenHeader() - 12, _this._raw_typeSpecificPartRawWithIo.length);
                        parent.writeBytes(_this._raw_typeSpecificPartRawWithIo);
                    }
                });
            }
            this.typeSpecificPartRawWithIo._write_Seq(_io__raw_typeSpecificPartRawWithIo);
        }

        public void _check() {
            if (!Objects.equals(this.commonPart._root(), _root()))
                throw new ConsistencyError("common_part", _root(), this.commonPart._root());
            if (!Objects.equals(this.commonPart._parent(), this))
                throw new ConsistencyError("common_part", this, this.commonPart._parent());
            if (_enabledTypeSpecificPart) {
                switch (commonPart().headerType()) {
                case 8: {
                    if (!Objects.equals(((CompressedResource.Header.TypeSpecificPartType8) (this.typeSpecificPart))._root(), _root()))
                        throw new ConsistencyError("type_specific_part", _root(), ((CompressedResource.Header.TypeSpecificPartType8) (this.typeSpecificPart))._root());
                    if (!Objects.equals(((CompressedResource.Header.TypeSpecificPartType8) (this.typeSpecificPart))._parent(), this))
                        throw new ConsistencyError("type_specific_part", this, ((CompressedResource.Header.TypeSpecificPartType8) (this.typeSpecificPart))._parent());
                    break;
                }
                case 9: {
                    if (!Objects.equals(((CompressedResource.Header.TypeSpecificPartType9) (this.typeSpecificPart))._root(), _root()))
                        throw new ConsistencyError("type_specific_part", _root(), ((CompressedResource.Header.TypeSpecificPartType9) (this.typeSpecificPart))._root());
                    if (!Objects.equals(((CompressedResource.Header.TypeSpecificPartType9) (this.typeSpecificPart))._parent(), this))
                        throw new ConsistencyError("type_specific_part", this, ((CompressedResource.Header.TypeSpecificPartType9) (this.typeSpecificPart))._parent());
                    break;
                }
                }
            }
            _dirty = false;
        }

        /**
         * The common part of a compressed resource data header.
         * The format of this part is the same for all compressed resources.
         */
        public static class CommonPart extends KaitaiStruct.ReadWrite {
            public static CommonPart fromFile(String fileName) throws IOException {
                return new CommonPart(new ByteBufferKaitaiStream(fileName));
            }
            public CommonPart() {
                this(null, null, null);
            }

            public CommonPart(KaitaiStream _io) {
                this(_io, null, null);
            }

            public CommonPart(KaitaiStream _io, CompressedResource.Header _parent) {
                this(_io, _parent, null);
            }

            public CommonPart(KaitaiStream _io, CompressedResource.Header _parent, CompressedResource _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.magic = this._io.readBytes(4);
                if (!(Arrays.equals(this.magic, new byte[] { -88, -97, 101, 114 }))) {
                    throw new KaitaiStream.ValidationNotEqualError(new byte[] { -88, -97, 101, 114 }, this.magic, this._io, "/types/header/types/common_part/seq/0");
                }
                this.lenHeader = this._io.readU2be();
                if (!(this.lenHeader == 18)) {
                    throw new KaitaiStream.ValidationNotEqualError(18, this.lenHeader, this._io, "/types/header/types/common_part/seq/1");
                }
                this.headerType = this._io.readU1();
                this.unknown = this._io.readU1();
                if (!(this.unknown == 1)) {
                    throw new KaitaiStream.ValidationNotEqualError(1, this.unknown, this._io, "/types/header/types/common_part/seq/3");
                }
                this.lenDecompressed = this._io.readU4be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBytes(this.magic);
                this._io.writeU2be(this.lenHeader);
                this._io.writeU1(this.headerType);
                this._io.writeU1(this.unknown);
                this._io.writeU4be(this.lenDecompressed);
            }

            public void _check() {
                if (this.magic.length != 4)
                    throw new ConsistencyError("magic", 4, this.magic.length);
                if (!(Arrays.equals(this.magic, new byte[] { -88, -97, 101, 114 }))) {
                    throw new KaitaiStream.ValidationNotEqualError(new byte[] { -88, -97, 101, 114 }, this.magic, null, "/types/header/types/common_part/seq/0");
                }
                if (!(this.lenHeader == 18)) {
                    throw new KaitaiStream.ValidationNotEqualError(18, this.lenHeader, null, "/types/header/types/common_part/seq/1");
                }
                if (!(this.unknown == 1)) {
                    throw new KaitaiStream.ValidationNotEqualError(1, this.unknown, null, "/types/header/types/common_part/seq/3");
                }
                _dirty = false;
            }
            private byte[] magic;
            private int lenHeader;
            private int headerType;
            private int unknown;
            private long lenDecompressed;
            private CompressedResource _root;
            private CompressedResource.Header _parent;

            /**
             * The signature of all compressed resource data.
             * 
             * When interpreted as MacRoman, this byte sequence decodes to `®üer`.
             */
            public byte[] magic() { return magic; }
            public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

            /**
             * The byte length of the entire header (common and type-specific parts).
             * 
             * The meaning of this field is mostly a guess,
             * as all known header types result in a total length of `0x12`.
             */
            public int lenHeader() { return lenHeader; }
            public void setLenHeader(int _v) { _dirty = true; lenHeader = _v; }

            /**
             * Type of the header.
             * This determines the format of the data in the type-specific part of the header.
             * 
             * The only known header type values are `8` and `9`.
             * 
             * Every known decompressor is only compatible with one of the header types
             * (but every header type is used by more than one decompressor).
             * Apple's decompressors with IDs 0 and 1 use header type 8,
             * and those with IDs 2 and 3 use header type 9.
             */
            public int headerType() { return headerType; }
            public void setHeaderType(int _v) { _dirty = true; headerType = _v; }

            /**
             * The meaning of this field is not known.
             * It has the value `0x01` in all known compressed resources.
             */
            public int unknown() { return unknown; }
            public void setUnknown(int _v) { _dirty = true; unknown = _v; }

            /**
             * The byte length of the data after decompression.
             */
            public long lenDecompressed() { return lenDecompressed; }
            public void setLenDecompressed(long _v) { _dirty = true; lenDecompressed = _v; }
            public CompressedResource _root() { return _root; }
            public void set_root(CompressedResource _v) { _dirty = true; _root = _v; }
            public CompressedResource.Header _parent() { return _parent; }
            public void set_parent(CompressedResource.Header _v) { _dirty = true; _parent = _v; }
        }

        /**
         * The type-specific part of a compressed resource header with header type `8`.
         */
        public static class TypeSpecificPartType8 extends KaitaiStruct.ReadWrite {
            public static TypeSpecificPartType8 fromFile(String fileName) throws IOException {
                return new TypeSpecificPartType8(new ByteBufferKaitaiStream(fileName));
            }
            public TypeSpecificPartType8() {
                this(null, null, null);
            }

            public TypeSpecificPartType8(KaitaiStream _io) {
                this(_io, null, null);
            }

            public TypeSpecificPartType8(KaitaiStream _io, CompressedResource.Header _parent) {
                this(_io, _parent, null);
            }

            public TypeSpecificPartType8(KaitaiStream _io, CompressedResource.Header _parent, CompressedResource _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.workingBufferFractionalSize = this._io.readU1();
                this.expansionBufferSize = this._io.readU1();
                this.decompressorId = this._io.readS2be();
                this.reserved = this._io.readU2be();
                if (!(this.reserved == 0)) {
                    throw new KaitaiStream.ValidationNotEqualError(0, this.reserved, this._io, "/types/header/types/type_specific_part_type_8/seq/3");
                }
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.workingBufferFractionalSize);
                this._io.writeU1(this.expansionBufferSize);
                this._io.writeS2be(this.decompressorId);
                this._io.writeU2be(this.reserved);
            }

            public void _check() {
                if (!(this.reserved == 0)) {
                    throw new KaitaiStream.ValidationNotEqualError(0, this.reserved, null, "/types/header/types/type_specific_part_type_8/seq/3");
                }
                _dirty = false;
            }
            private int workingBufferFractionalSize;
            private int expansionBufferSize;
            private short decompressorId;
            private int reserved;
            private CompressedResource _root;
            private CompressedResource.Header _parent;

            /**
             * The ratio of the compressed data size to the uncompressed data size,
             * times 256.
             * 
             * This parameter affects the amount of memory allocated by the Resource Manager during decompression,
             * but does not have a direct effect on the decompressor
             * (except that it will misbehave if insufficient memory is provided).
             * Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
             */
            public int workingBufferFractionalSize() { return workingBufferFractionalSize; }
            public void setWorkingBufferFractionalSize(int _v) { _dirty = true; workingBufferFractionalSize = _v; }

            /**
             * The maximum number of bytes that the compressed data might "grow" during decompression.
             * 
             * This parameter affects the amount of memory allocated by the Resource Manager during decompression,
             * but does not have a direct effect on the decompressor
             * (except that it will misbehave if insufficient memory is provided).
             * Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
             */
            public int expansionBufferSize() { return expansionBufferSize; }
            public void setExpansionBufferSize(int _v) { _dirty = true; expansionBufferSize = _v; }

            /**
             * The ID of the `'dcmp'` resource that should be used to decompress this resource.
             */
            public short decompressorId() { return decompressorId; }
            public void setDecompressorId(short _v) { _dirty = true; decompressorId = _v; }

            /**
             * The meaning of this field is not known.
             * It has the value `0` in all known compressed resources,
             * so it is most likely reserved.
             */
            public int reserved() { return reserved; }
            public void setReserved(int _v) { _dirty = true; reserved = _v; }
            public CompressedResource _root() { return _root; }
            public void set_root(CompressedResource _v) { _dirty = true; _root = _v; }
            public CompressedResource.Header _parent() { return _parent; }
            public void set_parent(CompressedResource.Header _v) { _dirty = true; _parent = _v; }
        }

        /**
         * The type-specific part of a compressed resource header with header type `9`.
         */
        public static class TypeSpecificPartType9 extends KaitaiStruct.ReadWrite {
            public static TypeSpecificPartType9 fromFile(String fileName) throws IOException {
                return new TypeSpecificPartType9(new ByteBufferKaitaiStream(fileName));
            }
            public TypeSpecificPartType9() {
                this(null, null, null);
            }

            public TypeSpecificPartType9(KaitaiStream _io) {
                this(_io, null, null);
            }

            public TypeSpecificPartType9(KaitaiStream _io, CompressedResource.Header _parent) {
                this(_io, _parent, null);
            }

            public TypeSpecificPartType9(KaitaiStream _io, CompressedResource.Header _parent, CompressedResource _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.decompressorId = this._io.readS2be();
                this._raw_decompressorSpecificParametersWithIo = this._io.readBytes(4);
                KaitaiStream _io__raw_decompressorSpecificParametersWithIo = new ByteBufferKaitaiStream(this._raw_decompressorSpecificParametersWithIo);
                this.decompressorSpecificParametersWithIo = new BytesWithIo(_io__raw_decompressorSpecificParametersWithIo);
                this.decompressorSpecificParametersWithIo._read();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.decompressorSpecificParametersWithIo._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeS2be(this.decompressorId);
                final KaitaiStream _io__raw_decompressorSpecificParametersWithIo = new ByteBufferKaitaiStream(4);
                this._io.addChildStream(_io__raw_decompressorSpecificParametersWithIo);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (4));
                    final TypeSpecificPartType9 _this = this;
                    _io__raw_decompressorSpecificParametersWithIo.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_decompressorSpecificParametersWithIo = _io__raw_decompressorSpecificParametersWithIo.toByteArray();
                            if (_this._raw_decompressorSpecificParametersWithIo.length != 4)
                                throw new ConsistencyError("raw(decompressor_specific_parameters_with_io)", 4, _this._raw_decompressorSpecificParametersWithIo.length);
                            parent.writeBytes(_this._raw_decompressorSpecificParametersWithIo);
                        }
                    });
                }
                this.decompressorSpecificParametersWithIo._write_Seq(_io__raw_decompressorSpecificParametersWithIo);
            }

            public void _check() {
                _dirty = false;
            }
            private byte[] decompressorSpecificParameters;

            /**
             * Decompressor-specific parameters.
             * The exact structure and meaning of this field is different for each decompressor.
             * 
             * This field always has the same length,
             * but decompressors don't always use the entirety of the field,
             * so depending on the decompressor some parts of this field may be meaningless.
             */
            public byte[] decompressorSpecificParameters() {
                if (this.decompressorSpecificParameters != null)
                    return this.decompressorSpecificParameters;
                this.decompressorSpecificParameters = decompressorSpecificParametersWithIo().data();
                return this.decompressorSpecificParameters;
            }
            public void _invalidateDecompressorSpecificParameters() { this.decompressorSpecificParameters = null; }
            private short decompressorId;
            private BytesWithIo decompressorSpecificParametersWithIo;
            private CompressedResource _root;
            private CompressedResource.Header _parent;
            private byte[] _raw_decompressorSpecificParametersWithIo;

            /**
             * The ID of the `'dcmp'` resource that should be used to decompress this resource.
             */
            public short decompressorId() { return decompressorId; }
            public void setDecompressorId(short _v) { _dirty = true; decompressorId = _v; }

            /**
             * Use `decompressor_specific_parameters` instead,
             * unless you need access to this field's `_io`.
             */
            public BytesWithIo decompressorSpecificParametersWithIo() { return decompressorSpecificParametersWithIo; }
            public void setDecompressorSpecificParametersWithIo(BytesWithIo _v) { _dirty = true; decompressorSpecificParametersWithIo = _v; }
            public CompressedResource _root() { return _root; }
            public void set_root(CompressedResource _v) { _dirty = true; _root = _v; }
            public CompressedResource.Header _parent() { return _parent; }
            public void set_parent(CompressedResource.Header _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_decompressorSpecificParametersWithIo() { return _raw_decompressorSpecificParametersWithIo; }
            public void set_raw_DecompressorSpecificParametersWithIo(byte[] _v) { _dirty = true; _raw_decompressorSpecificParametersWithIo = _v; }
        }
        private KaitaiStruct.ReadWrite typeSpecificPart;
        private boolean _shouldWriteTypeSpecificPart = false;
        private boolean _enabledTypeSpecificPart = true;

        /**
         * The type-specific part of the header,
         * parsed according to the type from the common part.
         */
        public KaitaiStruct.ReadWrite typeSpecificPart() {
            if (_shouldWriteTypeSpecificPart)
                _writeTypeSpecificPart();
            if (this.typeSpecificPart != null)
                return this.typeSpecificPart;
            if (!_enabledTypeSpecificPart)
                return null;
            KaitaiStream io = typeSpecificPartRawWithIo()._io();
            long _pos = io.pos();
            io.seek(0);
            switch (commonPart().headerType()) {
            case 8: {
                this.typeSpecificPart = new TypeSpecificPartType8(io, this, _root);
                ((TypeSpecificPartType8) (this.typeSpecificPart))._read();
                break;
            }
            case 9: {
                this.typeSpecificPart = new TypeSpecificPartType9(io, this, _root);
                ((TypeSpecificPartType9) (this.typeSpecificPart))._read();
                break;
            }
            }
            io.seek(_pos);
            return this.typeSpecificPart;
        }
        public void setTypeSpecificPart(KaitaiStruct.ReadWrite _v) { _dirty = true; typeSpecificPart = _v; }
        public void setTypeSpecificPart_Enabled(boolean _v) { _dirty = true; _enabledTypeSpecificPart = _v; }

        private void _writeTypeSpecificPart() {
            _shouldWriteTypeSpecificPart = false;
            KaitaiStream io = typeSpecificPartRawWithIo()._io();
            long _pos = io.pos();
            io.seek(0);
            switch (commonPart().headerType()) {
            case 8: {
                ((TypeSpecificPartType8) (this.typeSpecificPart))._write_Seq(io);
                break;
            }
            case 9: {
                ((TypeSpecificPartType9) (this.typeSpecificPart))._write_Seq(io);
                break;
            }
            }
            io.seek(_pos);
        }
        private byte[] typeSpecificPartRaw;

        /**
         * The type-specific part of the header,
         * as a raw byte array.
         */
        public byte[] typeSpecificPartRaw() {
            if (this.typeSpecificPartRaw != null)
                return this.typeSpecificPartRaw;
            this.typeSpecificPartRaw = typeSpecificPartRawWithIo().data();
            return this.typeSpecificPartRaw;
        }
        public void _invalidateTypeSpecificPartRaw() { this.typeSpecificPartRaw = null; }
        private CommonPart commonPart;
        private BytesWithIo typeSpecificPartRawWithIo;
        private CompressedResource _root;
        private CompressedResource _parent;
        private byte[] _raw_typeSpecificPartRawWithIo;

        /**
         * The common part of the header.
         * Among other things,
         * this part contains the header type,
         * which determines the format of the data in the type-specific part of the header.
         */
        public CommonPart commonPart() { return commonPart; }
        public void setCommonPart(CommonPart _v) { _dirty = true; commonPart = _v; }

        /**
         * Use `type_specific_part_raw` instead,
         * unless you need access to this field's `_io`.
         */
        public BytesWithIo typeSpecificPartRawWithIo() { return typeSpecificPartRawWithIo; }
        public void setTypeSpecificPartRawWithIo(BytesWithIo _v) { _dirty = true; typeSpecificPartRawWithIo = _v; }
        public CompressedResource _root() { return _root; }
        public void set_root(CompressedResource _v) { _dirty = true; _root = _v; }
        public CompressedResource _parent() { return _parent; }
        public void set_parent(CompressedResource _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_typeSpecificPartRawWithIo() { return _raw_typeSpecificPartRawWithIo; }
        public void set_raw_TypeSpecificPartRawWithIo(byte[] _v) { _dirty = true; _raw_typeSpecificPartRawWithIo = _v; }
    }
    private Header header;
    private byte[] compressedData;
    private CompressedResource _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * The header of the compressed data.
     */
    public Header header() { return header; }
    public void setHeader(Header _v) { _dirty = true; header = _v; }

    /**
     * The compressed resource data.
     * 
     * The format of this data is completely dependent on the decompressor and its parameters,
     * as specified in the header.
     * For details about the compressed data formats implemented by Apple's decompressors,
     * see the specs in the resource_compression subdirectory.
     */
    public byte[] compressedData() { return compressedData; }
    public void setCompressedData(byte[] _v) { _dirty = true; compressedData = _v; }
    public CompressedResource _root() { return _root; }
    public void set_root(CompressedResource _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
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
public class CompressedResource extends KaitaiStruct {
    public static CompressedResource fromFile(String fileName) throws IOException {
        return new CompressedResource(new ByteBufferKaitaiStream(fileName));
    }

    public CompressedResource(KaitaiStream _io) {
        this(_io, null, null);
    }

    public CompressedResource(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public CompressedResource(KaitaiStream _io, KaitaiStruct _parent, CompressedResource _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new Header(this._io, this, _root);
        this.compressedData = this._io.readBytesFull();
    }

    /**
     * Compressed resource data header,
     * as stored at the start of all compressed resources.
     */
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.commonPart = new CommonPart(this._io, this, _root);
            this._raw_typeSpecificPartRawWithIo = this._io.readBytes((commonPart().lenHeader() - 12));
            KaitaiStream _io__raw_typeSpecificPartRawWithIo = new ByteBufferKaitaiStream(_raw_typeSpecificPartRawWithIo);
            this.typeSpecificPartRawWithIo = new BytesWithIo(_io__raw_typeSpecificPartRawWithIo);
        }

        /**
         * The common part of a compressed resource data header.
         * The format of this part is the same for all compressed resources.
         */
        public static class CommonPart extends KaitaiStruct {
            public static CommonPart fromFile(String fileName) throws IOException {
                return new CommonPart(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.magic = this._io.readBytes(4);
                if (!(Arrays.equals(magic(), new byte[] { -88, -97, 101, 114 }))) {
                    throw new KaitaiStream.ValidationNotEqualError(new byte[] { -88, -97, 101, 114 }, magic(), _io(), "/types/header/types/common_part/seq/0");
                }
                this.lenHeader = this._io.readU2be();
                if (!(lenHeader() == 18)) {
                    throw new KaitaiStream.ValidationNotEqualError(18, lenHeader(), _io(), "/types/header/types/common_part/seq/1");
                }
                this.headerType = this._io.readU1();
                this.unknown = this._io.readU1();
                if (!(unknown() == 1)) {
                    throw new KaitaiStream.ValidationNotEqualError(1, unknown(), _io(), "/types/header/types/common_part/seq/3");
                }
                this.lenDecompressed = this._io.readU4be();
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

            /**
             * The byte length of the entire header (common and type-specific parts).
             * 
             * The meaning of this field is mostly a guess,
             * as all known header types result in a total length of `0x12`.
             */
            public int lenHeader() { return lenHeader; }

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

            /**
             * The meaning of this field is not known.
             * It has the value `0x01` in all known compressed resources.
             */
            public int unknown() { return unknown; }

            /**
             * The byte length of the data after decompression.
             */
            public long lenDecompressed() { return lenDecompressed; }
            public CompressedResource _root() { return _root; }
            public CompressedResource.Header _parent() { return _parent; }
        }

        /**
         * The type-specific part of a compressed resource header with header type `8`.
         */
        public static class TypeSpecificPartType8 extends KaitaiStruct {
            public static TypeSpecificPartType8 fromFile(String fileName) throws IOException {
                return new TypeSpecificPartType8(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.workingBufferFractionalSize = this._io.readU1();
                this.expansionBufferSize = this._io.readU1();
                this.decompressorId = this._io.readS2be();
                this.reserved = this._io.readU2be();
                if (!(reserved() == 0)) {
                    throw new KaitaiStream.ValidationNotEqualError(0, reserved(), _io(), "/types/header/types/type_specific_part_type_8/seq/3");
                }
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

            /**
             * The maximum number of bytes that the compressed data might "grow" during decompression.
             * 
             * This parameter affects the amount of memory allocated by the Resource Manager during decompression,
             * but does not have a direct effect on the decompressor
             * (except that it will misbehave if insufficient memory is provided).
             * Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
             */
            public int expansionBufferSize() { return expansionBufferSize; }

            /**
             * The ID of the `'dcmp'` resource that should be used to decompress this resource.
             */
            public short decompressorId() { return decompressorId; }

            /**
             * The meaning of this field is not known.
             * It has the value `0` in all known compressed resources,
             * so it is most likely reserved.
             */
            public int reserved() { return reserved; }
            public CompressedResource _root() { return _root; }
            public CompressedResource.Header _parent() { return _parent; }
        }

        /**
         * The type-specific part of a compressed resource header with header type `9`.
         */
        public static class TypeSpecificPartType9 extends KaitaiStruct {
            public static TypeSpecificPartType9 fromFile(String fileName) throws IOException {
                return new TypeSpecificPartType9(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.decompressorId = this._io.readS2be();
                this._raw_decompressorSpecificParametersWithIo = this._io.readBytes(4);
                KaitaiStream _io__raw_decompressorSpecificParametersWithIo = new ByteBufferKaitaiStream(_raw_decompressorSpecificParametersWithIo);
                this.decompressorSpecificParametersWithIo = new BytesWithIo(_io__raw_decompressorSpecificParametersWithIo);
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
            private short decompressorId;
            private BytesWithIo decompressorSpecificParametersWithIo;
            private CompressedResource _root;
            private CompressedResource.Header _parent;
            private byte[] _raw_decompressorSpecificParametersWithIo;

            /**
             * The ID of the `'dcmp'` resource that should be used to decompress this resource.
             */
            public short decompressorId() { return decompressorId; }

            /**
             * Use `decompressor_specific_parameters` instead,
             * unless you need access to this field's `_io`.
             */
            public BytesWithIo decompressorSpecificParametersWithIo() { return decompressorSpecificParametersWithIo; }
            public CompressedResource _root() { return _root; }
            public CompressedResource.Header _parent() { return _parent; }
            public byte[] _raw_decompressorSpecificParametersWithIo() { return _raw_decompressorSpecificParametersWithIo; }
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
        private KaitaiStruct typeSpecificPart;

        /**
         * The type-specific part of the header,
         * parsed according to the type from the common part.
         */
        public KaitaiStruct typeSpecificPart() {
            if (this.typeSpecificPart != null)
                return this.typeSpecificPart;
            KaitaiStream io = typeSpecificPartRawWithIo()._io();
            long _pos = io.pos();
            io.seek(0);
            switch (commonPart().headerType()) {
            case 8: {
                this.typeSpecificPart = new TypeSpecificPartType8(io, this, _root);
                break;
            }
            case 9: {
                this.typeSpecificPart = new TypeSpecificPartType9(io, this, _root);
                break;
            }
            }
            io.seek(_pos);
            return this.typeSpecificPart;
        }
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

        /**
         * Use `type_specific_part_raw` instead,
         * unless you need access to this field's `_io`.
         */
        public BytesWithIo typeSpecificPartRawWithIo() { return typeSpecificPartRawWithIo; }
        public CompressedResource _root() { return _root; }
        public CompressedResource _parent() { return _parent; }
        public byte[] _raw_typeSpecificPartRawWithIo() { return _raw_typeSpecificPartRawWithIo; }
    }
    private Header header;
    private byte[] compressedData;
    private CompressedResource _root;
    private KaitaiStruct _parent;

    /**
     * The header of the compressed data.
     */
    public Header header() { return header; }

    /**
     * The compressed resource data.
     * 
     * The format of this data is completely dependent on the decompressor and its parameters,
     * as specified in the header.
     * For details about the compressed data formats implemented by Apple's decompressors,
     * see the specs in the resource_compression subdirectory.
     */
    public byte[] compressedData() { return compressedData; }
    public CompressedResource _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

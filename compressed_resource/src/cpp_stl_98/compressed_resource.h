#ifndef COMPRESSED_RESOURCE_H_
#define COMPRESSED_RESOURCE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "bytes_with_io.h"

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif
class bytes_with_io_t;

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
 * \sa http://www.alysis.us/arctechnology.htm Source
 * \sa http://preserve.mactech.com/articles/mactech/Vol.09/09.01/ResCompression/index.html Source
 * \sa https://github.com/dgelessus/python-rsrcfork/tree/f891a6e/src/rsrcfork/compress Source
 */

class compressed_resource_t : public kaitai::kstruct {

public:
    class header_t;

    compressed_resource_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, compressed_resource_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~compressed_resource_t();

    /**
     * Compressed resource data header,
     * as stored at the start of all compressed resources.
     */

    class header_t : public kaitai::kstruct {

    public:
        class common_part_t;
        class type_specific_part_type_8_t;
        class type_specific_part_type_9_t;

        header_t(kaitai::kstream* p__io, compressed_resource_t* p__parent = 0, compressed_resource_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

        /**
         * The common part of a compressed resource data header.
         * The format of this part is the same for all compressed resources.
         */

        class common_part_t : public kaitai::kstruct {

        public:

            common_part_t(kaitai::kstream* p__io, compressed_resource_t::header_t* p__parent = 0, compressed_resource_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~common_part_t();

        private:
            std::string m_magic;
            uint16_t m_len_header;
            uint8_t m_header_type;
            uint8_t m_unknown;
            uint32_t m_len_decompressed;
            compressed_resource_t* m__root;
            compressed_resource_t::header_t* m__parent;

        public:

            /**
             * The signature of all compressed resource data.
             * 
             * When interpreted as MacRoman, this byte sequence decodes to `®üer`.
             */
            std::string magic() const { return m_magic; }

            /**
             * The byte length of the entire header (common and type-specific parts).
             * 
             * The meaning of this field is mostly a guess,
             * as all known header types result in a total length of `0x12`.
             */
            uint16_t len_header() const { return m_len_header; }

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
            uint8_t header_type() const { return m_header_type; }

            /**
             * The meaning of this field is not known.
             * It has the value `0x01` in all known compressed resources.
             */
            uint8_t unknown() const { return m_unknown; }

            /**
             * The byte length of the data after decompression.
             */
            uint32_t len_decompressed() const { return m_len_decompressed; }
            compressed_resource_t* _root() const { return m__root; }
            compressed_resource_t::header_t* _parent() const { return m__parent; }
        };

        /**
         * The type-specific part of a compressed resource header with header type `8`.
         */

        class type_specific_part_type_8_t : public kaitai::kstruct {

        public:

            type_specific_part_type_8_t(kaitai::kstream* p__io, compressed_resource_t::header_t* p__parent = 0, compressed_resource_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~type_specific_part_type_8_t();

        private:
            uint8_t m_working_buffer_fractional_size;
            uint8_t m_expansion_buffer_size;
            int16_t m_decompressor_id;
            uint16_t m_reserved;
            compressed_resource_t* m__root;
            compressed_resource_t::header_t* m__parent;

        public:

            /**
             * The ratio of the compressed data size to the uncompressed data size,
             * times 256.
             * 
             * This parameter affects the amount of memory allocated by the Resource Manager during decompression,
             * but does not have a direct effect on the decompressor
             * (except that it will misbehave if insufficient memory is provided).
             * Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
             */
            uint8_t working_buffer_fractional_size() const { return m_working_buffer_fractional_size; }

            /**
             * The maximum number of bytes that the compressed data might "grow" during decompression.
             * 
             * This parameter affects the amount of memory allocated by the Resource Manager during decompression,
             * but does not have a direct effect on the decompressor
             * (except that it will misbehave if insufficient memory is provided).
             * Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
             */
            uint8_t expansion_buffer_size() const { return m_expansion_buffer_size; }

            /**
             * The ID of the `'dcmp'` resource that should be used to decompress this resource.
             */
            int16_t decompressor_id() const { return m_decompressor_id; }

            /**
             * The meaning of this field is not known.
             * It has the value `0` in all known compressed resources,
             * so it is most likely reserved.
             */
            uint16_t reserved() const { return m_reserved; }
            compressed_resource_t* _root() const { return m__root; }
            compressed_resource_t::header_t* _parent() const { return m__parent; }
        };

        /**
         * The type-specific part of a compressed resource header with header type `9`.
         */

        class type_specific_part_type_9_t : public kaitai::kstruct {

        public:

            type_specific_part_type_9_t(kaitai::kstream* p__io, compressed_resource_t::header_t* p__parent = 0, compressed_resource_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~type_specific_part_type_9_t();

        private:
            bool f_decompressor_specific_parameters;
            std::string m_decompressor_specific_parameters;

        public:

            /**
             * Decompressor-specific parameters.
             * The exact structure and meaning of this field is different for each decompressor.
             * 
             * This field always has the same length,
             * but decompressors don't always use the entirety of the field,
             * so depending on the decompressor some parts of this field may be meaningless.
             */
            std::string decompressor_specific_parameters();

        private:
            int16_t m_decompressor_id;
            bytes_with_io_t* m_decompressor_specific_parameters_with_io;
            compressed_resource_t* m__root;
            compressed_resource_t::header_t* m__parent;
            std::string m__raw_decompressor_specific_parameters_with_io;
            kaitai::kstream* m__io__raw_decompressor_specific_parameters_with_io;

        public:

            /**
             * The ID of the `'dcmp'` resource that should be used to decompress this resource.
             */
            int16_t decompressor_id() const { return m_decompressor_id; }

            /**
             * Use `decompressor_specific_parameters` instead,
             * unless you need access to this field's `_io`.
             */
            bytes_with_io_t* decompressor_specific_parameters_with_io() const { return m_decompressor_specific_parameters_with_io; }
            compressed_resource_t* _root() const { return m__root; }
            compressed_resource_t::header_t* _parent() const { return m__parent; }
            std::string _raw_decompressor_specific_parameters_with_io() const { return m__raw_decompressor_specific_parameters_with_io; }
            kaitai::kstream* _io__raw_decompressor_specific_parameters_with_io() const { return m__io__raw_decompressor_specific_parameters_with_io; }
        };

    private:
        bool f_type_specific_part_raw;
        std::string m_type_specific_part_raw;

    public:

        /**
         * The type-specific part of the header,
         * as a raw byte array.
         */
        std::string type_specific_part_raw();

    private:
        bool f_type_specific_part;
        kaitai::kstruct* m_type_specific_part;
        bool n_type_specific_part;

    public:
        bool _is_null_type_specific_part() { type_specific_part(); return n_type_specific_part; };

    private:

    public:

        /**
         * The type-specific part of the header,
         * parsed according to the type from the common part.
         */
        kaitai::kstruct* type_specific_part();

    private:
        common_part_t* m_common_part;
        bytes_with_io_t* m_type_specific_part_raw_with_io;
        compressed_resource_t* m__root;
        compressed_resource_t* m__parent;
        std::string m__raw_type_specific_part_raw_with_io;
        kaitai::kstream* m__io__raw_type_specific_part_raw_with_io;

    public:

        /**
         * The common part of the header.
         * Among other things,
         * this part contains the header type,
         * which determines the format of the data in the type-specific part of the header.
         */
        common_part_t* common_part() const { return m_common_part; }

        /**
         * Use `type_specific_part_raw` instead,
         * unless you need access to this field's `_io`.
         */
        bytes_with_io_t* type_specific_part_raw_with_io() const { return m_type_specific_part_raw_with_io; }
        compressed_resource_t* _root() const { return m__root; }
        compressed_resource_t* _parent() const { return m__parent; }
        std::string _raw_type_specific_part_raw_with_io() const { return m__raw_type_specific_part_raw_with_io; }
        kaitai::kstream* _io__raw_type_specific_part_raw_with_io() const { return m__io__raw_type_specific_part_raw_with_io; }
    };

private:
    header_t* m_header;
    std::string m_compressed_data;
    compressed_resource_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * The header of the compressed data.
     */
    header_t* header() const { return m_header; }

    /**
     * The compressed resource data.
     * 
     * The format of this data is completely dependent on the decompressor and its parameters,
     * as specified in the header.
     * For details about the compressed data formats implemented by Apple's decompressors,
     * see the specs in the resource_compression subdirectory.
     */
    std::string compressed_data() const { return m_compressed_data; }
    compressed_resource_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // COMPRESSED_RESOURCE_H_

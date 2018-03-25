#ifndef MACH_O_H_
#define MACH_O_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class mach_o_t : public kaitai::kstruct {

public:
    class rpath_command_t;
    class uleb128_t;
    class source_version_command_t;
    class cs_blob_t;
    class routines_command_t;
    class macho_flags_t;
    class routines_command_64_t;
    class linker_option_command_t;
    class segment_command_64_t;
    class vm_prot_t;
    class dysymtab_command_t;
    class mach_header_t;
    class linkedit_data_command_t;
    class sub_command_t;
    class twolevel_hints_command_t;
    class version_t;
    class encryption_info_command_t;
    class code_signature_command_t;
    class dyld_info_command_t;
    class dylinker_command_t;
    class dylib_command_t;
    class lc_str_t;
    class load_command_t;
    class uuid_command_t;
    class symtab_command_t;
    class version_min_command_t;
    class entry_point_command_t;

    enum magic_type_t {
        MAGIC_TYPE_FAT_LE = 3199925962,
        MAGIC_TYPE_FAT_BE = 3405691582,
        MAGIC_TYPE_MACHO_LE_X86 = 3472551422,
        MAGIC_TYPE_MACHO_LE_X64 = 3489328638,
        MAGIC_TYPE_MACHO_BE_X86 = 4277009102,
        MAGIC_TYPE_MACHO_BE_X64 = 4277009103
    };

    enum cpu_type_t {
        CPU_TYPE_VAX = 1,
        CPU_TYPE_ROMP = 2,
        CPU_TYPE_NS32032 = 4,
        CPU_TYPE_NS32332 = 5,
        CPU_TYPE_I386 = 7,
        CPU_TYPE_MIPS = 8,
        CPU_TYPE_NS32532 = 9,
        CPU_TYPE_HPPA = 11,
        CPU_TYPE_ARM = 12,
        CPU_TYPE_MC88000 = 13,
        CPU_TYPE_SPARC = 14,
        CPU_TYPE_I860 = 15,
        CPU_TYPE_I860_LITTLE = 16,
        CPU_TYPE_RS6000 = 17,
        CPU_TYPE_POWERPC = 18,
        CPU_TYPE_ABI64 = 16777216,
        CPU_TYPE_X86_64 = 16777223,
        CPU_TYPE_ARM64 = 16777228,
        CPU_TYPE_POWERPC64 = 16777234,
        CPU_TYPE_ANY = 4294967295
    };

    enum file_type_t {
        FILE_TYPE_OBJECT = 1,
        FILE_TYPE_EXECUTE = 2,
        FILE_TYPE_FVMLIB = 3,
        FILE_TYPE_CORE = 4,
        FILE_TYPE_PRELOAD = 5,
        FILE_TYPE_DYLIB = 6,
        FILE_TYPE_DYLINKER = 7,
        FILE_TYPE_BUNDLE = 8,
        FILE_TYPE_DYLIB_STUB = 9,
        FILE_TYPE_DSYM = 10,
        FILE_TYPE_KEXT_BUNDLE = 11
    };

    enum load_command_type_t {
        LOAD_COMMAND_TYPE_SEGMENT = 1,
        LOAD_COMMAND_TYPE_SYMTAB = 2,
        LOAD_COMMAND_TYPE_SYMSEG = 3,
        LOAD_COMMAND_TYPE_THREAD = 4,
        LOAD_COMMAND_TYPE_UNIX_THREAD = 5,
        LOAD_COMMAND_TYPE_LOAD_FVM_LIB = 6,
        LOAD_COMMAND_TYPE_ID_FVM_LIB = 7,
        LOAD_COMMAND_TYPE_IDENT = 8,
        LOAD_COMMAND_TYPE_FVM_FILE = 9,
        LOAD_COMMAND_TYPE_PREPAGE = 10,
        LOAD_COMMAND_TYPE_DYSYMTAB = 11,
        LOAD_COMMAND_TYPE_LOAD_DYLIB = 12,
        LOAD_COMMAND_TYPE_ID_DYLIB = 13,
        LOAD_COMMAND_TYPE_LOAD_DYLINKER = 14,
        LOAD_COMMAND_TYPE_ID_DYLINKER = 15,
        LOAD_COMMAND_TYPE_PREBOUND_DYLIB = 16,
        LOAD_COMMAND_TYPE_ROUTINES = 17,
        LOAD_COMMAND_TYPE_SUB_FRAMEWORK = 18,
        LOAD_COMMAND_TYPE_SUB_UMBRELLA = 19,
        LOAD_COMMAND_TYPE_SUB_CLIENT = 20,
        LOAD_COMMAND_TYPE_SUB_LIBRARY = 21,
        LOAD_COMMAND_TYPE_TWOLEVEL_HINTS = 22,
        LOAD_COMMAND_TYPE_PREBIND_CKSUM = 23,
        LOAD_COMMAND_TYPE_SEGMENT_64 = 25,
        LOAD_COMMAND_TYPE_ROUTINES_64 = 26,
        LOAD_COMMAND_TYPE_UUID = 27,
        LOAD_COMMAND_TYPE_CODE_SIGNATURE = 29,
        LOAD_COMMAND_TYPE_SEGMENT_SPLIT_INFO = 30,
        LOAD_COMMAND_TYPE_LAZY_LOAD_DYLIB = 32,
        LOAD_COMMAND_TYPE_ENCRYPTION_INFO = 33,
        LOAD_COMMAND_TYPE_DYLD_INFO = 34,
        LOAD_COMMAND_TYPE_VERSION_MIN_MACOSX = 36,
        LOAD_COMMAND_TYPE_VERSION_MIN_IPHONEOS = 37,
        LOAD_COMMAND_TYPE_FUNCTION_STARTS = 38,
        LOAD_COMMAND_TYPE_DYLD_ENVIRONMENT = 39,
        LOAD_COMMAND_TYPE_DATA_IN_CODE = 41,
        LOAD_COMMAND_TYPE_SOURCE_VERSION = 42,
        LOAD_COMMAND_TYPE_DYLIB_CODE_SIGN_DRS = 43,
        LOAD_COMMAND_TYPE_ENCRYPTION_INFO_64 = 44,
        LOAD_COMMAND_TYPE_LINKER_OPTION = 45,
        LOAD_COMMAND_TYPE_LINKER_OPTIMIZATION_HINT = 46,
        LOAD_COMMAND_TYPE_VERSION_MIN_TVOS = 47,
        LOAD_COMMAND_TYPE_VERSION_MIN_WATCHOS = 48,
        LOAD_COMMAND_TYPE_REQ_DYLD = 2147483648,
        LOAD_COMMAND_TYPE_LOAD_WEAK_DYLIB = 2147483672,
        LOAD_COMMAND_TYPE_RPATH = 2147483676,
        LOAD_COMMAND_TYPE_REEXPORT_DYLIB = 2147483679,
        LOAD_COMMAND_TYPE_DYLD_INFO_ONLY = 2147483682,
        LOAD_COMMAND_TYPE_LOAD_UPWARD_DYLIB = 2147483683,
        LOAD_COMMAND_TYPE_MAIN = 2147483688
    };

    mach_o_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mach_o_t* p__root = 0);

private:
    void _read();

public:
    ~mach_o_t();

    class rpath_command_t : public kaitai::kstruct {

    public:

        rpath_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~rpath_command_t();

    private:
        uint32_t m_path_offset;
        std::string m_path;
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;

    public:
        uint32_t path_offset() const { return m_path_offset; }
        std::string path() const { return m_path; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
    };

    class uleb128_t : public kaitai::kstruct {

    public:

        uleb128_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~uleb128_t();

    private:
        bool f_value;
        int32_t m_value;

    public:
        int32_t value();

    private:
        uint8_t m_b1;
        uint8_t m_b2;
        bool n_b2;

    public:
        bool _is_null_b2() { b2(); return n_b2; };

    private:
        uint8_t m_b3;
        bool n_b3;

    public:
        bool _is_null_b3() { b3(); return n_b3; };

    private:
        uint8_t m_b4;
        bool n_b4;

    public:
        bool _is_null_b4() { b4(); return n_b4; };

    private:
        uint8_t m_b5;
        bool n_b5;

    public:
        bool _is_null_b5() { b5(); return n_b5; };

    private:
        uint8_t m_b6;
        bool n_b6;

    public:
        bool _is_null_b6() { b6(); return n_b6; };

    private:
        uint8_t m_b7;
        bool n_b7;

    public:
        bool _is_null_b7() { b7(); return n_b7; };

    private:
        uint8_t m_b8;
        bool n_b8;

    public:
        bool _is_null_b8() { b8(); return n_b8; };

    private:
        uint8_t m_b9;
        bool n_b9;

    public:
        bool _is_null_b9() { b9(); return n_b9; };

    private:
        uint8_t m_b10;
        bool n_b10;

    public:
        bool _is_null_b10() { b10(); return n_b10; };

    private:
        mach_o_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint8_t b1() const { return m_b1; }
        uint8_t b2() const { return m_b2; }
        uint8_t b3() const { return m_b3; }
        uint8_t b4() const { return m_b4; }
        uint8_t b5() const { return m_b5; }
        uint8_t b6() const { return m_b6; }
        uint8_t b7() const { return m_b7; }
        uint8_t b8() const { return m_b8; }
        uint8_t b9() const { return m_b9; }
        uint8_t b10() const { return m_b10; }
        mach_o_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class source_version_command_t : public kaitai::kstruct {

    public:

        source_version_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~source_version_command_t();

    private:
        uint64_t m_version;
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;

    public:
        uint64_t version() const { return m_version; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
    };

    class cs_blob_t : public kaitai::kstruct {

    public:
        class entitlement_t;
        class code_directory_t;
        class entitlements_blob_index_t;
        class data_t;
        class super_blob_t;
        class expr_t;
        class blob_index_t;
        class match_t;
        class requirement_t;
        class blob_wrapper_t;
        class entitlements_t;

        enum cs_magic_t {
            CS_MAGIC_BLOB_WRAPPER = 4208855809,
            CS_MAGIC_REQUIREMENT = 4208856064,
            CS_MAGIC_REQUIREMENTS = 4208856065,
            CS_MAGIC_CODE_DIRECTORY = 4208856066,
            CS_MAGIC_EMBEDDED_SIGNATURE = 4208856256,
            CS_MAGIC_DETACHED_SIGNATURE = 4208856257,
            CS_MAGIC_ENTITLEMENT = 4208882033
        };

        cs_blob_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~cs_blob_t();

        class entitlement_t : public kaitai::kstruct {

        public:

            entitlement_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~entitlement_t();

        private:
            std::string m_data;
            mach_o_t* m__root;
            mach_o_t::cs_blob_t* m__parent;

        public:
            std::string data() const { return m_data; }
            mach_o_t* _root() const { return m__root; }
            mach_o_t::cs_blob_t* _parent() const { return m__parent; }
        };

        class code_directory_t : public kaitai::kstruct {

        public:

            code_directory_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~code_directory_t();

        private:
            bool f_ident;
            std::string m_ident;

        public:
            std::string ident();

        private:
            bool f_team_id;
            std::string m_team_id;

        public:
            std::string team_id();

        private:
            bool f_hashes;
            std::vector<std::string>* m_hashes;

        public:
            std::vector<std::string>* hashes();

        private:
            uint32_t m_version;
            uint32_t m_flags;
            uint32_t m_hash_offset;
            uint32_t m_ident_offset;
            uint32_t m_n_special_slots;
            uint32_t m_n_code_slots;
            uint32_t m_code_limit;
            uint8_t m_hash_size;
            uint8_t m_hash_type;
            uint8_t m_spare1;
            uint8_t m_page_size;
            uint32_t m_spare2;
            uint32_t m_scatter_offset;
            bool n_scatter_offset;

        public:
            bool _is_null_scatter_offset() { scatter_offset(); return n_scatter_offset; };

        private:
            uint32_t m_team_id_offset;
            bool n_team_id_offset;

        public:
            bool _is_null_team_id_offset() { team_id_offset(); return n_team_id_offset; };

        private:
            mach_o_t* m__root;
            mach_o_t::cs_blob_t* m__parent;

        public:
            uint32_t version() const { return m_version; }
            uint32_t flags() const { return m_flags; }
            uint32_t hash_offset() const { return m_hash_offset; }
            uint32_t ident_offset() const { return m_ident_offset; }
            uint32_t n_special_slots() const { return m_n_special_slots; }
            uint32_t n_code_slots() const { return m_n_code_slots; }
            uint32_t code_limit() const { return m_code_limit; }
            uint8_t hash_size() const { return m_hash_size; }
            uint8_t hash_type() const { return m_hash_type; }
            uint8_t spare1() const { return m_spare1; }
            uint8_t page_size() const { return m_page_size; }
            uint32_t spare2() const { return m_spare2; }
            uint32_t scatter_offset() const { return m_scatter_offset; }
            uint32_t team_id_offset() const { return m_team_id_offset; }
            mach_o_t* _root() const { return m__root; }
            mach_o_t::cs_blob_t* _parent() const { return m__parent; }
        };

        class entitlements_blob_index_t : public kaitai::kstruct {

        public:

            enum requirement_type_t {
                REQUIREMENT_TYPE_HOST = 1,
                REQUIREMENT_TYPE_GUEST = 2,
                REQUIREMENT_TYPE_DESIGNATED = 3,
                REQUIREMENT_TYPE_LIBRARY = 4
            };

            entitlements_blob_index_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::entitlements_t* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~entitlements_blob_index_t();

        private:
            bool f_value;
            cs_blob_t* m_value;

        public:
            cs_blob_t* value();

        private:
            requirement_type_t m_type;
            uint32_t m_offset;
            mach_o_t* m__root;
            mach_o_t::cs_blob_t::entitlements_t* m__parent;

        public:
            requirement_type_t type() const { return m_type; }
            uint32_t offset() const { return m_offset; }
            mach_o_t* _root() const { return m__root; }
            mach_o_t::cs_blob_t::entitlements_t* _parent() const { return m__parent; }
        };

        class data_t : public kaitai::kstruct {

        public:

            data_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~data_t();

        private:
            uint32_t m_length;
            std::string m_value;
            std::string m_padding;
            mach_o_t* m__root;
            kaitai::kstruct* m__parent;

        public:
            uint32_t length() const { return m_length; }
            std::string value() const { return m_value; }
            std::string padding() const { return m_padding; }
            mach_o_t* _root() const { return m__root; }
            kaitai::kstruct* _parent() const { return m__parent; }
        };

        class super_blob_t : public kaitai::kstruct {

        public:

            super_blob_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~super_blob_t();

        private:
            uint32_t m_count;
            std::vector<blob_index_t*>* m_blobs;
            mach_o_t* m__root;
            mach_o_t::cs_blob_t* m__parent;

        public:
            uint32_t count() const { return m_count; }
            std::vector<blob_index_t*>* blobs() const { return m_blobs; }
            mach_o_t* _root() const { return m__root; }
            mach_o_t::cs_blob_t* _parent() const { return m__parent; }
        };

        class expr_t : public kaitai::kstruct {

        public:
            class info_key_field_expr_t;
            class cert_slot_expr_t;
            class cert_generic_expr_t;
            class ident_expr_t;
            class cert_field_expr_t;
            class anchor_hash_expr_t;
            class apple_generic_anchor_expr_t;
            class entitlement_field_expr_t;
            class and_expr_t;
            class or_expr_t;

            enum op_enum_t {
                OP_ENUM_FALSE = 0,
                OP_ENUM_TRUE = 1,
                OP_ENUM_IDENT = 2,
                OP_ENUM_APPLE_ANCHOR = 3,
                OP_ENUM_ANCHOR_HASH = 4,
                OP_ENUM_INFO_KEY_VALUE = 5,
                OP_ENUM_AND_OP = 6,
                OP_ENUM_OR_OP = 7,
                OP_ENUM_CD_HASH = 8,
                OP_ENUM_NOT_OP = 9,
                OP_ENUM_INFO_KEY_FIELD = 10,
                OP_ENUM_CERT_FIELD = 11,
                OP_ENUM_TRUSTED_CERT = 12,
                OP_ENUM_TRUSTED_CERTS = 13,
                OP_ENUM_CERT_GENERIC = 14,
                OP_ENUM_APPLE_GENERIC_ANCHOR = 15,
                OP_ENUM_ENTITLEMENT_FIELD = 16
            };

            enum cert_slot_t {
                CERT_SLOT_LEFT_CERT = 0,
                CERT_SLOT_ANCHOR_CERT = 4294967295
            };

            expr_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~expr_t();

            class info_key_field_expr_t : public kaitai::kstruct {

            public:

                info_key_field_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent = 0, mach_o_t* p__root = 0);

            private:
                void _read();

            public:
                ~info_key_field_expr_t();

            private:
                data_t* m_data;
                match_t* m_match;
                mach_o_t* m__root;
                mach_o_t::cs_blob_t::expr_t* m__parent;

            public:
                data_t* data() const { return m_data; }
                match_t* match() const { return m_match; }
                mach_o_t* _root() const { return m__root; }
                mach_o_t::cs_blob_t::expr_t* _parent() const { return m__parent; }
            };

            class cert_slot_expr_t : public kaitai::kstruct {

            public:

                cert_slot_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent = 0, mach_o_t* p__root = 0);

            private:
                void _read();

            public:
                ~cert_slot_expr_t();

            private:
                cert_slot_t m_value;
                mach_o_t* m__root;
                mach_o_t::cs_blob_t::expr_t* m__parent;

            public:
                cert_slot_t value() const { return m_value; }
                mach_o_t* _root() const { return m__root; }
                mach_o_t::cs_blob_t::expr_t* _parent() const { return m__parent; }
            };

            class cert_generic_expr_t : public kaitai::kstruct {

            public:

                cert_generic_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent = 0, mach_o_t* p__root = 0);

            private:
                void _read();

            public:
                ~cert_generic_expr_t();

            private:
                cert_slot_t m_cert_slot;
                data_t* m_data;
                match_t* m_match;
                mach_o_t* m__root;
                mach_o_t::cs_blob_t::expr_t* m__parent;

            public:
                cert_slot_t cert_slot() const { return m_cert_slot; }
                data_t* data() const { return m_data; }
                match_t* match() const { return m_match; }
                mach_o_t* _root() const { return m__root; }
                mach_o_t::cs_blob_t::expr_t* _parent() const { return m__parent; }
            };

            class ident_expr_t : public kaitai::kstruct {

            public:

                ident_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent = 0, mach_o_t* p__root = 0);

            private:
                void _read();

            public:
                ~ident_expr_t();

            private:
                data_t* m_identifier;
                mach_o_t* m__root;
                mach_o_t::cs_blob_t::expr_t* m__parent;

            public:
                data_t* identifier() const { return m_identifier; }
                mach_o_t* _root() const { return m__root; }
                mach_o_t::cs_blob_t::expr_t* _parent() const { return m__parent; }
            };

            class cert_field_expr_t : public kaitai::kstruct {

            public:

                cert_field_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent = 0, mach_o_t* p__root = 0);

            private:
                void _read();

            public:
                ~cert_field_expr_t();

            private:
                cert_slot_t m_cert_slot;
                data_t* m_data;
                match_t* m_match;
                mach_o_t* m__root;
                mach_o_t::cs_blob_t::expr_t* m__parent;

            public:
                cert_slot_t cert_slot() const { return m_cert_slot; }
                data_t* data() const { return m_data; }
                match_t* match() const { return m_match; }
                mach_o_t* _root() const { return m__root; }
                mach_o_t::cs_blob_t::expr_t* _parent() const { return m__parent; }
            };

            class anchor_hash_expr_t : public kaitai::kstruct {

            public:

                anchor_hash_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent = 0, mach_o_t* p__root = 0);

            private:
                void _read();

            public:
                ~anchor_hash_expr_t();

            private:
                cert_slot_t m_cert_slot;
                data_t* m_data;
                mach_o_t* m__root;
                mach_o_t::cs_blob_t::expr_t* m__parent;

            public:
                cert_slot_t cert_slot() const { return m_cert_slot; }
                data_t* data() const { return m_data; }
                mach_o_t* _root() const { return m__root; }
                mach_o_t::cs_blob_t::expr_t* _parent() const { return m__parent; }
            };

            class apple_generic_anchor_expr_t : public kaitai::kstruct {

            public:

                apple_generic_anchor_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent = 0, mach_o_t* p__root = 0);

            private:
                void _read();

            public:
                ~apple_generic_anchor_expr_t();

            private:
                bool f_value;
                std::string m_value;

            public:
                std::string value();

            private:
                mach_o_t* m__root;
                mach_o_t::cs_blob_t::expr_t* m__parent;

            public:
                mach_o_t* _root() const { return m__root; }
                mach_o_t::cs_blob_t::expr_t* _parent() const { return m__parent; }
            };

            class entitlement_field_expr_t : public kaitai::kstruct {

            public:

                entitlement_field_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent = 0, mach_o_t* p__root = 0);

            private:
                void _read();

            public:
                ~entitlement_field_expr_t();

            private:
                data_t* m_data;
                match_t* m_match;
                mach_o_t* m__root;
                mach_o_t::cs_blob_t::expr_t* m__parent;

            public:
                data_t* data() const { return m_data; }
                match_t* match() const { return m_match; }
                mach_o_t* _root() const { return m__root; }
                mach_o_t::cs_blob_t::expr_t* _parent() const { return m__parent; }
            };

            class and_expr_t : public kaitai::kstruct {

            public:

                and_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent = 0, mach_o_t* p__root = 0);

            private:
                void _read();

            public:
                ~and_expr_t();

            private:
                expr_t* m_left;
                expr_t* m_right;
                mach_o_t* m__root;
                mach_o_t::cs_blob_t::expr_t* m__parent;

            public:
                expr_t* left() const { return m_left; }
                expr_t* right() const { return m_right; }
                mach_o_t* _root() const { return m__root; }
                mach_o_t::cs_blob_t::expr_t* _parent() const { return m__parent; }
            };

            class or_expr_t : public kaitai::kstruct {

            public:

                or_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent = 0, mach_o_t* p__root = 0);

            private:
                void _read();

            public:
                ~or_expr_t();

            private:
                expr_t* m_left;
                expr_t* m_right;
                mach_o_t* m__root;
                mach_o_t::cs_blob_t::expr_t* m__parent;

            public:
                expr_t* left() const { return m_left; }
                expr_t* right() const { return m_right; }
                mach_o_t* _root() const { return m__root; }
                mach_o_t::cs_blob_t::expr_t* _parent() const { return m__parent; }
            };

        private:
            op_enum_t m_op;
            kaitai::kstruct* m_data;
            bool n_data;

        public:
            bool _is_null_data() { data(); return n_data; };

        private:
            mach_o_t* m__root;
            kaitai::kstruct* m__parent;

        public:
            op_enum_t op() const { return m_op; }
            kaitai::kstruct* data() const { return m_data; }
            mach_o_t* _root() const { return m__root; }
            kaitai::kstruct* _parent() const { return m__parent; }
        };

        class blob_index_t : public kaitai::kstruct {

        public:

            enum csslot_type_t {
                CSSLOT_TYPE_CODE_DIRECTORY = 0,
                CSSLOT_TYPE_INFO_SLOT = 1,
                CSSLOT_TYPE_REQUIREMENTS = 2,
                CSSLOT_TYPE_RESOURCE_DIR = 3,
                CSSLOT_TYPE_APPLICATION = 4,
                CSSLOT_TYPE_ENTITLEMENTS = 5,
                CSSLOT_TYPE_ALTERNATE_CODE_DIRECTORIES = 4096,
                CSSLOT_TYPE_SIGNATURE_SLOT = 65536
            };

            blob_index_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::super_blob_t* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~blob_index_t();

        private:
            bool f_blob;
            cs_blob_t* m_blob;

        public:
            cs_blob_t* blob();

        private:
            csslot_type_t m_type;
            uint32_t m_offset;
            mach_o_t* m__root;
            mach_o_t::cs_blob_t::super_blob_t* m__parent;
            std::string m__raw_blob;
            kaitai::kstream* m__io__raw_blob;

        public:
            csslot_type_t type() const { return m_type; }
            uint32_t offset() const { return m_offset; }
            mach_o_t* _root() const { return m__root; }
            mach_o_t::cs_blob_t::super_blob_t* _parent() const { return m__parent; }
            std::string _raw_blob() const { return m__raw_blob; }
            kaitai::kstream* _io__raw_blob() const { return m__io__raw_blob; }
        };

        class match_t : public kaitai::kstruct {

        public:

            enum op_t {
                OP_EXISTS = 0,
                OP_EQUAL = 1,
                OP_CONTAINS = 2,
                OP_BEGINS_WITH = 3,
                OP_ENDS_WITH = 4,
                OP_LESS_THAN = 5,
                OP_GREATER_THAN = 6,
                OP_LESS_EQUAL = 7,
                OP_GREATER_EQUAL = 8
            };

            match_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~match_t();

        private:
            op_t m_match_op;
            data_t* m_data;
            bool n_data;

        public:
            bool _is_null_data() { data(); return n_data; };

        private:
            mach_o_t* m__root;
            kaitai::kstruct* m__parent;

        public:
            op_t match_op() const { return m_match_op; }
            data_t* data() const { return m_data; }
            mach_o_t* _root() const { return m__root; }
            kaitai::kstruct* _parent() const { return m__parent; }
        };

        class requirement_t : public kaitai::kstruct {

        public:

            requirement_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~requirement_t();

        private:
            uint32_t m_kind;
            expr_t* m_expr;
            mach_o_t* m__root;
            mach_o_t::cs_blob_t* m__parent;

        public:
            uint32_t kind() const { return m_kind; }
            expr_t* expr() const { return m_expr; }
            mach_o_t* _root() const { return m__root; }
            mach_o_t::cs_blob_t* _parent() const { return m__parent; }
        };

        class blob_wrapper_t : public kaitai::kstruct {

        public:

            blob_wrapper_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~blob_wrapper_t();

        private:
            std::string m_data;
            mach_o_t* m__root;
            mach_o_t::cs_blob_t* m__parent;

        public:
            std::string data() const { return m_data; }
            mach_o_t* _root() const { return m__root; }
            mach_o_t::cs_blob_t* _parent() const { return m__parent; }
        };

        class entitlements_t : public kaitai::kstruct {

        public:

            entitlements_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~entitlements_t();

        private:
            uint32_t m_count;
            std::vector<entitlements_blob_index_t*>* m_items;
            mach_o_t* m__root;
            mach_o_t::cs_blob_t* m__parent;

        public:
            uint32_t count() const { return m_count; }
            std::vector<entitlements_blob_index_t*>* items() const { return m_items; }
            mach_o_t* _root() const { return m__root; }
            mach_o_t::cs_blob_t* _parent() const { return m__parent; }
        };

    private:
        cs_magic_t m_magic;
        uint32_t m_length;
        kaitai::kstruct* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        mach_o_t* m__root;
        kaitai::kstruct* m__parent;
        std::string m__raw_body;
        kaitai::kstream* m__io__raw_body;

    public:
        cs_magic_t magic() const { return m_magic; }
        uint32_t length() const { return m_length; }
        kaitai::kstruct* body() const { return m_body; }
        mach_o_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
    };

    class routines_command_t : public kaitai::kstruct {

    public:

        routines_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~routines_command_t();

    private:
        uint32_t m_init_address;
        uint32_t m_init_module;
        std::string m_reserved;
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;

    public:
        uint32_t init_address() const { return m_init_address; }
        uint32_t init_module() const { return m_init_module; }
        std::string reserved() const { return m_reserved; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
    };

    class macho_flags_t : public kaitai::kstruct {

    public:

        macho_flags_t(uint32_t p_value, kaitai::kstream* p__io, mach_o_t::mach_header_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~macho_flags_t();

    private:
        bool f_subsections_via_symbols;
        bool m_subsections_via_symbols;

    public:

        /**
         * safe to divide up the sections into sub-sections via symbols for dead code stripping
         */
        bool subsections_via_symbols();

    private:
        bool f_dead_strippable_dylib;
        bool m_dead_strippable_dylib;

    public:
        bool dead_strippable_dylib();

    private:
        bool f_weak_defines;
        bool m_weak_defines;

    public:

        /**
         * the final linked image contains external weak symbols
         */
        bool weak_defines();

    private:
        bool f_prebound;
        bool m_prebound;

    public:

        /**
         * the file has its dynamic undefined references prebound.
         */
        bool prebound();

    private:
        bool f_all_mods_bound;
        bool m_all_mods_bound;

    public:

        /**
         * indicates that this binary binds to all two-level namespace modules of its dependent libraries. only used when MH_PREBINDABLE and MH_TWOLEVEL are both set.
         */
        bool all_mods_bound();

    private:
        bool f_has_tlv_descriptors;
        bool m_has_tlv_descriptors;

    public:
        bool has_tlv_descriptors();

    private:
        bool f_force_flat;
        bool m_force_flat;

    public:

        /**
         * the executable is forcing all images to use flat name space bindings
         */
        bool force_flat();

    private:
        bool f_root_safe;
        bool m_root_safe;

    public:

        /**
         * When this bit is set, the binary declares it is safe for use in processes with uid zero
         */
        bool root_safe();

    private:
        bool f_no_undefs;
        bool m_no_undefs;

    public:

        /**
         * the object file has no undefined references
         */
        bool no_undefs();

    private:
        bool f_setuid_safe;
        bool m_setuid_safe;

    public:

        /**
         * When this bit is set, the binary declares it is safe for use in processes when issetugid() is true
         */
        bool setuid_safe();

    private:
        bool f_no_heap_execution;
        bool m_no_heap_execution;

    public:
        bool no_heap_execution();

    private:
        bool f_no_reexported_dylibs;
        bool m_no_reexported_dylibs;

    public:

        /**
         * When this bit is set on a dylib, the static linker does not need to examine dependent dylibs to see if any are re-exported
         */
        bool no_reexported_dylibs();

    private:
        bool f_no_multi_defs;
        bool m_no_multi_defs;

    public:

        /**
         * this umbrella guarantees no multiple defintions of symbols in its sub-images so the two-level namespace hints can always be used.
         */
        bool no_multi_defs();

    private:
        bool f_app_extension_safe;
        bool m_app_extension_safe;

    public:
        bool app_extension_safe();

    private:
        bool f_prebindable;
        bool m_prebindable;

    public:

        /**
         * the binary is not prebound but can have its prebinding redone. only used when MH_PREBOUND is not set.
         */
        bool prebindable();

    private:
        bool f_incr_link;
        bool m_incr_link;

    public:

        /**
         * the object file is the output of an incremental link against a base file and can't be link edited again
         */
        bool incr_link();

    private:
        bool f_bind_at_load;
        bool m_bind_at_load;

    public:

        /**
         * the object file's undefined references are bound by the dynamic linker when loaded.
         */
        bool bind_at_load();

    private:
        bool f_canonical;
        bool m_canonical;

    public:

        /**
         * the binary has been canonicalized via the unprebind operation
         */
        bool canonical();

    private:
        bool f_two_level;
        bool m_two_level;

    public:

        /**
         * the image is using two-level name space bindings
         */
        bool two_level();

    private:
        bool f_split_segs;
        bool m_split_segs;

    public:

        /**
         * the file has its read-only and read-write segments split
         */
        bool split_segs();

    private:
        bool f_lazy_init;
        bool m_lazy_init;

    public:

        /**
         * the shared library init routine is to be run lazily via catching memory faults to its writeable segments (obsolete)
         */
        bool lazy_init();

    private:
        bool f_allow_stack_execution;
        bool m_allow_stack_execution;

    public:

        /**
         * When this bit is set, all stacks in the task will be given stack execution privilege.  Only used in MH_EXECUTE filetypes.
         */
        bool allow_stack_execution();

    private:
        bool f_binds_to_weak;
        bool m_binds_to_weak;

    public:

        /**
         * the final linked image uses weak symbols
         */
        bool binds_to_weak();

    private:
        bool f_no_fix_prebinding;
        bool m_no_fix_prebinding;

    public:

        /**
         * do not have dyld notify the prebinding agent about this executable
         */
        bool no_fix_prebinding();

    private:
        bool f_dyld_link;
        bool m_dyld_link;

    public:

        /**
         * the object file is input for the dynamic linker and can't be staticly link edited again
         */
        bool dyld_link();

    private:
        bool f_pie;
        bool m_pie;

    public:

        /**
         * When this bit is set, the OS will load the main executable at a random address. Only used in MH_EXECUTE filetypes.
         */
        bool pie();

    private:
        uint32_t m_value;
        mach_o_t* m__root;
        mach_o_t::mach_header_t* m__parent;

    public:
        uint32_t value() const { return m_value; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::mach_header_t* _parent() const { return m__parent; }
    };

    class routines_command_64_t : public kaitai::kstruct {

    public:

        routines_command_64_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~routines_command_64_t();

    private:
        uint64_t m_init_address;
        uint64_t m_init_module;
        std::string m_reserved;
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;

    public:
        uint64_t init_address() const { return m_init_address; }
        uint64_t init_module() const { return m_init_module; }
        std::string reserved() const { return m_reserved; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
    };

    class linker_option_command_t : public kaitai::kstruct {

    public:

        linker_option_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~linker_option_command_t();

    private:
        uint32_t m_num_strings;
        std::vector<std::string>* m_strings;
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;

    public:
        uint32_t num_strings() const { return m_num_strings; }
        std::vector<std::string>* strings() const { return m_strings; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
    };

    class segment_command_64_t : public kaitai::kstruct {

    public:
        class section_64_t;

        segment_command_64_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~segment_command_64_t();

        class section_64_t : public kaitai::kstruct {

        public:
            class cf_string_list_t;
            class cf_string_t;
            class eh_frame_item_t;
            class eh_frame_t;
            class pointer_list_t;
            class string_list_t;

            section_64_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~section_64_t();

            class cf_string_list_t : public kaitai::kstruct {

            public:

                cf_string_list_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t::section_64_t* p__parent = 0, mach_o_t* p__root = 0);

            private:
                void _read();

            public:
                ~cf_string_list_t();

            private:
                std::vector<cf_string_t*>* m_items;
                mach_o_t* m__root;
                mach_o_t::segment_command_64_t::section_64_t* m__parent;

            public:
                std::vector<cf_string_t*>* items() const { return m_items; }
                mach_o_t* _root() const { return m__root; }
                mach_o_t::segment_command_64_t::section_64_t* _parent() const { return m__parent; }
            };

            class cf_string_t : public kaitai::kstruct {

            public:

                cf_string_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t::section_64_t::cf_string_list_t* p__parent = 0, mach_o_t* p__root = 0);

            private:
                void _read();

            public:
                ~cf_string_t();

            private:
                uint64_t m_isa;
                uint64_t m_info;
                uint64_t m_data;
                uint64_t m_length;
                mach_o_t* m__root;
                mach_o_t::segment_command_64_t::section_64_t::cf_string_list_t* m__parent;

            public:
                uint64_t isa() const { return m_isa; }
                uint64_t info() const { return m_info; }
                uint64_t data() const { return m_data; }
                uint64_t length() const { return m_length; }
                mach_o_t* _root() const { return m__root; }
                mach_o_t::segment_command_64_t::section_64_t::cf_string_list_t* _parent() const { return m__parent; }
            };

            class eh_frame_item_t : public kaitai::kstruct {

            public:
                class char_chain_t;
                class cie_t;
                class augmentation_entry_t;

                eh_frame_item_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t::section_64_t::eh_frame_t* p__parent = 0, mach_o_t* p__root = 0);

            private:
                void _read();

            public:
                ~eh_frame_item_t();

                class char_chain_t : public kaitai::kstruct {

                public:

                    char_chain_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mach_o_t* p__root = 0);

                private:
                    void _read();

                public:
                    ~char_chain_t();

                private:
                    uint8_t m_chr;
                    char_chain_t* m_next;
                    bool n_next;

                public:
                    bool _is_null_next() { next(); return n_next; };

                private:
                    mach_o_t* m__root;
                    kaitai::kstruct* m__parent;

                public:
                    uint8_t chr() const { return m_chr; }
                    char_chain_t* next() const { return m_next; }
                    mach_o_t* _root() const { return m__root; }
                    kaitai::kstruct* _parent() const { return m__parent; }
                };

                class cie_t : public kaitai::kstruct {

                public:

                    cie_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t* p__parent = 0, mach_o_t* p__root = 0);

                private:
                    void _read();

                public:
                    ~cie_t();

                private:
                    uint8_t m_version;
                    char_chain_t* m_aug_str;
                    uleb128_t* m_code_alignment_factor;
                    uleb128_t* m_data_alignment_factor;
                    uint8_t m_return_address_register;
                    augmentation_entry_t* m_augmentation;
                    bool n_augmentation;

                public:
                    bool _is_null_augmentation() { augmentation(); return n_augmentation; };

                private:
                    mach_o_t* m__root;
                    mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t* m__parent;

                public:
                    uint8_t version() const { return m_version; }
                    char_chain_t* aug_str() const { return m_aug_str; }
                    uleb128_t* code_alignment_factor() const { return m_code_alignment_factor; }
                    uleb128_t* data_alignment_factor() const { return m_data_alignment_factor; }
                    uint8_t return_address_register() const { return m_return_address_register; }
                    augmentation_entry_t* augmentation() const { return m_augmentation; }
                    mach_o_t* _root() const { return m__root; }
                    mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t* _parent() const { return m__parent; }
                };

                class augmentation_entry_t : public kaitai::kstruct {

                public:

                    augmentation_entry_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::cie_t* p__parent = 0, mach_o_t* p__root = 0);

                private:
                    void _read();

                public:
                    ~augmentation_entry_t();

                private:
                    uleb128_t* m_length;
                    uint8_t m_fde_pointer_encoding;
                    bool n_fde_pointer_encoding;

                public:
                    bool _is_null_fde_pointer_encoding() { fde_pointer_encoding(); return n_fde_pointer_encoding; };

                private:
                    mach_o_t* m__root;
                    mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::cie_t* m__parent;

                public:
                    uleb128_t* length() const { return m_length; }
                    uint8_t fde_pointer_encoding() const { return m_fde_pointer_encoding; }
                    mach_o_t* _root() const { return m__root; }
                    mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::cie_t* _parent() const { return m__parent; }
                };

            private:
                uint32_t m_length;
                uint64_t m_length64;
                bool n_length64;

            public:
                bool _is_null_length64() { length64(); return n_length64; };

            private:
                uint32_t m_id;
                cie_t* m_body;
                bool n_body;

            public:
                bool _is_null_body() { body(); return n_body; };

            private:
                mach_o_t* m__root;
                mach_o_t::segment_command_64_t::section_64_t::eh_frame_t* m__parent;
                std::string m__raw_body;
                kaitai::kstream* m__io__raw_body;

            public:
                uint32_t length() const { return m_length; }
                uint64_t length64() const { return m_length64; }
                uint32_t id() const { return m_id; }
                cie_t* body() const { return m_body; }
                mach_o_t* _root() const { return m__root; }
                mach_o_t::segment_command_64_t::section_64_t::eh_frame_t* _parent() const { return m__parent; }
                std::string _raw_body() const { return m__raw_body; }
                kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
            };

            class eh_frame_t : public kaitai::kstruct {

            public:

                eh_frame_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t::section_64_t* p__parent = 0, mach_o_t* p__root = 0);

            private:
                void _read();

            public:
                ~eh_frame_t();

            private:
                std::vector<eh_frame_item_t*>* m_items;
                mach_o_t* m__root;
                mach_o_t::segment_command_64_t::section_64_t* m__parent;

            public:
                std::vector<eh_frame_item_t*>* items() const { return m_items; }
                mach_o_t* _root() const { return m__root; }
                mach_o_t::segment_command_64_t::section_64_t* _parent() const { return m__parent; }
            };

            class pointer_list_t : public kaitai::kstruct {

            public:

                pointer_list_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t::section_64_t* p__parent = 0, mach_o_t* p__root = 0);

            private:
                void _read();

            public:
                ~pointer_list_t();

            private:
                std::vector<uint64_t>* m_items;
                mach_o_t* m__root;
                mach_o_t::segment_command_64_t::section_64_t* m__parent;

            public:
                std::vector<uint64_t>* items() const { return m_items; }
                mach_o_t* _root() const { return m__root; }
                mach_o_t::segment_command_64_t::section_64_t* _parent() const { return m__parent; }
            };

            class string_list_t : public kaitai::kstruct {

            public:

                string_list_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t::section_64_t* p__parent = 0, mach_o_t* p__root = 0);

            private:
                void _read();

            public:
                ~string_list_t();

            private:
                std::vector<std::string>* m_strings;
                mach_o_t* m__root;
                mach_o_t::segment_command_64_t::section_64_t* m__parent;

            public:
                std::vector<std::string>* strings() const { return m_strings; }
                mach_o_t* _root() const { return m__root; }
                mach_o_t::segment_command_64_t::section_64_t* _parent() const { return m__parent; }
            };

        private:
            bool f_data;
            kaitai::kstruct* m_data;

        public:
            kaitai::kstruct* data();

        private:
            std::string m_sect_name;
            std::string m_seg_name;
            uint64_t m_addr;
            uint64_t m_size;
            uint32_t m_offset;
            uint32_t m_align;
            uint32_t m_reloff;
            uint32_t m_nreloc;
            uint32_t m_flags;
            uint32_t m_reserved1;
            uint32_t m_reserved2;
            uint32_t m_reserved3;
            mach_o_t* m__root;
            mach_o_t::segment_command_64_t* m__parent;
            std::string m__raw_data;
            kaitai::kstream* m__io__raw_data;

        public:
            std::string sect_name() const { return m_sect_name; }
            std::string seg_name() const { return m_seg_name; }
            uint64_t addr() const { return m_addr; }
            uint64_t size() const { return m_size; }
            uint32_t offset() const { return m_offset; }
            uint32_t align() const { return m_align; }
            uint32_t reloff() const { return m_reloff; }
            uint32_t nreloc() const { return m_nreloc; }
            uint32_t flags() const { return m_flags; }
            uint32_t reserved1() const { return m_reserved1; }
            uint32_t reserved2() const { return m_reserved2; }
            uint32_t reserved3() const { return m_reserved3; }
            mach_o_t* _root() const { return m__root; }
            mach_o_t::segment_command_64_t* _parent() const { return m__parent; }
            std::string _raw_data() const { return m__raw_data; }
            kaitai::kstream* _io__raw_data() const { return m__io__raw_data; }
        };

    private:
        std::string m_segname;
        uint64_t m_vmaddr;
        uint64_t m_vmsize;
        uint64_t m_fileoff;
        uint64_t m_filesize;
        vm_prot_t* m_maxprot;
        vm_prot_t* m_initprot;
        uint32_t m_nsects;
        uint32_t m_flags;
        std::vector<section_64_t*>* m_sections;
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;

    public:
        std::string segname() const { return m_segname; }
        uint64_t vmaddr() const { return m_vmaddr; }
        uint64_t vmsize() const { return m_vmsize; }
        uint64_t fileoff() const { return m_fileoff; }
        uint64_t filesize() const { return m_filesize; }
        vm_prot_t* maxprot() const { return m_maxprot; }
        vm_prot_t* initprot() const { return m_initprot; }
        uint32_t nsects() const { return m_nsects; }
        uint32_t flags() const { return m_flags; }
        std::vector<section_64_t*>* sections() const { return m_sections; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
    };

    class vm_prot_t : public kaitai::kstruct {

    public:

        vm_prot_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~vm_prot_t();

    private:
        bool m_strip_read;
        bool m_is_mask;
        bool m_reserved0;
        bool m_copy;
        bool m_no_change;
        bool m_execute;
        bool m_write;
        bool m_read;
        uint64_t m_reserved1;
        mach_o_t* m__root;
        mach_o_t::segment_command_64_t* m__parent;

    public:

        /**
         * Special marker to support execute-only protection.
         */
        bool strip_read() const { return m_strip_read; }

        /**
         * Indicates to use value as a mask against the actual protection bits.
         */
        bool is_mask() const { return m_is_mask; }

        /**
         * Reserved (unused) bit.
         */
        bool reserved0() const { return m_reserved0; }

        /**
         * Used when write permission can not be obtained, to mark the entry as COW.
         */
        bool copy() const { return m_copy; }

        /**
         * Used only by memory_object_lock_request to indicate no change to page locks.
         */
        bool no_change() const { return m_no_change; }

        /**
         * Execute permission.
         */
        bool execute() const { return m_execute; }

        /**
         * Write permission.
         */
        bool write() const { return m_write; }

        /**
         * Read permission.
         */
        bool read() const { return m_read; }

        /**
         * Reserved (unused) bits.
         */
        uint64_t reserved1() const { return m_reserved1; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::segment_command_64_t* _parent() const { return m__parent; }
    };

    class dysymtab_command_t : public kaitai::kstruct {

    public:

        dysymtab_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~dysymtab_command_t();

    private:
        bool f_indirect_symbols;
        std::vector<uint32_t>* m_indirect_symbols;

    public:
        std::vector<uint32_t>* indirect_symbols();

    private:
        uint32_t m_i_local_sym;
        uint32_t m_n_local_sym;
        uint32_t m_i_ext_def_sym;
        uint32_t m_n_ext_def_sym;
        uint32_t m_i_undef_sym;
        uint32_t m_n_undef_sym;
        uint32_t m_toc_off;
        uint32_t m_n_toc;
        uint32_t m_mod_tab_off;
        uint32_t m_n_mod_tab;
        uint32_t m_ext_ref_sym_off;
        uint32_t m_n_ext_ref_syms;
        uint32_t m_indirect_sym_off;
        uint32_t m_n_indirect_syms;
        uint32_t m_ext_rel_off;
        uint32_t m_n_ext_rel;
        uint32_t m_loc_rel_off;
        uint32_t m_n_loc_rel;
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;

    public:
        uint32_t i_local_sym() const { return m_i_local_sym; }
        uint32_t n_local_sym() const { return m_n_local_sym; }
        uint32_t i_ext_def_sym() const { return m_i_ext_def_sym; }
        uint32_t n_ext_def_sym() const { return m_n_ext_def_sym; }
        uint32_t i_undef_sym() const { return m_i_undef_sym; }
        uint32_t n_undef_sym() const { return m_n_undef_sym; }
        uint32_t toc_off() const { return m_toc_off; }
        uint32_t n_toc() const { return m_n_toc; }
        uint32_t mod_tab_off() const { return m_mod_tab_off; }
        uint32_t n_mod_tab() const { return m_n_mod_tab; }
        uint32_t ext_ref_sym_off() const { return m_ext_ref_sym_off; }
        uint32_t n_ext_ref_syms() const { return m_n_ext_ref_syms; }
        uint32_t indirect_sym_off() const { return m_indirect_sym_off; }
        uint32_t n_indirect_syms() const { return m_n_indirect_syms; }
        uint32_t ext_rel_off() const { return m_ext_rel_off; }
        uint32_t n_ext_rel() const { return m_n_ext_rel; }
        uint32_t loc_rel_off() const { return m_loc_rel_off; }
        uint32_t n_loc_rel() const { return m_n_loc_rel; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
    };

    class mach_header_t : public kaitai::kstruct {

    public:

        mach_header_t(kaitai::kstream* p__io, mach_o_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~mach_header_t();

    private:
        bool f_flags_obj;
        macho_flags_t* m_flags_obj;

    public:
        macho_flags_t* flags_obj();

    private:
        cpu_type_t m_cputype;
        uint32_t m_cpusubtype;
        file_type_t m_filetype;
        uint32_t m_ncmds;
        uint32_t m_sizeofcmds;
        uint32_t m_flags;
        uint32_t m_reserved;
        bool n_reserved;

    public:
        bool _is_null_reserved() { reserved(); return n_reserved; };

    private:
        mach_o_t* m__root;
        mach_o_t* m__parent;

    public:
        cpu_type_t cputype() const { return m_cputype; }
        uint32_t cpusubtype() const { return m_cpusubtype; }
        file_type_t filetype() const { return m_filetype; }
        uint32_t ncmds() const { return m_ncmds; }
        uint32_t sizeofcmds() const { return m_sizeofcmds; }
        uint32_t flags() const { return m_flags; }
        uint32_t reserved() const { return m_reserved; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t* _parent() const { return m__parent; }
    };

    class linkedit_data_command_t : public kaitai::kstruct {

    public:

        linkedit_data_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~linkedit_data_command_t();

    private:
        uint32_t m_data_off;
        uint32_t m_data_size;
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;

    public:
        uint32_t data_off() const { return m_data_off; }
        uint32_t data_size() const { return m_data_size; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
    };

    class sub_command_t : public kaitai::kstruct {

    public:

        sub_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~sub_command_t();

    private:
        lc_str_t* m_name;
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;

    public:
        lc_str_t* name() const { return m_name; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
    };

    class twolevel_hints_command_t : public kaitai::kstruct {

    public:

        twolevel_hints_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~twolevel_hints_command_t();

    private:
        uint32_t m_offset;
        uint32_t m_num_hints;
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;

    public:
        uint32_t offset() const { return m_offset; }
        uint32_t num_hints() const { return m_num_hints; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
    };

    class version_t : public kaitai::kstruct {

    public:

        version_t(kaitai::kstream* p__io, mach_o_t::version_min_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~version_t();

    private:
        uint8_t m_p1;
        uint8_t m_minor;
        uint8_t m_major;
        uint8_t m_release;
        mach_o_t* m__root;
        mach_o_t::version_min_command_t* m__parent;

    public:
        uint8_t p1() const { return m_p1; }
        uint8_t minor() const { return m_minor; }
        uint8_t major() const { return m_major; }
        uint8_t release() const { return m_release; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::version_min_command_t* _parent() const { return m__parent; }
    };

    class encryption_info_command_t : public kaitai::kstruct {

    public:

        encryption_info_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~encryption_info_command_t();

    private:
        uint32_t m_cryptoff;
        uint32_t m_cryptsize;
        uint32_t m_cryptid;
        uint32_t m_pad;
        bool n_pad;

    public:
        bool _is_null_pad() { pad(); return n_pad; };

    private:
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;

    public:
        uint32_t cryptoff() const { return m_cryptoff; }
        uint32_t cryptsize() const { return m_cryptsize; }
        uint32_t cryptid() const { return m_cryptid; }
        uint32_t pad() const { return m_pad; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
    };

    class code_signature_command_t : public kaitai::kstruct {

    public:

        code_signature_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~code_signature_command_t();

    private:
        bool f_code_signature;
        cs_blob_t* m_code_signature;

    public:
        cs_blob_t* code_signature();

    private:
        uint32_t m_data_off;
        uint32_t m_data_size;
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;
        std::string m__raw_code_signature;
        kaitai::kstream* m__io__raw_code_signature;

    public:
        uint32_t data_off() const { return m_data_off; }
        uint32_t data_size() const { return m_data_size; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
        std::string _raw_code_signature() const { return m__raw_code_signature; }
        kaitai::kstream* _io__raw_code_signature() const { return m__io__raw_code_signature; }
    };

    class dyld_info_command_t : public kaitai::kstruct {

    public:
        class bind_item_t;
        class rebase_data_t;
        class export_node_t;
        class bind_data_t;
        class lazy_bind_data_t;

        enum bind_opcode_t {
            BIND_OPCODE_DONE = 0,
            BIND_OPCODE_SET_DYLIB_ORDINAL_IMMEDIATE = 16,
            BIND_OPCODE_SET_DYLIB_ORDINAL_ULEB = 32,
            BIND_OPCODE_SET_DYLIB_SPECIAL_IMMEDIATE = 48,
            BIND_OPCODE_SET_SYMBOL_TRAILING_FLAGS_IMMEDIATE = 64,
            BIND_OPCODE_SET_TYPE_IMMEDIATE = 80,
            BIND_OPCODE_SET_APPEND_SLEB = 96,
            BIND_OPCODE_SET_SEGMENT_AND_OFFSET_ULEB = 112,
            BIND_OPCODE_ADD_ADDRESS_ULEB = 128,
            BIND_OPCODE_DO_BIND = 144,
            BIND_OPCODE_DO_BIND_ADD_ADDRESS_ULEB = 160,
            BIND_OPCODE_DO_BIND_ADD_ADDRESS_IMMEDIATE_SCALED = 176,
            BIND_OPCODE_DO_BIND_ULEB_TIMES_SKIPPING_ULEB = 192
        };

        dyld_info_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~dyld_info_command_t();

        class bind_item_t : public kaitai::kstruct {

        public:

            bind_item_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~bind_item_t();

        private:
            bool f_opcode;
            bind_opcode_t m_opcode;

        public:
            bind_opcode_t opcode();

        private:
            bool f_immediate;
            int32_t m_immediate;

        public:
            int32_t immediate();

        private:
            uint8_t m_opcode_and_immediate;
            uleb128_t* m_uleb;
            bool n_uleb;

        public:
            bool _is_null_uleb() { uleb(); return n_uleb; };

        private:
            uleb128_t* m_skip;
            bool n_skip;

        public:
            bool _is_null_skip() { skip(); return n_skip; };

        private:
            std::string m_symbol;
            bool n_symbol;

        public:
            bool _is_null_symbol() { symbol(); return n_symbol; };

        private:
            mach_o_t* m__root;
            kaitai::kstruct* m__parent;

        public:
            uint8_t opcode_and_immediate() const { return m_opcode_and_immediate; }
            uleb128_t* uleb() const { return m_uleb; }
            uleb128_t* skip() const { return m_skip; }
            std::string symbol() const { return m_symbol; }
            mach_o_t* _root() const { return m__root; }
            kaitai::kstruct* _parent() const { return m__parent; }
        };

        class rebase_data_t : public kaitai::kstruct {

        public:
            class rebase_item_t;

            enum opcode_t {
                OPCODE_DONE = 0,
                OPCODE_SET_TYPE_IMMEDIATE = 16,
                OPCODE_SET_SEGMENT_AND_OFFSET_ULEB = 32,
                OPCODE_ADD_ADDRESS_ULEB = 48,
                OPCODE_ADD_ADDRESS_IMMEDIATE_SCALED = 64,
                OPCODE_DO_REBASE_IMMEDIATE_TIMES = 80,
                OPCODE_DO_REBASE_ULEB_TIMES = 96,
                OPCODE_DO_REBASE_ADD_ADDRESS_ULEB = 112,
                OPCODE_DO_REBASE_ULEB_TIMES_SKIPPING_ULEB = 128
            };

            rebase_data_t(kaitai::kstream* p__io, mach_o_t::dyld_info_command_t* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~rebase_data_t();

            class rebase_item_t : public kaitai::kstruct {

            public:

                rebase_item_t(kaitai::kstream* p__io, mach_o_t::dyld_info_command_t::rebase_data_t* p__parent = 0, mach_o_t* p__root = 0);

            private:
                void _read();

            public:
                ~rebase_item_t();

            private:
                bool f_opcode;
                opcode_t m_opcode;

            public:
                opcode_t opcode();

            private:
                bool f_immediate;
                int32_t m_immediate;

            public:
                int32_t immediate();

            private:
                uint8_t m_opcode_and_immediate;
                uleb128_t* m_uleb;
                bool n_uleb;

            public:
                bool _is_null_uleb() { uleb(); return n_uleb; };

            private:
                uleb128_t* m_skip;
                bool n_skip;

            public:
                bool _is_null_skip() { skip(); return n_skip; };

            private:
                mach_o_t* m__root;
                mach_o_t::dyld_info_command_t::rebase_data_t* m__parent;

            public:
                uint8_t opcode_and_immediate() const { return m_opcode_and_immediate; }
                uleb128_t* uleb() const { return m_uleb; }
                uleb128_t* skip() const { return m_skip; }
                mach_o_t* _root() const { return m__root; }
                mach_o_t::dyld_info_command_t::rebase_data_t* _parent() const { return m__parent; }
            };

        private:
            std::vector<rebase_item_t*>* m_items;
            mach_o_t* m__root;
            mach_o_t::dyld_info_command_t* m__parent;

        public:
            std::vector<rebase_item_t*>* items() const { return m_items; }
            mach_o_t* _root() const { return m__root; }
            mach_o_t::dyld_info_command_t* _parent() const { return m__parent; }
        };

        class export_node_t : public kaitai::kstruct {

        public:
            class child_t;

            export_node_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~export_node_t();

            class child_t : public kaitai::kstruct {

            public:

                child_t(kaitai::kstream* p__io, mach_o_t::dyld_info_command_t::export_node_t* p__parent = 0, mach_o_t* p__root = 0);

            private:
                void _read();

            public:
                ~child_t();

            private:
                bool f_value;
                export_node_t* m_value;

            public:
                export_node_t* value();

            private:
                std::string m_name;
                uleb128_t* m_node_offset;
                mach_o_t* m__root;
                mach_o_t::dyld_info_command_t::export_node_t* m__parent;

            public:
                std::string name() const { return m_name; }
                uleb128_t* node_offset() const { return m_node_offset; }
                mach_o_t* _root() const { return m__root; }
                mach_o_t::dyld_info_command_t::export_node_t* _parent() const { return m__parent; }
            };

        private:
            uleb128_t* m_terminal_size;
            uint8_t m_children_count;
            std::vector<child_t*>* m_children;
            std::string m_terminal;
            mach_o_t* m__root;
            kaitai::kstruct* m__parent;

        public:
            uleb128_t* terminal_size() const { return m_terminal_size; }
            uint8_t children_count() const { return m_children_count; }
            std::vector<child_t*>* children() const { return m_children; }
            std::string terminal() const { return m_terminal; }
            mach_o_t* _root() const { return m__root; }
            kaitai::kstruct* _parent() const { return m__parent; }
        };

        class bind_data_t : public kaitai::kstruct {

        public:

            bind_data_t(kaitai::kstream* p__io, mach_o_t::dyld_info_command_t* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~bind_data_t();

        private:
            std::vector<bind_item_t*>* m_items;
            mach_o_t* m__root;
            mach_o_t::dyld_info_command_t* m__parent;

        public:
            std::vector<bind_item_t*>* items() const { return m_items; }
            mach_o_t* _root() const { return m__root; }
            mach_o_t::dyld_info_command_t* _parent() const { return m__parent; }
        };

        class lazy_bind_data_t : public kaitai::kstruct {

        public:

            lazy_bind_data_t(kaitai::kstream* p__io, mach_o_t::dyld_info_command_t* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~lazy_bind_data_t();

        private:
            std::vector<bind_item_t*>* m_items;
            mach_o_t* m__root;
            mach_o_t::dyld_info_command_t* m__parent;

        public:
            std::vector<bind_item_t*>* items() const { return m_items; }
            mach_o_t* _root() const { return m__root; }
            mach_o_t::dyld_info_command_t* _parent() const { return m__parent; }
        };

    private:
        bool f_rebase;
        rebase_data_t* m_rebase;

    public:
        rebase_data_t* rebase();

    private:
        bool f_bind;
        bind_data_t* m_bind;

    public:
        bind_data_t* bind();

    private:
        bool f_lazy_bind;
        lazy_bind_data_t* m_lazy_bind;

    public:
        lazy_bind_data_t* lazy_bind();

    private:
        bool f_exports;
        export_node_t* m_exports;

    public:
        export_node_t* exports();

    private:
        uint32_t m_rebase_off;
        uint32_t m_rebase_size;
        uint32_t m_bind_off;
        uint32_t m_bind_size;
        uint32_t m_weak_bind_off;
        uint32_t m_weak_bind_size;
        uint32_t m_lazy_bind_off;
        uint32_t m_lazy_bind_size;
        uint32_t m_export_off;
        uint32_t m_export_size;
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;
        std::string m__raw_rebase;
        kaitai::kstream* m__io__raw_rebase;
        std::string m__raw_bind;
        kaitai::kstream* m__io__raw_bind;
        std::string m__raw_lazy_bind;
        kaitai::kstream* m__io__raw_lazy_bind;
        std::string m__raw_exports;
        kaitai::kstream* m__io__raw_exports;

    public:
        uint32_t rebase_off() const { return m_rebase_off; }
        uint32_t rebase_size() const { return m_rebase_size; }
        uint32_t bind_off() const { return m_bind_off; }
        uint32_t bind_size() const { return m_bind_size; }
        uint32_t weak_bind_off() const { return m_weak_bind_off; }
        uint32_t weak_bind_size() const { return m_weak_bind_size; }
        uint32_t lazy_bind_off() const { return m_lazy_bind_off; }
        uint32_t lazy_bind_size() const { return m_lazy_bind_size; }
        uint32_t export_off() const { return m_export_off; }
        uint32_t export_size() const { return m_export_size; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
        std::string _raw_rebase() const { return m__raw_rebase; }
        kaitai::kstream* _io__raw_rebase() const { return m__io__raw_rebase; }
        std::string _raw_bind() const { return m__raw_bind; }
        kaitai::kstream* _io__raw_bind() const { return m__io__raw_bind; }
        std::string _raw_lazy_bind() const { return m__raw_lazy_bind; }
        kaitai::kstream* _io__raw_lazy_bind() const { return m__io__raw_lazy_bind; }
        std::string _raw_exports() const { return m__raw_exports; }
        kaitai::kstream* _io__raw_exports() const { return m__io__raw_exports; }
    };

    class dylinker_command_t : public kaitai::kstruct {

    public:

        dylinker_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~dylinker_command_t();

    private:
        lc_str_t* m_name;
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;

    public:
        lc_str_t* name() const { return m_name; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
    };

    class dylib_command_t : public kaitai::kstruct {

    public:

        dylib_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~dylib_command_t();

    private:
        uint32_t m_name_offset;
        uint32_t m_timestamp;
        uint32_t m_current_version;
        uint32_t m_compatibility_version;
        std::string m_name;
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;

    public:
        uint32_t name_offset() const { return m_name_offset; }
        uint32_t timestamp() const { return m_timestamp; }
        uint32_t current_version() const { return m_current_version; }
        uint32_t compatibility_version() const { return m_compatibility_version; }
        std::string name() const { return m_name; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
    };

    class lc_str_t : public kaitai::kstruct {

    public:

        lc_str_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~lc_str_t();

    private:
        uint32_t m_length;
        std::string m_value;
        mach_o_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint32_t length() const { return m_length; }
        std::string value() const { return m_value; }
        mach_o_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class load_command_t : public kaitai::kstruct {

    public:

        load_command_t(kaitai::kstream* p__io, mach_o_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~load_command_t();

    private:
        load_command_type_t m_type;
        uint32_t m_size;
        kaitai::kstruct* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        mach_o_t* m__root;
        mach_o_t* m__parent;
        std::string m__raw_body;
        kaitai::kstream* m__io__raw_body;

    public:
        load_command_type_t type() const { return m_type; }
        uint32_t size() const { return m_size; }
        kaitai::kstruct* body() const { return m_body; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
    };

    class uuid_command_t : public kaitai::kstruct {

    public:

        uuid_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~uuid_command_t();

    private:
        std::string m_uuid;
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;

    public:
        std::string uuid() const { return m_uuid; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
    };

    class symtab_command_t : public kaitai::kstruct {

    public:
        class str_table_t;
        class nlist_64_t;

        symtab_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~symtab_command_t();

        class str_table_t : public kaitai::kstruct {

        public:

            str_table_t(kaitai::kstream* p__io, mach_o_t::symtab_command_t* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~str_table_t();

        private:
            uint32_t m_unknown;
            std::vector<std::string>* m_items;
            mach_o_t* m__root;
            mach_o_t::symtab_command_t* m__parent;

        public:
            uint32_t unknown() const { return m_unknown; }
            std::vector<std::string>* items() const { return m_items; }
            mach_o_t* _root() const { return m__root; }
            mach_o_t::symtab_command_t* _parent() const { return m__parent; }
        };

        class nlist_64_t : public kaitai::kstruct {

        public:

            nlist_64_t(kaitai::kstream* p__io, mach_o_t::symtab_command_t* p__parent = 0, mach_o_t* p__root = 0);

        private:
            void _read();

        public:
            ~nlist_64_t();

        private:
            uint32_t m_un;
            uint8_t m_type;
            uint8_t m_sect;
            uint16_t m_desc;
            uint64_t m_value;
            mach_o_t* m__root;
            mach_o_t::symtab_command_t* m__parent;

        public:
            uint32_t un() const { return m_un; }
            uint8_t type() const { return m_type; }
            uint8_t sect() const { return m_sect; }
            uint16_t desc() const { return m_desc; }
            uint64_t value() const { return m_value; }
            mach_o_t* _root() const { return m__root; }
            mach_o_t::symtab_command_t* _parent() const { return m__parent; }
        };

    private:
        bool f_symbols;
        std::vector<nlist_64_t*>* m_symbols;

    public:
        std::vector<nlist_64_t*>* symbols();

    private:
        bool f_strs;
        str_table_t* m_strs;

    public:
        str_table_t* strs();

    private:
        uint32_t m_sym_off;
        uint32_t m_n_syms;
        uint32_t m_str_off;
        uint32_t m_str_size;
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;
        std::string m__raw_strs;
        kaitai::kstream* m__io__raw_strs;

    public:
        uint32_t sym_off() const { return m_sym_off; }
        uint32_t n_syms() const { return m_n_syms; }
        uint32_t str_off() const { return m_str_off; }
        uint32_t str_size() const { return m_str_size; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
        std::string _raw_strs() const { return m__raw_strs; }
        kaitai::kstream* _io__raw_strs() const { return m__io__raw_strs; }
    };

    class version_min_command_t : public kaitai::kstruct {

    public:

        version_min_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~version_min_command_t();

    private:
        version_t* m_version;
        version_t* m_sdk;
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;

    public:
        version_t* version() const { return m_version; }
        version_t* sdk() const { return m_sdk; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
    };

    class entry_point_command_t : public kaitai::kstruct {

    public:

        entry_point_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent = 0, mach_o_t* p__root = 0);

    private:
        void _read();

    public:
        ~entry_point_command_t();

    private:
        uint64_t m_entry_off;
        uint64_t m_stack_size;
        mach_o_t* m__root;
        mach_o_t::load_command_t* m__parent;

    public:
        uint64_t entry_off() const { return m_entry_off; }
        uint64_t stack_size() const { return m_stack_size; }
        mach_o_t* _root() const { return m__root; }
        mach_o_t::load_command_t* _parent() const { return m__parent; }
    };

private:
    magic_type_t m_magic;
    mach_header_t* m_header;
    std::vector<load_command_t*>* m_load_commands;
    mach_o_t* m__root;
    kaitai::kstruct* m__parent;

public:
    magic_type_t magic() const { return m_magic; }
    mach_header_t* header() const { return m_header; }
    std::vector<load_command_t*>* load_commands() const { return m_load_commands; }
    mach_o_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // MACH_O_H_

#ifndef ID3V2_3_H_
#define ID3V2_3_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include <kaitai/kaitaistruct.h>
#include <kaitai/kaitaistream.h>

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class id3v2_3_t : public kaitai::kstruct {

public:
    class u1be_synchsafe_t;
    class u2be_synchsafe_t;
    class tag_t;
    class u4be_synchsafe_t;
    class frame_t;
    class header_ex_t;
    class header_t;

    id3v2_3_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, id3v2_3_t* p_root = 0);
    void _read();
    ~id3v2_3_t();

    class u1be_synchsafe_t : public kaitai::kstruct {

    public:

        u1be_synchsafe_t(kaitai::kstream* p_io, id3v2_3_t::u2be_synchsafe_t* p_parent = 0, id3v2_3_t* p_root = 0);
        void _read();
        ~u1be_synchsafe_t();

    private:
        bool m_padding;
        uint64_t m_value;
        id3v2_3_t* m__root;
        id3v2_3_t::u2be_synchsafe_t* m__parent;

    public:
        bool padding() const { return m_padding; }
        uint64_t value() const { return m_value; }
        id3v2_3_t* _root() const { return m__root; }
        id3v2_3_t::u2be_synchsafe_t* _parent() const { return m__parent; }
    };

    class u2be_synchsafe_t : public kaitai::kstruct {

    public:

        u2be_synchsafe_t(kaitai::kstream* p_io, id3v2_3_t::u4be_synchsafe_t* p_parent = 0, id3v2_3_t* p_root = 0);
        void _read();
        ~u2be_synchsafe_t();

    private:
        bool f_value;
        int32_t m_value;

    public:
        int32_t value();

    private:
        u1be_synchsafe_t* m_byte0;
        u1be_synchsafe_t* m_byte1;
        id3v2_3_t* m__root;
        id3v2_3_t::u4be_synchsafe_t* m__parent;

    public:
        u1be_synchsafe_t* byte0() const { return m_byte0; }
        u1be_synchsafe_t* byte1() const { return m_byte1; }
        id3v2_3_t* _root() const { return m__root; }
        id3v2_3_t::u4be_synchsafe_t* _parent() const { return m__parent; }
    };

    class tag_t : public kaitai::kstruct {

    public:

        tag_t(kaitai::kstream* p_io, id3v2_3_t* p_parent = 0, id3v2_3_t* p_root = 0);
        void _read();
        ~tag_t();

    private:
        header_t* m_header;
        header_ex_t* m_header_ex;
        bool n_header_ex;

    public:
        bool _is_null_header_ex() { header_ex(); return n_header_ex; };

    private:
        std::vector<frame_t*>* m_frames;
        std::string m_padding;
        bool n_padding;

    public:
        bool _is_null_padding() { padding(); return n_padding; };

    private:
        id3v2_3_t* m__root;
        id3v2_3_t* m__parent;

    public:
        header_t* header() const { return m_header; }
        header_ex_t* header_ex() const { return m_header_ex; }
        std::vector<frame_t*>* frames() const { return m_frames; }
        std::string padding() const { return m_padding; }
        id3v2_3_t* _root() const { return m__root; }
        id3v2_3_t* _parent() const { return m__parent; }
    };

    class u4be_synchsafe_t : public kaitai::kstruct {

    public:

        u4be_synchsafe_t(kaitai::kstream* p_io, id3v2_3_t::header_t* p_parent = 0, id3v2_3_t* p_root = 0);
        void _read();
        ~u4be_synchsafe_t();

    private:
        bool f_value;
        int32_t m_value;

    public:
        int32_t value();

    private:
        u2be_synchsafe_t* m_short0;
        u2be_synchsafe_t* m_short1;
        id3v2_3_t* m__root;
        id3v2_3_t::header_t* m__parent;

    public:
        u2be_synchsafe_t* short0() const { return m_short0; }
        u2be_synchsafe_t* short1() const { return m_short1; }
        id3v2_3_t* _root() const { return m__root; }
        id3v2_3_t::header_t* _parent() const { return m__parent; }
    };

    class frame_t : public kaitai::kstruct {

    public:
        class flags_t;

        frame_t(kaitai::kstream* p_io, id3v2_3_t::tag_t* p_parent = 0, id3v2_3_t* p_root = 0);
        void _read();
        ~frame_t();

        class flags_t : public kaitai::kstruct {

        public:

            flags_t(kaitai::kstream* p_io, id3v2_3_t::frame_t* p_parent = 0, id3v2_3_t* p_root = 0);
            void _read();
            ~flags_t();

        private:
            bool m_flag_discard_alter_tag;
            bool m_flag_discard_alter_file;
            bool m_flag_read_only;
            uint64_t m_reserved1;
            bool m_flag_compressed;
            bool m_flag_encrypted;
            bool m_flag_grouping;
            uint64_t m_reserved2;
            id3v2_3_t* m__root;
            id3v2_3_t::frame_t* m__parent;

        public:
            bool flag_discard_alter_tag() const { return m_flag_discard_alter_tag; }
            bool flag_discard_alter_file() const { return m_flag_discard_alter_file; }
            bool flag_read_only() const { return m_flag_read_only; }
            uint64_t reserved1() const { return m_reserved1; }
            bool flag_compressed() const { return m_flag_compressed; }
            bool flag_encrypted() const { return m_flag_encrypted; }
            bool flag_grouping() const { return m_flag_grouping; }
            uint64_t reserved2() const { return m_reserved2; }
            id3v2_3_t* _root() const { return m__root; }
            id3v2_3_t::frame_t* _parent() const { return m__parent; }
        };

    private:
        bool f_is_invalid;
        bool m_is_invalid;

    public:
        bool is_invalid();

    private:
        std::string m_id;
        uint32_t m_size;
        flags_t* m_flags;
        std::string m_data;
        id3v2_3_t* m__root;
        id3v2_3_t::tag_t* m__parent;

    public:
        std::string id() const { return m_id; }
        uint32_t size() const { return m_size; }
        flags_t* flags() const { return m_flags; }
        std::string data() const { return m_data; }
        id3v2_3_t* _root() const { return m__root; }
        id3v2_3_t::tag_t* _parent() const { return m__parent; }
    };

    /**
     * ID3v2 extended header
     * \sa Section 3.2. ID3v2 extended header
     */

    class header_ex_t : public kaitai::kstruct {

    public:
        class flags_ex_t;

        header_ex_t(kaitai::kstream* p_io, id3v2_3_t::tag_t* p_parent = 0, id3v2_3_t* p_root = 0);
        void _read();
        ~header_ex_t();

        class flags_ex_t : public kaitai::kstruct {

        public:

            flags_ex_t(kaitai::kstream* p_io, id3v2_3_t::header_ex_t* p_parent = 0, id3v2_3_t* p_root = 0);
            void _read();
            ~flags_ex_t();

        private:
            bool m_flag_crc;
            uint64_t m_reserved;
            id3v2_3_t* m__root;
            id3v2_3_t::header_ex_t* m__parent;

        public:
            bool flag_crc() const { return m_flag_crc; }
            uint64_t reserved() const { return m_reserved; }
            id3v2_3_t* _root() const { return m__root; }
            id3v2_3_t::header_ex_t* _parent() const { return m__parent; }
        };

    private:
        uint32_t m_size;
        flags_ex_t* m_flags_ex;
        uint32_t m_padding_size;
        uint32_t m_crc;
        bool n_crc;

    public:
        bool _is_null_crc() { crc(); return n_crc; };

    private:
        id3v2_3_t* m__root;
        id3v2_3_t::tag_t* m__parent;

    public:
        uint32_t size() const { return m_size; }
        flags_ex_t* flags_ex() const { return m_flags_ex; }
        uint32_t padding_size() const { return m_padding_size; }
        uint32_t crc() const { return m_crc; }
        id3v2_3_t* _root() const { return m__root; }
        id3v2_3_t::tag_t* _parent() const { return m__parent; }
    };

    /**
     * ID3v2 fixed header
     * \sa Section 3.1. ID3v2 header
     */

    class header_t : public kaitai::kstruct {

    public:
        class flags_t;

        header_t(kaitai::kstream* p_io, id3v2_3_t::tag_t* p_parent = 0, id3v2_3_t* p_root = 0);
        void _read();
        ~header_t();

        class flags_t : public kaitai::kstruct {

        public:

            flags_t(kaitai::kstream* p_io, id3v2_3_t::header_t* p_parent = 0, id3v2_3_t* p_root = 0);
            void _read();
            ~flags_t();

        private:
            bool m_flag_unsynchronization;
            bool m_flag_headerex;
            bool m_flag_experimental;
            uint64_t m_reserved;
            id3v2_3_t* m__root;
            id3v2_3_t::header_t* m__parent;

        public:
            bool flag_unsynchronization() const { return m_flag_unsynchronization; }
            bool flag_headerex() const { return m_flag_headerex; }
            bool flag_experimental() const { return m_flag_experimental; }
            uint64_t reserved() const { return m_reserved; }
            id3v2_3_t* _root() const { return m__root; }
            id3v2_3_t::header_t* _parent() const { return m__parent; }
        };

    private:
        std::string m_magic;
        uint8_t m_version_major;
        uint8_t m_version_revision;
        flags_t* m_flags;
        u4be_synchsafe_t* m_size;
        id3v2_3_t* m__root;
        id3v2_3_t::tag_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint8_t version_major() const { return m_version_major; }
        uint8_t version_revision() const { return m_version_revision; }
        flags_t* flags() const { return m_flags; }
        u4be_synchsafe_t* size() const { return m_size; }
        id3v2_3_t* _root() const { return m__root; }
        id3v2_3_t::tag_t* _parent() const { return m__parent; }
    };

private:
    tag_t* m_tag;
    id3v2_3_t* m__root;
    kaitai::kstruct* m__parent;

public:
    tag_t* tag() const { return m_tag; }
    id3v2_3_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // ID3V2_3_H_

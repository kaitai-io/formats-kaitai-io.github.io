#ifndef ID3V2_4_H_
#define ID3V2_4_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class id3v2_4_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * \sa http://id3.org/id3v2.4.0-structure Source
 * \sa http://id3.org/id3v2.4.0-frames Source
 */

class id3v2_4_t : public kaitai::kstruct {

public:
    class footer_t;
    class frame_t;
    class header_t;
    class header_ex_t;
    class padding_t;
    class tag_t;
    class u1be_synchsafe_t;
    class u2be_synchsafe_t;
    class u4be_synchsafe_t;

    id3v2_4_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, id3v2_4_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~id3v2_4_t();

    class footer_t : public kaitai::kstruct {

    public:
        class flags_t;

        footer_t(kaitai::kstream* p__io, id3v2_4_t::tag_t* p__parent = 0, id3v2_4_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~footer_t();

        class flags_t : public kaitai::kstruct {

        public:

            flags_t(kaitai::kstream* p__io, id3v2_4_t::footer_t* p__parent = 0, id3v2_4_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~flags_t();

        private:
            bool m_flag_unsynchronization;
            bool m_flag_headerex;
            bool m_flag_experimental;
            bool m_flag_footer;
            uint64_t m_reserved;
            id3v2_4_t* m__root;
            id3v2_4_t::footer_t* m__parent;

        public:
            bool flag_unsynchronization() const { return m_flag_unsynchronization; }
            bool flag_headerex() const { return m_flag_headerex; }
            bool flag_experimental() const { return m_flag_experimental; }
            bool flag_footer() const { return m_flag_footer; }
            uint64_t reserved() const { return m_reserved; }
            id3v2_4_t* _root() const { return m__root; }
            id3v2_4_t::footer_t* _parent() const { return m__parent; }
        };

    private:
        std::string m_magic;
        uint8_t m_version_major;
        uint8_t m_version_revision;
        flags_t* m_flags;
        u4be_synchsafe_t* m_size;
        id3v2_4_t* m__root;
        id3v2_4_t::tag_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint8_t version_major() const { return m_version_major; }
        uint8_t version_revision() const { return m_version_revision; }
        flags_t* flags() const { return m_flags; }
        u4be_synchsafe_t* size() const { return m_size; }
        id3v2_4_t* _root() const { return m__root; }
        id3v2_4_t::tag_t* _parent() const { return m__parent; }
    };

    class frame_t : public kaitai::kstruct {

    public:
        class flags_format_t;
        class flags_status_t;

        frame_t(kaitai::kstream* p__io, id3v2_4_t::tag_t* p__parent = 0, id3v2_4_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~frame_t();

        class flags_format_t : public kaitai::kstruct {

        public:

            flags_format_t(kaitai::kstream* p__io, id3v2_4_t::frame_t* p__parent = 0, id3v2_4_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~flags_format_t();

        private:
            bool m_reserved1;
            bool m_flag_grouping;
            uint64_t m_reserved2;
            bool m_flag_compressed;
            bool m_flag_encrypted;
            bool m_flag_unsynchronisated;
            bool m_flag_indicator;
            id3v2_4_t* m__root;
            id3v2_4_t::frame_t* m__parent;

        public:
            bool reserved1() const { return m_reserved1; }
            bool flag_grouping() const { return m_flag_grouping; }
            uint64_t reserved2() const { return m_reserved2; }
            bool flag_compressed() const { return m_flag_compressed; }
            bool flag_encrypted() const { return m_flag_encrypted; }
            bool flag_unsynchronisated() const { return m_flag_unsynchronisated; }
            bool flag_indicator() const { return m_flag_indicator; }
            id3v2_4_t* _root() const { return m__root; }
            id3v2_4_t::frame_t* _parent() const { return m__parent; }
        };

        class flags_status_t : public kaitai::kstruct {

        public:

            flags_status_t(kaitai::kstream* p__io, id3v2_4_t::frame_t* p__parent = 0, id3v2_4_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~flags_status_t();

        private:
            bool m_reserved1;
            bool m_flag_discard_alter_tag;
            bool m_flag_discard_alter_file;
            bool m_flag_read_only;
            uint64_t m_reserved2;
            id3v2_4_t* m__root;
            id3v2_4_t::frame_t* m__parent;

        public:
            bool reserved1() const { return m_reserved1; }
            bool flag_discard_alter_tag() const { return m_flag_discard_alter_tag; }
            bool flag_discard_alter_file() const { return m_flag_discard_alter_file; }
            bool flag_read_only() const { return m_flag_read_only; }
            uint64_t reserved2() const { return m_reserved2; }
            id3v2_4_t* _root() const { return m__root; }
            id3v2_4_t::frame_t* _parent() const { return m__parent; }
        };

    private:
        bool f_is_invalid;
        bool m_is_invalid;

    public:
        bool is_invalid();

    private:
        std::string m_id;
        u4be_synchsafe_t* m_size;
        flags_status_t* m_flags_status;
        flags_format_t* m_flags_format;
        std::string m_data;
        id3v2_4_t* m__root;
        id3v2_4_t::tag_t* m__parent;

    public:
        std::string id() const { return m_id; }
        u4be_synchsafe_t* size() const { return m_size; }
        flags_status_t* flags_status() const { return m_flags_status; }
        flags_format_t* flags_format() const { return m_flags_format; }
        std::string data() const { return m_data; }
        id3v2_4_t* _root() const { return m__root; }
        id3v2_4_t::tag_t* _parent() const { return m__parent; }
    };

    class header_t : public kaitai::kstruct {

    public:
        class flags_t;

        header_t(kaitai::kstream* p__io, id3v2_4_t::tag_t* p__parent = 0, id3v2_4_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

        class flags_t : public kaitai::kstruct {

        public:

            flags_t(kaitai::kstream* p__io, id3v2_4_t::header_t* p__parent = 0, id3v2_4_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~flags_t();

        private:
            bool m_flag_unsynchronization;
            bool m_flag_headerex;
            bool m_flag_experimental;
            bool m_flag_footer;
            uint64_t m_reserved;
            id3v2_4_t* m__root;
            id3v2_4_t::header_t* m__parent;

        public:
            bool flag_unsynchronization() const { return m_flag_unsynchronization; }
            bool flag_headerex() const { return m_flag_headerex; }
            bool flag_experimental() const { return m_flag_experimental; }
            bool flag_footer() const { return m_flag_footer; }
            uint64_t reserved() const { return m_reserved; }
            id3v2_4_t* _root() const { return m__root; }
            id3v2_4_t::header_t* _parent() const { return m__parent; }
        };

    private:
        std::string m_magic;
        uint8_t m_version_major;
        uint8_t m_version_revision;
        flags_t* m_flags;
        u4be_synchsafe_t* m_size;
        id3v2_4_t* m__root;
        id3v2_4_t::tag_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint8_t version_major() const { return m_version_major; }
        uint8_t version_revision() const { return m_version_revision; }
        flags_t* flags() const { return m_flags; }
        u4be_synchsafe_t* size() const { return m_size; }
        id3v2_4_t* _root() const { return m__root; }
        id3v2_4_t::tag_t* _parent() const { return m__parent; }
    };

    class header_ex_t : public kaitai::kstruct {

    public:
        class flags_ex_t;

        header_ex_t(kaitai::kstream* p__io, id3v2_4_t::tag_t* p__parent = 0, id3v2_4_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_ex_t();

        class flags_ex_t : public kaitai::kstruct {

        public:

            flags_ex_t(kaitai::kstream* p__io, id3v2_4_t::header_ex_t* p__parent = 0, id3v2_4_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~flags_ex_t();

        private:
            bool m_reserved1;
            bool m_flag_update;
            bool m_flag_crc;
            bool m_flag_restrictions;
            uint64_t m_reserved2;
            id3v2_4_t* m__root;
            id3v2_4_t::header_ex_t* m__parent;

        public:
            bool reserved1() const { return m_reserved1; }
            bool flag_update() const { return m_flag_update; }
            bool flag_crc() const { return m_flag_crc; }
            bool flag_restrictions() const { return m_flag_restrictions; }
            uint64_t reserved2() const { return m_reserved2; }
            id3v2_4_t* _root() const { return m__root; }
            id3v2_4_t::header_ex_t* _parent() const { return m__parent; }
        };

    private:
        u4be_synchsafe_t* m_size;
        flags_ex_t* m_flags_ex;
        std::string m_data;
        id3v2_4_t* m__root;
        id3v2_4_t::tag_t* m__parent;

    public:
        u4be_synchsafe_t* size() const { return m_size; }
        flags_ex_t* flags_ex() const { return m_flags_ex; }
        std::string data() const { return m_data; }
        id3v2_4_t* _root() const { return m__root; }
        id3v2_4_t::tag_t* _parent() const { return m__parent; }
    };

    class padding_t : public kaitai::kstruct {

    public:

        padding_t(kaitai::kstream* p__io, id3v2_4_t::tag_t* p__parent = 0, id3v2_4_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~padding_t();

    private:
        std::string m_padding;
        id3v2_4_t* m__root;
        id3v2_4_t::tag_t* m__parent;

    public:
        std::string padding() const { return m_padding; }
        id3v2_4_t* _root() const { return m__root; }
        id3v2_4_t::tag_t* _parent() const { return m__parent; }
    };

    class tag_t : public kaitai::kstruct {

    public:

        tag_t(kaitai::kstream* p__io, id3v2_4_t* p__parent = 0, id3v2_4_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~tag_t();

    private:
        header_t* m_header;
        header_ex_t* m_header_ex;
        bool n_header_ex;

    public:
        bool _is_null_header_ex() { header_ex(); return n_header_ex; };

    private:
        std::vector<frame_t*>* m_frames;
        padding_t* m_padding;
        bool n_padding;

    public:
        bool _is_null_padding() { padding(); return n_padding; };

    private:
        footer_t* m_footer;
        bool n_footer;

    public:
        bool _is_null_footer() { footer(); return n_footer; };

    private:
        id3v2_4_t* m__root;
        id3v2_4_t* m__parent;

    public:
        header_t* header() const { return m_header; }
        header_ex_t* header_ex() const { return m_header_ex; }
        std::vector<frame_t*>* frames() const { return m_frames; }
        padding_t* padding() const { return m_padding; }
        footer_t* footer() const { return m_footer; }
        id3v2_4_t* _root() const { return m__root; }
        id3v2_4_t* _parent() const { return m__parent; }
    };

    class u1be_synchsafe_t : public kaitai::kstruct {

    public:

        u1be_synchsafe_t(kaitai::kstream* p__io, id3v2_4_t::u2be_synchsafe_t* p__parent = 0, id3v2_4_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~u1be_synchsafe_t();

    private:
        bool m_padding;
        uint64_t m_value;
        id3v2_4_t* m__root;
        id3v2_4_t::u2be_synchsafe_t* m__parent;

    public:
        bool padding() const { return m_padding; }
        uint64_t value() const { return m_value; }
        id3v2_4_t* _root() const { return m__root; }
        id3v2_4_t::u2be_synchsafe_t* _parent() const { return m__parent; }
    };

    class u2be_synchsafe_t : public kaitai::kstruct {

    public:

        u2be_synchsafe_t(kaitai::kstream* p__io, id3v2_4_t::u4be_synchsafe_t* p__parent = 0, id3v2_4_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~u2be_synchsafe_t();

    private:
        bool f_value;
        int32_t m_value;

    public:
        int32_t value();

    private:
        u1be_synchsafe_t* m_byte0;
        u1be_synchsafe_t* m_byte1;
        id3v2_4_t* m__root;
        id3v2_4_t::u4be_synchsafe_t* m__parent;

    public:
        u1be_synchsafe_t* byte0() const { return m_byte0; }
        u1be_synchsafe_t* byte1() const { return m_byte1; }
        id3v2_4_t* _root() const { return m__root; }
        id3v2_4_t::u4be_synchsafe_t* _parent() const { return m__parent; }
    };

    class u4be_synchsafe_t : public kaitai::kstruct {

    public:

        u4be_synchsafe_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, id3v2_4_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~u4be_synchsafe_t();

    private:
        bool f_value;
        int32_t m_value;

    public:
        int32_t value();

    private:
        u2be_synchsafe_t* m_short0;
        u2be_synchsafe_t* m_short1;
        id3v2_4_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        u2be_synchsafe_t* short0() const { return m_short0; }
        u2be_synchsafe_t* short1() const { return m_short1; }
        id3v2_4_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

private:
    tag_t* m_tag;
    id3v2_4_t* m__root;
    kaitai::kstruct* m__parent;

public:
    tag_t* tag() const { return m_tag; }
    id3v2_4_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // ID3V2_4_H_

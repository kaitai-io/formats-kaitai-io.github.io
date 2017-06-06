#ifndef SWF_H_
#define SWF_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include <kaitai/kaitaistruct.h>
#include <kaitai/kaitaistream.h>

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class swf_t : public kaitai::kstruct {

public:
    class swf_body_t;
    class rect_t;
    class tag_t;
    class abc_tag_body_t;
    class record_header_t;

    enum tag_type_t {
        TAG_TYPE_FILE_ATTRIBUTES = 69,
        TAG_TYPE_ABC_TAG = 82
    };

    swf_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, swf_t* p_root = 0);
    void _read();
    ~swf_t();

    class swf_body_t : public kaitai::kstruct {

    public:

        swf_body_t(kaitai::kstream* p_io, swf_t* p_parent = 0, swf_t* p_root = 0);
        void _read();
        ~swf_body_t();

    private:
        rect_t* m_rect;
        uint16_t m_frame_rate;
        uint16_t m_frame_count;
        std::vector<tag_t*>* m_tags;
        swf_t* m__root;
        swf_t* m__parent;

    public:
        rect_t* rect() const { return m_rect; }
        uint16_t frame_rate() const { return m_frame_rate; }
        uint16_t frame_count() const { return m_frame_count; }
        std::vector<tag_t*>* tags() const { return m_tags; }
        swf_t* _root() const { return m__root; }
        swf_t* _parent() const { return m__parent; }
    };

    class rect_t : public kaitai::kstruct {

    public:

        rect_t(kaitai::kstream* p_io, swf_t::swf_body_t* p_parent = 0, swf_t* p_root = 0);
        void _read();
        ~rect_t();

    private:
        bool f_num_bits;
        int32_t m_num_bits;

    public:
        int32_t num_bits();

    private:
        bool f_num_bytes;
        int32_t m_num_bytes;

    public:
        int32_t num_bytes();

    private:
        uint8_t m_b1;
        std::string m_skip;
        swf_t* m__root;
        swf_t::swf_body_t* m__parent;

    public:
        uint8_t b1() const { return m_b1; }
        std::string skip() const { return m_skip; }
        swf_t* _root() const { return m__root; }
        swf_t::swf_body_t* _parent() const { return m__parent; }
    };

    class tag_t : public kaitai::kstruct {

    public:

        tag_t(kaitai::kstream* p_io, swf_t::swf_body_t* p_parent = 0, swf_t* p_root = 0);
        void _read();
        ~tag_t();

    private:
        record_header_t* m_record_header;
        abc_tag_body_t* m_tag_body;
        swf_t* m__root;
        swf_t::swf_body_t* m__parent;
        std::string m__raw_tag_body;
        kaitai::kstream* m__io__raw_tag_body;

    public:
        record_header_t* record_header() const { return m_record_header; }
        abc_tag_body_t* tag_body() const { return m_tag_body; }
        swf_t* _root() const { return m__root; }
        swf_t::swf_body_t* _parent() const { return m__parent; }
        std::string _raw_tag_body() const { return m__raw_tag_body; }
        kaitai::kstream* _io__raw_tag_body() const { return m__io__raw_tag_body; }
    };

    class abc_tag_body_t : public kaitai::kstruct {

    public:

        abc_tag_body_t(kaitai::kstream* p_io, swf_t::tag_t* p_parent = 0, swf_t* p_root = 0);
        void _read();
        ~abc_tag_body_t();

    private:
        uint32_t m_flags;
        std::string m_name;
        std::string m_abcdata;
        swf_t* m__root;
        swf_t::tag_t* m__parent;

    public:
        uint32_t flags() const { return m_flags; }
        std::string name() const { return m_name; }
        std::string abcdata() const { return m_abcdata; }
        swf_t* _root() const { return m__root; }
        swf_t::tag_t* _parent() const { return m__parent; }
    };

    class record_header_t : public kaitai::kstruct {

    public:

        record_header_t(kaitai::kstream* p_io, swf_t::tag_t* p_parent = 0, swf_t* p_root = 0);
        void _read();
        ~record_header_t();

    private:
        bool f_tag_type;
        tag_type_t m_tag_type;

    public:
        tag_type_t tag_type();

    private:
        bool f_small_len;
        int32_t m_small_len;

    public:
        int32_t small_len();

    private:
        bool f_len;
        int32_t m_len;

    public:
        int32_t len();

    private:
        uint16_t m_tag_code_and_length;
        int32_t m_big_len;
        bool n_big_len;

    public:
        bool _is_null_big_len() { big_len(); return n_big_len; };

    private:
        swf_t* m__root;
        swf_t::tag_t* m__parent;

    public:
        uint16_t tag_code_and_length() const { return m_tag_code_and_length; }
        int32_t big_len() const { return m_big_len; }
        swf_t* _root() const { return m__root; }
        swf_t::tag_t* _parent() const { return m__parent; }
    };

private:
    std::string m_junk;
    uint32_t m_file_size;
    swf_body_t* m_body;
    swf_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw__raw_body;
    std::string m__raw_body;
    kaitai::kstream* m__io__raw_body;

public:
    std::string junk() const { return m_junk; }
    uint32_t file_size() const { return m_file_size; }
    swf_body_t* body() const { return m_body; }
    swf_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw__raw_body() const { return m__raw__raw_body; }
    std::string _raw_body() const { return m__raw_body; }
    kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
};

#endif  // SWF_H_

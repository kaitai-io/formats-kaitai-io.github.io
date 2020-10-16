#ifndef RIFF_H_
#define RIFF_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * The Resource Interchange File Format (RIFF) is a generic file container format
 * for storing data in tagged chunks. It is primarily used to store multimedia
 * such as sound and video, though it may also be used to store any arbitrary data.
 * 
 * The Microsoft implementation is mostly known through container formats
 * like AVI, ANI and WAV, which use RIFF as their basis.
 * \sa https://www.johnloomis.org/cpe102/asgn/asgn1/riff.html Source
 */

class riff_t : public kaitai::kstruct {

public:
    class list_chunk_data_t;
    class chunk_t;
    class parent_chunk_data_t;
    class info_subchunk_t;
    class chunk_type_t;

    enum fourcc_t {
        FOURCC_RIFF = 1179011410,
        FOURCC_INFO = 1330007625,
        FOURCC_LIST = 1414744396
    };

    riff_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, riff_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~riff_t();

    class list_chunk_data_t : public kaitai::kstruct {

    public:

        list_chunk_data_t(kaitai::kstream* p__io, riff_t::chunk_type_t* p__parent = 0, riff_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~list_chunk_data_t();

    private:
        bool f_parent_chunk_data_ofs;
        int32_t m_parent_chunk_data_ofs;

    public:
        int32_t parent_chunk_data_ofs();

    private:
        bool f_form_type;
        fourcc_t m_form_type;

    public:
        fourcc_t form_type();

    private:
        bool f_form_type_readable;
        std::string m_form_type_readable;

    public:
        std::string form_type_readable();

    private:
        bool f_subchunks;
        std::vector<kaitai::kstruct*>* m_subchunks;

    public:
        std::vector<kaitai::kstruct*>* subchunks();

    private:
        std::string m_save_parent_chunk_data_ofs;
        bool n_save_parent_chunk_data_ofs;

    public:
        bool _is_null_save_parent_chunk_data_ofs() { save_parent_chunk_data_ofs(); return n_save_parent_chunk_data_ofs; };

    private:
        parent_chunk_data_t* m_parent_chunk_data;
        riff_t* m__root;
        riff_t::chunk_type_t* m__parent;

    public:
        std::string save_parent_chunk_data_ofs() const { return m_save_parent_chunk_data_ofs; }
        parent_chunk_data_t* parent_chunk_data() const { return m_parent_chunk_data; }
        riff_t* _root() const { return m__root; }
        riff_t::chunk_type_t* _parent() const { return m__parent; }
    };

    class chunk_t : public kaitai::kstruct {

    public:
        class slot_t;

        chunk_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, riff_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~chunk_t();

        class slot_t : public kaitai::kstruct {

        public:

            slot_t(kaitai::kstream* p__io, riff_t::chunk_t* p__parent = 0, riff_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~slot_t();

        private:
            riff_t* m__root;
            riff_t::chunk_t* m__parent;

        public:
            riff_t* _root() const { return m__root; }
            riff_t::chunk_t* _parent() const { return m__parent; }
        };

    private:
        uint32_t m_id;
        uint32_t m_len;
        slot_t* m_data_slot;
        std::string m_pad_byte;
        riff_t* m__root;
        kaitai::kstruct* m__parent;
        std::string m__raw_data_slot;
        kaitai::kstream* m__io__raw_data_slot;

    public:
        uint32_t id() const { return m_id; }
        uint32_t len() const { return m_len; }
        slot_t* data_slot() const { return m_data_slot; }
        std::string pad_byte() const { return m_pad_byte; }
        riff_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
        std::string _raw_data_slot() const { return m__raw_data_slot; }
        kaitai::kstream* _io__raw_data_slot() const { return m__io__raw_data_slot; }
    };

    class parent_chunk_data_t : public kaitai::kstruct {

    public:
        class slot_t;

        parent_chunk_data_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, riff_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~parent_chunk_data_t();

        class slot_t : public kaitai::kstruct {

        public:

            slot_t(kaitai::kstream* p__io, riff_t::parent_chunk_data_t* p__parent = 0, riff_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~slot_t();

        private:
            riff_t* m__root;
            riff_t::parent_chunk_data_t* m__parent;

        public:
            riff_t* _root() const { return m__root; }
            riff_t::parent_chunk_data_t* _parent() const { return m__parent; }
        };

    private:
        uint32_t m_form_type;
        slot_t* m_subchunks_slot;
        riff_t* m__root;
        kaitai::kstruct* m__parent;
        std::string m__raw_subchunks_slot;
        kaitai::kstream* m__io__raw_subchunks_slot;

    public:
        uint32_t form_type() const { return m_form_type; }
        slot_t* subchunks_slot() const { return m_subchunks_slot; }
        riff_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
        std::string _raw_subchunks_slot() const { return m__raw_subchunks_slot; }
        kaitai::kstream* _io__raw_subchunks_slot() const { return m__io__raw_subchunks_slot; }
    };

    /**
     * All registered subchunks in the INFO chunk are NULL-terminated strings,
     * but the unregistered might not be. By convention, the registered
     * chunk IDs are in uppercase and the unregistered IDs are in lowercase.
     * 
     * If the chunk ID of an INFO subchunk contains a lowercase
     * letter, this chunk is considered as unregistered and thus we can make
     * no assumptions about the type of data.
     */

    class info_subchunk_t : public kaitai::kstruct {

    public:

        info_subchunk_t(kaitai::kstream* p__io, riff_t::list_chunk_data_t* p__parent = 0, riff_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~info_subchunk_t();

    private:
        bool f_chunk_data;
        std::string m_chunk_data;
        bool n_chunk_data;

    public:
        bool _is_null_chunk_data() { chunk_data(); return n_chunk_data; };

    private:

    public:
        std::string chunk_data();

    private:
        bool f_is_unregistered_tag;
        bool m_is_unregistered_tag;

    public:

        /**
         * Check if chunk_id contains lowercase characters ([a-z], ASCII 97 = a, ASCII 122 = z).
         */
        bool is_unregistered_tag();

    private:
        bool f_id_chars;
        std::string m_id_chars;

    public:
        std::string id_chars();

    private:
        bool f_chunk_id_readable;
        std::string m_chunk_id_readable;

    public:
        std::string chunk_id_readable();

    private:
        bool f_chunk_ofs;
        int32_t m_chunk_ofs;

    public:
        int32_t chunk_ofs();

    private:
        std::string m_save_chunk_ofs;
        bool n_save_chunk_ofs;

    public:
        bool _is_null_save_chunk_ofs() { save_chunk_ofs(); return n_save_chunk_ofs; };

    private:
        chunk_t* m_chunk;
        riff_t* m__root;
        riff_t::list_chunk_data_t* m__parent;

    public:
        std::string save_chunk_ofs() const { return m_save_chunk_ofs; }
        chunk_t* chunk() const { return m_chunk; }
        riff_t* _root() const { return m__root; }
        riff_t::list_chunk_data_t* _parent() const { return m__parent; }
    };

    class chunk_type_t : public kaitai::kstruct {

    public:

        chunk_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, riff_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~chunk_type_t();

    private:
        bool f_chunk_ofs;
        int32_t m_chunk_ofs;

    public:
        int32_t chunk_ofs();

    private:
        bool f_chunk_id;
        fourcc_t m_chunk_id;

    public:
        fourcc_t chunk_id();

    private:
        bool f_chunk_id_readable;
        std::string m_chunk_id_readable;

    public:
        std::string chunk_id_readable();

    private:
        bool f_chunk_data;
        list_chunk_data_t* m_chunk_data;
        bool n_chunk_data;

    public:
        bool _is_null_chunk_data() { chunk_data(); return n_chunk_data; };

    private:

    public:
        list_chunk_data_t* chunk_data();

    private:
        std::string m_save_chunk_ofs;
        bool n_save_chunk_ofs;

    public:
        bool _is_null_save_chunk_ofs() { save_chunk_ofs(); return n_save_chunk_ofs; };

    private:
        chunk_t* m_chunk;
        riff_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::string save_chunk_ofs() const { return m_save_chunk_ofs; }
        chunk_t* chunk() const { return m_chunk; }
        riff_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

private:
    bool f_chunk_id;
    fourcc_t m_chunk_id;

public:
    fourcc_t chunk_id();

private:
    bool f_is_riff_chunk;
    bool m_is_riff_chunk;

public:
    bool is_riff_chunk();

private:
    bool f_parent_chunk_data;
    parent_chunk_data_t* m_parent_chunk_data;
    bool n_parent_chunk_data;

public:
    bool _is_null_parent_chunk_data() { parent_chunk_data(); return n_parent_chunk_data; };

private:

public:
    parent_chunk_data_t* parent_chunk_data();

private:
    bool f_subchunks;
    std::vector<chunk_type_t*>* m_subchunks;
    bool n_subchunks;

public:
    bool _is_null_subchunks() { subchunks(); return n_subchunks; };

private:

public:
    std::vector<chunk_type_t*>* subchunks();

private:
    chunk_t* m_chunk;
    riff_t* m__root;
    kaitai::kstruct* m__parent;

public:
    chunk_t* chunk() const { return m_chunk; }
    riff_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // RIFF_H_

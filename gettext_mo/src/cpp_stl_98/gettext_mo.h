#ifndef GETTEXT_MO_H_
#define GETTEXT_MO_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class gettext_mo_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * [GNU gettext](https://www.gnu.org/software/gettext/) is a popular
 * solution in free/open source software world to do i18n/l10n of
 * software, by providing translated strings that will substitute
 * strings in original language (typically, English).
 * 
 * gettext .mo is a binary database format which stores these string
 * translation pairs in an efficient binary format, ready to be used by
 * gettext-enabled software. .mo format is a result of compilation of
 * text-based .po files using
 * [msgfmt](https://www.gnu.org/software/gettext/manual/html_node/msgfmt-Invocation.html#msgfmt-Invocation)
 * utility. The reverse conversion (.mo -> .po) is also possible using
 * [msgunfmt](https://www.gnu.org/software/gettext/manual/html_node/msgunfmt-Invocation.html#msgunfmt-Invocation)
 * decompiler utility.
 * \sa https://gitlab.com/worr/libintl Source
 */

class gettext_mo_t : public kaitai::kstruct {

public:
    class hash_lookup_iteration_t;
    class hashtable_lookup_t;
    class lookup_iteration_t;
    class mo_t;

    gettext_mo_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, gettext_mo_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~gettext_mo_t();

    class hash_lookup_iteration_t : public kaitai::kstruct {

    public:

        hash_lookup_iteration_t(uint32_t p_idx, uint32_t p_collision_step, kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, gettext_mo_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~hash_lookup_iteration_t();

    private:
        bool f_next;
        hash_lookup_iteration_t* m_next;

    public:
        hash_lookup_iteration_t* next();

    private:
        bool f_next_idx;
        int32_t m_next_idx;

    public:
        int32_t next_idx();

    private:
        bool f_original;
        std::string m_original;

    public:
        std::string original();

    private:
        bool f_translation;
        std::string m_translation;

    public:
        std::string translation();

    private:
        uint32_t m_idx;
        uint32_t m_collision_step;
        gettext_mo_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint32_t idx() const { return m_idx; }
        uint32_t collision_step() const { return m_collision_step; }
        gettext_mo_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * def lookup(s:str, t:gettext_mo.GettextMo):
     *   try:
     *     l=gettext_mo.GettextMo.HashtableLookup(s, string_hash(s), t._io, _parent=t, _root=t)
     *     e=l.entry
     *     while(not e.found):
     *       e=e.next
     *     return e.current
     *   except:
     *     raise Exception("Not found "+s+" in the hashtable!")
     * 
     * lookup(t.mo.originals[145].str, t)
     * \sa https://gitlab.com/worr/libintl/raw/master/src/lib/libintl/gettext.c Source
     */

    class hashtable_lookup_t : public kaitai::kstruct {

    public:

        hashtable_lookup_t(std::string p_query, uint32_t p_hash, kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, gettext_mo_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~hashtable_lookup_t();

    private:
        bool f_collision_step;
        int32_t m_collision_step;

    public:
        int32_t collision_step();

    private:
        bool f_entry;
        lookup_iteration_t* m_entry;

    public:
        lookup_iteration_t* entry();

    private:
        bool f_hash_lookup_iteration;
        hash_lookup_iteration_t* m_hash_lookup_iteration;

    public:
        hash_lookup_iteration_t* hash_lookup_iteration();

    private:
        bool f_idx;
        int32_t m_idx;

    public:
        int32_t idx();

    private:
        std::string m_query;
        uint32_t m_hash;
        gettext_mo_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::string query() const { return m_query; }

        /**
         * def string_hash(s):
         *   s=s.encode("utf-8")
         *   h = 0
         *   for i in range(len(s)):
         *     h = h << 4
         *     h += s[i]
         *     tmp = h & 0xF0000000
         *     if tmp != 0:
         *       h ^= tmp
         *       h ^= tmp >> 24
         *   return h
         * \sa https://gitlab.com/worr/libintl/raw/master/src/lib/libintl/strhash.c Source
         */
        uint32_t hash() const { return m_hash; }
        gettext_mo_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class lookup_iteration_t : public kaitai::kstruct {

    public:

        lookup_iteration_t(hash_lookup_iteration_t* p_current, std::string p_query, kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, gettext_mo_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~lookup_iteration_t();

    private:
        bool f_found;
        bool m_found;

    public:
        bool found();

    private:
        bool f_next;
        lookup_iteration_t* m_next;
        bool n_next;

    public:
        bool _is_null_next() { next(); return n_next; };

    private:

    public:
        lookup_iteration_t* next();

    private:
        hash_lookup_iteration_t* m_current;
        std::string m_query;
        gettext_mo_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        hash_lookup_iteration_t* current() const { return m_current; }
        std::string query() const { return m_query; }
        gettext_mo_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class mo_t : public kaitai::kstruct {

    public:
        class descriptor_t;
        class hashtable_item_t;
        class version_t;

        mo_t(kaitai::kstream* p__io, gettext_mo_t* p__parent = 0, gettext_mo_t* p__root = 0);

    private:
        int m__is_le;

    public:

    private:
        void _read();
        void _read_le();
        void _read_be();
        void _clean_up();

    public:
        ~mo_t();

        class descriptor_t : public kaitai::kstruct {

        public:

            descriptor_t(kaitai::kstream* p__io, gettext_mo_t::mo_t* p__parent = 0, gettext_mo_t* p__root = 0, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~descriptor_t();

        private:
            bool f_str;
            std::string m_str;

        public:
            std::string str();

        private:
            uint32_t m_len_str;
            uint32_t m_ofs_str;
            gettext_mo_t* m__root;
            gettext_mo_t::mo_t* m__parent;

        public:
            uint32_t len_str() const { return m_len_str; }
            uint32_t ofs_str() const { return m_ofs_str; }
            gettext_mo_t* _root() const { return m__root; }
            gettext_mo_t::mo_t* _parent() const { return m__parent; }
        };

        class hashtable_item_t : public kaitai::kstruct {

        public:

            hashtable_item_t(kaitai::kstream* p__io, gettext_mo_t::mo_t* p__parent = 0, gettext_mo_t* p__root = 0, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~hashtable_item_t();

        private:
            bool f_is_system_dependent;
            bool m_is_system_dependent;
            bool n_is_system_dependent;

        public:
            bool _is_null_is_system_dependent() { is_system_dependent(); return n_is_system_dependent; };

        private:

        public:
            bool is_system_dependent();

        private:
            bool f_mask;
            int32_t m_mask;

        public:
            int32_t mask();

        private:
            bool f_val;
            int32_t m_val;
            bool n_val;

        public:
            bool _is_null_val() { val(); return n_val; };

        private:

        public:
            int32_t val();

        private:
            bool f_val_1;
            int32_t m_val_1;
            bool n_val_1;

        public:
            bool _is_null_val_1() { val_1(); return n_val_1; };

        private:

        public:
            int32_t val_1();

        private:
            uint32_t m_raw_val;
            gettext_mo_t* m__root;
            gettext_mo_t::mo_t* m__parent;

        public:
            uint32_t raw_val() const { return m_raw_val; }
            gettext_mo_t* _root() const { return m__root; }
            gettext_mo_t::mo_t* _parent() const { return m__parent; }
        };

        class version_t : public kaitai::kstruct {

        public:

            version_t(kaitai::kstream* p__io, gettext_mo_t::mo_t* p__parent = 0, gettext_mo_t* p__root = 0, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~version_t();

        private:
            bool f_major;
            int32_t m_major;

        public:
            int32_t major();

        private:
            bool f_minor;
            int32_t m_minor;

        public:
            int32_t minor();

        private:
            uint32_t m_version_raw;
            gettext_mo_t* m__root;
            gettext_mo_t::mo_t* m__parent;

        public:
            uint32_t version_raw() const { return m_version_raw; }
            gettext_mo_t* _root() const { return m__root; }
            gettext_mo_t::mo_t* _parent() const { return m__parent; }
        };

    private:
        bool f_hashtable_items;
        std::vector<hashtable_item_t*>* m_hashtable_items;
        bool n_hashtable_items;

    public:
        bool _is_null_hashtable_items() { hashtable_items(); return n_hashtable_items; };

    private:

    public:
        std::vector<hashtable_item_t*>* hashtable_items();

    private:
        bool f_originals;
        std::vector<descriptor_t*>* m_originals;

    public:
        std::vector<descriptor_t*>* originals();

    private:
        bool f_translations;
        std::vector<descriptor_t*>* m_translations;

    public:
        std::vector<descriptor_t*>* translations();

    private:
        version_t* m_version;
        uint32_t m_num_translations;
        uint32_t m_ofs_originals;
        uint32_t m_ofs_translations;
        uint32_t m_num_hashtable_items;
        uint32_t m_ofs_hashtable_items;
        gettext_mo_t* m__root;
        gettext_mo_t* m__parent;

    public:
        version_t* version() const { return m_version; }
        uint32_t num_translations() const { return m_num_translations; }
        uint32_t ofs_originals() const { return m_ofs_originals; }
        uint32_t ofs_translations() const { return m_ofs_translations; }
        uint32_t num_hashtable_items() const { return m_num_hashtable_items; }
        uint32_t ofs_hashtable_items() const { return m_ofs_hashtable_items; }
        gettext_mo_t* _root() const { return m__root; }
        gettext_mo_t* _parent() const { return m__parent; }
    };

private:
    std::string m_signature;
    mo_t* m_mo;
    gettext_mo_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string signature() const { return m_signature; }
    mo_t* mo() const { return m_mo; }
    gettext_mo_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // GETTEXT_MO_H_

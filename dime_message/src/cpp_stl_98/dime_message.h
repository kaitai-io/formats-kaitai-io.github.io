#ifndef DIME_MESSAGE_H_
#define DIME_MESSAGE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * Direct Internet Message Encapsulation (DIME)
 * is an old Microsoft specification for sending and receiving
 * SOAP messages along with additional attachments,
 * like binary files, XML fragments, and even other
 * SOAP messages, using standard transport protocols like HTTP.
 * 
 * Sample file: `curl -L
 * https://github.com/kaitai-io/kaitai_struct_formats/files/5894723/scanner_withoptions.dump.gz
 * | gunzip -c > scanner.dump`
 * \sa https://tools.ietf.org/html/draft-nielsen-dime-02 Source
 * \sa https://docs.microsoft.com/en-us/archive/msdn-magazine/2002/december/sending-files-attachments-and-soap-messages-via-dime Source
 * \sa http://imrannazar.com/Parsing-the-DIME-Message-Format Source
 */

class dime_message_t : public kaitai::kstruct {

public:
    class padding_t;
    class option_field_t;
    class option_element_t;
    class record_t;

    enum type_formats_t {
        TYPE_FORMATS_UNCHANGED = 0,
        TYPE_FORMATS_MEDIA_TYPE = 1,
        TYPE_FORMATS_ABSOLUTE_URI = 2,
        TYPE_FORMATS_UNKNOWN = 3,
        TYPE_FORMATS_NONE = 4
    };

    dime_message_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, dime_message_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~dime_message_t();

    /**
     * padding to the next 4-byte boundary
     */

    class padding_t : public kaitai::kstruct {

    public:

        padding_t(kaitai::kstream* p__io, dime_message_t::record_t* p__parent = 0, dime_message_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~padding_t();

    private:
        std::string m_boundary_padding;
        dime_message_t* m__root;
        dime_message_t::record_t* m__parent;

    public:
        std::string boundary_padding() const { return m_boundary_padding; }
        dime_message_t* _root() const { return m__root; }
        dime_message_t::record_t* _parent() const { return m__parent; }
    };

    /**
     * the option field of the record
     */

    class option_field_t : public kaitai::kstruct {

    public:

        option_field_t(kaitai::kstream* p__io, dime_message_t::record_t* p__parent = 0, dime_message_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~option_field_t();

    private:
        std::vector<option_element_t*>* m_option_elements;
        dime_message_t* m__root;
        dime_message_t::record_t* m__parent;

    public:
        std::vector<option_element_t*>* option_elements() const { return m_option_elements; }
        dime_message_t* _root() const { return m__root; }
        dime_message_t::record_t* _parent() const { return m__parent; }
    };

    /**
     * one element of the option field
     */

    class option_element_t : public kaitai::kstruct {

    public:

        option_element_t(kaitai::kstream* p__io, dime_message_t::option_field_t* p__parent = 0, dime_message_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~option_element_t();

    private:
        uint16_t m_element_format;
        uint16_t m_len_element;
        std::string m_element_data;
        dime_message_t* m__root;
        dime_message_t::option_field_t* m__parent;

    public:
        uint16_t element_format() const { return m_element_format; }
        uint16_t len_element() const { return m_len_element; }
        std::string element_data() const { return m_element_data; }
        dime_message_t* _root() const { return m__root; }
        dime_message_t::option_field_t* _parent() const { return m__parent; }
    };

    /**
     * each individual fragment of the message
     */

    class record_t : public kaitai::kstruct {

    public:

        record_t(kaitai::kstream* p__io, dime_message_t* p__parent = 0, dime_message_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_t();

    private:
        uint64_t m_version;
        bool m_is_first_record;
        bool m_is_last_record;
        bool m_is_chunk_record;
        type_formats_t m_type_format;
        uint64_t m_reserved;
        uint16_t m_len_options;
        uint16_t m_len_id;
        uint16_t m_len_type;
        uint32_t m_len_data;
        option_field_t* m_options;
        padding_t* m_options_padding;
        std::string m_id;
        padding_t* m_id_padding;
        std::string m_type;
        padding_t* m_type_padding;
        std::string m_data;
        padding_t* m_data_padding;
        dime_message_t* m__root;
        dime_message_t* m__parent;
        std::string m__raw_options;
        kaitai::kstream* m__io__raw_options;

    public:

        /**
         * DIME format version (always 1)
         */
        uint64_t version() const { return m_version; }

        /**
         * Set if this is the first record in the message
         */
        bool is_first_record() const { return m_is_first_record; }

        /**
         * Set if this is the last record in the message
         */
        bool is_last_record() const { return m_is_last_record; }

        /**
         * Set if the file contained in this record is chunked into multiple records
         */
        bool is_chunk_record() const { return m_is_chunk_record; }

        /**
         * Indicates the structure and format of the value of the TYPE field
         */
        type_formats_t type_format() const { return m_type_format; }

        /**
         * Reserved for future use
         */
        uint64_t reserved() const { return m_reserved; }

        /**
         * Length of the Options field
         */
        uint16_t len_options() const { return m_len_options; }

        /**
         * Length of the ID field
         */
        uint16_t len_id() const { return m_len_id; }

        /**
         * Length of the Type field
         */
        uint16_t len_type() const { return m_len_type; }

        /**
         * Length of the Data field
         */
        uint32_t len_data() const { return m_len_data; }
        option_field_t* options() const { return m_options; }
        padding_t* options_padding() const { return m_options_padding; }

        /**
         * Unique identifier of the file (set in the first record of file)
         */
        std::string id() const { return m_id; }
        padding_t* id_padding() const { return m_id_padding; }

        /**
         * Specified type in the format set with type_format
         */
        std::string type() const { return m_type; }
        padding_t* type_padding() const { return m_type_padding; }

        /**
         * The file data
         */
        std::string data() const { return m_data; }
        padding_t* data_padding() const { return m_data_padding; }
        dime_message_t* _root() const { return m__root; }
        dime_message_t* _parent() const { return m__parent; }
        std::string _raw_options() const { return m__raw_options; }
        kaitai::kstream* _io__raw_options() const { return m__io__raw_options; }
    };

private:
    std::vector<record_t*>* m_records;
    dime_message_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<record_t*>* records() const { return m_records; }
    dime_message_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // DIME_MESSAGE_H_

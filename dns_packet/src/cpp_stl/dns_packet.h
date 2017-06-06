#ifndef DNS_PACKET_H_
#define DNS_PACKET_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include <kaitai/kaitaistruct.h>
#include <kaitai/kaitaistream.h>

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class dns_packet_t : public kaitai::kstruct {

public:
    class pointer_struct_t;
    class label_t;
    class query_t;
    class domain_name_t;
    class address_t;
    class answer_t;
    class packet_flags_t;

    enum class_type_t {
        CLASS_TYPE_IN_CLASS = 1,
        CLASS_TYPE_CS = 2,
        CLASS_TYPE_CH = 3,
        CLASS_TYPE_HS = 4
    };

    enum type_type_t {
        TYPE_TYPE_A = 1,
        TYPE_TYPE_NS = 2,
        TYPE_TYPE_MD = 3,
        TYPE_TYPE_MF = 4,
        TYPE_TYPE_CNAME = 5,
        TYPE_TYPE_SOE = 6,
        TYPE_TYPE_MB = 7,
        TYPE_TYPE_MG = 8,
        TYPE_TYPE_MR = 9,
        TYPE_TYPE_NULL = 10,
        TYPE_TYPE_WKS = 11,
        TYPE_TYPE_PTR = 12,
        TYPE_TYPE_HINFO = 13,
        TYPE_TYPE_MINFO = 14,
        TYPE_TYPE_MX = 15,
        TYPE_TYPE_TXT = 16
    };

    dns_packet_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, dns_packet_t* p_root = 0);
    void _read();
    ~dns_packet_t();

    class pointer_struct_t : public kaitai::kstruct {

    public:

        pointer_struct_t(kaitai::kstream* p_io, dns_packet_t::label_t* p_parent = 0, dns_packet_t* p_root = 0);
        void _read();
        ~pointer_struct_t();

    private:
        bool f_contents;
        domain_name_t* m_contents;

    public:
        domain_name_t* contents();

    private:
        uint8_t m_value;
        dns_packet_t* m__root;
        dns_packet_t::label_t* m__parent;

    public:

        /**
         * Read one byte, then offset to that position, read one domain-name and return
         */
        uint8_t value() const { return m_value; }
        dns_packet_t* _root() const { return m__root; }
        dns_packet_t::label_t* _parent() const { return m__parent; }
    };

    class label_t : public kaitai::kstruct {

    public:

        label_t(kaitai::kstream* p_io, dns_packet_t::domain_name_t* p_parent = 0, dns_packet_t* p_root = 0);
        void _read();
        ~label_t();

    private:
        bool f_is_pointer;
        bool m_is_pointer;

    public:
        bool is_pointer();

    private:
        uint8_t m_length;
        pointer_struct_t* m_pointer;
        bool n_pointer;

    public:
        bool _is_null_pointer() { pointer(); return n_pointer; };

    private:
        std::string m_name;
        bool n_name;

    public:
        bool _is_null_name() { name(); return n_name; };

    private:
        dns_packet_t* m__root;
        dns_packet_t::domain_name_t* m__parent;

    public:

        /**
         * RFC1035 4.1.4: If the first two bits are raised it's a pointer-offset to a previously defined name
         */
        uint8_t length() const { return m_length; }
        pointer_struct_t* pointer() const { return m_pointer; }

        /**
         * Otherwise its a string the length of the length value
         */
        std::string name() const { return m_name; }
        dns_packet_t* _root() const { return m__root; }
        dns_packet_t::domain_name_t* _parent() const { return m__parent; }
    };

    class query_t : public kaitai::kstruct {

    public:

        query_t(kaitai::kstream* p_io, dns_packet_t* p_parent = 0, dns_packet_t* p_root = 0);
        void _read();
        ~query_t();

    private:
        domain_name_t* m_name;
        type_type_t m_type;
        class_type_t m_query_class;
        dns_packet_t* m__root;
        dns_packet_t* m__parent;

    public:
        domain_name_t* name() const { return m_name; }
        type_type_t type() const { return m_type; }
        class_type_t query_class() const { return m_query_class; }
        dns_packet_t* _root() const { return m__root; }
        dns_packet_t* _parent() const { return m__parent; }
    };

    class domain_name_t : public kaitai::kstruct {

    public:

        domain_name_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, dns_packet_t* p_root = 0);
        void _read();
        ~domain_name_t();

    private:
        std::vector<label_t*>* m_name;
        dns_packet_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * Repeat until the length is 0 or it is a pointer (bit-hack to get around lack of OR operator)
         */
        std::vector<label_t*>* name() const { return m_name; }
        dns_packet_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class address_t : public kaitai::kstruct {

    public:

        address_t(kaitai::kstream* p_io, dns_packet_t::answer_t* p_parent = 0, dns_packet_t* p_root = 0);
        void _read();
        ~address_t();

    private:
        std::vector<uint8_t>* m_ip;
        dns_packet_t* m__root;
        dns_packet_t::answer_t* m__parent;

    public:
        std::vector<uint8_t>* ip() const { return m_ip; }
        dns_packet_t* _root() const { return m__root; }
        dns_packet_t::answer_t* _parent() const { return m__parent; }
    };

    class answer_t : public kaitai::kstruct {

    public:

        answer_t(kaitai::kstream* p_io, dns_packet_t* p_parent = 0, dns_packet_t* p_root = 0);
        void _read();
        ~answer_t();

    private:
        domain_name_t* m_name;
        type_type_t m_type;
        class_type_t m_answer_class;
        int32_t m_ttl;
        uint16_t m_rdlength;
        domain_name_t* m_ptrdname;
        bool n_ptrdname;

    public:
        bool _is_null_ptrdname() { ptrdname(); return n_ptrdname; };

    private:
        address_t* m_address;
        bool n_address;

    public:
        bool _is_null_address() { address(); return n_address; };

    private:
        dns_packet_t* m__root;
        dns_packet_t* m__parent;

    public:
        domain_name_t* name() const { return m_name; }
        type_type_t type() const { return m_type; }
        class_type_t answer_class() const { return m_answer_class; }

        /**
         * Time to live (in seconds)
         */
        int32_t ttl() const { return m_ttl; }

        /**
         * Length in octets of the following payload
         */
        uint16_t rdlength() const { return m_rdlength; }
        domain_name_t* ptrdname() const { return m_ptrdname; }
        address_t* address() const { return m_address; }
        dns_packet_t* _root() const { return m__root; }
        dns_packet_t* _parent() const { return m__parent; }
    };

    class packet_flags_t : public kaitai::kstruct {

    public:

        packet_flags_t(kaitai::kstream* p_io, dns_packet_t* p_parent = 0, dns_packet_t* p_root = 0);
        void _read();
        ~packet_flags_t();

    private:
        bool f_qr;
        int32_t m_qr;

    public:
        int32_t qr();

    private:
        bool f_ra;
        int32_t m_ra;

    public:
        int32_t ra();

    private:
        bool f_tc;
        int32_t m_tc;

    public:
        int32_t tc();

    private:
        bool f_rcode;
        int32_t m_rcode;

    public:
        int32_t rcode();

    private:
        bool f_opcode;
        int32_t m_opcode;

    public:
        int32_t opcode();

    private:
        bool f_aa;
        int32_t m_aa;

    public:
        int32_t aa();

    private:
        bool f_z;
        int32_t m_z;

    public:
        int32_t z();

    private:
        bool f_rd;
        int32_t m_rd;

    public:
        int32_t rd();

    private:
        bool f_cd;
        int32_t m_cd;

    public:
        int32_t cd();

    private:
        bool f_ad;
        int32_t m_ad;

    public:
        int32_t ad();

    private:
        uint16_t m_flag;
        dns_packet_t* m__root;
        dns_packet_t* m__parent;

    public:
        uint16_t flag() const { return m_flag; }
        dns_packet_t* _root() const { return m__root; }
        dns_packet_t* _parent() const { return m__parent; }
    };

private:
    uint16_t m_transaction_id;
    packet_flags_t* m_flags;
    uint16_t m_qdcount;
    uint16_t m_ancount;
    uint16_t m_nscount;
    uint16_t m_arcount;
    std::vector<query_t*>* m_queries;
    std::vector<answer_t*>* m_answers;
    dns_packet_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * ID to keep track of request/responces
     */
    uint16_t transaction_id() const { return m_transaction_id; }
    packet_flags_t* flags() const { return m_flags; }

    /**
     * How many questions are there
     */
    uint16_t qdcount() const { return m_qdcount; }

    /**
     * Number of resource records answering the question
     */
    uint16_t ancount() const { return m_ancount; }

    /**
     * Number of resource records pointing toward an authority
     */
    uint16_t nscount() const { return m_nscount; }

    /**
     * Number of resource records holding additional information
     */
    uint16_t arcount() const { return m_arcount; }
    std::vector<query_t*>* queries() const { return m_queries; }
    std::vector<answer_t*>* answers() const { return m_answers; }
    dns_packet_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // DNS_PACKET_H_

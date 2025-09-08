#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class dns_packet_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * (No support for Auth-Name + Add-Name for simplicity)
 */

class dns_packet_t : public kaitai::kstruct {

public:
    class address_t;
    class address_v6_t;
    class answer_t;
    class authority_info_t;
    class domain_name_t;
    class label_t;
    class mx_info_t;
    class packet_flags_t;
    class pointer_struct_t;
    class query_t;
    class service_t;
    class txt_t;
    class txt_body_t;

    enum class_type_t {
        CLASS_TYPE_IN_CLASS = 1,
        CLASS_TYPE_CS = 2,
        CLASS_TYPE_CH = 3,
        CLASS_TYPE_HS = 4
    };
    static bool _is_defined_class_type_t(class_type_t v);

private:
    static const std::set<class_type_t> _values_class_type_t;

public:

    enum type_type_t {
        TYPE_TYPE_A = 1,
        TYPE_TYPE_NS = 2,
        TYPE_TYPE_MD = 3,
        TYPE_TYPE_MF = 4,
        TYPE_TYPE_CNAME = 5,
        TYPE_TYPE_SOA = 6,
        TYPE_TYPE_MB = 7,
        TYPE_TYPE_MG = 8,
        TYPE_TYPE_MR = 9,
        TYPE_TYPE_NULL = 10,
        TYPE_TYPE_WKS = 11,
        TYPE_TYPE_PTR = 12,
        TYPE_TYPE_HINFO = 13,
        TYPE_TYPE_MINFO = 14,
        TYPE_TYPE_MX = 15,
        TYPE_TYPE_TXT = 16,
        TYPE_TYPE_AAAA = 28,
        TYPE_TYPE_SRV = 33
    };
    static bool _is_defined_type_type_t(type_type_t v);

private:
    static const std::set<type_type_t> _values_type_type_t;

public:

    dns_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, dns_packet_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~dns_packet_t();

    class address_t : public kaitai::kstruct {

    public:

        address_t(kaitai::kstream* p__io, dns_packet_t::answer_t* p__parent = nullptr, dns_packet_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~address_t();

    private:
        std::string m_ip;
        dns_packet_t* m__root;
        dns_packet_t::answer_t* m__parent;

    public:
        std::string ip() const { return m_ip; }
        dns_packet_t* _root() const { return m__root; }
        dns_packet_t::answer_t* _parent() const { return m__parent; }
    };

    class address_v6_t : public kaitai::kstruct {

    public:

        address_v6_t(kaitai::kstream* p__io, dns_packet_t::answer_t* p__parent = nullptr, dns_packet_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~address_v6_t();

    private:
        std::string m_ip_v6;
        dns_packet_t* m__root;
        dns_packet_t::answer_t* m__parent;

    public:
        std::string ip_v6() const { return m_ip_v6; }
        dns_packet_t* _root() const { return m__root; }
        dns_packet_t::answer_t* _parent() const { return m__parent; }
    };

    class answer_t : public kaitai::kstruct {

    public:

        answer_t(kaitai::kstream* p__io, dns_packet_t* p__parent = nullptr, dns_packet_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~answer_t();

    private:
        std::unique_ptr<domain_name_t> m_name;
        type_type_t m_type;
        class_type_t m_answer_class;
        int32_t m_ttl;
        uint16_t m_rdlength;
        std::unique_ptr<kaitai::kstruct> m_payload;
        bool n_payload;

    public:
        bool _is_null_payload() { payload(); return n_payload; };

    private:
        dns_packet_t* m__root;
        dns_packet_t* m__parent;
        std::string m__raw_payload;
        std::unique_ptr<kaitai::kstream> m__io__raw_payload;

    public:
        domain_name_t* name() const { return m_name.get(); }
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
        kaitai::kstruct* payload() const { return m_payload.get(); }
        dns_packet_t* _root() const { return m__root; }
        dns_packet_t* _parent() const { return m__parent; }
        std::string _raw_payload() const { return m__raw_payload; }
        kaitai::kstream* _io__raw_payload() const { return m__io__raw_payload.get(); }
    };

    class authority_info_t : public kaitai::kstruct {

    public:

        authority_info_t(kaitai::kstream* p__io, dns_packet_t::answer_t* p__parent = nullptr, dns_packet_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~authority_info_t();

    private:
        std::unique_ptr<domain_name_t> m_primary_ns;
        std::unique_ptr<domain_name_t> m_resoponsible_mailbox;
        uint32_t m_serial;
        uint32_t m_refresh_interval;
        uint32_t m_retry_interval;
        uint32_t m_expire_limit;
        uint32_t m_min_ttl;
        dns_packet_t* m__root;
        dns_packet_t::answer_t* m__parent;

    public:
        domain_name_t* primary_ns() const { return m_primary_ns.get(); }
        domain_name_t* resoponsible_mailbox() const { return m_resoponsible_mailbox.get(); }
        uint32_t serial() const { return m_serial; }
        uint32_t refresh_interval() const { return m_refresh_interval; }
        uint32_t retry_interval() const { return m_retry_interval; }
        uint32_t expire_limit() const { return m_expire_limit; }
        uint32_t min_ttl() const { return m_min_ttl; }
        dns_packet_t* _root() const { return m__root; }
        dns_packet_t::answer_t* _parent() const { return m__parent; }
    };

    class domain_name_t : public kaitai::kstruct {

    public:

        domain_name_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, dns_packet_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~domain_name_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<label_t>>> m_name;
        dns_packet_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * Repeat until the length is 0 or it is a pointer (bit-hack to get around lack of OR operator)
         */
        std::vector<std::unique_ptr<label_t>>* name() const { return m_name.get(); }
        dns_packet_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class label_t : public kaitai::kstruct {

    public:

        label_t(kaitai::kstream* p__io, dns_packet_t::domain_name_t* p__parent = nullptr, dns_packet_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~label_t();

    private:
        bool f_is_pointer;
        bool m_is_pointer;

    public:
        bool is_pointer();

    private:
        uint8_t m_length;
        std::unique_ptr<pointer_struct_t> m_pointer;
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
        pointer_struct_t* pointer() const { return m_pointer.get(); }

        /**
         * Otherwise its a string the length of the length value
         */
        std::string name() const { return m_name; }
        dns_packet_t* _root() const { return m__root; }
        dns_packet_t::domain_name_t* _parent() const { return m__parent; }
    };

    class mx_info_t : public kaitai::kstruct {

    public:

        mx_info_t(kaitai::kstream* p__io, dns_packet_t::answer_t* p__parent = nullptr, dns_packet_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~mx_info_t();

    private:
        uint16_t m_preference;
        std::unique_ptr<domain_name_t> m_mx;
        dns_packet_t* m__root;
        dns_packet_t::answer_t* m__parent;

    public:
        uint16_t preference() const { return m_preference; }
        domain_name_t* mx() const { return m_mx.get(); }
        dns_packet_t* _root() const { return m__root; }
        dns_packet_t::answer_t* _parent() const { return m__parent; }
    };

    class packet_flags_t : public kaitai::kstruct {

    public:

        packet_flags_t(kaitai::kstream* p__io, dns_packet_t* p__parent = nullptr, dns_packet_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~packet_flags_t();

    private:
        bool f_aa;
        int32_t m_aa;

    public:
        int32_t aa();

    private:
        bool f_ad;
        int32_t m_ad;

    public:
        int32_t ad();

    private:
        bool f_cd;
        int32_t m_cd;

    public:
        int32_t cd();

    private:
        bool f_is_opcode_valid;
        bool m_is_opcode_valid;

    public:
        bool is_opcode_valid();

    private:
        bool f_opcode;
        int32_t m_opcode;

    public:
        int32_t opcode();

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
        bool f_rcode;
        int32_t m_rcode;

    public:
        int32_t rcode();

    private:
        bool f_rd;
        int32_t m_rd;

    public:
        int32_t rd();

    private:
        bool f_tc;
        int32_t m_tc;

    public:
        int32_t tc();

    private:
        bool f_z;
        int32_t m_z;

    public:
        int32_t z();

    private:
        uint16_t m_flag;
        dns_packet_t* m__root;
        dns_packet_t* m__parent;

    public:
        uint16_t flag() const { return m_flag; }
        dns_packet_t* _root() const { return m__root; }
        dns_packet_t* _parent() const { return m__parent; }
    };

    class pointer_struct_t : public kaitai::kstruct {

    public:

        pointer_struct_t(kaitai::kstream* p__io, dns_packet_t::label_t* p__parent = nullptr, dns_packet_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~pointer_struct_t();

    private:
        bool f_contents;
        std::unique_ptr<domain_name_t> m_contents;

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

    class query_t : public kaitai::kstruct {

    public:

        query_t(kaitai::kstream* p__io, dns_packet_t* p__parent = nullptr, dns_packet_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~query_t();

    private:
        std::unique_ptr<domain_name_t> m_name;
        type_type_t m_type;
        class_type_t m_query_class;
        dns_packet_t* m__root;
        dns_packet_t* m__parent;

    public:
        domain_name_t* name() const { return m_name.get(); }
        type_type_t type() const { return m_type; }
        class_type_t query_class() const { return m_query_class; }
        dns_packet_t* _root() const { return m__root; }
        dns_packet_t* _parent() const { return m__parent; }
    };

    class service_t : public kaitai::kstruct {

    public:

        service_t(kaitai::kstream* p__io, dns_packet_t::answer_t* p__parent = nullptr, dns_packet_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~service_t();

    private:
        uint16_t m_priority;
        uint16_t m_weight;
        uint16_t m_port;
        std::unique_ptr<domain_name_t> m_target;
        dns_packet_t* m__root;
        dns_packet_t::answer_t* m__parent;

    public:
        uint16_t priority() const { return m_priority; }
        uint16_t weight() const { return m_weight; }
        uint16_t port() const { return m_port; }
        domain_name_t* target() const { return m_target.get(); }
        dns_packet_t* _root() const { return m__root; }
        dns_packet_t::answer_t* _parent() const { return m__parent; }
    };

    class txt_t : public kaitai::kstruct {

    public:

        txt_t(kaitai::kstream* p__io, dns_packet_t::txt_body_t* p__parent = nullptr, dns_packet_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~txt_t();

    private:
        uint8_t m_length;
        std::string m_text;
        dns_packet_t* m__root;
        dns_packet_t::txt_body_t* m__parent;

    public:
        uint8_t length() const { return m_length; }
        std::string text() const { return m_text; }
        dns_packet_t* _root() const { return m__root; }
        dns_packet_t::txt_body_t* _parent() const { return m__parent; }
    };

    class txt_body_t : public kaitai::kstruct {

    public:

        txt_body_t(kaitai::kstream* p__io, dns_packet_t::answer_t* p__parent = nullptr, dns_packet_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~txt_body_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<txt_t>>> m_data;
        dns_packet_t* m__root;
        dns_packet_t::answer_t* m__parent;

    public:
        std::vector<std::unique_ptr<txt_t>>* data() const { return m_data.get(); }
        dns_packet_t* _root() const { return m__root; }
        dns_packet_t::answer_t* _parent() const { return m__parent; }
    };

private:
    uint16_t m_transaction_id;
    std::unique_ptr<packet_flags_t> m_flags;
    uint16_t m_qdcount;
    bool n_qdcount;

public:
    bool _is_null_qdcount() { qdcount(); return n_qdcount; };

private:
    uint16_t m_ancount;
    bool n_ancount;

public:
    bool _is_null_ancount() { ancount(); return n_ancount; };

private:
    uint16_t m_nscount;
    bool n_nscount;

public:
    bool _is_null_nscount() { nscount(); return n_nscount; };

private:
    uint16_t m_arcount;
    bool n_arcount;

public:
    bool _is_null_arcount() { arcount(); return n_arcount; };

private:
    std::unique_ptr<std::vector<std::unique_ptr<query_t>>> m_queries;
    bool n_queries;

public:
    bool _is_null_queries() { queries(); return n_queries; };

private:
    std::unique_ptr<std::vector<std::unique_ptr<answer_t>>> m_answers;
    bool n_answers;

public:
    bool _is_null_answers() { answers(); return n_answers; };

private:
    std::unique_ptr<std::vector<std::unique_ptr<answer_t>>> m_authorities;
    bool n_authorities;

public:
    bool _is_null_authorities() { authorities(); return n_authorities; };

private:
    std::unique_ptr<std::vector<std::unique_ptr<answer_t>>> m_additionals;
    bool n_additionals;

public:
    bool _is_null_additionals() { additionals(); return n_additionals; };

private:
    dns_packet_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * ID to keep track of request/responces
     */
    uint16_t transaction_id() const { return m_transaction_id; }
    packet_flags_t* flags() const { return m_flags.get(); }

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
    std::vector<std::unique_ptr<query_t>>* queries() const { return m_queries.get(); }
    std::vector<std::unique_ptr<answer_t>>* answers() const { return m_answers.get(); }
    std::vector<std::unique_ptr<answer_t>>* authorities() const { return m_authorities.get(); }
    std::vector<std::unique_ptr<answer_t>>* additionals() const { return m_additionals.get(); }
    dns_packet_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

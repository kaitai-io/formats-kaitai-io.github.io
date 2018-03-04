#ifndef ICMP_PACKET_H_
#define ICMP_PACKET_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class icmp_packet_t : public kaitai::kstruct {

public:
    class destination_unreachable_msg_t;
    class time_exceeded_msg_t;
    class echo_msg_t;

    enum icmp_type_enum_t {
        ICMP_TYPE_ENUM_ECHO_REPLY = 0,
        ICMP_TYPE_ENUM_DESTINATION_UNREACHABLE = 3,
        ICMP_TYPE_ENUM_SOURCE_QUENCH = 4,
        ICMP_TYPE_ENUM_REDIRECT = 5,
        ICMP_TYPE_ENUM_ECHO = 8,
        ICMP_TYPE_ENUM_TIME_EXCEEDED = 11
    };

    icmp_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, icmp_packet_t* p__root = 0);

private:
    void _read();

public:
    ~icmp_packet_t();

    class destination_unreachable_msg_t : public kaitai::kstruct {

    public:

        enum destination_unreachable_code_t {
            DESTINATION_UNREACHABLE_CODE_NET_UNREACHABLE = 0,
            DESTINATION_UNREACHABLE_CODE_HOST_UNREACHABLE = 1,
            DESTINATION_UNREACHABLE_CODE_PROTOCOL_UNREACHABLE = 2,
            DESTINATION_UNREACHABLE_CODE_PORT_UNREACHABLE = 3,
            DESTINATION_UNREACHABLE_CODE_FRAGMENTATION_NEEDED_AND_DF_SET = 4,
            DESTINATION_UNREACHABLE_CODE_SOURCE_ROUTE_FAILED = 5,
            DESTINATION_UNREACHABLE_CODE_DST_NET_UNKOWN = 6,
            DESTINATION_UNREACHABLE_CODE_SDT_HOST_UNKOWN = 7,
            DESTINATION_UNREACHABLE_CODE_SRC_ISOLATED = 8,
            DESTINATION_UNREACHABLE_CODE_NET_PROHIBITED_BY_ADMIN = 9,
            DESTINATION_UNREACHABLE_CODE_HOST_PROHIBITED_BY_ADMIN = 10,
            DESTINATION_UNREACHABLE_CODE_NET_UNREACHABLE_FOR_TOS = 11,
            DESTINATION_UNREACHABLE_CODE_HOST_UNREACHABLE_FOR_TOS = 12,
            DESTINATION_UNREACHABLE_CODE_COMMUNICATION_PROHIBITED_BY_ADMIN = 13,
            DESTINATION_UNREACHABLE_CODE_HOST_PRECEDENCE_VIOLATION = 14,
            DESTINATION_UNREACHABLE_CODE_PRECEDENCE_CUTTOFF_IN_EFFECT = 15
        };

        destination_unreachable_msg_t(kaitai::kstream* p__io, icmp_packet_t* p__parent = 0, icmp_packet_t* p__root = 0);

    private:
        void _read();

    public:
        ~destination_unreachable_msg_t();

    private:
        destination_unreachable_code_t m_code;
        uint16_t m_checksum;
        icmp_packet_t* m__root;
        icmp_packet_t* m__parent;

    public:
        destination_unreachable_code_t code() const { return m_code; }
        uint16_t checksum() const { return m_checksum; }
        icmp_packet_t* _root() const { return m__root; }
        icmp_packet_t* _parent() const { return m__parent; }
    };

    class time_exceeded_msg_t : public kaitai::kstruct {

    public:

        enum time_exceeded_code_t {
            TIME_EXCEEDED_CODE_TIME_TO_LIVE_EXCEEDED_IN_TRANSIT = 0,
            TIME_EXCEEDED_CODE_FRAGMENT_REASSEMBLY_TIME_EXCEEDED = 1
        };

        time_exceeded_msg_t(kaitai::kstream* p__io, icmp_packet_t* p__parent = 0, icmp_packet_t* p__root = 0);

    private:
        void _read();

    public:
        ~time_exceeded_msg_t();

    private:
        time_exceeded_code_t m_code;
        uint16_t m_checksum;
        icmp_packet_t* m__root;
        icmp_packet_t* m__parent;

    public:
        time_exceeded_code_t code() const { return m_code; }
        uint16_t checksum() const { return m_checksum; }
        icmp_packet_t* _root() const { return m__root; }
        icmp_packet_t* _parent() const { return m__parent; }
    };

    class echo_msg_t : public kaitai::kstruct {

    public:

        echo_msg_t(kaitai::kstream* p__io, icmp_packet_t* p__parent = 0, icmp_packet_t* p__root = 0);

    private:
        void _read();

    public:
        ~echo_msg_t();

    private:
        std::string m_code;
        uint16_t m_checksum;
        uint16_t m_identifier;
        uint16_t m_seq_num;
        icmp_packet_t* m__root;
        icmp_packet_t* m__parent;

    public:
        std::string code() const { return m_code; }
        uint16_t checksum() const { return m_checksum; }
        uint16_t identifier() const { return m_identifier; }
        uint16_t seq_num() const { return m_seq_num; }
        icmp_packet_t* _root() const { return m__root; }
        icmp_packet_t* _parent() const { return m__parent; }
    };

private:
    icmp_type_enum_t m_icmp_type;
    destination_unreachable_msg_t* m_destination_unreachable;
    bool n_destination_unreachable;

public:
    bool _is_null_destination_unreachable() { destination_unreachable(); return n_destination_unreachable; };

private:
    time_exceeded_msg_t* m_time_exceeded;
    bool n_time_exceeded;

public:
    bool _is_null_time_exceeded() { time_exceeded(); return n_time_exceeded; };

private:
    echo_msg_t* m_echo;
    bool n_echo;

public:
    bool _is_null_echo() { echo(); return n_echo; };

private:
    icmp_packet_t* m__root;
    kaitai::kstruct* m__parent;

public:
    icmp_type_enum_t icmp_type() const { return m_icmp_type; }
    destination_unreachable_msg_t* destination_unreachable() const { return m_destination_unreachable; }
    time_exceeded_msg_t* time_exceeded() const { return m_time_exceeded; }
    echo_msg_t* echo() const { return m_echo; }
    icmp_packet_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // ICMP_PACKET_H_

#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include "some_ip_sd.h"

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif
class some_ip_sd_t;

/**
 * SOME/IP (Scalable service-Oriented MiddlewarE over IP) is an automotive/embedded
 * communication protocol which supports remoteprocedure calls, event notifications
 * and the underlying serialization/wire format.
 * \sa https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPProtocol.pdf Source
 */

class some_ip_t : public kaitai::kstruct {

public:
    class header_t;

    some_ip_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, some_ip_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~some_ip_t();

    class header_t : public kaitai::kstruct {

    public:
        class message_id_t;
        class request_id_t;

        enum message_type_enum_t {
            MESSAGE_TYPE_ENUM_REQUEST = 0,
            MESSAGE_TYPE_ENUM_REQUEST_NO_RETURN = 1,
            MESSAGE_TYPE_ENUM_NOTIFICATION = 2,
            MESSAGE_TYPE_ENUM_REQUEST_ACK = 64,
            MESSAGE_TYPE_ENUM_REQUEST_NO_RETURN_ACK = 65,
            MESSAGE_TYPE_ENUM_NOTIFICATION_ACK = 66,
            MESSAGE_TYPE_ENUM_RESPONSE = 128,
            MESSAGE_TYPE_ENUM_ERROR = 129,
            MESSAGE_TYPE_ENUM_RESPONSE_ACK = 192,
            MESSAGE_TYPE_ENUM_ERROR_ACK = 193
        };

        enum return_code_enum_t {
            RETURN_CODE_ENUM_OK = 0,
            RETURN_CODE_ENUM_NOT_OK = 1,
            RETURN_CODE_ENUM_UNKNOWN_SERVICE = 2,
            RETURN_CODE_ENUM_UNKNOWN_METHOD = 3,
            RETURN_CODE_ENUM_NOT_READY = 4,
            RETURN_CODE_ENUM_NOT_REACHABLE = 5,
            RETURN_CODE_ENUM_TIME_OUT = 6,
            RETURN_CODE_ENUM_WRONG_PROTOCOL_VERSION = 7,
            RETURN_CODE_ENUM_WRONG_INTERFACE_VERSION = 8,
            RETURN_CODE_ENUM_MALFORMED_MESSAGE = 9,
            RETURN_CODE_ENUM_WRONG_MESSAGE_TYPE = 10
        };

        header_t(kaitai::kstream* p__io, some_ip_t* p__parent = nullptr, some_ip_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

        /**
         * [PRS_SOMEIP_00035] The assignment of the Message ID shall be up to
         * the user. However, the Message ID shall be unique for the whole
         * system (i.e. the vehicle). TheMessage ID is similar to a CAN ID and
         * should be handled via a comparable process.
         * [PRS_SOMEIP_00038] Message IDs of method calls shall be structured in
         * the ID with 2^16 services with 2^15 methods.
         * \sa AUTOSAR_PRS_SOMEIPProtocol.pdf 4.1.1.1  Message ID
         */

        class message_id_t : public kaitai::kstruct {

        public:

            message_id_t(kaitai::kstream* p__io, some_ip_t::header_t* p__parent = nullptr, some_ip_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~message_id_t();

        private:
            bool f_value;
            uint32_t m_value;

        public:

            /**
             * The value provides the undissected Message ID
             */
            uint32_t value();

        private:
            uint16_t m_service_id;
            bool m_sub_id;
            uint64_t m_method_id;
            bool n_method_id;

        public:
            bool _is_null_method_id() { method_id(); return n_method_id; };

        private:
            uint64_t m_event_id;
            bool n_event_id;

        public:
            bool _is_null_event_id() { event_id(); return n_event_id; };

        private:
            some_ip_t* m__root;
            some_ip_t::header_t* m__parent;

        public:

            /**
             * Service ID
             */
            uint16_t service_id() const { return m_service_id; }

            /**
             * Single bit to flag, if there is a Method or a Event ID
             */
            bool sub_id() const { return m_sub_id; }

            /**
             * Method ID
             * \sa AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.1.
             */
            uint64_t method_id() const { return m_method_id; }

            /**
             * Event ID
             * \sa AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.6
             */
            uint64_t event_id() const { return m_event_id; }
            some_ip_t* _root() const { return m__root; }
            some_ip_t::header_t* _parent() const { return m__parent; }
        };

        /**
         * The Request ID allows a provider and subscriber to differentiate
         * multiple parallel usesof the same method, event, getter or setter.
         * \sa AUTOSAR_PRS_SOMEIPProtocol.pdf - section 4.1.1.3  Request ID
         */

        class request_id_t : public kaitai::kstruct {

        public:

            request_id_t(kaitai::kstream* p__io, some_ip_t::header_t* p__parent = nullptr, some_ip_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~request_id_t();

        private:
            bool f_value;
            uint32_t m_value;

        public:

            /**
             * The value provides the undissected Request ID
             */
            uint32_t value();

        private:
            uint16_t m_client_id;
            uint16_t m_session_id;
            some_ip_t* m__root;
            some_ip_t::header_t* m__parent;

        public:
            uint16_t client_id() const { return m_client_id; }
            uint16_t session_id() const { return m_session_id; }
            some_ip_t* _root() const { return m__root; }
            some_ip_t::header_t* _parent() const { return m__parent; }
        };

    private:
        bool f_is_valid_service_discovery;
        bool m_is_valid_service_discovery;

    public:

        /**
         * auxillary value
         * \sa AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - section 4.1.2.1 General Requirements
         */
        bool is_valid_service_discovery();

    private:
        std::unique_ptr<message_id_t> m_message_id;
        uint32_t m_length;
        std::unique_ptr<request_id_t> m_request_id;
        uint8_t m_protocol_version;
        uint8_t m_interface_version;
        message_type_enum_t m_message_type;
        return_code_enum_t m_return_code;
        some_ip_t* m__root;
        some_ip_t* m__parent;
        std::string m__raw_message_id;
        std::unique_ptr<kaitai::kstream> m__io__raw_message_id;
        std::string m__raw_request_id;
        std::unique_ptr<kaitai::kstream> m__io__raw_request_id;

    public:

        /**
         * The Message ID shall be a 32 Bit identifier that is used to identify
         * the RPC call to a method of an application or to identify an event.
         */
        message_id_t* message_id() const { return m_message_id.get(); }

        /**
         * [PRS_SOMEIP_00042] Length field shall contain the length in Byte
         * starting from Request ID/Client ID until the end of the SOME/IP message.
         */
        uint32_t length() const { return m_length; }

        /**
         * The Request ID allows a provider and subscriber to differentiate
         * multiple parallel uses of the same method, event, getter or setter.
         */
        request_id_t* request_id() const { return m_request_id.get(); }

        /**
         * The Protocol Version identifies the used SOME/IP Header format
         * (not including the Payload format).
         */
        uint8_t protocol_version() const { return m_protocol_version; }

        /**
         * Interface Version shall be an 8 Bit field that contains the
         * MajorVersion of the Service Interface.
         */
        uint8_t interface_version() const { return m_interface_version; }

        /**
         * The Message Type field is used to differentiate different types of
         * messages.
         * \sa AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.4
         */
        message_type_enum_t message_type() const { return m_message_type; }

        /**
         * The Return Code shall be used to signal whether a request was
         * successfully processed.
         * \sa AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.5
         */
        return_code_enum_t return_code() const { return m_return_code; }
        some_ip_t* _root() const { return m__root; }
        some_ip_t* _parent() const { return m__parent; }
        std::string _raw_message_id() const { return m__raw_message_id; }
        kaitai::kstream* _io__raw_message_id() const { return m__io__raw_message_id.get(); }
        std::string _raw_request_id() const { return m__raw_request_id; }
        kaitai::kstream* _io__raw_request_id() const { return m__io__raw_request_id.get(); }
    };

private:
    std::unique_ptr<header_t> m_header;
    std::unique_ptr<some_ip_sd_t> m_payload;
    bool n_payload;

public:
    bool _is_null_payload() { payload(); return n_payload; };

private:
    some_ip_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_payload;
    std::unique_ptr<kaitai::kstream> m__io__raw_payload;

public:
    header_t* header() const { return m_header.get(); }
    some_ip_sd_t* payload() const { return m_payload.get(); }
    some_ip_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_payload() const { return m__raw_payload; }
    kaitai::kstream* _io__raw_payload() const { return m__io__raw_payload.get(); }
};

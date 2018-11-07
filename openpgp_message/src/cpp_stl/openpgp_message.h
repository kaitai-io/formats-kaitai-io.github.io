#ifndef OPENPGP_MESSAGE_H_
#define OPENPGP_MESSAGE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * The OpenPGP Message Format is a format to store encryption and signature keys for emails.
 * \sa Source
 */

class openpgp_message_t : public kaitai::kstruct {

public:
    class preferred_hash_algorithms_t;
    class preferred_compression_algorithms_t;
    class signers_user_id_t;
    class secret_key_packet_t;
    class key_server_preferences_t;
    class regular_expression_t;
    class subpackets_t;
    class revocation_key_t;
    class user_id_packet_t;
    class policy_uri_t;
    class signature_target_t;
    class key_flags_t;
    class features_t;
    class primary_user_id_t;
    class subpacket_t;
    class old_packet_t;
    class issuer_t;
    class exportable_certification_t;
    class signature_expiration_time_t;
    class signature_creation_time_t;
    class signature_packet_t;
    class revocable_t;
    class embedded_signature_t;
    class preferred_key_server_t;
    class reason_for_revocation_t;
    class len_subpacket_t;
    class notation_data_t;
    class public_key_packet_t;
    class key_expiration_time_t;
    class packet_t;
    class trust_signature_t;

    enum public_key_algorithms_t {
        PUBLIC_KEY_ALGORITHMS_RSA_ENCRYPT_OR_SIGN_HAC = 1,
        PUBLIC_KEY_ALGORITHMS_RSA_ENCRYPT_ONLY_HAC = 2,
        PUBLIC_KEY_ALGORITHMS_RSA_SIGN_ONLY_HAC = 3,
        PUBLIC_KEY_ALGORITHMS_ELGAMAL_ENCRYPT_ONLY_ELGAMAL_HAC = 16,
        PUBLIC_KEY_ALGORITHMS_DSA_DIGITAL_SIGNATURE_ALGORITHM_FIPS_HAC = 17,
        PUBLIC_KEY_ALGORITHMS_RESERVED_FOR_ELLIPTIC_CURVE = 18,
        PUBLIC_KEY_ALGORITHMS_RESERVED_FOR_ECDSA = 19,
        PUBLIC_KEY_ALGORITHMS_RESERVED_FORMERLY_ELGAMAL_ENCRYPT_OR_SIGN_ = 20,
        PUBLIC_KEY_ALGORITHMS_RESERVED_FOR_DIFFIE_HELLMAN_X_AS_DEFINED_FOR_IETF_S_MIME = 21,
        PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_00 = 100,
        PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_01 = 101,
        PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_02 = 102,
        PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_03 = 103,
        PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_04 = 104,
        PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_05 = 105,
        PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_06 = 106,
        PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_07 = 107,
        PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_08 = 108,
        PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_09 = 109,
        PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_10 = 110
    };

    enum server_flags_t {
        SERVER_FLAGS_NO_MODIFY = 128
    };

    enum key_flags_t {
        KEY_FLAGS_THIS_KEY_MAY_BE_USED_TO_CERTIFY_OTHER_KEYS = 1,
        KEY_FLAGS_THIS_KEY_MAY_BE_USED_TO_SIGN_DATA = 2,
        KEY_FLAGS_THIS_KEY_MAY_BE_USED_TO_ENCRYPT_COMMUNICATIONS = 4,
        KEY_FLAGS_THIS_KEY_MAY_BE_USED_TO_ENCRYPT_STORAGE = 8,
        KEY_FLAGS_THE_PRIVATE_COMPONENT_OF_THIS_KEY_MAY_HAVE_BEEN_SPLIT_BY_A_SECRET_SHARING_MECHANISM = 16,
        KEY_FLAGS_THIS_KEY_MAY_BE_USED_FOR_AUTHENTICATION = 32,
        KEY_FLAGS_THE_PRIVATE_COMPONENT_OF_THIS_KEY_MAY_BE_IN_THE_POSSESSION_OF_MORE_THAN_ONE_PERSON = 128
    };

    enum compression_algorithms_t {
        COMPRESSION_ALGORITHMS_UNCOMPRESSED = 0,
        COMPRESSION_ALGORITHMS_ZIB = 1,
        COMPRESSION_ALGORITHMS_ZLIB = 2,
        COMPRESSION_ALGORITHMS_BZIP = 3,
        COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_00 = 100,
        COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_01 = 101,
        COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_02 = 102,
        COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_03 = 103,
        COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_04 = 104,
        COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_05 = 105,
        COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_06 = 106,
        COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_07 = 107,
        COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_08 = 108,
        COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_09 = 109,
        COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_10 = 110
    };

    enum packet_tags_t {
        PACKET_TAGS_RESERVED_A_PACKET_TAG_MUST_NOT_HAVE_THIS_VALUE = 0,
        PACKET_TAGS_PUBLIC_KEY_ENCRYPTED_SESSION_KEY_PACKET = 1,
        PACKET_TAGS_SIGNATURE_PACKET = 2,
        PACKET_TAGS_SYMMETRIC_KEY_ENCRYPTED_SESSION_KEY_PACKET = 3,
        PACKET_TAGS_ONE_PASS_SIGNATURE_PACKET = 4,
        PACKET_TAGS_SECRET_KEY_PACKET = 5,
        PACKET_TAGS_PUBLIC_KEY_PACKET = 6,
        PACKET_TAGS_SECRET_SUBKEY_PACKET = 7,
        PACKET_TAGS_COMPRESSED_DATA_PACKET = 8,
        PACKET_TAGS_SYMMETRICALLY_ENCRYPTED_DATA_PACKET = 9,
        PACKET_TAGS_MARKER_PACKET = 10,
        PACKET_TAGS_LITERAL_DATA_PACKET = 11,
        PACKET_TAGS_TRUST_PACKET = 12,
        PACKET_TAGS_USER_ID_PACKET = 13,
        PACKET_TAGS_PUBLIC_SUBKEY_PACKET = 14,
        PACKET_TAGS_USER_ATTRIBUTE_PACKET = 17,
        PACKET_TAGS_SYM_ENCRYPTED_AND_INTEGRITY_PROTECTED_DATA_PACKET = 18,
        PACKET_TAGS_MODIFICATION_DETECTION_CODE_PACKET = 19,
        PACKET_TAGS_PRIVATE_OR_EXPERIMENTAL_VALUES_0 = 60,
        PACKET_TAGS_PRIVATE_OR_EXPERIMENTAL_VALUES_1 = 61,
        PACKET_TAGS_PRIVATE_OR_EXPERIMENTAL_VALUES_2 = 62,
        PACKET_TAGS_PRIVATE_OR_EXPERIMENTAL_VALUES_3 = 63
    };

    enum revocation_codes_t {
        REVOCATION_CODES_NO_REASON_SPECIFIED_KEY_REVOCATIONS_OR_CERT_REVOCATIONS = 0,
        REVOCATION_CODES_KEY_IS_SUPERSEDED_KEY_REVOCATIONS = 1,
        REVOCATION_CODES_KEY_MATERIAL_HAS_BEEN_COMPROMISED_KEY_REVOCATIONS = 2,
        REVOCATION_CODES_KEY_IS_RETIRED_AND_NO_LONGER_USED_KEY_REVOCATIONS = 3,
        REVOCATION_CODES_USER_ID_INFORMATION_IS_NO_LONGER_VALID_CERT_REVOCATIONS = 32,
        REVOCATION_CODES_PRIVATE_USE_1 = 100,
        REVOCATION_CODES_PRIVATE_USE_2 = 101,
        REVOCATION_CODES_PRIVATE_USE_3 = 102,
        REVOCATION_CODES_PRIVATE_USE_4 = 103,
        REVOCATION_CODES_PRIVATE_USE_11 = 110
    };

    enum hash_algorithms_t {
        HASH_ALGORITHMS_MD5 = 1,
        HASH_ALGORITHMS_SHA1 = 2,
        HASH_ALGORITHMS_RIPEMD160 = 3,
        HASH_ALGORITHMS_RESERVED_4 = 4,
        HASH_ALGORITHMS_RESERVED_5 = 5,
        HASH_ALGORITHMS_RESERVED_6 = 6,
        HASH_ALGORITHMS_RESERVED_7 = 7,
        HASH_ALGORITHMS_SHA256 = 8,
        HASH_ALGORITHMS_SHA384 = 9,
        HASH_ALGORITHMS_SHA512 = 10,
        HASH_ALGORITHMS_SHA224 = 11,
        HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_00 = 100,
        HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_01 = 101,
        HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_02 = 102,
        HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_03 = 103,
        HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_04 = 104,
        HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_05 = 105,
        HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_06 = 106,
        HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_07 = 107,
        HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_08 = 108,
        HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_09 = 109,
        HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_10 = 110
    };

    enum symmetric_key_algorithm_t {
        SYMMETRIC_KEY_ALGORITHM_PLAIN = 0,
        SYMMETRIC_KEY_ALGORITHM_IDEA = 1,
        SYMMETRIC_KEY_ALGORITHM_TRIPLE_DES = 2,
        SYMMETRIC_KEY_ALGORITHM_CAST5 = 3,
        SYMMETRIC_KEY_ALGORITHM_BLOWFISCH = 4,
        SYMMETRIC_KEY_ALGORITHM_RESERVED_5 = 5,
        SYMMETRIC_KEY_ALGORITHM_RESERVED_6 = 6,
        SYMMETRIC_KEY_ALGORITHM_AES_128 = 7,
        SYMMETRIC_KEY_ALGORITHM_AES_192 = 8,
        SYMMETRIC_KEY_ALGORITHM_AES_256 = 9,
        SYMMETRIC_KEY_ALGORITHM_TWOFISH_256 = 10,
        SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_00 = 100,
        SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_01 = 101,
        SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_02 = 102,
        SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_03 = 103,
        SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_04 = 104,
        SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_05 = 105,
        SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_06 = 106,
        SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_07 = 107,
        SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_08 = 108,
        SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_09 = 109,
        SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_10 = 110
    };

    enum subpacket_types_t {
        SUBPACKET_TYPES_RESERVED = 0,
        SUBPACKET_TYPES_RESERVED = 1,
        SUBPACKET_TYPES_SIGNATURE_CREATION_TIME = 2,
        SUBPACKET_TYPES_SIGNATURE_EXPIRATION_TIME = 3,
        SUBPACKET_TYPES_EXPORTABLE_CERTIFICATION = 4,
        SUBPACKET_TYPES_TRUST_SIGNATURE = 5,
        SUBPACKET_TYPES_REGULAR_EXPRESSION = 6,
        SUBPACKET_TYPES_REVOCABLE = 7,
        SUBPACKET_TYPES_RESERVED = 8,
        SUBPACKET_TYPES_KEY_EXPIRATION_TIME = 9,
        SUBPACKET_TYPES_PLACEHOLDER_FOR_BACKWARD_COMPATIBILITY = 10,
        SUBPACKET_TYPES_PREFERRED_SYMMETRIC_ALGORITHMS = 11,
        SUBPACKET_TYPES_REVOCATION_KEY = 12,
        SUBPACKET_TYPES_RESERVED = 13,
        SUBPACKET_TYPES_RESERVED = 14,
        SUBPACKET_TYPES_RESERVED = 15,
        SUBPACKET_TYPES_ISSUER = 16,
        SUBPACKET_TYPES_RESERVED = 17,
        SUBPACKET_TYPES_RESERVED = 18,
        SUBPACKET_TYPES_RESERVED = 19,
        SUBPACKET_TYPES_NOTATION_DATA = 20,
        SUBPACKET_TYPES_PREFERRED_HASH_ALGORITHMS = 21,
        SUBPACKET_TYPES_PREFERRED_COMPRESSION_ALGORITHMS = 22,
        SUBPACKET_TYPES_KEY_SERVER_PREFERENCES = 23,
        SUBPACKET_TYPES_PREFERRED_KEY_SERVER = 24,
        SUBPACKET_TYPES_PRIMARY_USER_ID = 25,
        SUBPACKET_TYPES_POLICY_URI = 26,
        SUBPACKET_TYPES_KEY_FLAGS = 27,
        SUBPACKET_TYPES_SIGNERS_USER_ID = 28,
        SUBPACKET_TYPES_REASON_FOR_REVOCATION = 29,
        SUBPACKET_TYPES_FEATURES = 30,
        SUBPACKET_TYPES_SIGNATURE_TARGET = 31,
        SUBPACKET_TYPES_EMBEDDED_SIGNATURE = 32
    };

    openpgp_message_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, openpgp_message_t* p__root = 0);

private:
    void _read();

public:
    ~openpgp_message_t();

    class preferred_hash_algorithms_t : public kaitai::kstruct {

    public:

        preferred_hash_algorithms_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~preferred_hash_algorithms_t();

    private:
        std::vector<hash_algorithms_t>* m_algorithm;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        std::vector<hash_algorithms_t>* algorithm() const { return m_algorithm; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class preferred_compression_algorithms_t : public kaitai::kstruct {

    public:

        preferred_compression_algorithms_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~preferred_compression_algorithms_t();

    private:
        std::vector<compression_algorithms_t>* m_algorithm;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        std::vector<compression_algorithms_t>* algorithm() const { return m_algorithm; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class signers_user_id_t : public kaitai::kstruct {

    public:

        signers_user_id_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~signers_user_id_t();

    private:
        std::string m_user_id;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        std::string user_id() const { return m_user_id; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class secret_key_packet_t : public kaitai::kstruct {

    public:

        secret_key_packet_t(kaitai::kstream* p__io, openpgp_message_t::old_packet_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~secret_key_packet_t();

    private:
        public_key_packet_t* m_public_key;
        uint8_t m_string_to_key;
        symmetric_key_algorithm_t m_symmetric_encryption_algorithm;
        bool n_symmetric_encryption_algorithm;

    public:
        bool _is_null_symmetric_encryption_algorithm() { symmetric_encryption_algorithm(); return n_symmetric_encryption_algorithm; };

    private:
        std::string m_secret_key;
        openpgp_message_t* m__root;
        openpgp_message_t::old_packet_t* m__parent;

    public:
        public_key_packet_t* public_key() const { return m_public_key; }
        uint8_t string_to_key() const { return m_string_to_key; }
        symmetric_key_algorithm_t symmetric_encryption_algorithm() const { return m_symmetric_encryption_algorithm; }
        std::string secret_key() const { return m_secret_key; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::old_packet_t* _parent() const { return m__parent; }
    };

    class key_server_preferences_t : public kaitai::kstruct {

    public:

        key_server_preferences_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~key_server_preferences_t();

    private:
        std::vector<server_flags_t>* m_flag;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        std::vector<server_flags_t>* flag() const { return m_flag; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class regular_expression_t : public kaitai::kstruct {

    public:

        regular_expression_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~regular_expression_t();

    private:
        std::string m_regex;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        std::string regex() const { return m_regex; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class subpackets_t : public kaitai::kstruct {

    public:

        subpackets_t(kaitai::kstream* p__io, openpgp_message_t::signature_packet_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~subpackets_t();

    private:
        std::vector<subpacket_t*>* m_subpacketss;
        openpgp_message_t* m__root;
        openpgp_message_t::signature_packet_t* m__parent;

    public:
        std::vector<subpacket_t*>* subpacketss() const { return m_subpacketss; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::signature_packet_t* _parent() const { return m__parent; }
    };

    class revocation_key_t : public kaitai::kstruct {

    public:

        revocation_key_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~revocation_key_t();

    private:
        uint8_t m_class;
        public_key_algorithms_t m_public_key_algorithm;
        std::string m_fingerprint;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        uint8_t class() const { return m_class; }
        public_key_algorithms_t public_key_algorithm() const { return m_public_key_algorithm; }
        std::string fingerprint() const { return m_fingerprint; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class user_id_packet_t : public kaitai::kstruct {

    public:

        user_id_packet_t(kaitai::kstream* p__io, openpgp_message_t::old_packet_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~user_id_packet_t();

    private:
        std::string m_user_id;
        openpgp_message_t* m__root;
        openpgp_message_t::old_packet_t* m__parent;

    public:
        std::string user_id() const { return m_user_id; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::old_packet_t* _parent() const { return m__parent; }
    };

    class policy_uri_t : public kaitai::kstruct {

    public:

        policy_uri_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~policy_uri_t();

    private:
        std::string m_uri;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        std::string uri() const { return m_uri; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class signature_target_t : public kaitai::kstruct {

    public:

        signature_target_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~signature_target_t();

    private:
        public_key_algorithms_t m_public_key_algorithm;
        hash_algorithms_t m_hash_algorithm;
        std::string m_hash;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        public_key_algorithms_t public_key_algorithm() const { return m_public_key_algorithm; }
        hash_algorithms_t hash_algorithm() const { return m_hash_algorithm; }
        std::string hash() const { return m_hash; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class key_flags_t : public kaitai::kstruct {

    public:

        key_flags_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~key_flags_t();

    private:
        std::vector<key_flags_t>* m_flag;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        std::vector<key_flags_t>* flag() const { return m_flag; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class features_t : public kaitai::kstruct {

    public:

        features_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~features_t();

    private:
        std::string m_flags;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        std::string flags() const { return m_flags; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class primary_user_id_t : public kaitai::kstruct {

    public:

        primary_user_id_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~primary_user_id_t();

    private:
        uint8_t m_user_id;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        uint8_t user_id() const { return m_user_id; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class subpacket_t : public kaitai::kstruct {

    public:

        subpacket_t(kaitai::kstream* p__io, openpgp_message_t::subpackets_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~subpacket_t();

    private:
        len_subpacket_t* m_len;
        subpacket_types_t m_subpacket_type;
        kaitai::kstruct* m_content;
        bool n_content;

    public:
        bool _is_null_content() { content(); return n_content; };

    private:
        openpgp_message_t* m__root;
        openpgp_message_t::subpackets_t* m__parent;
        std::string m__raw_content;
        kaitai::kstream* m__io__raw_content;

    public:
        len_subpacket_t* len() const { return m_len; }
        subpacket_types_t subpacket_type() const { return m_subpacket_type; }
        kaitai::kstruct* content() const { return m_content; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpackets_t* _parent() const { return m__parent; }
        std::string _raw_content() const { return m__raw_content; }
        kaitai::kstream* _io__raw_content() const { return m__io__raw_content; }
    };

    class old_packet_t : public kaitai::kstruct {

    public:

        old_packet_t(kaitai::kstream* p__io, openpgp_message_t::packet_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~old_packet_t();

    private:
        uint32_t m_len;
        bool n_len;

    public:
        bool _is_null_len() { len(); return n_len; };

    private:
        kaitai::kstruct* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        openpgp_message_t* m__root;
        openpgp_message_t::packet_t* m__parent;
        std::string m__raw_body;
        kaitai::kstream* m__io__raw_body;

    public:
        uint32_t len() const { return m_len; }
        kaitai::kstruct* body() const { return m_body; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::packet_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
    };

    class issuer_t : public kaitai::kstruct {

    public:

        issuer_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~issuer_t();

    private:
        uint64_t m_keyid;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        uint64_t keyid() const { return m_keyid; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class exportable_certification_t : public kaitai::kstruct {

    public:

        exportable_certification_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~exportable_certification_t();

    private:
        uint8_t m_exportable;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        uint8_t exportable() const { return m_exportable; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class signature_expiration_time_t : public kaitai::kstruct {

    public:

        signature_expiration_time_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~signature_expiration_time_t();

    private:
        uint32_t m_time;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        uint32_t time() const { return m_time; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class signature_creation_time_t : public kaitai::kstruct {

    public:

        signature_creation_time_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~signature_creation_time_t();

    private:
        uint32_t m_time;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        uint32_t time() const { return m_time; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class signature_packet_t : public kaitai::kstruct {

    public:

        signature_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~signature_packet_t();

    private:
        uint8_t m_version;
        uint8_t m_signature_type;
        public_key_algorithms_t m_public_key_algorithm;
        hash_algorithms_t m_hash_algorithm;
        uint16_t m_len_hashed_subpacket;
        subpackets_t* m_hashed_subpackets;
        uint16_t m_len_unhashed_subpacket;
        subpackets_t* m_unhashed_subpackets;
        uint16_t m_left_signed_hash;
        uint16_t m_rsa_n;
        std::string m_signature;
        openpgp_message_t* m__root;
        kaitai::kstruct* m__parent;
        std::string m__raw_hashed_subpackets;
        kaitai::kstream* m__io__raw_hashed_subpackets;
        std::string m__raw_unhashed_subpackets;
        kaitai::kstream* m__io__raw_unhashed_subpackets;

    public:
        uint8_t version() const { return m_version; }
        uint8_t signature_type() const { return m_signature_type; }
        public_key_algorithms_t public_key_algorithm() const { return m_public_key_algorithm; }
        hash_algorithms_t hash_algorithm() const { return m_hash_algorithm; }
        uint16_t len_hashed_subpacket() const { return m_len_hashed_subpacket; }
        subpackets_t* hashed_subpackets() const { return m_hashed_subpackets; }
        uint16_t len_unhashed_subpacket() const { return m_len_unhashed_subpacket; }
        subpackets_t* unhashed_subpackets() const { return m_unhashed_subpackets; }
        uint16_t left_signed_hash() const { return m_left_signed_hash; }
        uint16_t rsa_n() const { return m_rsa_n; }
        std::string signature() const { return m_signature; }
        openpgp_message_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
        std::string _raw_hashed_subpackets() const { return m__raw_hashed_subpackets; }
        kaitai::kstream* _io__raw_hashed_subpackets() const { return m__io__raw_hashed_subpackets; }
        std::string _raw_unhashed_subpackets() const { return m__raw_unhashed_subpackets; }
        kaitai::kstream* _io__raw_unhashed_subpackets() const { return m__io__raw_unhashed_subpackets; }
    };

    class revocable_t : public kaitai::kstruct {

    public:

        revocable_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~revocable_t();

    private:
        uint8_t m_revocable;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        uint8_t revocable() const { return m_revocable; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class embedded_signature_t : public kaitai::kstruct {

    public:

        embedded_signature_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~embedded_signature_t();

    private:
        signature_packet_t* m_signature_packet;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        signature_packet_t* signature_packet() const { return m_signature_packet; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class preferred_key_server_t : public kaitai::kstruct {

    public:

        preferred_key_server_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~preferred_key_server_t();

    private:
        std::string m_uri;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        std::string uri() const { return m_uri; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class reason_for_revocation_t : public kaitai::kstruct {

    public:

        reason_for_revocation_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~reason_for_revocation_t();

    private:
        revocation_codes_t m_revocation_code;
        std::string m_reason;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        revocation_codes_t revocation_code() const { return m_revocation_code; }
        std::string reason() const { return m_reason; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class len_subpacket_t : public kaitai::kstruct {

    public:

        len_subpacket_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~len_subpacket_t();

    private:
        bool f_len;
        int32_t m_len;

    public:
        int32_t len();

    private:
        uint8_t m_first_octet;
        uint8_t m_second_octet;
        bool n_second_octet;

    public:
        bool _is_null_second_octet() { second_octet(); return n_second_octet; };

    private:
        uint32_t m_scalar;
        bool n_scalar;

    public:
        bool _is_null_scalar() { scalar(); return n_scalar; };

    private:
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        uint8_t first_octet() const { return m_first_octet; }
        uint8_t second_octet() const { return m_second_octet; }
        uint32_t scalar() const { return m_scalar; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class notation_data_t : public kaitai::kstruct {

    public:

        notation_data_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~notation_data_t();

    private:
        std::string m_flags;
        uint16_t m_len_name;
        uint16_t m_len_value;
        std::string m_name;
        std::string m_value;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        std::string flags() const { return m_flags; }
        uint16_t len_name() const { return m_len_name; }
        uint16_t len_value() const { return m_len_value; }
        std::string name() const { return m_name; }
        std::string value() const { return m_value; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class public_key_packet_t : public kaitai::kstruct {

    public:

        public_key_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~public_key_packet_t();

    private:
        uint8_t m_version;
        uint32_t m_timestamp;
        public_key_algorithms_t m_public_key_algorithm;
        uint16_t m_len_alg;
        std::string m_rsa_n;
        uint16_t m_padding;
        std::string m_rsa_e;
        openpgp_message_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint8_t version() const { return m_version; }
        uint32_t timestamp() const { return m_timestamp; }
        public_key_algorithms_t public_key_algorithm() const { return m_public_key_algorithm; }
        uint16_t len_alg() const { return m_len_alg; }
        std::string rsa_n() const { return m_rsa_n; }
        uint16_t padding() const { return m_padding; }
        std::string rsa_e() const { return m_rsa_e; }
        openpgp_message_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class key_expiration_time_t : public kaitai::kstruct {

    public:

        key_expiration_time_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~key_expiration_time_t();

    private:
        uint32_t m_time;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        uint32_t time() const { return m_time; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

    class packet_t : public kaitai::kstruct {

    public:

        packet_t(kaitai::kstream* p__io, openpgp_message_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~packet_t();

    private:
        bool m_one;
        bool m_new_packet_format;
        packet_tags_t m_packet_type_new;
        bool n_packet_type_new;

    public:
        bool _is_null_packet_type_new() { packet_type_new(); return n_packet_type_new; };

    private:
        packet_tags_t m_packet_type_old;
        bool n_packet_type_old;

    public:
        bool _is_null_packet_type_old() { packet_type_old(); return n_packet_type_old; };

    private:
        uint64_t m_len_type;
        bool n_len_type;

    public:
        bool _is_null_len_type() { len_type(); return n_len_type; };

    private:
        old_packet_t* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        openpgp_message_t* m__root;
        openpgp_message_t* m__parent;

    public:
        bool one() const { return m_one; }
        bool new_packet_format() const { return m_new_packet_format; }
        packet_tags_t packet_type_new() const { return m_packet_type_new; }
        packet_tags_t packet_type_old() const { return m_packet_type_old; }
        uint64_t len_type() const { return m_len_type; }
        old_packet_t* body() const { return m_body; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t* _parent() const { return m__parent; }
    };

    class trust_signature_t : public kaitai::kstruct {

    public:

        trust_signature_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent = 0, openpgp_message_t* p__root = 0);

    private:
        void _read();

    public:
        ~trust_signature_t();

    private:
        uint8_t m_level;
        uint8_t m_amount;
        openpgp_message_t* m__root;
        openpgp_message_t::subpacket_t* m__parent;

    public:
        uint8_t level() const { return m_level; }
        uint8_t amount() const { return m_amount; }
        openpgp_message_t* _root() const { return m__root; }
        openpgp_message_t::subpacket_t* _parent() const { return m__parent; }
    };

private:
    std::vector<packet_t*>* m_packets;
    openpgp_message_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<packet_t*>* packets() const { return m_packets; }
    openpgp_message_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // OPENPGP_MESSAGE_H_

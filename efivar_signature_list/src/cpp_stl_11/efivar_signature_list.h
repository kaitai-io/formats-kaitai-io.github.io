#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class efivar_signature_list_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * Parse UEFI variables db and dbx that contain signatures, certificates and
 * hashes. On a Linux system using UEFI, these variables are readable from:
 * 
 * ```
 * /sys/firmware/efi/efivars/db-d719b2cb-3d3a-4596-a3bc-dad00e67656f
 * /sys/firmware/efi/efivars/dbDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c
 * /sys/firmware/efi/efivars/dbx-d719b2cb-3d3a-4596-a3bc-dad00e67656f
 * /sys/firmware/efi/efivars/dbxDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c
 * ```
 * 
 * Note:
 * 
 * * `d719b2cb-3d3a-4596-a3bc-dad00e67656f` is defined as `EFI_IMAGE_SECURITY_DATABASE_GUID`
 * * `8be4df61-93ca-11d2-aa0d-00e098032b8c` is defined as `EFI_GLOBAL_VARIABLE`
 * 
 * Each file contains an EFI attribute (32-bit integer) followed by a list of
 * `EFI_SIGNATURE_LIST` structures.
 * \sa https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf Source
 */

class efivar_signature_list_t : public kaitai::kstruct {

public:
    class efi_var_attr_t;
    class signature_data_t;
    class signature_list_t;

    efivar_signature_list_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, efivar_signature_list_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~efivar_signature_list_t();

    /**
     * Attributes of a UEFI variable
     */

    class efi_var_attr_t : public kaitai::kstruct {

    public:

        efi_var_attr_t(kaitai::kstream* p__io, efivar_signature_list_t* p__parent = nullptr, efivar_signature_list_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~efi_var_attr_t();

    private:
        bool m_enhanced_authenticated_access;
        bool m_append_write;
        bool m_time_based_authenticated_write_access;
        bool m_authenticated_write_access;
        bool m_hardware_error_record;
        bool m_runtime_access;
        bool m_bootservice_access;
        bool m_non_volatile;
        uint64_t m_reserved1;
        efivar_signature_list_t* m__root;
        efivar_signature_list_t* m__parent;

    public:
        bool enhanced_authenticated_access() const { return m_enhanced_authenticated_access; }
        bool append_write() const { return m_append_write; }
        bool time_based_authenticated_write_access() const { return m_time_based_authenticated_write_access; }
        bool authenticated_write_access() const { return m_authenticated_write_access; }
        bool hardware_error_record() const { return m_hardware_error_record; }
        bool runtime_access() const { return m_runtime_access; }
        bool bootservice_access() const { return m_bootservice_access; }
        bool non_volatile() const { return m_non_volatile; }

        /**
         * Reserved (unused) bits
         */
        uint64_t reserved1() const { return m_reserved1; }
        efivar_signature_list_t* _root() const { return m__root; }
        efivar_signature_list_t* _parent() const { return m__parent; }
    };

    /**
     * \sa EFI_SIGNATURE_DATA
     */

    class signature_data_t : public kaitai::kstruct {

    public:

        signature_data_t(kaitai::kstream* p__io, efivar_signature_list_t::signature_list_t* p__parent = nullptr, efivar_signature_list_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~signature_data_t();

    private:
        std::string m_owner;
        std::string m_data;
        efivar_signature_list_t* m__root;
        efivar_signature_list_t::signature_list_t* m__parent;

    public:

        /**
         * An identifier which identifies the agent which added the signature to the list
         */
        std::string owner() const { return m_owner; }

        /**
         * The format of the signature is defined by the SignatureType.
         */
        std::string data() const { return m_data; }
        efivar_signature_list_t* _root() const { return m__root; }
        efivar_signature_list_t::signature_list_t* _parent() const { return m__parent; }
    };

    /**
     * \sa EFI_SIGNATURE_LIST
     */

    class signature_list_t : public kaitai::kstruct {

    public:

        signature_list_t(kaitai::kstream* p__io, efivar_signature_list_t* p__parent = nullptr, efivar_signature_list_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~signature_list_t();

    private:
        bool f_is_cert_der_pkcs7;
        bool m_is_cert_der_pkcs7;

    public:

        /**
         * DER-encoded PKCS #7 version 1.5 [RFC2315]
         * \sa EFI_CERT_TYPE_PKCS7_GUID
         */
        bool is_cert_der_pkcs7();

    private:
        bool f_is_cert_rsa2048_key;
        bool m_is_cert_rsa2048_key;

    public:

        /**
         * RSA-2048 key (only the modulus since the public key exponent is known to be 0x10001)
         * \sa EFI_CERT_RSA2048_GUID
         */
        bool is_cert_rsa2048_key();

    private:
        bool f_is_cert_rsa2048_sha1;
        bool m_is_cert_rsa2048_sha1;

    public:

        /**
         * RSA-2048 signature of a SHA-1 hash
         * \sa EFI_CERT_RSA2048_SHA1_GUID
         */
        bool is_cert_rsa2048_sha1();

    private:
        bool f_is_cert_rsa2048_sha256;
        bool m_is_cert_rsa2048_sha256;

    public:

        /**
         * RSA-2048 signature of a SHA-256 hash
         * \sa EFI_CERT_RSA2048_SHA256_GUID
         */
        bool is_cert_rsa2048_sha256();

    private:
        bool f_is_cert_sha1;
        bool m_is_cert_sha1;

    public:

        /**
         * SHA-1 hash
         * \sa EFI_CERT_SHA1_GUID
         */
        bool is_cert_sha1();

    private:
        bool f_is_cert_sha224;
        bool m_is_cert_sha224;

    public:

        /**
         * SHA-224 hash
         * \sa EFI_CERT_SHA224_GUID
         */
        bool is_cert_sha224();

    private:
        bool f_is_cert_sha256;
        bool m_is_cert_sha256;

    public:

        /**
         * SHA-256 hash
         * \sa EFI_CERT_SHA256_GUID
         */
        bool is_cert_sha256();

    private:
        bool f_is_cert_sha256_x509;
        bool m_is_cert_sha256_x509;

    public:

        /**
         * SHA256 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
         * \sa EFI_CERT_X509_SHA256_GUID
         */
        bool is_cert_sha256_x509();

    private:
        bool f_is_cert_sha384;
        bool m_is_cert_sha384;

    public:

        /**
         * SHA-384 hash
         * \sa EFI_CERT_SHA384_GUID
         */
        bool is_cert_sha384();

    private:
        bool f_is_cert_sha384_x509;
        bool m_is_cert_sha384_x509;

    public:

        /**
         * SHA384 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
         * \sa EFI_CERT_X509_SHA384_GUID
         */
        bool is_cert_sha384_x509();

    private:
        bool f_is_cert_sha512;
        bool m_is_cert_sha512;

    public:

        /**
         * SHA-512 hash
         * \sa EFI_CERT_SHA512_GUID
         */
        bool is_cert_sha512();

    private:
        bool f_is_cert_sha512_x509;
        bool m_is_cert_sha512_x509;

    public:

        /**
         * SHA512 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
         * \sa EFI_CERT_X509_SHA512_GUID
         */
        bool is_cert_sha512_x509();

    private:
        bool f_is_cert_x509;
        bool m_is_cert_x509;

    public:

        /**
         * X.509 certificate
         * \sa EFI_CERT_X509_GUID
         */
        bool is_cert_x509();

    private:
        std::string m_signature_type;
        uint32_t m_len_signature_list;
        uint32_t m_len_signature_header;
        uint32_t m_len_signature;
        std::string m_header;
        std::unique_ptr<std::vector<std::unique_ptr<signature_data_t>>> m_signatures;
        bool n_signatures;

    public:
        bool _is_null_signatures() { signatures(); return n_signatures; };

    private:
        efivar_signature_list_t* m__root;
        efivar_signature_list_t* m__parent;
        std::unique_ptr<std::vector<std::string>> m__raw_signatures;
        bool n__raw_signatures;

    public:
        bool _is_null__raw_signatures() { _raw_signatures(); return n__raw_signatures; };

    private:
        std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>> m__io__raw_signatures;

    public:

        /**
         * Type of the signature as a GUID
         */
        std::string signature_type() const { return m_signature_type; }

        /**
         * Total size of the signature list, including this header
         */
        uint32_t len_signature_list() const { return m_len_signature_list; }

        /**
         * Size of the signature header which precedes the array of signatures
         */
        uint32_t len_signature_header() const { return m_len_signature_header; }

        /**
         * Size of each signature
         */
        uint32_t len_signature() const { return m_len_signature; }

        /**
         * Header before the array of signatures
         */
        std::string header() const { return m_header; }

        /**
         * An array of signatures
         */
        std::vector<std::unique_ptr<signature_data_t>>* signatures() const { return m_signatures.get(); }
        efivar_signature_list_t* _root() const { return m__root; }
        efivar_signature_list_t* _parent() const { return m__parent; }
        std::vector<std::string>* _raw_signatures() const { return m__raw_signatures.get(); }
        std::vector<std::unique_ptr<kaitai::kstream>>* _io__raw_signatures() const { return m__io__raw_signatures.get(); }
    };

private:
    std::unique_ptr<efi_var_attr_t> m_var_attributes;
    std::unique_ptr<std::vector<std::unique_ptr<signature_list_t>>> m_signatures;
    efivar_signature_list_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * Attributes of the UEFI variable
     */
    efi_var_attr_t* var_attributes() const { return m_var_attributes.get(); }
    std::vector<std::unique_ptr<signature_list_t>>* signatures() const { return m_signatures.get(); }
    efivar_signature_list_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

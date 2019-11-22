#ifndef SSH_PUBLIC_KEY_H_
#define SSH_PUBLIC_KEY_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * SSH public keys are encoded in a special binary format, typically represented
 * to end users as either one-liner OpenSSH format or multi-line PEM format
 * (commerical SSH). Text wrapper carries extra information about user who
 * created the key, comment, etc, but the inner binary is always base64-encoded
 * and follows the same internal format.
 * 
 * This format spec deals with this internal binary format (called "blob" in
 * openssh sources) only. Buffer is expected to be raw binary and not base64-d.
 * Implementation closely follows code in OpenSSH.
 * \sa Source
 */

class ssh_public_key_t : public kaitai::kstruct {

public:
    class key_rsa_t;
    class key_ed25519_t;
    class key_ecdsa_t;
    class cstring_t;
    class key_dsa_t;
    class elliptic_curve_t;
    class bignum2_t;

    ssh_public_key_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, ssh_public_key_t* p__root = 0);

private:
    void _read();

public:
    ~ssh_public_key_t();

    /**
     * \sa Source
     */

    class key_rsa_t : public kaitai::kstruct {

    public:

        key_rsa_t(kaitai::kstream* p__io, ssh_public_key_t* p__parent = 0, ssh_public_key_t* p__root = 0);

    private:
        void _read();

    public:
        ~key_rsa_t();

    private:
        bool f_key_length;
        int32_t m_key_length;

    public:

        /**
         * Key length in bits
         */
        int32_t key_length();

    private:
        bignum2_t* m_rsa_e;
        bignum2_t* m_rsa_n;
        ssh_public_key_t* m__root;
        ssh_public_key_t* m__parent;

    public:

        /**
         * Public key exponent, designated `e` in RSA documentation.
         */
        bignum2_t* rsa_e() const { return m_rsa_e; }

        /**
         * Modulus of both public and private keys, designated `n` in RSA
         * documentation. Its length in bits is designated as "key length".
         */
        bignum2_t* rsa_n() const { return m_rsa_n; }
        ssh_public_key_t* _root() const { return m__root; }
        ssh_public_key_t* _parent() const { return m__parent; }
    };

    /**
     * \sa Source
     */

    class key_ed25519_t : public kaitai::kstruct {

    public:

        key_ed25519_t(kaitai::kstream* p__io, ssh_public_key_t* p__parent = 0, ssh_public_key_t* p__root = 0);

    private:
        void _read();

    public:
        ~key_ed25519_t();

    private:
        uint32_t m_len_pk;
        std::string m_pk;
        ssh_public_key_t* m__root;
        ssh_public_key_t* m__parent;

    public:
        uint32_t len_pk() const { return m_len_pk; }
        std::string pk() const { return m_pk; }
        ssh_public_key_t* _root() const { return m__root; }
        ssh_public_key_t* _parent() const { return m__parent; }
    };

    /**
     * \sa Source
     */

    class key_ecdsa_t : public kaitai::kstruct {

    public:

        key_ecdsa_t(kaitai::kstream* p__io, ssh_public_key_t* p__parent = 0, ssh_public_key_t* p__root = 0);

    private:
        void _read();

    public:
        ~key_ecdsa_t();

    private:
        cstring_t* m_curve_name;
        elliptic_curve_t* m_ec;
        ssh_public_key_t* m__root;
        ssh_public_key_t* m__parent;

    public:
        cstring_t* curve_name() const { return m_curve_name; }
        elliptic_curve_t* ec() const { return m_ec; }
        ssh_public_key_t* _root() const { return m__root; }
        ssh_public_key_t* _parent() const { return m__parent; }
    };

    /**
     * A integer-prefixed string designed to be read using `sshbuf_get_cstring`
     * and written by `sshbuf_put_cstring` routines in ssh sources. Name is an
     * obscure misnomer, as typically "C string" means a null-terminated string.
     * \sa Source
     */

    class cstring_t : public kaitai::kstruct {

    public:

        cstring_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, ssh_public_key_t* p__root = 0);

    private:
        void _read();

    public:
        ~cstring_t();

    private:
        uint32_t m_len;
        std::string m_value;
        ssh_public_key_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint32_t len() const { return m_len; }
        std::string value() const { return m_value; }
        ssh_public_key_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * \sa Source
     */

    class key_dsa_t : public kaitai::kstruct {

    public:

        key_dsa_t(kaitai::kstream* p__io, ssh_public_key_t* p__parent = 0, ssh_public_key_t* p__root = 0);

    private:
        void _read();

    public:
        ~key_dsa_t();

    private:
        bignum2_t* m_dsa_p;
        bignum2_t* m_dsa_q;
        bignum2_t* m_dsa_g;
        bignum2_t* m_dsa_pub_key;
        ssh_public_key_t* m__root;
        ssh_public_key_t* m__parent;

    public:
        bignum2_t* dsa_p() const { return m_dsa_p; }
        bignum2_t* dsa_q() const { return m_dsa_q; }
        bignum2_t* dsa_g() const { return m_dsa_g; }
        bignum2_t* dsa_pub_key() const { return m_dsa_pub_key; }
        ssh_public_key_t* _root() const { return m__root; }
        ssh_public_key_t* _parent() const { return m__parent; }
    };

    /**
     * Elliptic curve dump format used by ssh. In OpenSSH code, the following
     * routines are used to read/write it:
     * 
     * * sshbuf_get_ec
     * * get_ec
     * \sa Source
     */

    class elliptic_curve_t : public kaitai::kstruct {

    public:

        elliptic_curve_t(kaitai::kstream* p__io, ssh_public_key_t::key_ecdsa_t* p__parent = 0, ssh_public_key_t* p__root = 0);

    private:
        void _read();

    public:
        ~elliptic_curve_t();

    private:
        uint32_t m_len;
        std::string m_body;
        ssh_public_key_t* m__root;
        ssh_public_key_t::key_ecdsa_t* m__parent;

    public:
        uint32_t len() const { return m_len; }
        std::string body() const { return m_body; }
        ssh_public_key_t* _root() const { return m__root; }
        ssh_public_key_t::key_ecdsa_t* _parent() const { return m__parent; }
    };

    /**
     * Big integers serialization format used by ssh, v2. In the code, the following
     * routines are used to read/write it:
     * 
     * * sshbuf_get_bignum2
     * * sshbuf_get_bignum2_bytes_direct
     * * sshbuf_put_bignum2
     * * sshbuf_get_bignum2_bytes_direct
     * \sa Source
     */

    class bignum2_t : public kaitai::kstruct {

    public:

        bignum2_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, ssh_public_key_t* p__root = 0);

    private:
        void _read();

    public:
        ~bignum2_t();

    private:
        bool f_length_in_bits;
        int32_t m_length_in_bits;

    public:

        /**
         * Length of big integer in bits. In OpenSSH sources, this corresponds to
         * `BN_num_bits` function.
         */
        int32_t length_in_bits();

    private:
        uint32_t m_len;
        std::string m_body;
        ssh_public_key_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint32_t len() const { return m_len; }
        std::string body() const { return m_body; }
        ssh_public_key_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

private:
    cstring_t* m_key_name;
    kaitai::kstruct* m_body;
    bool n_body;

public:
    bool _is_null_body() { body(); return n_body; };

private:
    ssh_public_key_t* m__root;
    kaitai::kstruct* m__parent;

public:
    cstring_t* key_name() const { return m_key_name; }
    kaitai::kstruct* body() const { return m_body; }
    ssh_public_key_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // SSH_PUBLIC_KEY_H_

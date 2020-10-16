#ifndef BITCOIN_TRANSACTION_H_
#define BITCOIN_TRANSACTION_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * \sa https://bitcoin.org/en/developer-guide#transactions
 * https://en.bitcoin.it/wiki/Transaction
 *  Source
 */

class bitcoin_transaction_t : public kaitai::kstruct {

public:
    class vin_t;
    class vout_t;

    bitcoin_transaction_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, bitcoin_transaction_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~bitcoin_transaction_t();

    class vin_t : public kaitai::kstruct {

    public:
        class script_signature_t;

        vin_t(kaitai::kstream* p__io, bitcoin_transaction_t* p__parent = 0, bitcoin_transaction_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~vin_t();

        class script_signature_t : public kaitai::kstruct {

        public:
            class der_signature_t;
            class public_key_t;

            enum sighash_type_t {
                SIGHASH_TYPE_SIGHASH_ALL = 1,
                SIGHASH_TYPE_SIGHASH_NONE = 2,
                SIGHASH_TYPE_SIGHASH_SINGLE = 3,
                SIGHASH_TYPE_SIGHASH_ANYONECANPAY = 80
            };

            script_signature_t(kaitai::kstream* p__io, bitcoin_transaction_t::vin_t* p__parent = 0, bitcoin_transaction_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~script_signature_t();

            class der_signature_t : public kaitai::kstruct {

            public:

                der_signature_t(kaitai::kstream* p__io, bitcoin_transaction_t::vin_t::script_signature_t* p__parent = 0, bitcoin_transaction_t* p__root = 0);

            private:
                void _read();
                void _clean_up();

            public:
                ~der_signature_t();

            private:
                std::string m_sequence;
                uint8_t m_len_sig;
                std::string m_sep_1;
                uint8_t m_len_sig_r;
                std::string m_sig_r;
                std::string m_sep_2;
                uint8_t m_len_sig_s;
                std::string m_sig_s;
                bitcoin_transaction_t* m__root;
                bitcoin_transaction_t::vin_t::script_signature_t* m__parent;

            public:
                std::string sequence() const { return m_sequence; }
                uint8_t len_sig() const { return m_len_sig; }
                std::string sep_1() const { return m_sep_1; }

                /**
                 * 'r' value's length.
                 */
                uint8_t len_sig_r() const { return m_len_sig_r; }

                /**
                 * 'r' value of the ECDSA signature.
                 * \sa https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm Source
                 */
                std::string sig_r() const { return m_sig_r; }
                std::string sep_2() const { return m_sep_2; }

                /**
                 * 's' value's length.
                 */
                uint8_t len_sig_s() const { return m_len_sig_s; }

                /**
                 * 's' value of the ECDSA signature.
                 * \sa https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm Source
                 */
                std::string sig_s() const { return m_sig_s; }
                bitcoin_transaction_t* _root() const { return m__root; }
                bitcoin_transaction_t::vin_t::script_signature_t* _parent() const { return m__parent; }
            };

            class public_key_t : public kaitai::kstruct {

            public:

                public_key_t(kaitai::kstream* p__io, bitcoin_transaction_t::vin_t::script_signature_t* p__parent = 0, bitcoin_transaction_t* p__root = 0);

            private:
                void _read();
                void _clean_up();

            public:
                ~public_key_t();

            private:
                uint8_t m_type;
                std::string m_x;
                std::string m_y;
                bitcoin_transaction_t* m__root;
                bitcoin_transaction_t::vin_t::script_signature_t* m__parent;

            public:
                uint8_t type() const { return m_type; }

                /**
                 * 'x' coordinate of the public key on the elliptic curve.
                 */
                std::string x() const { return m_x; }

                /**
                 * 'y' coordinate of the public key on the elliptic curve.
                 */
                std::string y() const { return m_y; }
                bitcoin_transaction_t* _root() const { return m__root; }
                bitcoin_transaction_t::vin_t::script_signature_t* _parent() const { return m__parent; }
            };

        private:
            uint8_t m_len_sig_stack;
            der_signature_t* m_der_sig;
            sighash_type_t m_sig_type;
            uint8_t m_len_pubkey_stack;
            public_key_t* m_pubkey;
            bitcoin_transaction_t* m__root;
            bitcoin_transaction_t::vin_t* m__parent;

        public:
            uint8_t len_sig_stack() const { return m_len_sig_stack; }

            /**
             * DER-encoded ECDSA signature.
             * \sa https://en.wikipedia.org/wiki/X.690#DER_encoding
             * https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm
             *  Source
             */
            der_signature_t* der_sig() const { return m_der_sig; }

            /**
             * Type of signature.
             */
            sighash_type_t sig_type() const { return m_sig_type; }
            uint8_t len_pubkey_stack() const { return m_len_pubkey_stack; }

            /**
             * Public key (bitcoin address of the recipient).
             */
            public_key_t* pubkey() const { return m_pubkey; }
            bitcoin_transaction_t* _root() const { return m__root; }
            bitcoin_transaction_t::vin_t* _parent() const { return m__parent; }
        };

    private:
        std::string m_txid;
        uint32_t m_output_id;
        uint8_t m_len_script;
        script_signature_t* m_script_sig;
        std::string m_end_of_vin;
        bitcoin_transaction_t* m__root;
        bitcoin_transaction_t* m__parent;
        std::string m__raw_script_sig;
        kaitai::kstream* m__io__raw_script_sig;

    public:

        /**
         * Previous transaction hash.
         */
        std::string txid() const { return m_txid; }

        /**
         * ID indexing an ouput of the transaction refered by txid.
         * This output will be used as an input in the present transaction.
         */
        uint32_t output_id() const { return m_output_id; }

        /**
         * ScriptSig's length.
         */
        uint8_t len_script() const { return m_len_script; }

        /**
         * ScriptSig.
         * \sa https://en.bitcoin.it/wiki/Transaction#Input
         * https://en.bitcoin.it/wiki/Script
         *  Source
         */
        script_signature_t* script_sig() const { return m_script_sig; }

        /**
         * Magic number indicating the end of the current input.
         */
        std::string end_of_vin() const { return m_end_of_vin; }
        bitcoin_transaction_t* _root() const { return m__root; }
        bitcoin_transaction_t* _parent() const { return m__parent; }
        std::string _raw_script_sig() const { return m__raw_script_sig; }
        kaitai::kstream* _io__raw_script_sig() const { return m__io__raw_script_sig; }
    };

    class vout_t : public kaitai::kstruct {

    public:

        vout_t(kaitai::kstream* p__io, bitcoin_transaction_t* p__parent = 0, bitcoin_transaction_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~vout_t();

    private:
        uint64_t m_amount;
        uint8_t m_len_script;
        std::string m_script_pub_key;
        bitcoin_transaction_t* m__root;
        bitcoin_transaction_t* m__parent;

    public:

        /**
         * Number of Satoshis to be transfered.
         */
        uint64_t amount() const { return m_amount; }

        /**
         * ScriptPubKey's length.
         */
        uint8_t len_script() const { return m_len_script; }

        /**
         * ScriptPubKey.
         * \sa https://en.bitcoin.it/wiki/Transaction#Output
         * https://en.bitcoin.it/wiki/Script
         *  Source
         */
        std::string script_pub_key() const { return m_script_pub_key; }
        bitcoin_transaction_t* _root() const { return m__root; }
        bitcoin_transaction_t* _parent() const { return m__parent; }
    };

private:
    uint32_t m_version;
    uint8_t m_num_vins;
    std::vector<vin_t*>* m_vins;
    uint8_t m_num_vouts;
    std::vector<vout_t*>* m_vouts;
    uint32_t m_locktime;
    bitcoin_transaction_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * Version number.
     */
    uint32_t version() const { return m_version; }

    /**
     * Number of input transactions.
     */
    uint8_t num_vins() const { return m_num_vins; }

    /**
     * Input transactions.
     * An input refers to an output from a previous transaction.
     */
    std::vector<vin_t*>* vins() const { return m_vins; }

    /**
     * Number of output transactions.
     */
    uint8_t num_vouts() const { return m_num_vouts; }

    /**
     * Output transactions.
     */
    std::vector<vout_t*>* vouts() const { return m_vouts; }
    uint32_t locktime() const { return m_locktime; }
    bitcoin_transaction_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // BITCOIN_TRANSACTION_H_

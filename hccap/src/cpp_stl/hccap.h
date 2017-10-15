#ifndef HCCAP_H_
#define HCCAP_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * Native format of Hashcat password "recovery" utility
 * A sample of file for testing can be downloaded from https://web.archive.org/web/20150220013635if_/http://hashcat.net:80/misc/example_hashes/hashcat.hccap
 * \sa Source
 */

class hccap_t : public kaitai::kstruct {

public:
    class hccap_t;
    class eapol_frame_t;

    hccap_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, hccap_t* p__root = 0);

private:
    void _read();

public:
    ~hccap_t();

    class hccap_t : public kaitai::kstruct {

    public:

        hccap_t(kaitai::kstream* p__io, hccap_t* p__parent = 0, hccap_t* p__root = 0);

    private:
        void _read();

    public:
        ~hccap_t();

    private:
        std::string m_essid;
        std::string m_ap_mac;
        std::string m_stantion_mac;
        std::string m_stantion_nonce;
        std::string m_ap_nonce;
        eapol_frame_t* m_eapol;
        uint32_t m_eapol_size;
        uint32_t m_keyver;
        std::string m_keymic;
        hccap_t* m__root;
        hccap_t* m__parent;
        std::string m__raw_eapol;
        kaitai::kstream* m__io__raw_eapol;

    public:
        std::string essid() const { return m_essid; }

        /**
         * the bssid(MAC) of the access point
         */
        std::string ap_mac() const { return m_ap_mac; }

        /**
         * the MAC address of a client connecting to the access point
         */
        std::string stantion_mac() const { return m_stantion_mac; }
        std::string stantion_nonce() const { return m_stantion_nonce; }
        std::string ap_nonce() const { return m_ap_nonce; }
        eapol_frame_t* eapol() const { return m_eapol; }

        /**
         * size of eapol
         */
        uint32_t eapol_size() const { return m_eapol_size; }

        /**
         * the flag used to distinguish WPA from WPA2 ciphers. Value of 1 means WPA, other - WPA2
         */
        uint32_t keyver() const { return m_keyver; }

        /**
         * the final hash value. MD5 for WPA and SHA-1 for WPA2 (truncated to 128 bit)
         */
        std::string keymic() const { return m_keymic; }
        hccap_t* _root() const { return m__root; }
        hccap_t* _parent() const { return m__parent; }
        std::string _raw_eapol() const { return m__raw_eapol; }
        kaitai::kstream* _io__raw_eapol() const { return m__io__raw_eapol; }
    };

    class eapol_frame_t : public kaitai::kstruct {

    public:

        eapol_frame_t(kaitai::kstream* p__io, hccap_t::hccap_t* p__parent = 0, hccap_t* p__root = 0);

    private:
        void _read();

    public:
        ~eapol_frame_t();

    private:
        bool f_body;
        std::string m_body;

    public:
        std::string body();

    private:
        hccap_t* m__root;
        hccap_t::hccap_t* m__parent;

    public:
        hccap_t* _root() const { return m__root; }
        hccap_t::hccap_t* _parent() const { return m__parent; }
    };

private:
    std::vector<hccap_t*>* m_records;
    hccap_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<hccap_t*>* records() const { return m_records; }
    hccap_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // HCCAP_H_

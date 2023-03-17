#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * This spec can be used to parse utmp, wtmp and other similar as created by IBM AIX.
 * \sa https://www.ibm.com/docs/en/aix/7.1?topic=files-utmph-file Source
 */

class aix_utmp_t : public kaitai::kstruct {

public:
    class record_t;
    class exit_status_t;

    enum entry_type_t {
        ENTRY_TYPE_EMPTY = 0,
        ENTRY_TYPE_RUN_LVL = 1,
        ENTRY_TYPE_BOOT_TIME = 2,
        ENTRY_TYPE_OLD_TIME = 3,
        ENTRY_TYPE_NEW_TIME = 4,
        ENTRY_TYPE_INIT_PROCESS = 5,
        ENTRY_TYPE_LOGIN_PROCESS = 6,
        ENTRY_TYPE_USER_PROCESS = 7,
        ENTRY_TYPE_DEAD_PROCESS = 8,
        ENTRY_TYPE_ACCOUNTING = 9
    };

    aix_utmp_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, aix_utmp_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~aix_utmp_t();

    class record_t : public kaitai::kstruct {

    public:

        record_t(kaitai::kstream* p__io, aix_utmp_t* p__parent = nullptr, aix_utmp_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_t();

    private:
        std::string m_user;
        std::string m_inittab_id;
        std::string m_device;
        uint64_t m_pid;
        entry_type_t m_type;
        int64_t m_timestamp;
        std::unique_ptr<exit_status_t> m_exit_status;
        std::string m_hostname;
        int32_t m_dbl_word_pad;
        std::string m_reserved_a;
        std::string m_reserved_v;
        aix_utmp_t* m__root;
        aix_utmp_t* m__parent;

    public:

        /**
         * User login name
         */
        std::string user() const { return m_user; }

        /**
         * /etc/inittab id
         */
        std::string inittab_id() const { return m_inittab_id; }

        /**
         * device name (console, lnxx)
         */
        std::string device() const { return m_device; }

        /**
         * process id
         */
        uint64_t pid() const { return m_pid; }

        /**
         * Type of login
         */
        entry_type_t type() const { return m_type; }

        /**
         * time entry was made
         */
        int64_t timestamp() const { return m_timestamp; }

        /**
         * the exit status of a process marked as DEAD PROCESS
         */
        exit_status_t* exit_status() const { return m_exit_status.get(); }

        /**
         * host name
         */
        std::string hostname() const { return m_hostname; }
        int32_t dbl_word_pad() const { return m_dbl_word_pad; }
        std::string reserved_a() const { return m_reserved_a; }
        std::string reserved_v() const { return m_reserved_v; }
        aix_utmp_t* _root() const { return m__root; }
        aix_utmp_t* _parent() const { return m__parent; }
    };

    class exit_status_t : public kaitai::kstruct {

    public:

        exit_status_t(kaitai::kstream* p__io, aix_utmp_t::record_t* p__parent = nullptr, aix_utmp_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~exit_status_t();

    private:
        int16_t m_termination_code;
        int16_t m_exit_code;
        aix_utmp_t* m__root;
        aix_utmp_t::record_t* m__parent;

    public:

        /**
         * process termination status
         */
        int16_t termination_code() const { return m_termination_code; }

        /**
         * process exit status
         */
        int16_t exit_code() const { return m_exit_code; }
        aix_utmp_t* _root() const { return m__root; }
        aix_utmp_t::record_t* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<std::vector<std::unique_ptr<record_t>>> m_records;
    aix_utmp_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<std::unique_ptr<record_t>>* records() const { return m_records.get(); }
    aix_utmp_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

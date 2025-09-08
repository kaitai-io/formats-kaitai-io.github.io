#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class glibc_utmp_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

class glibc_utmp_t : public kaitai::kstruct {

public:
    class record_t;
    class timeval_t;

    enum entry_type_t {
        ENTRY_TYPE_EMPTY = 0,
        ENTRY_TYPE_RUN_LVL = 1,
        ENTRY_TYPE_BOOT_TIME = 2,
        ENTRY_TYPE_NEW_TIME = 3,
        ENTRY_TYPE_OLD_TIME = 4,
        ENTRY_TYPE_INIT_PROCESS = 5,
        ENTRY_TYPE_LOGIN_PROCESS = 6,
        ENTRY_TYPE_USER_PROCESS = 7,
        ENTRY_TYPE_DEAD_PROCESS = 8,
        ENTRY_TYPE_ACCOUNTING = 9
    };
    static bool _is_defined_entry_type_t(entry_type_t v);

private:
    static const std::set<entry_type_t> _values_entry_type_t;

public:

    glibc_utmp_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, glibc_utmp_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~glibc_utmp_t();

    class record_t : public kaitai::kstruct {

    public:

        record_t(kaitai::kstream* p__io, glibc_utmp_t* p__parent = nullptr, glibc_utmp_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_t();

    private:
        entry_type_t m_ut_type;
        int32_t m_pid;
        std::string m_line;
        std::string m_id;
        std::string m_user;
        std::string m_host;
        uint32_t m_exit;
        int32_t m_session;
        std::unique_ptr<timeval_t> m_tv;
        std::string m_addr_v6;
        std::string m_reserved;
        glibc_utmp_t* m__root;
        glibc_utmp_t* m__parent;

    public:

        /**
         * Type of login
         */
        entry_type_t ut_type() const { return m_ut_type; }

        /**
         * Process ID of login process
         */
        int32_t pid() const { return m_pid; }

        /**
         * Devicename
         */
        std::string line() const { return m_line; }

        /**
         * Inittab ID
         */
        std::string id() const { return m_id; }

        /**
         * Username
         */
        std::string user() const { return m_user; }

        /**
         * Hostname for remote login
         */
        std::string host() const { return m_host; }

        /**
         * Exit status of a process marked as DEAD_PROCESS
         */
        uint32_t exit() const { return m_exit; }

        /**
         * Session ID, used for windowing
         */
        int32_t session() const { return m_session; }

        /**
         * Time entry was made
         */
        timeval_t* tv() const { return m_tv.get(); }

        /**
         * Internet address of remote host
         */
        std::string addr_v6() const { return m_addr_v6; }
        std::string reserved() const { return m_reserved; }
        glibc_utmp_t* _root() const { return m__root; }
        glibc_utmp_t* _parent() const { return m__parent; }
    };

    class timeval_t : public kaitai::kstruct {

    public:

        timeval_t(kaitai::kstream* p__io, glibc_utmp_t::record_t* p__parent = nullptr, glibc_utmp_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~timeval_t();

    private:
        uint32_t m_sec;
        int32_t m_usec;
        glibc_utmp_t* m__root;
        glibc_utmp_t::record_t* m__parent;

    public:

        /**
         * Seconds
         */
        uint32_t sec() const { return m_sec; }

        /**
         * Microseconds
         */
        int32_t usec() const { return m_usec; }
        glibc_utmp_t* _root() const { return m__root; }
        glibc_utmp_t::record_t* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<std::vector<std::unique_ptr<record_t>>> m_records;
    glibc_utmp_t* m__root;
    kaitai::kstruct* m__parent;
    std::unique_ptr<std::vector<std::string>> m__raw_records;
    std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>> m__io__raw_records;

public:
    std::vector<std::unique_ptr<record_t>>* records() const { return m_records.get(); }
    glibc_utmp_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::vector<std::string>* _raw_records() const { return m__raw_records.get(); }
    std::vector<std::unique_ptr<kaitai::kstream>>* _io__raw_records() const { return m__io__raw_records.get(); }
};

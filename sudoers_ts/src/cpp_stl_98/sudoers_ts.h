#ifndef SUDOERS_TS_H_
#define SUDOERS_TS_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * This spec can be used to parse sudo time stamp files located in directories
 * such as /run/sudo/ts/$USER or /var/lib/sudo/ts/$USER.
 * \sa https://www.sudo.ws/docs/man/1.8.27/sudoers_timestamp.man/ Source
 */

class sudoers_ts_t : public kaitai::kstruct {

public:
    class record_v2_t;
    class ts_flag_t;
    class record_v1_t;
    class timespec_t;
    class record_t;

    enum ts_type_t {
        TS_TYPE_GLOBAL = 1,
        TS_TYPE_TTY = 2,
        TS_TYPE_PPID = 3,
        TS_TYPE_LOCKEXCL = 4
    };

    sudoers_ts_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, sudoers_ts_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~sudoers_ts_t();

    class record_v2_t : public kaitai::kstruct {

    public:

        record_v2_t(kaitai::kstream* p__io, sudoers_ts_t::record_t* p__parent = 0, sudoers_ts_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_v2_t();

    private:
        ts_type_t m_type;
        ts_flag_t* m_flags;
        uint32_t m_auth_uid;
        uint32_t m_sid;
        timespec_t* m_start_time;
        timespec_t* m_ts;
        uint32_t m_ttydev;
        bool n_ttydev;

    public:
        bool _is_null_ttydev() { ttydev(); return n_ttydev; };

    private:
        uint32_t m_ppid;
        bool n_ppid;

    public:
        bool _is_null_ppid() { ppid(); return n_ppid; };

    private:
        sudoers_ts_t* m__root;
        sudoers_ts_t::record_t* m__parent;

    public:

        /**
         * record type
         */
        ts_type_t type() const { return m_type; }

        /**
         * record flags
         */
        ts_flag_t* flags() const { return m_flags; }

        /**
         * user ID that was used for authentication
         */
        uint32_t auth_uid() const { return m_auth_uid; }

        /**
         * ID of the user's terminal session, if present (when type is TS_TTY)
         */
        uint32_t sid() const { return m_sid; }

        /**
         * start time of the session leader for records of type TS_TTY or of the parent process for records of type TS_PPID
         */
        timespec_t* start_time() const { return m_start_time; }

        /**
         * actual time stamp, from a monotonic time source
         */
        timespec_t* ts() const { return m_ts; }

        /**
         * device number of the terminal associated with the session
         */
        uint32_t ttydev() const { return m_ttydev; }

        /**
         * ID of the parent process
         */
        uint32_t ppid() const { return m_ppid; }
        sudoers_ts_t* _root() const { return m__root; }
        sudoers_ts_t::record_t* _parent() const { return m__parent; }
    };

    class ts_flag_t : public kaitai::kstruct {

    public:

        ts_flag_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, sudoers_ts_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~ts_flag_t();

    private:
        uint64_t m_reserved0;
        bool m_anyuid;
        bool m_disabled;
        uint64_t m_reserved1;
        sudoers_ts_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * Reserved (unused) bits
         */
        uint64_t reserved0() const { return m_reserved0; }

        /**
         * ignore uid
         */
        bool anyuid() const { return m_anyuid; }

        /**
         * entry disabled
         */
        bool disabled() const { return m_disabled; }

        /**
         * Reserved (unused) bits
         */
        uint64_t reserved1() const { return m_reserved1; }
        sudoers_ts_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class record_v1_t : public kaitai::kstruct {

    public:

        record_v1_t(kaitai::kstream* p__io, sudoers_ts_t::record_t* p__parent = 0, sudoers_ts_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_v1_t();

    private:
        ts_type_t m_type;
        ts_flag_t* m_flags;
        uint32_t m_auth_uid;
        uint32_t m_sid;
        timespec_t* m_ts;
        uint32_t m_ttydev;
        bool n_ttydev;

    public:
        bool _is_null_ttydev() { ttydev(); return n_ttydev; };

    private:
        uint32_t m_ppid;
        bool n_ppid;

    public:
        bool _is_null_ppid() { ppid(); return n_ppid; };

    private:
        sudoers_ts_t* m__root;
        sudoers_ts_t::record_t* m__parent;

    public:

        /**
         * record type
         */
        ts_type_t type() const { return m_type; }

        /**
         * record flags
         */
        ts_flag_t* flags() const { return m_flags; }

        /**
         * user ID that was used for authentication
         */
        uint32_t auth_uid() const { return m_auth_uid; }

        /**
         * session ID associated with tty/ppid
         */
        uint32_t sid() const { return m_sid; }

        /**
         * time stamp, from a monotonic time source
         */
        timespec_t* ts() const { return m_ts; }

        /**
         * device number of the terminal associated with the session
         */
        uint32_t ttydev() const { return m_ttydev; }

        /**
         * ID of the parent process
         */
        uint32_t ppid() const { return m_ppid; }
        sudoers_ts_t* _root() const { return m__root; }
        sudoers_ts_t::record_t* _parent() const { return m__parent; }
    };

    class timespec_t : public kaitai::kstruct {

    public:

        timespec_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, sudoers_ts_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~timespec_t();

    private:
        int64_t m_sec;
        int64_t m_nsec;
        sudoers_ts_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * seconds
         */
        int64_t sec() const { return m_sec; }

        /**
         * nanoseconds
         */
        int64_t nsec() const { return m_nsec; }
        sudoers_ts_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class record_t : public kaitai::kstruct {

    public:

        record_t(kaitai::kstream* p__io, sudoers_ts_t* p__parent = 0, sudoers_ts_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_t();

    private:
        uint16_t m_version;
        uint16_t m_len_record;
        kaitai::kstruct* m_payload;
        bool n_payload;

    public:
        bool _is_null_payload() { payload(); return n_payload; };

    private:
        sudoers_ts_t* m__root;
        sudoers_ts_t* m__parent;
        std::string m__raw_payload;
        kaitai::kstream* m__io__raw_payload;

    public:

        /**
         * version number of the timestamp_entry struct
         */
        uint16_t version() const { return m_version; }

        /**
         * size of the record in bytes
         */
        uint16_t len_record() const { return m_len_record; }
        kaitai::kstruct* payload() const { return m_payload; }
        sudoers_ts_t* _root() const { return m__root; }
        sudoers_ts_t* _parent() const { return m__parent; }
        std::string _raw_payload() const { return m__raw_payload; }
        kaitai::kstream* _io__raw_payload() const { return m__io__raw_payload; }
    };

private:
    std::vector<record_t*>* m_records;
    sudoers_ts_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<record_t*>* records() const { return m_records; }
    sudoers_ts_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // SUDOERS_TS_H_

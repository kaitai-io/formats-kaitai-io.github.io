#ifndef WINDOWS_EVT_LOG_H_
#define WINDOWS_EVT_LOG_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * EVT files are Windows Event Log files written by older Windows
 * operating systems (2000, XP, 2003). They are used as binary log
 * files by several major Windows subsystems and
 * applications. Typically, several of them can be found in
 * `%WINDIR%\system32\config` directory:
 * 
 * * Application = `AppEvent.evt`
 * * System = `SysEvent.evt`
 * * Security = `SecEvent.evt`
 * 
 * Alternatively, one can export any system event log as distinct .evt
 * file using relevant option in Event Viewer application.
 * 
 * A Windows application can submit an entry into these logs using
 * [ReportEvent](https://msdn.microsoft.com/en-us/library/aa363679(v=vs.85).aspx)
 * function of Windows API.
 * 
 * Internally, EVT files consist of a fixed-size header and event
 * records. There are several usage scenarios (non-wrapping vs wrapping
 * log files) which result in slightly different organization of
 * records.
 * \sa https://msdn.microsoft.com/en-us/library/bb309026(v=vs.85).aspx Source
 */

class windows_evt_log_t : public kaitai::kstruct {

public:
    class header_t;
    class record_t;
    class record_body_t;
    class cursor_record_body_t;

    windows_evt_log_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, windows_evt_log_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~windows_evt_log_t();

    /**
     * \sa https://msdn.microsoft.com/en-us/library/bb309024(v=vs.85).aspx Source
     */

    class header_t : public kaitai::kstruct {

    public:
        class flags_t;

        header_t(kaitai::kstream* p__io, windows_evt_log_t* p__parent = 0, windows_evt_log_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

        class flags_t : public kaitai::kstruct {

        public:

            flags_t(kaitai::kstream* p__io, windows_evt_log_t::header_t* p__parent = 0, windows_evt_log_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~flags_t();

        private:
            uint64_t m_reserved;
            bool m_archive;
            bool m_log_full;
            bool m_wrap;
            bool m_dirty;
            windows_evt_log_t* m__root;
            windows_evt_log_t::header_t* m__parent;

        public:
            uint64_t reserved() const { return m_reserved; }

            /**
             * True if archive attribute has been set for this log file.
             */
            bool archive() const { return m_archive; }

            /**
             * True if last write operation failed due to log being full.
             */
            bool log_full() const { return m_log_full; }

            /**
             * True if wrapping of record has occured.
             */
            bool wrap() const { return m_wrap; }

            /**
             * True if write operation was in progress, but log file
             * wasn't properly closed.
             */
            bool dirty() const { return m_dirty; }
            windows_evt_log_t* _root() const { return m__root; }
            windows_evt_log_t::header_t* _parent() const { return m__parent; }
        };

    private:
        uint32_t m_len_header;
        std::string m_magic;
        uint32_t m_version_major;
        uint32_t m_version_minor;
        uint32_t m_ofs_start;
        uint32_t m_ofs_end;
        uint32_t m_cur_rec_idx;
        uint32_t m_oldest_rec_idx;
        uint32_t m_len_file_max;
        flags_t* m_flags;
        uint32_t m_retention;
        uint32_t m_len_header_2;
        windows_evt_log_t* m__root;
        windows_evt_log_t* m__parent;

    public:

        /**
         * Size of the header structure, must be 0x30.
         */
        uint32_t len_header() const { return m_len_header; }
        std::string magic() const { return m_magic; }
        uint32_t version_major() const { return m_version_major; }
        uint32_t version_minor() const { return m_version_minor; }

        /**
         * Offset of oldest record kept in this log file.
         */
        uint32_t ofs_start() const { return m_ofs_start; }

        /**
         * Offset of EOF log record, which is a placeholder for new record.
         */
        uint32_t ofs_end() const { return m_ofs_end; }

        /**
         * Index of current record, where a new submission would be
         * written to (normally there should to EOF log record there).
         */
        uint32_t cur_rec_idx() const { return m_cur_rec_idx; }

        /**
         * Index of oldest record in the log file
         */
        uint32_t oldest_rec_idx() const { return m_oldest_rec_idx; }

        /**
         * Total maximum size of the log file
         */
        uint32_t len_file_max() const { return m_len_file_max; }
        flags_t* flags() const { return m_flags; }
        uint32_t retention() const { return m_retention; }

        /**
         * Size of the header structure repeated again, and again it must be 0x30.
         */
        uint32_t len_header_2() const { return m_len_header_2; }
        windows_evt_log_t* _root() const { return m__root; }
        windows_evt_log_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://msdn.microsoft.com/en-us/library/windows/desktop/aa363646(v=vs.85).aspx Source
     */

    class record_t : public kaitai::kstruct {

    public:

        record_t(kaitai::kstream* p__io, windows_evt_log_t* p__parent = 0, windows_evt_log_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_t();

    private:
        uint32_t m_len_record;
        uint32_t m_type;
        kaitai::kstruct* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        uint32_t m_len_record2;
        windows_evt_log_t* m__root;
        windows_evt_log_t* m__parent;
        std::string m__raw_body;
        kaitai::kstream* m__io__raw_body;

    public:

        /**
         * Size of whole record, including all headers, footers and data
         */
        uint32_t len_record() const { return m_len_record; }

        /**
         * Type of record. Normal log records specify "LfLe"
         * (0x654c664c) in this field, cursor records use 0x11111111.
         */
        uint32_t type() const { return m_type; }

        /**
         * Record body interpretation depends on type of record. Body
         * size is specified in a way that it won't include a 8-byte
         * "header" (`len_record` + `type`) and a "footer"
         * (`len_record2`).
         */
        kaitai::kstruct* body() const { return m_body; }

        /**
         * Size of whole record again.
         */
        uint32_t len_record2() const { return m_len_record2; }
        windows_evt_log_t* _root() const { return m__root; }
        windows_evt_log_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
    };

    /**
     * \sa https://msdn.microsoft.com/en-us/library/windows/desktop/aa363646(v=vs.85).aspx Source
     */

    class record_body_t : public kaitai::kstruct {

    public:

        enum event_types_t {
            EVENT_TYPES_ERROR = 1,
            EVENT_TYPES_AUDIT_FAILURE = 2,
            EVENT_TYPES_AUDIT_SUCCESS = 3,
            EVENT_TYPES_INFO = 4,
            EVENT_TYPES_WARNING = 5
        };

        record_body_t(kaitai::kstream* p__io, windows_evt_log_t::record_t* p__parent = 0, windows_evt_log_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_body_t();

    private:
        bool f_user_sid;
        std::string m_user_sid;

    public:
        std::string user_sid();

    private:
        bool f_data;
        std::string m_data;

    public:
        std::string data();

    private:
        uint32_t m_idx;
        uint32_t m_time_generated;
        uint32_t m_time_written;
        uint32_t m_event_id;
        event_types_t m_event_type;
        uint16_t m_num_strings;
        uint16_t m_event_category;
        std::string m_reserved;
        uint32_t m_ofs_strings;
        uint32_t m_len_user_sid;
        uint32_t m_ofs_user_sid;
        uint32_t m_len_data;
        uint32_t m_ofs_data;
        windows_evt_log_t* m__root;
        windows_evt_log_t::record_t* m__parent;

    public:

        /**
         * Index of record in the file.
         */
        uint32_t idx() const { return m_idx; }

        /**
         * Time when this record was generated, POSIX timestamp format.
         */
        uint32_t time_generated() const { return m_time_generated; }

        /**
         * Time when thsi record was written into the log file, POSIX timestamp format.
         */
        uint32_t time_written() const { return m_time_written; }

        /**
         * Identifier of an event, meaning is specific to particular
         * source of events / event type.
         */
        uint32_t event_id() const { return m_event_id; }

        /**
         * Type of event.
         * \sa https://msdn.microsoft.com/en-us/library/windows/desktop/aa363662(v=vs.85).aspx Source
         */
        event_types_t event_type() const { return m_event_type; }

        /**
         * Number of strings present in the log.
         */
        uint16_t num_strings() const { return m_num_strings; }

        /**
         * \sa https://msdn.microsoft.com/en-us/library/windows/desktop/aa363649(v=vs.85).aspx Source
         */
        uint16_t event_category() const { return m_event_category; }
        std::string reserved() const { return m_reserved; }

        /**
         * Offset of strings present in the log
         */
        uint32_t ofs_strings() const { return m_ofs_strings; }
        uint32_t len_user_sid() const { return m_len_user_sid; }
        uint32_t ofs_user_sid() const { return m_ofs_user_sid; }
        uint32_t len_data() const { return m_len_data; }
        uint32_t ofs_data() const { return m_ofs_data; }
        windows_evt_log_t* _root() const { return m__root; }
        windows_evt_log_t::record_t* _parent() const { return m__parent; }
    };

    /**
     * \sa http://www.forensicswiki.xyz/page/Windows_Event_Log_(EVT)#Cursor_Record Source
     */

    class cursor_record_body_t : public kaitai::kstruct {

    public:

        cursor_record_body_t(kaitai::kstream* p__io, windows_evt_log_t::record_t* p__parent = 0, windows_evt_log_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~cursor_record_body_t();

    private:
        std::string m_magic;
        uint32_t m_ofs_first_record;
        uint32_t m_ofs_next_record;
        uint32_t m_idx_next_record;
        uint32_t m_idx_first_record;
        windows_evt_log_t* m__root;
        windows_evt_log_t::record_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint32_t ofs_first_record() const { return m_ofs_first_record; }
        uint32_t ofs_next_record() const { return m_ofs_next_record; }
        uint32_t idx_next_record() const { return m_idx_next_record; }
        uint32_t idx_first_record() const { return m_idx_first_record; }
        windows_evt_log_t* _root() const { return m__root; }
        windows_evt_log_t::record_t* _parent() const { return m__parent; }
    };

private:
    header_t* m_header;
    std::vector<record_t*>* m_records;
    windows_evt_log_t* m__root;
    kaitai::kstruct* m__parent;

public:
    header_t* header() const { return m_header; }
    std::vector<record_t*>* records() const { return m_records; }
    windows_evt_log_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // WINDOWS_EVT_LOG_H_

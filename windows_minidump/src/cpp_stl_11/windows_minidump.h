#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class windows_minidump_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * Windows MiniDump (MDMP) file provides a concise way to store process
 * core dumps, which is useful for debugging. Given its small size,
 * modularity, some cross-platform features and native support in some
 * debuggers, it is particularly useful for crash reporting, and is
 * used for that purpose in Windows and Google Chrome projects.
 * 
 * The file itself is a container, which contains a number of typed
 * "streams", which contain some data according to its type attribute.
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_header Source
 */

class windows_minidump_t : public kaitai::kstruct {

public:
    class dir_t;
    class exception_record_t;
    class exception_stream_t;
    class location_descriptor_t;
    class memory_descriptor_t;
    class memory_list_t;
    class minidump_string_t;
    class misc_info_t;
    class system_info_t;
    class thread_t;
    class thread_list_t;

    enum stream_types_t {
        STREAM_TYPES_UNUSED = 0,
        STREAM_TYPES_RESERVED_0 = 1,
        STREAM_TYPES_RESERVED_1 = 2,
        STREAM_TYPES_THREAD_LIST = 3,
        STREAM_TYPES_MODULE_LIST = 4,
        STREAM_TYPES_MEMORY_LIST = 5,
        STREAM_TYPES_EXCEPTION = 6,
        STREAM_TYPES_SYSTEM_INFO = 7,
        STREAM_TYPES_THREAD_EX_LIST = 8,
        STREAM_TYPES_MEMORY_64_LIST = 9,
        STREAM_TYPES_COMMENT_A = 10,
        STREAM_TYPES_COMMENT_W = 11,
        STREAM_TYPES_HANDLE_DATA = 12,
        STREAM_TYPES_FUNCTION_TABLE = 13,
        STREAM_TYPES_UNLOADED_MODULE_LIST = 14,
        STREAM_TYPES_MISC_INFO = 15,
        STREAM_TYPES_MEMORY_INFO_LIST = 16,
        STREAM_TYPES_THREAD_INFO_LIST = 17,
        STREAM_TYPES_HANDLE_OPERATION_LIST = 18,
        STREAM_TYPES_TOKEN = 19,
        STREAM_TYPES_JAVA_SCRIPT_DATA = 20,
        STREAM_TYPES_SYSTEM_MEMORY_INFO = 21,
        STREAM_TYPES_PROCESS_VM_COUNTERS = 22,
        STREAM_TYPES_IPT_TRACE = 23,
        STREAM_TYPES_THREAD_NAMES = 24,
        STREAM_TYPES_CE_NULL = 32768,
        STREAM_TYPES_CE_SYSTEM_INFO = 32769,
        STREAM_TYPES_CE_EXCEPTION = 32770,
        STREAM_TYPES_CE_MODULE_LIST = 32771,
        STREAM_TYPES_CE_PROCESS_LIST = 32772,
        STREAM_TYPES_CE_THREAD_LIST = 32773,
        STREAM_TYPES_CE_THREAD_CONTEXT_LIST = 32774,
        STREAM_TYPES_CE_THREAD_CALL_STACK_LIST = 32775,
        STREAM_TYPES_CE_MEMORY_VIRTUAL_LIST = 32776,
        STREAM_TYPES_CE_MEMORY_PHYSICAL_LIST = 32777,
        STREAM_TYPES_CE_BUCKET_PARAMETERS = 32778,
        STREAM_TYPES_CE_PROCESS_MODULE_MAP = 32779,
        STREAM_TYPES_CE_DIAGNOSIS_LIST = 32780,
        STREAM_TYPES_MD_CRASHPAD_INFO_STREAM = 1129316353,
        STREAM_TYPES_MD_RAW_BREAKPAD_INFO = 1197932545,
        STREAM_TYPES_MD_RAW_ASSERTION_INFO = 1197932546,
        STREAM_TYPES_MD_LINUX_CPU_INFO = 1197932547,
        STREAM_TYPES_MD_LINUX_PROC_STATUS = 1197932548,
        STREAM_TYPES_MD_LINUX_LSB_RELEASE = 1197932549,
        STREAM_TYPES_MD_LINUX_CMD_LINE = 1197932550,
        STREAM_TYPES_MD_LINUX_ENVIRON = 1197932551,
        STREAM_TYPES_MD_LINUX_AUXV = 1197932552,
        STREAM_TYPES_MD_LINUX_MAPS = 1197932553,
        STREAM_TYPES_MD_LINUX_DSO_DEBUG = 1197932554
    };
    static bool _is_defined_stream_types_t(stream_types_t v);

private:
    static const std::set<stream_types_t> _values_stream_types_t;

public:

    windows_minidump_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, windows_minidump_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~windows_minidump_t();

    /**
     * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_directory Source
     */

    class dir_t : public kaitai::kstruct {

    public:

        dir_t(kaitai::kstream* p__io, windows_minidump_t* p__parent = nullptr, windows_minidump_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~dir_t();

    private:
        bool f_data;
        std::unique_ptr<kaitai::kstruct> m_data;
        bool n_data;

    public:
        bool _is_null_data() { data(); return n_data; };

    private:

    public:
        kaitai::kstruct* data();

    private:
        stream_types_t m_stream_type;
        uint32_t m_len_data;
        uint32_t m_ofs_data;
        windows_minidump_t* m__root;
        windows_minidump_t* m__parent;
        std::string m__raw_data;
        std::unique_ptr<kaitai::kstream> m__io__raw_data;

    public:
        stream_types_t stream_type() const { return m_stream_type; }

        /**
         * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor Source
         */
        uint32_t len_data() const { return m_len_data; }
        uint32_t ofs_data() const { return m_ofs_data; }
        windows_minidump_t* _root() const { return m__root; }
        windows_minidump_t* _parent() const { return m__parent; }
        std::string _raw_data() const { return m__raw_data; }
        kaitai::kstream* _io__raw_data() const { return m__io__raw_data.get(); }
    };

    /**
     * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception Source
     */

    class exception_record_t : public kaitai::kstruct {

    public:

        exception_record_t(kaitai::kstream* p__io, windows_minidump_t::exception_stream_t* p__parent = nullptr, windows_minidump_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~exception_record_t();

    private:
        uint32_t m_code;
        uint32_t m_flags;
        uint64_t m_inner_exception;
        uint64_t m_addr;
        uint32_t m_num_params;
        uint32_t m_reserved;
        std::unique_ptr<std::vector<uint64_t>> m_params;
        windows_minidump_t* m__root;
        windows_minidump_t::exception_stream_t* m__parent;

    public:
        uint32_t code() const { return m_code; }
        uint32_t flags() const { return m_flags; }
        uint64_t inner_exception() const { return m_inner_exception; }

        /**
         * Memory address where exception has occurred
         */
        uint64_t addr() const { return m_addr; }
        uint32_t num_params() const { return m_num_params; }
        uint32_t reserved() const { return m_reserved; }

        /**
         * Additional parameters passed along with exception raise
         * function (for WinAPI, that is `RaiseException`). Meaning is
         * exception-specific. Given that this type is originally
         * defined by a C structure, it is described there as array of
         * fixed number of elements (`EXCEPTION_MAXIMUM_PARAMETERS` =
         * 15), but in reality only first `num_params` would be used.
         */
        std::vector<uint64_t>* params() const { return m_params.get(); }
        windows_minidump_t* _root() const { return m__root; }
        windows_minidump_t::exception_stream_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception_stream Source
     */

    class exception_stream_t : public kaitai::kstruct {

    public:

        exception_stream_t(kaitai::kstream* p__io, windows_minidump_t::dir_t* p__parent = nullptr, windows_minidump_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~exception_stream_t();

    private:
        uint32_t m_thread_id;
        uint32_t m_reserved;
        std::unique_ptr<exception_record_t> m_exception_rec;
        std::unique_ptr<location_descriptor_t> m_thread_context;
        windows_minidump_t* m__root;
        windows_minidump_t::dir_t* m__parent;

    public:
        uint32_t thread_id() const { return m_thread_id; }
        uint32_t reserved() const { return m_reserved; }
        exception_record_t* exception_rec() const { return m_exception_rec.get(); }
        location_descriptor_t* thread_context() const { return m_thread_context.get(); }
        windows_minidump_t* _root() const { return m__root; }
        windows_minidump_t::dir_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor Source
     */

    class location_descriptor_t : public kaitai::kstruct {

    public:

        location_descriptor_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, windows_minidump_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~location_descriptor_t();

    private:
        bool f_data;
        std::string m_data;

    public:
        std::string data();

    private:
        uint32_t m_len_data;
        uint32_t m_ofs_data;
        windows_minidump_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint32_t len_data() const { return m_len_data; }
        uint32_t ofs_data() const { return m_ofs_data; }
        windows_minidump_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_descriptor Source
     */

    class memory_descriptor_t : public kaitai::kstruct {

    public:

        memory_descriptor_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, windows_minidump_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~memory_descriptor_t();

    private:
        uint64_t m_addr_memory_range;
        std::unique_ptr<location_descriptor_t> m_memory;
        windows_minidump_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint64_t addr_memory_range() const { return m_addr_memory_range; }
        location_descriptor_t* memory() const { return m_memory.get(); }
        windows_minidump_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory64_list Source
     */

    class memory_list_t : public kaitai::kstruct {

    public:

        memory_list_t(kaitai::kstream* p__io, windows_minidump_t::dir_t* p__parent = nullptr, windows_minidump_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~memory_list_t();

    private:
        uint32_t m_num_mem_ranges;
        std::unique_ptr<std::vector<std::unique_ptr<memory_descriptor_t>>> m_mem_ranges;
        windows_minidump_t* m__root;
        windows_minidump_t::dir_t* m__parent;

    public:
        uint32_t num_mem_ranges() const { return m_num_mem_ranges; }
        std::vector<std::unique_ptr<memory_descriptor_t>>* mem_ranges() const { return m_mem_ranges.get(); }
        windows_minidump_t* _root() const { return m__root; }
        windows_minidump_t::dir_t* _parent() const { return m__parent; }
    };

    /**
     * Specific string serialization scheme used in MiniDump format is
     * actually a simple 32-bit length-prefixed UTF-16 string.
     * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_string Source
     */

    class minidump_string_t : public kaitai::kstruct {

    public:

        minidump_string_t(kaitai::kstream* p__io, windows_minidump_t::system_info_t* p__parent = nullptr, windows_minidump_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~minidump_string_t();

    private:
        uint32_t m_len_str;
        std::string m_str;
        windows_minidump_t* m__root;
        windows_minidump_t::system_info_t* m__parent;

    public:
        uint32_t len_str() const { return m_len_str; }
        std::string str() const { return m_str; }
        windows_minidump_t* _root() const { return m__root; }
        windows_minidump_t::system_info_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_misc_info Source
     */

    class misc_info_t : public kaitai::kstruct {

    public:

        misc_info_t(kaitai::kstream* p__io, windows_minidump_t::dir_t* p__parent = nullptr, windows_minidump_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~misc_info_t();

    private:
        uint32_t m_len_info;
        uint32_t m_flags1;
        uint32_t m_process_id;
        uint32_t m_process_create_time;
        uint32_t m_process_user_time;
        uint32_t m_process_kernel_time;
        uint32_t m_cpu_max_mhz;
        uint32_t m_cpu_cur_mhz;
        uint32_t m_cpu_limit_mhz;
        uint32_t m_cpu_max_idle_state;
        uint32_t m_cpu_cur_idle_state;
        windows_minidump_t* m__root;
        windows_minidump_t::dir_t* m__parent;

    public:
        uint32_t len_info() const { return m_len_info; }
        uint32_t flags1() const { return m_flags1; }
        uint32_t process_id() const { return m_process_id; }
        uint32_t process_create_time() const { return m_process_create_time; }
        uint32_t process_user_time() const { return m_process_user_time; }
        uint32_t process_kernel_time() const { return m_process_kernel_time; }
        uint32_t cpu_max_mhz() const { return m_cpu_max_mhz; }
        uint32_t cpu_cur_mhz() const { return m_cpu_cur_mhz; }
        uint32_t cpu_limit_mhz() const { return m_cpu_limit_mhz; }
        uint32_t cpu_max_idle_state() const { return m_cpu_max_idle_state; }
        uint32_t cpu_cur_idle_state() const { return m_cpu_cur_idle_state; }
        windows_minidump_t* _root() const { return m__root; }
        windows_minidump_t::dir_t* _parent() const { return m__parent; }
    };

    /**
     * "System info" stream provides basic information about the
     * hardware and operating system which produces this dump.
     * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_system_info Source
     */

    class system_info_t : public kaitai::kstruct {

    public:

        enum cpu_archs_t {
            CPU_ARCHS_INTEL = 0,
            CPU_ARCHS_ARM = 5,
            CPU_ARCHS_IA64 = 6,
            CPU_ARCHS_AMD64 = 9,
            CPU_ARCHS_UNKNOWN = 65535
        };
        static bool _is_defined_cpu_archs_t(cpu_archs_t v);

    private:
        static const std::set<cpu_archs_t> _values_cpu_archs_t;

    public:

        system_info_t(kaitai::kstream* p__io, windows_minidump_t::dir_t* p__parent = nullptr, windows_minidump_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~system_info_t();

    private:
        bool f_service_pack;
        std::unique_ptr<minidump_string_t> m_service_pack;
        bool n_service_pack;

    public:
        bool _is_null_service_pack() { service_pack(); return n_service_pack; };

    private:

    public:
        minidump_string_t* service_pack();

    private:
        cpu_archs_t m_cpu_arch;
        uint16_t m_cpu_level;
        uint16_t m_cpu_revision;
        uint8_t m_num_cpus;
        uint8_t m_os_type;
        uint32_t m_os_ver_major;
        uint32_t m_os_ver_minor;
        uint32_t m_os_build;
        uint32_t m_os_platform;
        uint32_t m_ofs_service_pack;
        uint16_t m_os_suite_mask;
        uint16_t m_reserved2;
        windows_minidump_t* m__root;
        windows_minidump_t::dir_t* m__parent;

    public:
        cpu_archs_t cpu_arch() const { return m_cpu_arch; }
        uint16_t cpu_level() const { return m_cpu_level; }
        uint16_t cpu_revision() const { return m_cpu_revision; }
        uint8_t num_cpus() const { return m_num_cpus; }
        uint8_t os_type() const { return m_os_type; }
        uint32_t os_ver_major() const { return m_os_ver_major; }
        uint32_t os_ver_minor() const { return m_os_ver_minor; }
        uint32_t os_build() const { return m_os_build; }
        uint32_t os_platform() const { return m_os_platform; }
        uint32_t ofs_service_pack() const { return m_ofs_service_pack; }
        uint16_t os_suite_mask() const { return m_os_suite_mask; }
        uint16_t reserved2() const { return m_reserved2; }
        windows_minidump_t* _root() const { return m__root; }
        windows_minidump_t::dir_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread Source
     */

    class thread_t : public kaitai::kstruct {

    public:

        thread_t(kaitai::kstream* p__io, windows_minidump_t::thread_list_t* p__parent = nullptr, windows_minidump_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~thread_t();

    private:
        uint32_t m_thread_id;
        uint32_t m_suspend_count;
        uint32_t m_priority_class;
        uint32_t m_priority;
        uint64_t m_teb;
        std::unique_ptr<memory_descriptor_t> m_stack;
        std::unique_ptr<location_descriptor_t> m_thread_context;
        windows_minidump_t* m__root;
        windows_minidump_t::thread_list_t* m__parent;

    public:
        uint32_t thread_id() const { return m_thread_id; }
        uint32_t suspend_count() const { return m_suspend_count; }
        uint32_t priority_class() const { return m_priority_class; }
        uint32_t priority() const { return m_priority; }

        /**
         * Thread Environment Block
         */
        uint64_t teb() const { return m_teb; }
        memory_descriptor_t* stack() const { return m_stack.get(); }
        location_descriptor_t* thread_context() const { return m_thread_context.get(); }
        windows_minidump_t* _root() const { return m__root; }
        windows_minidump_t::thread_list_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_list Source
     */

    class thread_list_t : public kaitai::kstruct {

    public:

        thread_list_t(kaitai::kstream* p__io, windows_minidump_t::dir_t* p__parent = nullptr, windows_minidump_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~thread_list_t();

    private:
        uint32_t m_num_threads;
        std::unique_ptr<std::vector<std::unique_ptr<thread_t>>> m_threads;
        windows_minidump_t* m__root;
        windows_minidump_t::dir_t* m__parent;

    public:
        uint32_t num_threads() const { return m_num_threads; }
        std::vector<std::unique_ptr<thread_t>>* threads() const { return m_threads.get(); }
        windows_minidump_t* _root() const { return m__root; }
        windows_minidump_t::dir_t* _parent() const { return m__parent; }
    };

private:
    bool f_streams;
    std::unique_ptr<std::vector<std::unique_ptr<dir_t>>> m_streams;

public:
    std::vector<std::unique_ptr<dir_t>>* streams();

private:
    std::string m_magic1;
    std::string m_magic2;
    uint16_t m_version;
    uint32_t m_num_streams;
    uint32_t m_ofs_streams;
    uint32_t m_checksum;
    uint32_t m_timestamp;
    uint64_t m_flags;
    windows_minidump_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic1() const { return m_magic1; }
    std::string magic2() const { return m_magic2; }
    uint16_t version() const { return m_version; }
    uint32_t num_streams() const { return m_num_streams; }
    uint32_t ofs_streams() const { return m_ofs_streams; }
    uint32_t checksum() const { return m_checksum; }
    uint32_t timestamp() const { return m_timestamp; }
    uint64_t flags() const { return m_flags; }
    windows_minidump_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

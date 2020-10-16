#ifndef WINDOWS_SYSTEMTIME_H_
#define WINDOWS_SYSTEMTIME_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * Microsoft Windows SYSTEMTIME structure, stores individual components
 * of date and time as individual fields, up to millisecond precision.
 * \sa https://msdn.microsoft.com/en-us/library/windows/desktop/ms724950.aspx Source
 */

class windows_systemtime_t : public kaitai::kstruct {

public:

    windows_systemtime_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, windows_systemtime_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~windows_systemtime_t();

private:
    uint16_t m_year;
    uint16_t m_month;
    uint16_t m_dow;
    uint16_t m_day;
    uint16_t m_hour;
    uint16_t m_min;
    uint16_t m_sec;
    uint16_t m_msec;
    windows_systemtime_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * Year
     */
    uint16_t year() const { return m_year; }

    /**
     * Month (January = 1)
     */
    uint16_t month() const { return m_month; }

    /**
     * Day of week (Sun = 0)
     */
    uint16_t dow() const { return m_dow; }

    /**
     * Day of month
     */
    uint16_t day() const { return m_day; }

    /**
     * Hours
     */
    uint16_t hour() const { return m_hour; }

    /**
     * Minutes
     */
    uint16_t min() const { return m_min; }

    /**
     * Seconds
     */
    uint16_t sec() const { return m_sec; }

    /**
     * Milliseconds
     */
    uint16_t msec() const { return m_msec; }
    windows_systemtime_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // WINDOWS_SYSTEMTIME_H_

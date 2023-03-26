// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System;

namespace Kaitai
{

    /// <summary>
    /// MS-DOS date and time are packed 16-bit values that specify local date/time.
    /// The time is always stored in the current UTC time offset set on the computer
    /// which created the file. Note that the daylight saving time (DST) shifts
    /// also change the UTC time offset.
    /// 
    /// For example, if you pack two files A and B into a ZIP archive, file A last modified
    /// at 2020-03-29 00:59 UTC+00:00 (GMT) and file B at 2020-03-29 02:00 UTC+01:00 (BST),
    /// the file modification times saved in MS-DOS format in the ZIP file will vary depending
    /// on whether the computer packing the files is set to GMT or BST at the time of ZIP creation.
    /// 
    ///   - If set to GMT:
    ///       - file A: 2020-03-29 00:59 (UTC+00:00)
    ///       - file B: 2020-03-29 01:00 (UTC+00:00)
    ///   - If set to BST:
    ///       - file A: 2020-03-29 01:59 (UTC+01:00)
    ///       - file B: 2020-03-29 02:00 (UTC+01:00)
    /// 
    /// It follows that you are unable to determine the actual last modified time
    /// of any file stored in the ZIP archive, if you don't know the locale time
    /// setting of the computer at the time it created the ZIP.
    /// 
    /// This format is used in some data formats from the MS-DOS era, for example:
    /// 
    ///   - [zip](/zip/)
    ///   - [rar](/rar/)
    ///   - [vfat](/vfat/) (FAT12)
    ///   - [lzh](/lzh/)
    ///   - [cab](http://justsolve.archiveteam.org/wiki/Cabinet)
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://learn.microsoft.com/en-us/windows/win32/sysinfo/ms-dos-date-and-time">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-dosdatetimetofiletime">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/reactos/reactos/blob/c6b64448ce4/dll/win32/kernel32/client/time.c#L82-L87">DosDateTimeToFileTime</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://download.microsoft.com/download/0/8/4/084c452b-b772-4fe5-89bb-a0cbf082286a/fatgen103.doc">page 25/34</a>
    /// </remarks>
    public partial class DosDatetime : KaitaiStruct
    {
        public static DosDatetime FromFile(string fileName)
        {
            return new DosDatetime(new KaitaiStream(fileName));
        }

        public DosDatetime(KaitaiStream p__io, KaitaiStruct p__parent = null, DosDatetime p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _time = new Time(m_io, this, m_root);
            _date = new Date(m_io, this, m_root);
        }
        public partial class Time : KaitaiStruct
        {
            public static Time FromFile(string fileName)
            {
                return new Time(new KaitaiStream(fileName));
            }

            public Time(KaitaiStream p__io, DosDatetime p__parent = null, DosDatetime p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_second = false;
                f_paddedSecond = false;
                f_paddedMinute = false;
                f_paddedHour = false;
                _read();
            }
            private void _read()
            {
                _secondDiv2 = m_io.ReadBitsIntLe(5);
                if (!(SecondDiv2 <= 29))
                {
                    throw new ValidationGreaterThanError(29, SecondDiv2, M_Io, "/types/time/seq/0");
                }
                _minute = m_io.ReadBitsIntLe(6);
                if (!(Minute <= 59))
                {
                    throw new ValidationGreaterThanError(59, Minute, M_Io, "/types/time/seq/1");
                }
                _hour = m_io.ReadBitsIntLe(5);
                if (!(Hour <= 23))
                {
                    throw new ValidationGreaterThanError(23, Hour, M_Io, "/types/time/seq/2");
                }
            }
            private bool f_second;
            private int _second;
            public int Second
            {
                get
                {
                    if (f_second)
                        return _second;
                    _second = (int) ((2 * SecondDiv2));
                    f_second = true;
                    return _second;
                }
            }
            private bool f_paddedSecond;
            private string _paddedSecond;
            public string PaddedSecond
            {
                get
                {
                    if (f_paddedSecond)
                        return _paddedSecond;
                    _paddedSecond = (string) ((Second <= 9 ? "0" : "") + Convert.ToString((long) (Second), 10));
                    f_paddedSecond = true;
                    return _paddedSecond;
                }
            }
            private bool f_paddedMinute;
            private string _paddedMinute;
            public string PaddedMinute
            {
                get
                {
                    if (f_paddedMinute)
                        return _paddedMinute;
                    _paddedMinute = (string) ((Minute <= 9 ? "0" : "") + Convert.ToString((long) (Minute), 10));
                    f_paddedMinute = true;
                    return _paddedMinute;
                }
            }
            private bool f_paddedHour;
            private string _paddedHour;
            public string PaddedHour
            {
                get
                {
                    if (f_paddedHour)
                        return _paddedHour;
                    _paddedHour = (string) ((Hour <= 9 ? "0" : "") + Convert.ToString((long) (Hour), 10));
                    f_paddedHour = true;
                    return _paddedHour;
                }
            }
            private ulong _secondDiv2;
            private ulong _minute;
            private ulong _hour;
            private DosDatetime m_root;
            private DosDatetime m_parent;
            public ulong SecondDiv2 { get { return _secondDiv2; } }
            public ulong Minute { get { return _minute; } }
            public ulong Hour { get { return _hour; } }
            public DosDatetime M_Root { get { return m_root; } }
            public DosDatetime M_Parent { get { return m_parent; } }
        }
        public partial class Date : KaitaiStruct
        {
            public static Date FromFile(string fileName)
            {
                return new Date(new KaitaiStream(fileName));
            }

            public Date(KaitaiStream p__io, DosDatetime p__parent = null, DosDatetime p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_year = false;
                f_paddedDay = false;
                f_paddedMonth = false;
                f_paddedYear = false;
                _read();
            }
            private void _read()
            {
                _day = m_io.ReadBitsIntLe(5);
                if (!(Day >= 1))
                {
                    throw new ValidationLessThanError(1, Day, M_Io, "/types/date/seq/0");
                }
                _month = m_io.ReadBitsIntLe(4);
                if (!(Month >= 1))
                {
                    throw new ValidationLessThanError(1, Month, M_Io, "/types/date/seq/1");
                }
                if (!(Month <= 12))
                {
                    throw new ValidationGreaterThanError(12, Month, M_Io, "/types/date/seq/1");
                }
                _yearMinus1980 = m_io.ReadBitsIntLe(7);
            }
            private bool f_year;
            private int _year;

            /// <summary>
            /// only years from 1980 to 2107 (1980 + 127) can be represented
            /// </summary>
            public int Year
            {
                get
                {
                    if (f_year)
                        return _year;
                    _year = (int) ((1980 + YearMinus1980));
                    f_year = true;
                    return _year;
                }
            }
            private bool f_paddedDay;
            private string _paddedDay;
            public string PaddedDay
            {
                get
                {
                    if (f_paddedDay)
                        return _paddedDay;
                    _paddedDay = (string) ((Day <= 9 ? "0" : "") + Convert.ToString((long) (Day), 10));
                    f_paddedDay = true;
                    return _paddedDay;
                }
            }
            private bool f_paddedMonth;
            private string _paddedMonth;
            public string PaddedMonth
            {
                get
                {
                    if (f_paddedMonth)
                        return _paddedMonth;
                    _paddedMonth = (string) ((Month <= 9 ? "0" : "") + Convert.ToString((long) (Month), 10));
                    f_paddedMonth = true;
                    return _paddedMonth;
                }
            }
            private bool f_paddedYear;
            private string _paddedYear;
            public string PaddedYear
            {
                get
                {
                    if (f_paddedYear)
                        return _paddedYear;
                    _paddedYear = (string) ((Year <= 999 ? "0" + (Year <= 99 ? "0" + (Year <= 9 ? "0" : "") : "") : "") + Convert.ToString((long) (Year), 10));
                    f_paddedYear = true;
                    return _paddedYear;
                }
            }
            private ulong _day;
            private ulong _month;
            private ulong _yearMinus1980;
            private DosDatetime m_root;
            private DosDatetime m_parent;
            public ulong Day { get { return _day; } }
            public ulong Month { get { return _month; } }
            public ulong YearMinus1980 { get { return _yearMinus1980; } }
            public DosDatetime M_Root { get { return m_root; } }
            public DosDatetime M_Parent { get { return m_parent; } }
        }
        private Time _time;
        private Date _date;
        private DosDatetime m_root;
        private KaitaiStruct m_parent;
        public Time Time { get { return _time; } }
        public Date Date { get { return _date; } }
        public DosDatetime M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

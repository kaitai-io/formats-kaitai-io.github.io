// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// Microsoft Windows SYSTEMTIME structure, stores individual components
    /// of date and time as individual fields, up to millisecond precision.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://learn.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-systemtime">Source</a>
    /// </remarks>
    public partial class WindowsSystemtime : KaitaiStruct
    {
        public static WindowsSystemtime FromFile(string fileName)
        {
            return new WindowsSystemtime(new KaitaiStream(fileName));
        }

        public WindowsSystemtime(KaitaiStream p__io, KaitaiStruct p__parent = null, WindowsSystemtime p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _year = m_io.ReadU2le();
            _month = m_io.ReadU2le();
            _dow = m_io.ReadU2le();
            _day = m_io.ReadU2le();
            _hour = m_io.ReadU2le();
            _min = m_io.ReadU2le();
            _sec = m_io.ReadU2le();
            _msec = m_io.ReadU2le();
        }
        private ushort _year;
        private ushort _month;
        private ushort _dow;
        private ushort _day;
        private ushort _hour;
        private ushort _min;
        private ushort _sec;
        private ushort _msec;
        private WindowsSystemtime m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// Year
        /// </summary>
        public ushort Year { get { return _year; } }

        /// <summary>
        /// Month (January = 1)
        /// </summary>
        public ushort Month { get { return _month; } }

        /// <summary>
        /// Day of week (Sun = 0)
        /// </summary>
        public ushort Dow { get { return _dow; } }

        /// <summary>
        /// Day of month
        /// </summary>
        public ushort Day { get { return _day; } }

        /// <summary>
        /// Hours
        /// </summary>
        public ushort Hour { get { return _hour; } }

        /// <summary>
        /// Minutes
        /// </summary>
        public ushort Min { get { return _min; } }

        /// <summary>
        /// Seconds
        /// </summary>
        public ushort Sec { get { return _sec; } }

        /// <summary>
        /// Milliseconds
        /// </summary>
        public ushort Msec { get { return _msec; } }
        public WindowsSystemtime M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

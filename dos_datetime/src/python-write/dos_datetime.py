# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class DosDatetime(ReadWriteKaitaiStruct):
    """MS-DOS date and time are packed 16-bit values that specify local date/time.
    The time is always stored in the current UTC time offset set on the computer
    which created the file. Note that the daylight saving time (DST) shifts
    also change the UTC time offset.
    
    For example, if you pack two files A and B into a ZIP archive, file A last modified
    at 2020-03-29 00:59 UTC+00:00 (GMT) and file B at 2020-03-29 02:00 UTC+01:00 (BST),
    the file modification times saved in MS-DOS format in the ZIP file will vary depending
    on whether the computer packing the files is set to GMT or BST at the time of ZIP creation.
    
      - If set to GMT:
          - file A: 2020-03-29 00:59 (UTC+00:00)
          - file B: 2020-03-29 01:00 (UTC+00:00)
      - If set to BST:
          - file A: 2020-03-29 01:59 (UTC+01:00)
          - file B: 2020-03-29 02:00 (UTC+01:00)
    
    It follows that you are unable to determine the actual last modified time
    of any file stored in the ZIP archive, if you don't know the locale time
    setting of the computer at the time it created the ZIP.
    
    This format is used in some data formats from the MS-DOS era, for example:
    
      - [zip](/zip/)
      - [rar](/rar/)
      - [vfat](/vfat/) (FAT12)
      - [lzh](/lzh/)
      - [cab](http://justsolve.archiveteam.org/wiki/Cabinet)
    
    .. seealso::
       Source - https://learn.microsoft.com/en-us/windows/win32/sysinfo/ms-dos-date-and-time
    
    
    .. seealso::
       Source - https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-dosdatetimetofiletime
    
    
    .. seealso::
       DosDateTimeToFileTime - https://github.com/reactos/reactos/blob/c6b64448ce4/dll/win32/kernel32/client/time.c#L82-L87
    
    
    .. seealso::
       page 25/34 - https://download.microsoft.com/download/0/8/4/084c452b-b772-4fe5-89bb-a0cbf082286a/fatgen103.doc
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(DosDatetime, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.time = DosDatetime.Time(self._io, self, self._root)
        self.time._read()
        self.date = DosDatetime.Date(self._io, self, self._root)
        self.date._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.time._fetch_instances()
        self.date._fetch_instances()


    def _write__seq(self, io=None):
        super(DosDatetime, self)._write__seq(io)
        self.time._write__seq(self._io)
        self.date._write__seq(self._io)


    def _check(self):
        if self.time._root != self._root:
            raise kaitaistruct.ConsistencyError(u"time", self._root, self.time._root)
        if self.time._parent != self:
            raise kaitaistruct.ConsistencyError(u"time", self, self.time._parent)
        if self.date._root != self._root:
            raise kaitaistruct.ConsistencyError(u"date", self._root, self.date._root)
        if self.date._parent != self:
            raise kaitaistruct.ConsistencyError(u"date", self, self.date._parent)
        self._dirty = False

    class Date(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DosDatetime.Date, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.day = self._io.read_bits_int_le(5)
            if not self.day >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.day, self._io, u"/types/date/seq/0")
            self.month = self._io.read_bits_int_le(4)
            if not self.month >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.month, self._io, u"/types/date/seq/1")
            if not self.month <= 12:
                raise kaitaistruct.ValidationGreaterThanError(12, self.month, self._io, u"/types/date/seq/1")
            self.year_minus_1980 = self._io.read_bits_int_le(7)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(DosDatetime.Date, self)._write__seq(io)
            self._io.write_bits_int_le(5, self.day)
            self._io.write_bits_int_le(4, self.month)
            self._io.write_bits_int_le(7, self.year_minus_1980)


        def _check(self):
            if not self.day >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.day, None, u"/types/date/seq/0")
            if not self.month >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.month, None, u"/types/date/seq/1")
            if not self.month <= 12:
                raise kaitaistruct.ValidationGreaterThanError(12, self.month, None, u"/types/date/seq/1")
            self._dirty = False

        @property
        def padded_day(self):
            if hasattr(self, '_m_padded_day'):
                return self._m_padded_day

            self._m_padded_day = (u"0" if self.day <= 9 else u"") + str(self.day)
            return getattr(self, '_m_padded_day', None)

        def _invalidate_padded_day(self):
            del self._m_padded_day
        @property
        def padded_month(self):
            if hasattr(self, '_m_padded_month'):
                return self._m_padded_month

            self._m_padded_month = (u"0" if self.month <= 9 else u"") + str(self.month)
            return getattr(self, '_m_padded_month', None)

        def _invalidate_padded_month(self):
            del self._m_padded_month
        @property
        def padded_year(self):
            if hasattr(self, '_m_padded_year'):
                return self._m_padded_year

            self._m_padded_year = (u"0" + (u"0" + (u"0" if self.year <= 9 else u"") if self.year <= 99 else u"") if self.year <= 999 else u"") + str(self.year)
            return getattr(self, '_m_padded_year', None)

        def _invalidate_padded_year(self):
            del self._m_padded_year
        @property
        def year(self):
            """only years from 1980 to 2107 (1980 + 127) can be represented."""
            if hasattr(self, '_m_year'):
                return self._m_year

            self._m_year = 1980 + self.year_minus_1980
            return getattr(self, '_m_year', None)

        def _invalidate_year(self):
            del self._m_year

    class Time(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DosDatetime.Time, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.second_div_2 = self._io.read_bits_int_le(5)
            if not self.second_div_2 <= 29:
                raise kaitaistruct.ValidationGreaterThanError(29, self.second_div_2, self._io, u"/types/time/seq/0")
            self.minute = self._io.read_bits_int_le(6)
            if not self.minute <= 59:
                raise kaitaistruct.ValidationGreaterThanError(59, self.minute, self._io, u"/types/time/seq/1")
            self.hour = self._io.read_bits_int_le(5)
            if not self.hour <= 23:
                raise kaitaistruct.ValidationGreaterThanError(23, self.hour, self._io, u"/types/time/seq/2")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(DosDatetime.Time, self)._write__seq(io)
            self._io.write_bits_int_le(5, self.second_div_2)
            self._io.write_bits_int_le(6, self.minute)
            self._io.write_bits_int_le(5, self.hour)


        def _check(self):
            if not self.second_div_2 <= 29:
                raise kaitaistruct.ValidationGreaterThanError(29, self.second_div_2, None, u"/types/time/seq/0")
            if not self.minute <= 59:
                raise kaitaistruct.ValidationGreaterThanError(59, self.minute, None, u"/types/time/seq/1")
            if not self.hour <= 23:
                raise kaitaistruct.ValidationGreaterThanError(23, self.hour, None, u"/types/time/seq/2")
            self._dirty = False

        @property
        def padded_hour(self):
            if hasattr(self, '_m_padded_hour'):
                return self._m_padded_hour

            self._m_padded_hour = (u"0" if self.hour <= 9 else u"") + str(self.hour)
            return getattr(self, '_m_padded_hour', None)

        def _invalidate_padded_hour(self):
            del self._m_padded_hour
        @property
        def padded_minute(self):
            if hasattr(self, '_m_padded_minute'):
                return self._m_padded_minute

            self._m_padded_minute = (u"0" if self.minute <= 9 else u"") + str(self.minute)
            return getattr(self, '_m_padded_minute', None)

        def _invalidate_padded_minute(self):
            del self._m_padded_minute
        @property
        def padded_second(self):
            if hasattr(self, '_m_padded_second'):
                return self._m_padded_second

            self._m_padded_second = (u"0" if self.second <= 9 else u"") + str(self.second)
            return getattr(self, '_m_padded_second', None)

        def _invalidate_padded_second(self):
            del self._m_padded_second
        @property
        def second(self):
            if hasattr(self, '_m_second'):
                return self._m_second

            self._m_second = 2 * self.second_div_2
            return getattr(self, '_m_second', None)

        def _invalidate_second(self):
            del self._m_second



// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// GIMP brush format is native to the GIMP image editor for storing a brush or a texture.
    /// It can be used in all [Paint Tools](https://docs.gimp.org/2.10/en/gimp-tools-paint.html),
    /// for example Pencil and Paintbrush. It works by repeating the brush bitmap as you move
    /// the tool. The Spacing parameter sets the distance between the brush marks as a percentage
    /// of brush width. Its default value can be set in the brush file.
    /// 
    /// You can also use GIMP to create new brushes in this format. Custom brushes can be loaded
    /// into GIMP for use in the paint tools by copying them into one of the Brush Folders -
    /// select **Edit** &gt; **Preferences** in the menu bar, expand the **Folders** section
    /// and choose **Brushes** to see the recognized Brush Folders or to add new ones.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/GNOME/gimp/blob/441631322b/devel-docs/gbr.txt">Source</a>
    /// </remarks>
    public partial class GimpBrush : KaitaiStruct
    {
        public static GimpBrush FromFile(string fileName)
        {
            return new GimpBrush(new KaitaiStream(fileName));
        }


        public enum ColorDepth
        {
            Grayscale = 1,
            Rgba = 4,
        }
        public GimpBrush(KaitaiStream p__io, KaitaiStruct p__parent = null, GimpBrush p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_body = false;
            f_lenBody = false;
            _read();
        }
        private void _read()
        {
            _lenHeader = m_io.ReadU4be();
            __raw_header = m_io.ReadBytes(LenHeader - 4);
            var io___raw_header = new KaitaiStream(__raw_header);
            _header = new Header(io___raw_header, this, m_root);
        }
        public partial class Bitmap : KaitaiStruct
        {
            public static Bitmap FromFile(string fileName)
            {
                return new Bitmap(new KaitaiStream(fileName));
            }

            public Bitmap(KaitaiStream p__io, KaitaiStruct p__parent = null, GimpBrush p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _rows = new List<Row>();
                for (var i = 0; i < M_Root.Header.Height; i++)
                {
                    _rows.Add(new Row(m_io, this, m_root));
                }
            }
            private List<Row> _rows;
            private GimpBrush m_root;
            private KaitaiStruct m_parent;
            public List<Row> Rows { get { return _rows; } }
            public GimpBrush M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, GimpBrush p__parent = null, GimpBrush p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _version = m_io.ReadU4be();
                if (!(_version == 2))
                {
                    throw new ValidationNotEqualError(2, _version, m_io, "/types/header/seq/0");
                }
                _width = m_io.ReadU4be();
                if (!(_width >= 1))
                {
                    throw new ValidationLessThanError(1, _width, m_io, "/types/header/seq/1");
                }
                if (!(_width <= 10000))
                {
                    throw new ValidationGreaterThanError(10000, _width, m_io, "/types/header/seq/1");
                }
                _height = m_io.ReadU4be();
                if (!(_height >= 1))
                {
                    throw new ValidationLessThanError(1, _height, m_io, "/types/header/seq/2");
                }
                if (!(_height <= 10000))
                {
                    throw new ValidationGreaterThanError(10000, _height, m_io, "/types/header/seq/2");
                }
                _bytesPerPixel = ((GimpBrush.ColorDepth) m_io.ReadU4be());
                _magic = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 71, 73, 77, 80 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 71, 73, 77, 80 }, _magic, m_io, "/types/header/seq/4");
                }
                _spacing = m_io.ReadU4be();
                _brushName = System.Text.Encoding.GetEncoding("UTF-8").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytesFull(), 0, false));
            }
            private uint _version;
            private uint _width;
            private uint _height;
            private ColorDepth _bytesPerPixel;
            private byte[] _magic;
            private uint _spacing;
            private string _brushName;
            private GimpBrush m_root;
            private GimpBrush m_parent;
            public uint Version { get { return _version; } }

            /// <remarks>
            /// Reference: <a href="https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-load.c#L170">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-header.h#L24">Source</a>
            /// </remarks>
            public uint Width { get { return _width; } }

            /// <remarks>
            /// Reference: <a href="https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-load.c#L177">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-header.h#L24">Source</a>
            /// </remarks>
            public uint Height { get { return _height; } }
            public ColorDepth BytesPerPixel { get { return _bytesPerPixel; } }
            public byte[] Magic { get { return _magic; } }

            /// <summary>
            /// Default spacing to be used for brush. Percentage of brush width.
            /// </summary>
            public uint Spacing { get { return _spacing; } }
            public string BrushName { get { return _brushName; } }
            public GimpBrush M_Root { get { return m_root; } }
            public GimpBrush M_Parent { get { return m_parent; } }
        }
        public partial class Row : KaitaiStruct
        {
            public static Row FromFile(string fileName)
            {
                return new Row(new KaitaiStream(fileName));
            }

            public Row(KaitaiStream p__io, GimpBrush.Bitmap p__parent = null, GimpBrush p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _pixels = new List<KaitaiStruct>();
                for (var i = 0; i < M_Root.Header.Width; i++)
                {
                    switch (M_Root.Header.BytesPerPixel) {
                    case GimpBrush.ColorDepth.Grayscale: {
                        _pixels.Add(new PixelGray(m_io, this, m_root));
                        break;
                    }
                    case GimpBrush.ColorDepth.Rgba: {
                        _pixels.Add(new PixelRgba(m_io, this, m_root));
                        break;
                    }
                    }
                }
            }
            public partial class PixelGray : KaitaiStruct
            {
                public static PixelGray FromFile(string fileName)
                {
                    return new PixelGray(new KaitaiStream(fileName));
                }

                public PixelGray(KaitaiStream p__io, GimpBrush.Row p__parent = null, GimpBrush p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_alpha = false;
                    f_blue = false;
                    f_green = false;
                    f_red = false;
                    _read();
                }
                private void _read()
                {
                    _gray = m_io.ReadU1();
                }
                private bool f_alpha;
                private byte _alpha;
                public byte Alpha
                {
                    get
                    {
                        if (f_alpha)
                            return _alpha;
                        f_alpha = true;
                        _alpha = (byte) (Gray);
                        return _alpha;
                    }
                }
                private bool f_blue;
                private sbyte _blue;
                public sbyte Blue
                {
                    get
                    {
                        if (f_blue)
                            return _blue;
                        f_blue = true;
                        _blue = (sbyte) (0);
                        return _blue;
                    }
                }
                private bool f_green;
                private sbyte _green;
                public sbyte Green
                {
                    get
                    {
                        if (f_green)
                            return _green;
                        f_green = true;
                        _green = (sbyte) (0);
                        return _green;
                    }
                }
                private bool f_red;
                private sbyte _red;
                public sbyte Red
                {
                    get
                    {
                        if (f_red)
                            return _red;
                        f_red = true;
                        _red = (sbyte) (0);
                        return _red;
                    }
                }
                private byte _gray;
                private GimpBrush m_root;
                private GimpBrush.Row m_parent;
                public byte Gray { get { return _gray; } }
                public GimpBrush M_Root { get { return m_root; } }
                public GimpBrush.Row M_Parent { get { return m_parent; } }
            }
            public partial class PixelRgba : KaitaiStruct
            {
                public static PixelRgba FromFile(string fileName)
                {
                    return new PixelRgba(new KaitaiStream(fileName));
                }

                public PixelRgba(KaitaiStream p__io, GimpBrush.Row p__parent = null, GimpBrush p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _red = m_io.ReadU1();
                    _green = m_io.ReadU1();
                    _blue = m_io.ReadU1();
                    _alpha = m_io.ReadU1();
                }
                private byte _red;
                private byte _green;
                private byte _blue;
                private byte _alpha;
                private GimpBrush m_root;
                private GimpBrush.Row m_parent;
                public byte Red { get { return _red; } }
                public byte Green { get { return _green; } }
                public byte Blue { get { return _blue; } }
                public byte Alpha { get { return _alpha; } }
                public GimpBrush M_Root { get { return m_root; } }
                public GimpBrush.Row M_Parent { get { return m_parent; } }
            }
            private List<KaitaiStruct> _pixels;
            private GimpBrush m_root;
            private GimpBrush.Bitmap m_parent;
            public List<KaitaiStruct> Pixels { get { return _pixels; } }
            public GimpBrush M_Root { get { return m_root; } }
            public GimpBrush.Bitmap M_Parent { get { return m_parent; } }
        }
        private bool f_body;
        private byte[] _body;
        public byte[] Body
        {
            get
            {
                if (f_body)
                    return _body;
                f_body = true;
                long _pos = m_io.Pos;
                m_io.Seek(LenHeader);
                _body = m_io.ReadBytes(LenBody);
                m_io.Seek(_pos);
                return _body;
            }
        }
        private bool f_lenBody;
        private int _lenBody;
        public int LenBody
        {
            get
            {
                if (f_lenBody)
                    return _lenBody;
                f_lenBody = true;
                _lenBody = (int) ((Header.Width * Header.Height) * ((int) Header.BytesPerPixel));
                return _lenBody;
            }
        }
        private uint _lenHeader;
        private Header _header;
        private GimpBrush m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_header;
        public uint LenHeader { get { return _lenHeader; } }
        public Header Header { get { return _header; } }
        public GimpBrush M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawHeader { get { return __raw_header; } }
    }
}

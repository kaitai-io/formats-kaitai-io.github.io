// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// STL files are used to represent simple 3D models, defined using
    /// triangular 3D faces.
    /// 
    /// Initially it was introduced as native format for 3D Systems
    /// Stereolithography CAD system, but due to its extreme simplicity, it
    /// was adopted by a wide range of 3D modelling, CAD, rapid prototyping
    /// and 3D printing applications as the simplest 3D model exchange
    /// format.
    /// 
    /// STL is extremely bare-bones format: there are no complex headers, no
    /// texture / color support, no units specifications, no distinct vertex
    /// arrays. Whole model is specified as a collection of triangular
    /// faces.
    /// 
    /// There are two versions of the format (text and binary), this spec
    /// describes binary version.
    /// </summary>
    public partial class Stl : KaitaiStruct
    {
        public static Stl FromFile(string fileName)
        {
            return new Stl(new KaitaiStream(fileName));
        }

        public Stl(KaitaiStream p__io, KaitaiStruct p__parent = null, Stl p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _header = m_io.ReadBytes(80);
            _numTriangles = m_io.ReadU4le();
            _triangles = new List<Triangle>();
            for (var i = 0; i < NumTriangles; i++)
            {
                _triangles.Add(new Triangle(m_io, this, m_root));
            }
        }

        /// <summary>
        /// Each STL triangle is defined by its 3 points in 3D space and a
        /// normal vector, which is generally used to determine where is
        /// &quot;inside&quot; and &quot;outside&quot; of the model.
        /// </summary>
        public partial class Triangle : KaitaiStruct
        {
            public static Triangle FromFile(string fileName)
            {
                return new Triangle(new KaitaiStream(fileName));
            }

            public Triangle(KaitaiStream p__io, Stl p__parent = null, Stl p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _normal = new Vec3d(m_io, this, m_root);
                _vertices = new List<Vec3d>();
                for (var i = 0; i < 3; i++)
                {
                    _vertices.Add(new Vec3d(m_io, this, m_root));
                }
                _abr = m_io.ReadU2le();
            }
            private Vec3d _normal;
            private List<Vec3d> _vertices;
            private ushort _abr;
            private Stl m_root;
            private Stl m_parent;
            public Vec3d Normal { get { return _normal; } }
            public List<Vec3d> Vertices { get { return _vertices; } }

            /// <summary>
            /// In theory (per standard), it's &quot;attribute byte count&quot; with
            /// no other details given on what &quot;attribute&quot; is and what
            /// should be stored in this field.
            /// 
            /// In practice, software dealing with STL either expected to
            /// see 0 here, or uses this 16-bit field per se to store
            /// additional attributes (such as RGB color of a vertex or
            /// color index).
            /// </summary>
            public ushort Abr { get { return _abr; } }
            public Stl M_Root { get { return m_root; } }
            public Stl M_Parent { get { return m_parent; } }
        }
        public partial class Vec3d : KaitaiStruct
        {
            public static Vec3d FromFile(string fileName)
            {
                return new Vec3d(new KaitaiStream(fileName));
            }

            public Vec3d(KaitaiStream p__io, Stl.Triangle p__parent = null, Stl p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _x = m_io.ReadF4le();
                _y = m_io.ReadF4le();
                _z = m_io.ReadF4le();
            }
            private float _x;
            private float _y;
            private float _z;
            private Stl m_root;
            private Stl.Triangle m_parent;
            public float X { get { return _x; } }
            public float Y { get { return _y; } }
            public float Z { get { return _z; } }
            public Stl M_Root { get { return m_root; } }
            public Stl.Triangle M_Parent { get { return m_parent; } }
        }
        private byte[] _header;
        private uint _numTriangles;
        private List<Triangle> _triangles;
        private Stl m_root;
        private KaitaiStruct m_parent;
        public byte[] Header { get { return _header; } }
        public uint NumTriangles { get { return _numTriangles; } }
        public List<Triangle> Triangles { get { return _triangles; } }
        public Stl M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

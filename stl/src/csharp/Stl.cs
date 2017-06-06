// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class Stl : KaitaiStruct
    {
        public static Stl FromFile(string fileName)
        {
            return new Stl(new KaitaiStream(fileName));
        }

        public Stl(KaitaiStream io, KaitaiStruct parent = null, Stl root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            _read();
        }
        private void _read() {
            _header = m_io.ReadBytes(80);
            _numTriangles = m_io.ReadU4le();
            _triangles = new List<Triangle>((int) (NumTriangles));
            for (var i = 0; i < NumTriangles; i++) {
                _triangles.Add(new Triangle(m_io, this, m_root));
            }
            }
        public partial class Triangle : KaitaiStruct
        {
            public static Triangle FromFile(string fileName)
            {
                return new Triangle(new KaitaiStream(fileName));
            }

            public Triangle(KaitaiStream io, Stl parent = null, Stl root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _normal = new Vec3d(m_io, this, m_root);
                _vertices = new List<Vec3d>((int) (3));
                for (var i = 0; i < 3; i++) {
                    _vertices.Add(new Vec3d(m_io, this, m_root));
                }
                }
            private Vec3d _normal;
            private List<Vec3d> _vertices;
            private Stl m_root;
            private Stl m_parent;
            public Vec3d Normal { get { return _normal; } }
            public List<Vec3d> Vertices { get { return _vertices; } }
            public Stl M_Root { get { return m_root; } }
            public Stl M_Parent { get { return m_parent; } }
        }
        public partial class Vec3d : KaitaiStruct
        {
            public static Vec3d FromFile(string fileName)
            {
                return new Vec3d(new KaitaiStream(fileName));
            }

            public Vec3d(KaitaiStream io, Stl.Triangle parent = null, Stl root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
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

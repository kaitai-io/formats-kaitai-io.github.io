// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// This spec can be used to disassemble raw stream of 6502 CPU machine
    /// code into individual operations. Each operation includes an opcode
    /// and, optionally, an argument. Register arguments are part of the
    /// `opcode` enum.
    /// </summary>
    public partial class Code6502 : KaitaiStruct
    {
        public static Code6502 FromFile(string fileName)
        {
            return new Code6502(new KaitaiStream(fileName));
        }

        public enum Opcode
        {
            BrkImpl = 0,
            OraXInd = 1,
            OraZpg = 5,
            AslZpg = 6,
            PhpImpl = 8,
            OraImm = 9,
            AslA = 10,
            OraAbs = 13,
            AslAbs = 14,
            BplRel = 16,
            OraIndY = 17,
            OraZpgX = 21,
            AslZpgX = 22,
            ClcImpl = 24,
            OraAbsY = 25,
            OraAbsX = 29,
            AslAbsX = 30,
            JsrAbs = 32,
            AndXInd = 33,
            BitZpg = 36,
            AndZpg = 37,
            RolZpg = 38,
            PlpImpl = 40,
            AndImm = 41,
            RolA = 42,
            BitAbs = 44,
            AndAbs = 45,
            RolAbs = 46,
            BmiRel = 48,
            AndIndY = 49,
            AndZpgX = 53,
            RolZpgX = 54,
            SecImpl = 56,
            AndAbsY = 57,
            AndAbsX = 61,
            RolAbsX = 62,
            RtiImpl = 64,
            EorXInd = 65,
            EorZpg = 69,
            LsrZpg = 70,
            PhaImpl = 72,
            EorImm = 73,
            LsrA = 74,
            JmpAbs = 76,
            EorAbs = 77,
            LsrAbs = 78,
            BvcRel = 80,
            EorIndY = 81,
            EorZpgX = 85,
            LsrZpgX = 86,
            CliImpl = 88,
            EorAbsY = 89,
            EorAbsX = 93,
            LsrAbsX = 94,
            RtsImpl = 96,
            AdcXInd = 97,
            AdcZpg = 101,
            RorZpg = 102,
            PlaImpl = 104,
            AdcImm = 105,
            RorA = 106,
            JmpInd = 108,
            AdcAbs = 109,
            RorAbs = 110,
            BvsRel = 112,
            AdcIndY = 113,
            AdcZpgX = 117,
            RorZpgX = 118,
            SeiImpl = 120,
            AdcAbsY = 121,
            AdcAbsX = 125,
            RorAbsX = 126,
            StaXInd = 129,
            StyZpg = 132,
            StaZpg = 133,
            StxZpg = 134,
            DeyImpl = 136,
            TxaImpl = 138,
            StyAbs = 140,
            StaAbs = 141,
            StxAbs = 142,
            BccRel = 144,
            StaIndY = 145,
            StyZpgX = 148,
            StaZpgX = 149,
            StxZpgY = 150,
            TyaImpl = 152,
            StaAbsY = 153,
            TxsImpl = 154,
            StaAbsX = 157,
            LdyImm = 160,
            LdaXInd = 161,
            LdxImm = 162,
            LdyZpg = 164,
            LdaZpg = 165,
            LdxZpg = 166,
            TayImpl = 168,
            LdaImm = 169,
            TaxImpl = 170,
            LdyAbs = 172,
            LdaAbs = 173,
            LdxAbs = 174,
            BcsRel = 176,
            LdaIndY = 177,
            LdyZpgX = 180,
            LdaZpgX = 181,
            LdxZpgY = 182,
            ClvImpl = 184,
            LdaAbsY = 185,
            TsxImpl = 186,
            LdyAbsX = 188,
            LdaAbsX = 189,
            LdxAbsY = 190,
            CpyImm = 192,
            CmpXInd = 193,
            CpyZpg = 196,
            CmpZpg = 197,
            DecZpg = 198,
            InyImpl = 200,
            CmpImm = 201,
            DexImpl = 202,
            CpyAbs = 204,
            CmpAbs = 205,
            DecAbs = 206,
            BneRel = 208,
            CmpIndY = 209,
            CmpZpgX = 213,
            DecZpgX = 214,
            CldImpl = 216,
            CmpAbsY = 217,
            CmpAbsX = 221,
            DecAbsX = 222,
            CpxImm = 224,
            SbcXInd = 225,
            CpxZpg = 228,
            SbcZpg = 229,
            IncZpg = 230,
            InxImpl = 232,
            SbcImm = 233,
            NopImpl = 234,
            CpxAbs = 236,
            SbcAbs = 237,
            IncAbs = 238,
            BeqRel = 240,
            SbcIndY = 241,
            SbcZpgX = 245,
            IncZpgX = 246,
            SedImpl = 248,
            SbcAbsY = 249,
            SbcAbsX = 253,
            IncAbsX = 254,
        }

        public Code6502(KaitaiStream io, KaitaiStruct parent = null, Code6502 root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            _read();
        }
        private void _read() {
            _operations = new List<Operation>();
            while (!m_io.IsEof) {
                _operations.Add(new Operation(m_io, this, m_root));
            }
            }
        public partial class Operation : KaitaiStruct
        {
            public static Operation FromFile(string fileName)
            {
                return new Operation(new KaitaiStream(fileName));
            }

            public Operation(KaitaiStream io, Code6502 parent = null, Code6502 root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _code = ((Code6502.Opcode) m_io.ReadU1());
                switch (Code) {
                case Code6502.Opcode.LsrAbsX: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.AndAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.BitZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.AslZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.RorAbsX: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.StyAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.OraZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.EorZpgX: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.EorAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.EorZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.OraAbsX: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.AdcAbsY: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.StyZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.EorIndY: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.RolAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.EorImm: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.BmiRel: {
                    _args = m_io.ReadS1();
                    break;
                }
                case Code6502.Opcode.IncAbsX: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.CpyZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.JsrAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.AndAbsY: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.CmpZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.SbcIndY: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.AndXInd: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.BvcRel: {
                    _args = m_io.ReadS1();
                    break;
                }
                case Code6502.Opcode.OraXInd: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.OraAbsY: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.LsrAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.LdxZpgY: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.RolAbsX: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.AdcAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.StyZpgX: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.OraZpgX: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.LdyAbsX: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.AdcImm: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.SbcZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.LdxImm: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.BeqRel: {
                    _args = m_io.ReadS1();
                    break;
                }
                case Code6502.Opcode.SbcAbsX: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.LdxAbsY: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.OraImm: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.BcsRel: {
                    _args = m_io.ReadS1();
                    break;
                }
                case Code6502.Opcode.SbcZpgX: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.StaZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.BccRel: {
                    _args = m_io.ReadS1();
                    break;
                }
                case Code6502.Opcode.AndImm: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.LdyZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.AdcZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.BneRel: {
                    _args = m_io.ReadS1();
                    break;
                }
                case Code6502.Opcode.EorAbsY: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.CpyAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.StxAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.LdyImm: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.LdaZpgX: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.CmpAbsY: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.LsrZpgX: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.EorAbsX: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.CmpAbsX: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.IncAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.StaZpgX: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.StaXInd: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.CmpImm: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.EorXInd: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.CmpIndY: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.CmpXInd: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.AslAbsX: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.DecZpgX: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.SbcAbsY: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.StxZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.LdaAbsX: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.AndZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.SbcXInd: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.LdaZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.JmpInd: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.StaAbsY: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.AslAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.CmpZpgX: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.LdxAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.AdcZpgX: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.RorZpgX: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.AndAbsX: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.StaAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.AdcAbsX: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.BitAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.DecAbsX: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.StxZpgY: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.LdaAbsY: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.LdaXInd: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.CpyImm: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.OraIndY: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.AslZpgX: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.AndIndY: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.StaIndY: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.RorAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.LdxZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.AndZpgX: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.CpxImm: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.BvsRel: {
                    _args = m_io.ReadS1();
                    break;
                }
                case Code6502.Opcode.LdyAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.IncZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.SbcAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.RolZpgX: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.SbcImm: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.AdcXInd: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.StaAbsX: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.CpxAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.CmpAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.LdaAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.RolZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.IncZpgX: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.LdaImm: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.DecZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.AdcIndY: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.LdaIndY: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.BplRel: {
                    _args = m_io.ReadS1();
                    break;
                }
                case Code6502.Opcode.LsrZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.JmpAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.DecAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.OraAbs: {
                    _args = m_io.ReadU2le();
                    break;
                }
                case Code6502.Opcode.RorZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.LdyZpgX: {
                    _args = m_io.ReadU1();
                    break;
                }
                case Code6502.Opcode.CpxZpg: {
                    _args = m_io.ReadU1();
                    break;
                }
                }
                }
            private Opcode _code;
            private ushort _args;
            private Code6502 m_root;
            private Code6502 m_parent;
            public Opcode Code { get { return _code; } }
            public ushort Args { get { return _args; } }
            public Code6502 M_Root { get { return m_root; } }
            public Code6502 M_Parent { get { return m_parent; } }
        }
        private List<Operation> _operations;
        private Code6502 m_root;
        private KaitaiStruct m_parent;
        public List<Operation> Operations { get { return _operations; } }
        public Code6502 M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

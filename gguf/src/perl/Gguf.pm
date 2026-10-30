# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Gguf;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $GGML_TYPE_F32 = 0;
our $GGML_TYPE_F16 = 1;
our $GGML_TYPE_Q4_0 = 2;
our $GGML_TYPE_Q4_1 = 3;
our $GGML_TYPE_Q4_2 = 4;
our $GGML_TYPE_Q4_3 = 5;
our $GGML_TYPE_Q5_0 = 6;
our $GGML_TYPE_Q5_1 = 7;
our $GGML_TYPE_Q8_0 = 8;
our $GGML_TYPE_Q8_1 = 9;
our $GGML_TYPE_Q2_K = 10;
our $GGML_TYPE_Q3_K = 11;
our $GGML_TYPE_Q4_K = 12;
our $GGML_TYPE_Q5_K = 13;
our $GGML_TYPE_Q6_K = 14;
our $GGML_TYPE_Q8_K = 15;
our $GGML_TYPE_IQ2_XXS = 16;
our $GGML_TYPE_IQ2_XS = 17;
our $GGML_TYPE_IQ3_XXS = 18;
our $GGML_TYPE_IQ1_S = 19;
our $GGML_TYPE_IQ4_NL = 20;
our $GGML_TYPE_IQ3_S = 21;
our $GGML_TYPE_IQ2_S = 22;
our $GGML_TYPE_IQ4_XS = 23;
our $GGML_TYPE_I8 = 24;
our $GGML_TYPE_I16 = 25;
our $GGML_TYPE_I32 = 26;
our $GGML_TYPE_I64 = 27;
our $GGML_TYPE_F64 = 28;
our $GGML_TYPE_IQ1_M = 29;
our $GGML_TYPE_BF16 = 30;
our $GGML_TYPE_Q4_0_4_4 = 31;
our $GGML_TYPE_Q4_0_4_8 = 32;
our $GGML_TYPE_Q4_0_8_8 = 33;
our $GGML_TYPE_TQ1_0 = 34;
our $GGML_TYPE_TQ2_0 = 35;
our $GGML_TYPE_IQ4_NL_4_4 = 36;
our $GGML_TYPE_IQ4_NL_4_8 = 37;
our $GGML_TYPE_IQ4_NL_8_8 = 38;
our $GGML_TYPE_MXFP4 = 39;
our $GGML_TYPE_NVFP4 = 40;
our $GGML_TYPE_Q1_0 = 41;
our $GGML_TYPE_Q2_0 = 42;

our $GGUF_TYPE_UINT8 = 0;
our $GGUF_TYPE_INT8 = 1;
our $GGUF_TYPE_UINT16 = 2;
our $GGUF_TYPE_INT16 = 3;
our $GGUF_TYPE_UINT32 = 4;
our $GGUF_TYPE_INT32 = 5;
our $GGUF_TYPE_FLOAT32 = 6;
our $GGUF_TYPE_BOOL = 7;
our $GGUF_TYPE_STRING = 8;
our $GGUF_TYPE_ARRAY = 9;
our $GGUF_TYPE_UINT64 = 10;
our $GGUF_TYPE_INT64 = 11;
our $GGUF_TYPE_FLOAT64 = 12;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{body} = Gguf::GgufBody->new($self->{_io}, $self, $self->{_root});
}

sub is_big_endian {
    my ($self) = @_;
    return $self->{is_big_endian} if ($self->{is_big_endian});
    $self->{is_big_endian} = ($self->version_le() & 65535) == 0;
    return $self->{is_big_endian};
}

sub len_file {
    my ($self) = @_;
    return $self->{len_file} if ($self->{len_file});
    $self->{len_file} = ($self->body()->ofs_tensor_data() + ($self->body()->num_tensor_infos() != 0 ? @{$self->body()->tensor_infos()}[-1]->expected_next_offset() : 0));
    return $self->{len_file};
}

sub version_le {
    my ($self) = @_;
    return $self->{version_le} if ($self->{version_le});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(4);
    $self->{version_le} = $self->{_io}->read_u4le();
    $self->{_io}->seek($_pos);
    return $self->{version_le};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package Gguf::GgufBody;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    my $_on = $self->_root()->is_big_endian();
    if ($_on == 1) {
        $self->{_is_le} = 0;
    }
    elsif ($_on == 0) {
        $self->{_is_le} = 1;
    }
    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{version} = $self->{_io}->read_u4le();
    $self->{num_tensor_infos} = $self->{_io}->read_u8le();
    $self->{num_kv_pairs} = $self->{_io}->read_u8le();
    $self->{kv_pairs} = [];
    my $n_kv_pairs = $self->num_kv_pairs();
    for (my $i = 0; $i < $n_kv_pairs; $i++) {
        push @{$self->{kv_pairs}}, Gguf::GgufBody::GgufKv->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    $self->{tensor_infos} = [];
    my $n_tensor_infos = $self->num_tensor_infos();
    for (my $i = 0; $i < $n_tensor_infos; $i++) {
        push @{$self->{tensor_infos}}, Gguf::GgufBody::GgufTensorInfo->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    if ($self->num_tensor_infos() != 0) {
        $self->{padding} = $self->{_io}->read_bytes(($self->alignment() - $self->_io()->pos() % $self->alignment()) % $self->alignment());
    }
    if ($self->ofs_tensor_data() < 0) {
        $self->{_unnamed6} = $self->{_io}->read_bytes(0);
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{version} = $self->{_io}->read_u4be();
    $self->{num_tensor_infos} = $self->{_io}->read_u8be();
    $self->{num_kv_pairs} = $self->{_io}->read_u8be();
    $self->{kv_pairs} = [];
    my $n_kv_pairs = $self->num_kv_pairs();
    for (my $i = 0; $i < $n_kv_pairs; $i++) {
        push @{$self->{kv_pairs}}, Gguf::GgufBody::GgufKv->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    $self->{tensor_infos} = [];
    my $n_tensor_infos = $self->num_tensor_infos();
    for (my $i = 0; $i < $n_tensor_infos; $i++) {
        push @{$self->{tensor_infos}}, Gguf::GgufBody::GgufTensorInfo->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    if ($self->num_tensor_infos() != 0) {
        $self->{padding} = $self->{_io}->read_bytes(($self->alignment() - $self->_io()->pos() % $self->alignment()) % $self->alignment());
    }
    if ($self->ofs_tensor_data() < 0) {
        $self->{_unnamed6} = $self->{_io}->read_bytes(0);
    }
}

sub alignment {
    my ($self) = @_;
    return $self->{alignment} if ($self->{alignment});
    $self->{alignment} = (scalar(@{$self->kv_pairs()}) != 0 ? @{$self->kv_pairs()}[-1]->alignment() : 32);
    return $self->{alignment};
}

sub ofs_tensor_data {
    my ($self) = @_;
    return $self->{ofs_tensor_data} if ($self->{ofs_tensor_data});
    $self->{ofs_tensor_data} = $self->_io()->pos();
    return $self->{ofs_tensor_data};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub num_tensor_infos {
    my ($self) = @_;
    return $self->{num_tensor_infos};
}

sub num_kv_pairs {
    my ($self) = @_;
    return $self->{num_kv_pairs};
}

sub kv_pairs {
    my ($self) = @_;
    return $self->{kv_pairs};
}

sub tensor_infos {
    my ($self) = @_;
    return $self->{tensor_infos};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub _unnamed6 {
    my ($self) = @_;
    return $self->{_unnamed6};
}

########################################################################
package Gguf::GgufBody::GgufArray;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{type} = $self->{_io}->read_u4le();
    $self->{num_elems} = $self->{_io}->read_u8le();
    $self->{elems} = [];
    my $n_elems = $self->num_elems();
    for (my $i = 0; $i < $n_elems; $i++) {
        push @{$self->{elems}}, Gguf::GgufBody::GgufValue->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{type} = $self->{_io}->read_u4be();
    $self->{num_elems} = $self->{_io}->read_u8be();
    $self->{elems} = [];
    my $n_elems = $self->num_elems();
    for (my $i = 0; $i < $n_elems; $i++) {
        push @{$self->{elems}}, Gguf::GgufBody::GgufValue->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub num_elems {
    my ($self) = @_;
    return $self->{num_elems};
}

sub elems {
    my ($self) = @_;
    return $self->{elems};
}

########################################################################
package Gguf::GgufBody::GgufBool;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{value_raw} = $self->{_io}->read_u1();
}

sub _read_be {
    my ($self) = @_;

    $self->{value_raw} = $self->{_io}->read_u1();
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = $self->value_raw() != 0;
    return $self->{value};
}

sub value_raw {
    my ($self) = @_;
    return $self->{value_raw};
}

########################################################################
package Gguf::GgufBody::GgufFloat32;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_f4le();
}

sub _read_be {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_f4be();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Gguf::GgufBody::GgufFloat64;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_f8le();
}

sub _read_be {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_f8be();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Gguf::GgufBody::GgufInt16;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_s2le();
}

sub _read_be {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_s2be();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Gguf::GgufBody::GgufInt32;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_s4le();
}

sub _read_be {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_s4be();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Gguf::GgufBody::GgufInt64;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_s8le();
}

sub _read_be {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_s8be();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Gguf::GgufBody::GgufInt8;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_s1();
}

sub _read_be {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_s1();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Gguf::GgufBody::GgufKv;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{key} = Gguf::GgufBody::GgufStr->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    {
        my $_it = $self->{key};
    }
    $self->{type} = $self->{_io}->read_u4le();
    $self->{value} = Gguf::GgufBody::GgufValue->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    {
        my $_it = $self->{value};
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{key} = Gguf::GgufBody::GgufStr->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    {
        my $_it = $self->{key};
    }
    $self->{type} = $self->{_io}->read_u4be();
    $self->{value} = Gguf::GgufBody::GgufValue->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    {
        my $_it = $self->{value};
    }
}

sub alignment {
    my ($self) = @_;
    return $self->{alignment} if ($self->{alignment});
    $self->{alignment} = ($self->key()->value() eq "general.alignment" ? $self->value()->value()->value() : $self->prev_alignment());
    return $self->{alignment};
}

sub key {
    my ($self) = @_;
    return $self->{key};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

sub prev_alignment {
    my ($self) = @_;
    return $self->{prev_alignment};
}

########################################################################
package Gguf::GgufBody::GgufStr;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{len_value} = $self->{_io}->read_u8le();
    $self->{value} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->len_value()));
}

sub _read_be {
    my ($self) = @_;

    $self->{len_value} = $self->{_io}->read_u8be();
    $self->{value} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->len_value()));
}

sub len_value {
    my ($self) = @_;
    return $self->{len_value};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Gguf::GgufBody::GgufTensorInfo;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{name} = Gguf::GgufBody::GgufStr->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    {
        my $_it = $self->{name};
    }
    $self->{num_dims} = $self->{_io}->read_u4le();
    $self->{dims} = [];
    my $n_dims = $self->num_dims();
    for (my $i = 0; $i < $n_dims; $i++) {
        push @{$self->{dims}}, $self->{_io}->read_s8le();
    }
    $self->{type} = $self->{_io}->read_u4le();
    {
        my $_it = $self->{type};
    }
    $self->{offset} = $self->{_io}->read_u8le();
}

sub _read_be {
    my ($self) = @_;

    $self->{name} = Gguf::GgufBody::GgufStr->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    {
        my $_it = $self->{name};
    }
    $self->{num_dims} = $self->{_io}->read_u4be();
    $self->{dims} = [];
    my $n_dims = $self->num_dims();
    for (my $i = 0; $i < $n_dims; $i++) {
        push @{$self->{dims}}, $self->{_io}->read_s8be();
    }
    $self->{type} = $self->{_io}->read_u4be();
    {
        my $_it = $self->{type};
    }
    $self->{offset} = $self->{_io}->read_u8be();
}

sub data {
    my ($self) = @_;
    return $self->{data} if ($self->{data});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->_parent()->ofs_tensor_data() + $self->offset());
    if ($self->{_is_le}) {
        $self->{data} = $self->{_io}->read_bytes($self->len_data());
    } else {
        $self->{data} = $self->{_io}->read_bytes($self->len_data());
    }
    $self->{_io}->seek($_pos);
    return $self->{data};
}

sub dump_dims {
    my ($self) = @_;
    return $self->{dump_dims} if ($self->{dump_dims});
    $self->{dump_dims} = ((($self->num_dims() > 0 ? sprintf('%d', @{$self->dims()}[0]) : "") . ($self->num_dims() > 1 ? " x " . sprintf('%d', @{$self->dims()}[1]) : "")) . ($self->num_dims() > 2 ? " x " . sprintf('%d', @{$self->dims()}[2]) : "")) . ($self->num_dims() > 3 ? " x " . sprintf('%d', @{$self->dims()}[3]) : "");
    return $self->{dump_dims};
}

sub expected_next_offset {
    my ($self) = @_;
    return $self->{expected_next_offset} if ($self->{expected_next_offset});
    $self->{expected_next_offset} = (($self->offset() + $self->len_data()) + $self->len_padding());
    return $self->{expected_next_offset};
}

sub len_block {
    my ($self) = @_;
    return $self->{len_block} if ($self->{len_block});
    $self->{len_block} = @{[4, 2, 18, 20, 0, 0, 22, 24, 34, 36, 84, 110, 144, 176, 210, 292, 66, 74, 98, 50, 18, 110, 82, 136, 1, 2, 4, 8, 8, 56, 2, 0, 0, 0, 54, 66, 0, 0, 0, 17, 36, 18, 18]}[$self->type()];
    return $self->{len_block};
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data} if ($self->{len_data});
    $self->{len_data} = ($self->len_block() * $self->num_blocks());
    return $self->{len_data};
}

sub len_padding {
    my ($self) = @_;
    return $self->{len_padding} if ($self->{len_padding});
    $self->{len_padding} = ($self->_parent()->alignment() - $self->len_data() % $self->_parent()->alignment()) % $self->_parent()->alignment();
    return $self->{len_padding};
}

sub num_blocks {
    my ($self) = @_;
    return $self->{num_blocks} if ($self->{num_blocks});
    $self->{num_blocks} = int($self->num_elements() / $self->num_elements_per_block());
    return $self->{num_blocks};
}

sub num_elements {
    my ($self) = @_;
    return $self->{num_elements} if ($self->{num_elements});
    $self->{num_elements} = (((($self->num_dims() > 0 ? @{$self->dims()}[0] : 1) * ($self->num_dims() > 1 ? @{$self->dims()}[1] : 1)) * ($self->num_dims() > 2 ? @{$self->dims()}[2] : 1)) * ($self->num_dims() > 3 ? @{$self->dims()}[3] : 1));
    return $self->{num_elements};
}

sub num_elements_per_block {
    my ($self) = @_;
    return $self->{num_elements_per_block} if ($self->{num_elements_per_block});
    $self->{num_elements_per_block} = @{[1, 1, 32, 32, 0, 0, 32, 32, 32, 32, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 32, 256, 256, 256, 1, 1, 1, 1, 1, 256, 1, 0, 0, 0, 256, 256, 0, 0, 0, 32, 64, 128, 64]}[$self->type()];
    return $self->{num_elements_per_block};
}

sub padding {
    my ($self) = @_;
    return $self->{padding} if ($self->{padding});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->_parent()->ofs_tensor_data() + $self->offset()) + $self->len_data());
    if ($self->{_is_le}) {
        $self->{padding} = $self->{_io}->read_bytes($self->len_padding());
    } else {
        $self->{padding} = $self->{_io}->read_bytes($self->len_padding());
    }
    $self->{_io}->seek($_pos);
    return $self->{padding};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub num_dims {
    my ($self) = @_;
    return $self->{num_dims};
}

sub dims {
    my ($self) = @_;
    return $self->{dims};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub expected_offset {
    my ($self) = @_;
    return $self->{expected_offset};
}

########################################################################
package Gguf::GgufBody::GgufUint16;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_u2le();
}

sub _read_be {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_u2be();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Gguf::GgufBody::GgufUint32;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_u4le();
}

sub _read_be {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_u4be();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Gguf::GgufBody::GgufUint64;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_u8le();
}

sub _read_be {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_u8be();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Gguf::GgufBody::GgufUint8;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_u1();
}

sub _read_be {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_u1();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Gguf::GgufBody::GgufValue;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    my $_on = $self->type();
    if ($_on == $Gguf::GGUF_TYPE_ARRAY) {
        $self->{value} = Gguf::GgufBody::GgufArray->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_BOOL) {
        $self->{value} = Gguf::GgufBody::GgufBool->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_FLOAT32) {
        $self->{value} = Gguf::GgufBody::GgufFloat32->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_FLOAT64) {
        $self->{value} = Gguf::GgufBody::GgufFloat64->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_INT16) {
        $self->{value} = Gguf::GgufBody::GgufInt16->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_INT32) {
        $self->{value} = Gguf::GgufBody::GgufInt32->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_INT64) {
        $self->{value} = Gguf::GgufBody::GgufInt64->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_INT8) {
        $self->{value} = Gguf::GgufBody::GgufInt8->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_STRING) {
        $self->{value} = Gguf::GgufBody::GgufStr->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_UINT16) {
        $self->{value} = Gguf::GgufBody::GgufUint16->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_UINT32) {
        $self->{value} = Gguf::GgufBody::GgufUint32->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_UINT64) {
        $self->{value} = Gguf::GgufBody::GgufUint64->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_UINT8) {
        $self->{value} = Gguf::GgufBody::GgufUint8->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub _read_be {
    my ($self) = @_;

    my $_on = $self->type();
    if ($_on == $Gguf::GGUF_TYPE_ARRAY) {
        $self->{value} = Gguf::GgufBody::GgufArray->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_BOOL) {
        $self->{value} = Gguf::GgufBody::GgufBool->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_FLOAT32) {
        $self->{value} = Gguf::GgufBody::GgufFloat32->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_FLOAT64) {
        $self->{value} = Gguf::GgufBody::GgufFloat64->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_INT16) {
        $self->{value} = Gguf::GgufBody::GgufInt16->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_INT32) {
        $self->{value} = Gguf::GgufBody::GgufInt32->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_INT64) {
        $self->{value} = Gguf::GgufBody::GgufInt64->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_INT8) {
        $self->{value} = Gguf::GgufBody::GgufInt8->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_STRING) {
        $self->{value} = Gguf::GgufBody::GgufStr->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_UINT16) {
        $self->{value} = Gguf::GgufBody::GgufUint16->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_UINT32) {
        $self->{value} = Gguf::GgufBody::GgufUint32->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_UINT64) {
        $self->{value} = Gguf::GgufBody::GgufUint64->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    elsif ($_on == $Gguf::GGUF_TYPE_UINT8) {
        $self->{value} = Gguf::GgufBody::GgufUint8->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

1;

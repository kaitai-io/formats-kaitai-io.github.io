# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package RubyMarshal;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $CODES_RUBY_STRING = 34;
our $CODES_CONST_NIL = 48;
our $CODES_RUBY_SYMBOL = 58;
our $CODES_RUBY_SYMBOL_LINK = 59;
our $CODES_RUBY_OBJECT_LINK = 64;
our $CODES_CONST_FALSE = 70;
our $CODES_INSTANCE_VAR = 73;
our $CODES_RUBY_STRUCT = 83;
our $CODES_CONST_TRUE = 84;
our $CODES_RUBY_ARRAY = 91;
our $CODES_PACKED_INT = 105;
our $CODES_BIGNUM = 108;
our $CODES_RUBY_HASH = 123;

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

    $self->{version} = $self->{_io}->read_bytes(2);
    $self->{records} = RubyMarshal::Record->new($self->{_io}, $self, $self->{_root});
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub records {
    my ($self) = @_;
    return $self->{records};
}

########################################################################
package RubyMarshal::Bignum;

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

    $self->{sign} = $self->{_io}->read_u1();
    $self->{len_div_2} = RubyMarshal::PackedInt->new($self->{_io}, $self, $self->{_root});
    $self->{body} = $self->{_io}->read_bytes($self->len_div_2()->value() * 2);
}

sub sign {
    my ($self) = @_;
    return $self->{sign};
}

sub len_div_2 {
    my ($self) = @_;
    return $self->{len_div_2};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package RubyMarshal::InstanceVar;

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

    $self->{obj} = RubyMarshal::Record->new($self->{_io}, $self, $self->{_root});
    $self->{num_vars} = RubyMarshal::PackedInt->new($self->{_io}, $self, $self->{_root});
    $self->{vars} = [];
    my $n_vars = $self->num_vars()->value();
    for (my $i = 0; $i < $n_vars; $i++) {
        push @{$self->{vars}}, RubyMarshal::Pair->new($self->{_io}, $self, $self->{_root});
    }
}

sub obj {
    my ($self) = @_;
    return $self->{obj};
}

sub num_vars {
    my ($self) = @_;
    return $self->{num_vars};
}

sub vars {
    my ($self) = @_;
    return $self->{vars};
}

########################################################################
package RubyMarshal::PackedInt;

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

    $self->{code} = $self->{_io}->read_u1();
    my $_on = $self->code();
    if ($_on == 1) {
        $self->{encoded} = $self->{_io}->read_u1();
    }
    elsif ($_on == 2) {
        $self->{encoded} = $self->{_io}->read_u2le();
    }
    elsif ($_on == 252) {
        $self->{encoded} = $self->{_io}->read_u4le();
    }
    elsif ($_on == 253) {
        $self->{encoded} = $self->{_io}->read_u2le();
    }
    elsif ($_on == 254) {
        $self->{encoded} = $self->{_io}->read_u2le();
    }
    elsif ($_on == 255) {
        $self->{encoded} = $self->{_io}->read_u1();
    }
    elsif ($_on == 3) {
        $self->{encoded} = $self->{_io}->read_u2le();
    }
    elsif ($_on == 4) {
        $self->{encoded} = $self->{_io}->read_u4le();
    }
    my $_on = $self->code();
    if ($_on == 253) {
        $self->{encoded2} = $self->{_io}->read_u1();
    }
    elsif ($_on == 3) {
        $self->{encoded2} = $self->{_io}->read_u1();
    }
}

sub is_immediate {
    my ($self) = @_;
    return $self->{is_immediate} if ($self->{is_immediate});
    $self->{is_immediate} =  (($self->code() > 4) && ($self->code() < 252)) ;
    return $self->{is_immediate};
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = ($self->is_immediate() ? ($self->code() < 128 ? $self->code() - 5 : 4 - (~($self->code()) & 127)) : ($self->code() == 0 ? 0 : ($self->code() == 255 ? $self->encoded() - 256 : ($self->code() == 254 ? $self->encoded() - 65536 : ($self->code() == 253 ? ($self->encoded2() << 16 | $self->encoded()) - 16777216 : ($self->code() == 3 ? $self->encoded2() << 16 | $self->encoded() : $self->encoded()))))));
    return $self->{value};
}

sub code {
    my ($self) = @_;
    return $self->{code};
}

sub encoded {
    my ($self) = @_;
    return $self->{encoded};
}

sub encoded2 {
    my ($self) = @_;
    return $self->{encoded2};
}

########################################################################
package RubyMarshal::Pair;

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

    $self->{key} = RubyMarshal::Record->new($self->{_io}, $self, $self->{_root});
    $self->{value} = RubyMarshal::Record->new($self->{_io}, $self, $self->{_root});
}

sub key {
    my ($self) = @_;
    return $self->{key};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package RubyMarshal::Record;

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

    $self->{code} = $self->{_io}->read_u1();
    my $_on = $self->code();
    if ($_on == $RubyMarshal::CODES_BIGNUM) {
        $self->{body} = RubyMarshal::Bignum->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $RubyMarshal::CODES_INSTANCE_VAR) {
        $self->{body} = RubyMarshal::InstanceVar->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $RubyMarshal::CODES_PACKED_INT) {
        $self->{body} = RubyMarshal::PackedInt->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $RubyMarshal::CODES_RUBY_ARRAY) {
        $self->{body} = RubyMarshal::RubyArray->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $RubyMarshal::CODES_RUBY_HASH) {
        $self->{body} = RubyMarshal::RubyHash->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $RubyMarshal::CODES_RUBY_OBJECT_LINK) {
        $self->{body} = RubyMarshal::PackedInt->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $RubyMarshal::CODES_RUBY_STRING) {
        $self->{body} = RubyMarshal::RubyString->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $RubyMarshal::CODES_RUBY_STRUCT) {
        $self->{body} = RubyMarshal::RubyStruct->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $RubyMarshal::CODES_RUBY_SYMBOL) {
        $self->{body} = RubyMarshal::RubySymbol->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $RubyMarshal::CODES_RUBY_SYMBOL_LINK) {
        $self->{body} = RubyMarshal::PackedInt->new($self->{_io}, $self, $self->{_root});
    }
}

sub code {
    my ($self) = @_;
    return $self->{code};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package RubyMarshal::RubyArray;

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

    $self->{num_elements} = RubyMarshal::PackedInt->new($self->{_io}, $self, $self->{_root});
    $self->{elements} = [];
    my $n_elements = $self->num_elements()->value();
    for (my $i = 0; $i < $n_elements; $i++) {
        push @{$self->{elements}}, RubyMarshal::Record->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_elements {
    my ($self) = @_;
    return $self->{num_elements};
}

sub elements {
    my ($self) = @_;
    return $self->{elements};
}

########################################################################
package RubyMarshal::RubyHash;

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

    $self->{num_pairs} = RubyMarshal::PackedInt->new($self->{_io}, $self, $self->{_root});
    $self->{pairs} = [];
    my $n_pairs = $self->num_pairs()->value();
    for (my $i = 0; $i < $n_pairs; $i++) {
        push @{$self->{pairs}}, RubyMarshal::Pair->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_pairs {
    my ($self) = @_;
    return $self->{num_pairs};
}

sub pairs {
    my ($self) = @_;
    return $self->{pairs};
}

########################################################################
package RubyMarshal::RubyString;

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

    $self->{len} = RubyMarshal::PackedInt->new($self->{_io}, $self, $self->{_root});
    $self->{body} = $self->{_io}->read_bytes($self->len()->value());
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package RubyMarshal::RubyStruct;

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

    $self->{name} = RubyMarshal::Record->new($self->{_io}, $self, $self->{_root});
    $self->{num_members} = RubyMarshal::PackedInt->new($self->{_io}, $self, $self->{_root});
    $self->{members} = [];
    my $n_members = $self->num_members()->value();
    for (my $i = 0; $i < $n_members; $i++) {
        push @{$self->{members}}, RubyMarshal::Pair->new($self->{_io}, $self, $self->{_root});
    }
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub num_members {
    my ($self) = @_;
    return $self->{num_members};
}

sub members {
    my ($self) = @_;
    return $self->{members};
}

########################################################################
package RubyMarshal::RubySymbol;

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

    $self->{len} = RubyMarshal::PackedInt->new($self->{_io}, $self, $self->{_root});
    $self->{name} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->len()->value()));
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

1;

# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package SshPublicKey;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{key_name} = SshPublicKey::Cstring->new($self->{_io}, $self, $self->{_root});
    my $_on = $self->key_name()->value();
    if ($_on eq "ssh-rsa") {
        $self->{body} = SshPublicKey::KeyRsa->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on eq "ecdsa-sha2-nistp256") {
        $self->{body} = SshPublicKey::KeyEcdsa->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on eq "ssh-ed25519") {
        $self->{body} = SshPublicKey::KeyEd25519->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on eq "ssh-dss") {
        $self->{body} = SshPublicKey::KeyDsa->new($self->{_io}, $self, $self->{_root});
    }
}

sub key_name {
    my ($self) = @_;
    return $self->{key_name};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package SshPublicKey::KeyRsa;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{rsa_e} = SshPublicKey::Bignum2->new($self->{_io}, $self, $self->{_root});
    $self->{rsa_n} = SshPublicKey::Bignum2->new($self->{_io}, $self, $self->{_root});
}

sub key_length {
    my ($self) = @_;
    return $self->{key_length} if ($self->{key_length});
    $self->{key_length} = $self->rsa_n()->length_in_bits();
    return $self->{key_length};
}

sub rsa_e {
    my ($self) = @_;
    return $self->{rsa_e};
}

sub rsa_n {
    my ($self) = @_;
    return $self->{rsa_n};
}

########################################################################
package SshPublicKey::KeyEd25519;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len_pk} = $self->{_io}->read_u4be();
    $self->{pk} = $self->{_io}->read_bytes($self->len_pk());
}

sub len_pk {
    my ($self) = @_;
    return $self->{len_pk};
}

sub pk {
    my ($self) = @_;
    return $self->{pk};
}

########################################################################
package SshPublicKey::KeyEcdsa;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{curve_name} = SshPublicKey::Cstring->new($self->{_io}, $self, $self->{_root});
    $self->{ec} = SshPublicKey::EllipticCurve->new($self->{_io}, $self, $self->{_root});
}

sub curve_name {
    my ($self) = @_;
    return $self->{curve_name};
}

sub ec {
    my ($self) = @_;
    return $self->{ec};
}

########################################################################
package SshPublicKey::Cstring;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len} = $self->{_io}->read_u4be();
    $self->{value} = Encode::decode("ASCII", $self->{_io}->read_bytes($self->len()));
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package SshPublicKey::KeyDsa;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{dsa_p} = SshPublicKey::Bignum2->new($self->{_io}, $self, $self->{_root});
    $self->{dsa_q} = SshPublicKey::Bignum2->new($self->{_io}, $self, $self->{_root});
    $self->{dsa_g} = SshPublicKey::Bignum2->new($self->{_io}, $self, $self->{_root});
    $self->{dsa_pub_key} = SshPublicKey::Bignum2->new($self->{_io}, $self, $self->{_root});
}

sub dsa_p {
    my ($self) = @_;
    return $self->{dsa_p};
}

sub dsa_q {
    my ($self) = @_;
    return $self->{dsa_q};
}

sub dsa_g {
    my ($self) = @_;
    return $self->{dsa_g};
}

sub dsa_pub_key {
    my ($self) = @_;
    return $self->{dsa_pub_key};
}

########################################################################
package SshPublicKey::EllipticCurve;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len} = $self->{_io}->read_u4be();
    $self->{body} = $self->{_io}->read_bytes($self->len());
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
package SshPublicKey::Bignum2;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len} = $self->{_io}->read_u4be();
    $self->{body} = $self->{_io}->read_bytes($self->len());
}

sub length_in_bits {
    my ($self) = @_;
    return $self->{length_in_bits} if ($self->{length_in_bits});
    $self->{length_in_bits} = (($self->len() - 1) * 8);
    return $self->{length_in_bits};
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

1;

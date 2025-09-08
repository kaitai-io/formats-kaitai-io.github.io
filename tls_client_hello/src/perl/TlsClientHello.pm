# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;

########################################################################
package TlsClientHello;

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
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{version} = TlsClientHello::Version->new($self->{_io}, $self, $self->{_root});
    $self->{random} = TlsClientHello::Random->new($self->{_io}, $self, $self->{_root});
    $self->{session_id} = TlsClientHello::SessionId->new($self->{_io}, $self, $self->{_root});
    $self->{cipher_suites} = TlsClientHello::CipherSuites->new($self->{_io}, $self, $self->{_root});
    $self->{compression_methods} = TlsClientHello::CompressionMethods->new($self->{_io}, $self, $self->{_root});
    if ($self->_io()->is_eof() == 0) {
        $self->{extensions} = TlsClientHello::Extensions->new($self->{_io}, $self, $self->{_root});
    }
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub random {
    my ($self) = @_;
    return $self->{random};
}

sub session_id {
    my ($self) = @_;
    return $self->{session_id};
}

sub cipher_suites {
    my ($self) = @_;
    return $self->{cipher_suites};
}

sub compression_methods {
    my ($self) = @_;
    return $self->{compression_methods};
}

sub extensions {
    my ($self) = @_;
    return $self->{extensions};
}

########################################################################
package TlsClientHello::Alpn;

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

    $self->{ext_len} = $self->{_io}->read_u2be();
    $self->{alpn_protocols} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{alpn_protocols}}, TlsClientHello::Protocol->new($self->{_io}, $self, $self->{_root});
    }
}

sub ext_len {
    my ($self) = @_;
    return $self->{ext_len};
}

sub alpn_protocols {
    my ($self) = @_;
    return $self->{alpn_protocols};
}

########################################################################
package TlsClientHello::CipherSuites;

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

    $self->{len} = $self->{_io}->read_u2be();
    $self->{cipher_suites} = [];
    my $n_cipher_suites = int($self->len() / 2);
    for (my $i = 0; $i < $n_cipher_suites; $i++) {
        push @{$self->{cipher_suites}}, $self->{_io}->read_u2be();
    }
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub cipher_suites {
    my ($self) = @_;
    return $self->{cipher_suites};
}

########################################################################
package TlsClientHello::CompressionMethods;

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

    $self->{len} = $self->{_io}->read_u1();
    $self->{compression_methods} = $self->{_io}->read_bytes($self->len());
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub compression_methods {
    my ($self) = @_;
    return $self->{compression_methods};
}

########################################################################
package TlsClientHello::Extension;

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

    $self->{type} = $self->{_io}->read_u2be();
    $self->{len} = $self->{_io}->read_u2be();
    my $_on = $self->type();
    if ($_on == 0) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = TlsClientHello::Sni->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == 16) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = TlsClientHello::Alpn->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes($self->len());
    }
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package TlsClientHello::Extensions;

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

    $self->{len} = $self->{_io}->read_u2be();
    $self->{extensions} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{extensions}}, TlsClientHello::Extension->new($self->{_io}, $self, $self->{_root});
    }
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub extensions {
    my ($self) = @_;
    return $self->{extensions};
}

########################################################################
package TlsClientHello::Protocol;

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

    $self->{strlen} = $self->{_io}->read_u1();
    $self->{name} = $self->{_io}->read_bytes($self->strlen());
}

sub strlen {
    my ($self) = @_;
    return $self->{strlen};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

########################################################################
package TlsClientHello::Random;

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

    $self->{gmt_unix_time} = $self->{_io}->read_u4be();
    $self->{random} = $self->{_io}->read_bytes(28);
}

sub gmt_unix_time {
    my ($self) = @_;
    return $self->{gmt_unix_time};
}

sub random {
    my ($self) = @_;
    return $self->{random};
}

########################################################################
package TlsClientHello::ServerName;

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

    $self->{name_type} = $self->{_io}->read_u1();
    $self->{length} = $self->{_io}->read_u2be();
    $self->{host_name} = $self->{_io}->read_bytes($self->length());
}

sub name_type {
    my ($self) = @_;
    return $self->{name_type};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub host_name {
    my ($self) = @_;
    return $self->{host_name};
}

########################################################################
package TlsClientHello::SessionId;

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

    $self->{len} = $self->{_io}->read_u1();
    $self->{sid} = $self->{_io}->read_bytes($self->len());
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub sid {
    my ($self) = @_;
    return $self->{sid};
}

########################################################################
package TlsClientHello::Sni;

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

    $self->{list_length} = $self->{_io}->read_u2be();
    $self->{server_names} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{server_names}}, TlsClientHello::ServerName->new($self->{_io}, $self, $self->{_root});
    }
}

sub list_length {
    my ($self) = @_;
    return $self->{list_length};
}

sub server_names {
    my ($self) = @_;
    return $self->{server_names};
}

########################################################################
package TlsClientHello::Version;

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

    $self->{major} = $self->{_io}->read_u1();
    $self->{minor} = $self->{_io}->read_u1();
}

sub major {
    my ($self) = @_;
    return $self->{major};
}

sub minor {
    my ($self) = @_;
    return $self->{minor};
}

1;

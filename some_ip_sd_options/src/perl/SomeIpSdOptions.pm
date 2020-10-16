# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package SomeIpSdOptions;

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

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, SomeIpSdOptions::SdOption->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package SomeIpSdOptions::SdOption;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $OPTION_TYPES_CONFIGURATION_OPTION = 1;
our $OPTION_TYPES_LOAD_BALANCING_OPTION = 2;
our $OPTION_TYPES_IPV4_ENDPOINT_OPTION = 4;
our $OPTION_TYPES_IPV6_ENDPOINT_OPTION = 6;
our $OPTION_TYPES_IPV4_MULTICAST_OPTION = 20;
our $OPTION_TYPES_IPV6_MULTICAST_OPTION = 22;
our $OPTION_TYPES_IPV4_SD_ENDPOINT_OPTION = 36;
our $OPTION_TYPES_IPV6_SD_ENDPOINT_OPTION = 38;

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

    $self->{header} = SomeIpSdOptions::SdOption::SdOptionHeader->new($self->{_io}, $self, $self->{_root});
    my $_on = $self->header()->type();
    if ($_on == $SomeIpSdOptions::SdOption::OPTION_TYPES_LOAD_BALANCING_OPTION) {
        $self->{content} = SomeIpSdOptions::SdOption::SdLoadBalancingOption->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $SomeIpSdOptions::SdOption::OPTION_TYPES_CONFIGURATION_OPTION) {
        $self->{content} = SomeIpSdOptions::SdOption::SdConfigurationOption->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $SomeIpSdOptions::SdOption::OPTION_TYPES_IPV4_SD_ENDPOINT_OPTION) {
        $self->{content} = SomeIpSdOptions::SdOption::SdIpv4SdEndpointOption->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $SomeIpSdOptions::SdOption::OPTION_TYPES_IPV4_ENDPOINT_OPTION) {
        $self->{content} = SomeIpSdOptions::SdOption::SdIpv4EndpointOption->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $SomeIpSdOptions::SdOption::OPTION_TYPES_IPV6_SD_ENDPOINT_OPTION) {
        $self->{content} = SomeIpSdOptions::SdOption::SdIpv6SdEndpointOption->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $SomeIpSdOptions::SdOption::OPTION_TYPES_IPV4_MULTICAST_OPTION) {
        $self->{content} = SomeIpSdOptions::SdOption::SdIpv4MulticastOption->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $SomeIpSdOptions::SdOption::OPTION_TYPES_IPV6_ENDPOINT_OPTION) {
        $self->{content} = SomeIpSdOptions::SdOption::SdIpv6EndpointOption->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $SomeIpSdOptions::SdOption::OPTION_TYPES_IPV6_MULTICAST_OPTION) {
        $self->{content} = SomeIpSdOptions::SdOption::SdIpv6MulticastOption->new($self->{_io}, $self, $self->{_root});
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub content {
    my ($self) = @_;
    return $self->{content};
}

########################################################################
package SomeIpSdOptions::SdOption::SdOptionHeader;

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

    $self->{length} = $self->{_io}->read_u2be();
    $self->{type} = $self->{_io}->read_u1();
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

########################################################################
package SomeIpSdOptions::SdOption::SdConfigString;

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

    $self->{length} = $self->{_io}->read_u1();
    if ($self->length() != 0) {
        $self->{_raw_config} = $self->{_io}->read_bytes($self->length());
        my $io__raw_config = IO::KaitaiStruct::Stream->new($self->{_raw_config});
        $self->{config} = SomeIpSdOptions::SdOption::SdConfigKvPair->new($io__raw_config, $self, $self->{_root});
    }
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub config {
    my ($self) = @_;
    return $self->{config};
}

sub _raw_config {
    my ($self) = @_;
    return $self->{_raw_config};
}

########################################################################
package SomeIpSdOptions::SdOption::SdConfigStringsContainer;

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

    $self->{config_strings} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{config_strings}}, SomeIpSdOptions::SdOption::SdConfigString->new($self->{_io}, $self, $self->{_root});
    }
}

sub config_strings {
    my ($self) = @_;
    return $self->{config_strings};
}

########################################################################
package SomeIpSdOptions::SdOption::SdConfigurationOption;

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

    $self->{reserved} = $self->{_io}->read_u1();
    $self->{_raw_configurations} = $self->{_io}->read_bytes(($self->_parent()->header()->length() - 1));
    my $io__raw_configurations = IO::KaitaiStruct::Stream->new($self->{_raw_configurations});
    $self->{configurations} = SomeIpSdOptions::SdOption::SdConfigStringsContainer->new($io__raw_configurations, $self, $self->{_root});
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub configurations {
    my ($self) = @_;
    return $self->{configurations};
}

sub _raw_configurations {
    my ($self) = @_;
    return $self->{_raw_configurations};
}

########################################################################
package SomeIpSdOptions::SdOption::SdIpv4MulticastOption;

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

    $self->{reserved} = $self->{_io}->read_u1();
    $self->{address} = $self->{_io}->read_bytes(4);
    $self->{reserved2} = $self->{_io}->read_u1();
    $self->{l4_protocol} = $self->{_io}->read_u1();
    $self->{port} = $self->{_io}->read_u2be();
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub address {
    my ($self) = @_;
    return $self->{address};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub l4_protocol {
    my ($self) = @_;
    return $self->{l4_protocol};
}

sub port {
    my ($self) = @_;
    return $self->{port};
}

########################################################################
package SomeIpSdOptions::SdOption::SdIpv4SdEndpointOption;

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

    $self->{reserved} = $self->{_io}->read_u1();
    $self->{address} = $self->{_io}->read_bytes(4);
    $self->{reserved2} = $self->{_io}->read_u1();
    $self->{l4_protocol} = $self->{_io}->read_u1();
    $self->{port} = $self->{_io}->read_u2be();
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub address {
    my ($self) = @_;
    return $self->{address};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub l4_protocol {
    my ($self) = @_;
    return $self->{l4_protocol};
}

sub port {
    my ($self) = @_;
    return $self->{port};
}

########################################################################
package SomeIpSdOptions::SdOption::SdIpv6MulticastOption;

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

    $self->{reserved} = $self->{_io}->read_u1();
    $self->{address} = $self->{_io}->read_bytes(16);
    $self->{reserved2} = $self->{_io}->read_u1();
    $self->{l4_protocol} = $self->{_io}->read_u1();
    $self->{port} = $self->{_io}->read_u2be();
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub address {
    my ($self) = @_;
    return $self->{address};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub l4_protocol {
    my ($self) = @_;
    return $self->{l4_protocol};
}

sub port {
    my ($self) = @_;
    return $self->{port};
}

########################################################################
package SomeIpSdOptions::SdOption::SdConfigKvPair;

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

    $self->{key} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(61, 0, 1, 1));
    $self->{value} = Encode::decode("ASCII", $self->{_io}->read_bytes_full());
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
package SomeIpSdOptions::SdOption::SdIpv6SdEndpointOption;

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

    $self->{reserved} = $self->{_io}->read_u1();
    $self->{address} = $self->{_io}->read_bytes(16);
    $self->{reserved2} = $self->{_io}->read_u1();
    $self->{l4_protocol} = $self->{_io}->read_u1();
    $self->{port} = $self->{_io}->read_u2be();
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub address {
    my ($self) = @_;
    return $self->{address};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub l4_protocol {
    my ($self) = @_;
    return $self->{l4_protocol};
}

sub port {
    my ($self) = @_;
    return $self->{port};
}

########################################################################
package SomeIpSdOptions::SdOption::SdIpv4EndpointOption;

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

    $self->{reserved} = $self->{_io}->read_u1();
    $self->{address} = $self->{_io}->read_bytes(4);
    $self->{reserved2} = $self->{_io}->read_u1();
    $self->{l4_protocol} = $self->{_io}->read_u1();
    $self->{port} = $self->{_io}->read_u2be();
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub address {
    my ($self) = @_;
    return $self->{address};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub l4_protocol {
    my ($self) = @_;
    return $self->{l4_protocol};
}

sub port {
    my ($self) = @_;
    return $self->{port};
}

########################################################################
package SomeIpSdOptions::SdOption::SdIpv6EndpointOption;

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

    $self->{reserved} = $self->{_io}->read_u1();
    $self->{address} = $self->{_io}->read_bytes(16);
    $self->{reserved2} = $self->{_io}->read_u1();
    $self->{l4_protocol} = $self->{_io}->read_u1();
    $self->{port} = $self->{_io}->read_u2be();
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub address {
    my ($self) = @_;
    return $self->{address};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub l4_protocol {
    my ($self) = @_;
    return $self->{l4_protocol};
}

sub port {
    my ($self) = @_;
    return $self->{port};
}

########################################################################
package SomeIpSdOptions::SdOption::SdLoadBalancingOption;

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

    $self->{reserved} = $self->{_io}->read_u1();
    $self->{priority} = $self->{_io}->read_u2be();
    $self->{weight} = $self->{_io}->read_u2be();
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub priority {
    my ($self) = @_;
    return $self->{priority};
}

sub weight {
    my ($self) = @_;
    return $self->{weight};
}

1;

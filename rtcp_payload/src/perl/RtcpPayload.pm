# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package RtcpPayload;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $PAYLOAD_TYPE_FIR = 192;
our $PAYLOAD_TYPE_NACK = 193;
our $PAYLOAD_TYPE_IJ = 195;
our $PAYLOAD_TYPE_SR = 200;
our $PAYLOAD_TYPE_RR = 201;
our $PAYLOAD_TYPE_SDES = 202;
our $PAYLOAD_TYPE_BYE = 203;
our $PAYLOAD_TYPE_APP = 204;
our $PAYLOAD_TYPE_RTPFB = 205;
our $PAYLOAD_TYPE_PSFB = 206;
our $PAYLOAD_TYPE_XR = 207;
our $PAYLOAD_TYPE_AVB = 208;
our $PAYLOAD_TYPE_RSI = 209;

our $SDES_SUBTYPE_PAD = 0;
our $SDES_SUBTYPE_CNAME = 1;
our $SDES_SUBTYPE_NAME = 2;
our $SDES_SUBTYPE_EMAIL = 3;
our $SDES_SUBTYPE_PHONE = 4;
our $SDES_SUBTYPE_LOC = 5;
our $SDES_SUBTYPE_TOOL = 6;
our $SDES_SUBTYPE_NOTE = 7;
our $SDES_SUBTYPE_PRIV = 8;

our $PSFB_SUBTYPE_PLI = 1;
our $PSFB_SUBTYPE_SLI = 2;
our $PSFB_SUBTYPE_RPSI = 3;
our $PSFB_SUBTYPE_FIR = 4;
our $PSFB_SUBTYPE_TSTR = 5;
our $PSFB_SUBTYPE_TSTN = 6;
our $PSFB_SUBTYPE_VBCM = 7;
our $PSFB_SUBTYPE_AFB = 15;

our $RTPFB_SUBTYPE_NACK = 1;
our $RTPFB_SUBTYPE_TMMBR = 3;
our $RTPFB_SUBTYPE_TMMBN = 4;
our $RTPFB_SUBTYPE_RRR = 5;
our $RTPFB_SUBTYPE_TRANSPORT_FEEDBACK = 15;

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

    $self->{rtcp_packets} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{rtcp_packets}}, RtcpPayload::RtcpPacket->new($self->{_io}, $self, $self->{_root});
    }
}

sub rtcp_packets {
    my ($self) = @_;
    return $self->{rtcp_packets};
}

########################################################################
package RtcpPayload::PsfbAfbRembPacket;

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

    $self->{num_ssrc} = $self->{_io}->read_u1();
    $self->{br_exp} = $self->{_io}->read_bits_int(6);
    $self->{br_mantissa} = $self->{_io}->read_bits_int(18);
    $self->{_io}->align_to_byte();
    $self->{ssrc_list} = ();
    my $n_ssrc_list = $self->num_ssrc();
    for (my $i = 0; $i < $n_ssrc_list; $i++) {
        $self->{ssrc_list}[$i] = $self->{_io}->read_u4be();
    }
}

sub max_total_bitrate {
    my ($self) = @_;
    return $self->{max_total_bitrate} if ($self->{max_total_bitrate});
    $self->{max_total_bitrate} = ($self->br_mantissa() * (1 << $self->br_exp()));
    return $self->{max_total_bitrate};
}

sub num_ssrc {
    my ($self) = @_;
    return $self->{num_ssrc};
}

sub br_exp {
    my ($self) = @_;
    return $self->{br_exp};
}

sub br_mantissa {
    my ($self) = @_;
    return $self->{br_mantissa};
}

sub ssrc_list {
    my ($self) = @_;
    return $self->{ssrc_list};
}

########################################################################
package RtcpPayload::SrPacket;

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

    $self->{ssrc} = $self->{_io}->read_u4be();
    $self->{ntp_msw} = $self->{_io}->read_u4be();
    $self->{ntp_lsw} = $self->{_io}->read_u4be();
    $self->{rtp_timestamp} = $self->{_io}->read_u4be();
    $self->{sender_packet_count} = $self->{_io}->read_u4be();
    $self->{sender_octet_count} = $self->{_io}->read_u4be();
    $self->{report_block} = ();
    my $n_report_block = $self->_parent()->subtype();
    for (my $i = 0; $i < $n_report_block; $i++) {
        $self->{report_block}[$i] = RtcpPayload::ReportBlock->new($self->{_io}, $self, $self->{_root});
    }
}

sub ntp {
    my ($self) = @_;
    return $self->{ntp} if ($self->{ntp});
    $self->{ntp} = (($self->ntp_msw() << 32) & $self->ntp_lsw());
    return $self->{ntp};
}

sub ssrc {
    my ($self) = @_;
    return $self->{ssrc};
}

sub ntp_msw {
    my ($self) = @_;
    return $self->{ntp_msw};
}

sub ntp_lsw {
    my ($self) = @_;
    return $self->{ntp_lsw};
}

sub rtp_timestamp {
    my ($self) = @_;
    return $self->{rtp_timestamp};
}

sub sender_packet_count {
    my ($self) = @_;
    return $self->{sender_packet_count};
}

sub sender_octet_count {
    my ($self) = @_;
    return $self->{sender_octet_count};
}

sub report_block {
    my ($self) = @_;
    return $self->{report_block};
}

########################################################################
package RtcpPayload::RrPacket;

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

    $self->{ssrc} = $self->{_io}->read_u4be();
    $self->{report_block} = ();
    my $n_report_block = $self->_parent()->subtype();
    for (my $i = 0; $i < $n_report_block; $i++) {
        $self->{report_block}[$i] = RtcpPayload::ReportBlock->new($self->{_io}, $self, $self->{_root});
    }
}

sub ssrc {
    my ($self) = @_;
    return $self->{ssrc};
}

sub report_block {
    my ($self) = @_;
    return $self->{report_block};
}

########################################################################
package RtcpPayload::RtcpPacket;

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

    $self->{version} = $self->{_io}->read_bits_int(2);
    $self->{padding} = $self->{_io}->read_bits_int(1);
    $self->{subtype} = $self->{_io}->read_bits_int(5);
    $self->{_io}->align_to_byte();
    $self->{payload_type} = $self->{_io}->read_u1();
    $self->{length} = $self->{_io}->read_u2be();
    my $_on = $self->payload_type();
    if ($_on == $RtcpPayload::PAYLOAD_TYPE_SR) {
        $self->{_raw_body} = $self->{_io}->read_bytes((4 * $self->length()));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = RtcpPayload::SrPacket->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $RtcpPayload::PAYLOAD_TYPE_PSFB) {
        $self->{_raw_body} = $self->{_io}->read_bytes((4 * $self->length()));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = RtcpPayload::PsfbPacket->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $RtcpPayload::PAYLOAD_TYPE_RR) {
        $self->{_raw_body} = $self->{_io}->read_bytes((4 * $self->length()));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = RtcpPayload::RrPacket->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $RtcpPayload::PAYLOAD_TYPE_RTPFB) {
        $self->{_raw_body} = $self->{_io}->read_bytes((4 * $self->length()));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = RtcpPayload::RtpfbPacket->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $RtcpPayload::PAYLOAD_TYPE_SDES) {
        $self->{_raw_body} = $self->{_io}->read_bytes((4 * $self->length()));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = RtcpPayload::SdesPacket->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes((4 * $self->length()));
    }
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub subtype {
    my ($self) = @_;
    return $self->{subtype};
}

sub payload_type {
    my ($self) = @_;
    return $self->{payload_type};
}

sub length {
    my ($self) = @_;
    return $self->{length};
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
package RtcpPayload::SdesTlv;

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

    $self->{type} = $self->{_io}->read_u1();
    if ($self->type() != $RtcpPayload::SDES_SUBTYPE_PAD) {
        $self->{length} = $self->{_io}->read_u1();
    }
    if ($self->type() != $RtcpPayload::SDES_SUBTYPE_PAD) {
        $self->{value} = $self->{_io}->read_bytes($self->length());
    }
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package RtcpPayload::ReportBlock;

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

    $self->{ssrc_source} = $self->{_io}->read_u4be();
    $self->{lost_val} = $self->{_io}->read_u1();
    $self->{highest_seq_num_received} = $self->{_io}->read_u4be();
    $self->{interarrival_jitter} = $self->{_io}->read_u4be();
    $self->{lsr} = $self->{_io}->read_u4be();
    $self->{dlsr} = $self->{_io}->read_u4be();
}

sub fraction_lost {
    my ($self) = @_;
    return $self->{fraction_lost} if ($self->{fraction_lost});
    $self->{fraction_lost} = ($self->lost_val() >> 24);
    return $self->{fraction_lost};
}

sub cumulative_packets_lost {
    my ($self) = @_;
    return $self->{cumulative_packets_lost} if ($self->{cumulative_packets_lost});
    $self->{cumulative_packets_lost} = ($self->lost_val() & 16777215);
    return $self->{cumulative_packets_lost};
}

sub ssrc_source {
    my ($self) = @_;
    return $self->{ssrc_source};
}

sub lost_val {
    my ($self) = @_;
    return $self->{lost_val};
}

sub highest_seq_num_received {
    my ($self) = @_;
    return $self->{highest_seq_num_received};
}

sub interarrival_jitter {
    my ($self) = @_;
    return $self->{interarrival_jitter};
}

sub lsr {
    my ($self) = @_;
    return $self->{lsr};
}

sub dlsr {
    my ($self) = @_;
    return $self->{dlsr};
}

########################################################################
package RtcpPayload::RtpfbTransportFeedbackPacket;

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

    $self->{base_sequence_number} = $self->{_io}->read_u2be();
    $self->{packet_status_count} = $self->{_io}->read_u2be();
    $self->{b4} = $self->{_io}->read_u4be();
    $self->{remaining} = $self->{_io}->read_bytes_full();
}

sub reference_time {
    my ($self) = @_;
    return $self->{reference_time} if ($self->{reference_time});
    $self->{reference_time} = ($self->b4() >> 8);
    return $self->{reference_time};
}

sub fb_pkt_count {
    my ($self) = @_;
    return $self->{fb_pkt_count} if ($self->{fb_pkt_count});
    $self->{fb_pkt_count} = ($self->b4() & 255);
    return $self->{fb_pkt_count};
}

sub packet_status {
    my ($self) = @_;
    return $self->{packet_status} if ($self->{packet_status});
    $self->{packet_status} = $self->{_io}->read_bytes(0);
    return $self->{packet_status};
}

sub recv_delta {
    my ($self) = @_;
    return $self->{recv_delta} if ($self->{recv_delta});
    $self->{recv_delta} = $self->{_io}->read_bytes(0);
    return $self->{recv_delta};
}

sub base_sequence_number {
    my ($self) = @_;
    return $self->{base_sequence_number};
}

sub packet_status_count {
    my ($self) = @_;
    return $self->{packet_status_count};
}

sub b4 {
    my ($self) = @_;
    return $self->{b4};
}

sub remaining {
    my ($self) = @_;
    return $self->{remaining};
}

########################################################################
package RtcpPayload::PsfbPacket;

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

    $self->{ssrc} = $self->{_io}->read_u4be();
    $self->{ssrc_media_source} = $self->{_io}->read_u4be();
    my $_on = $self->fmt();
    if ($_on == $RtcpPayload::PSFB_SUBTYPE_AFB) {
        $self->{_raw_fci_block} = $self->{_io}->read_bytes_full();
        my $io__raw_fci_block = IO::KaitaiStruct::Stream->new($self->{_raw_fci_block});
        $self->{fci_block} = RtcpPayload::PsfbAfbPacket->new($io__raw_fci_block, $self, $self->{_root});
    }
    else {
        $self->{fci_block} = $self->{_io}->read_bytes_full();
    }
}

sub fmt {
    my ($self) = @_;
    return $self->{fmt} if ($self->{fmt});
    $self->{fmt} = $self->_parent()->subtype();
    return $self->{fmt};
}

sub ssrc {
    my ($self) = @_;
    return $self->{ssrc};
}

sub ssrc_media_source {
    my ($self) = @_;
    return $self->{ssrc_media_source};
}

sub fci_block {
    my ($self) = @_;
    return $self->{fci_block};
}

sub _raw_fci_block {
    my ($self) = @_;
    return $self->{_raw_fci_block};
}

########################################################################
package RtcpPayload::SourceChunk;

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

    $self->{ssrc} = $self->{_io}->read_u4be();
    $self->{sdes_tlv} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{sdes_tlv}}, RtcpPayload::SdesTlv->new($self->{_io}, $self, $self->{_root});
    }
}

sub ssrc {
    my ($self) = @_;
    return $self->{ssrc};
}

sub sdes_tlv {
    my ($self) = @_;
    return $self->{sdes_tlv};
}

########################################################################
package RtcpPayload::SdesPacket;

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

    $self->{source_chunk} = ();
    my $n_source_chunk = $self->source_count();
    for (my $i = 0; $i < $n_source_chunk; $i++) {
        $self->{source_chunk}[$i] = RtcpPayload::SourceChunk->new($self->{_io}, $self, $self->{_root});
    }
}

sub source_count {
    my ($self) = @_;
    return $self->{source_count} if ($self->{source_count});
    $self->{source_count} = $self->_parent()->subtype();
    return $self->{source_count};
}

sub source_chunk {
    my ($self) = @_;
    return $self->{source_chunk};
}

########################################################################
package RtcpPayload::RtpfbPacket;

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

    $self->{ssrc} = $self->{_io}->read_u4be();
    $self->{ssrc_media_source} = $self->{_io}->read_u4be();
    my $_on = $self->fmt();
    if ($_on == $RtcpPayload::RTPFB_SUBTYPE_TRANSPORT_FEEDBACK) {
        $self->{_raw_fci_block} = $self->{_io}->read_bytes_full();
        my $io__raw_fci_block = IO::KaitaiStruct::Stream->new($self->{_raw_fci_block});
        $self->{fci_block} = RtcpPayload::RtpfbTransportFeedbackPacket->new($io__raw_fci_block, $self, $self->{_root});
    }
    else {
        $self->{fci_block} = $self->{_io}->read_bytes_full();
    }
}

sub fmt {
    my ($self) = @_;
    return $self->{fmt} if ($self->{fmt});
    $self->{fmt} = $self->_parent()->subtype();
    return $self->{fmt};
}

sub ssrc {
    my ($self) = @_;
    return $self->{ssrc};
}

sub ssrc_media_source {
    my ($self) = @_;
    return $self->{ssrc_media_source};
}

sub fci_block {
    my ($self) = @_;
    return $self->{fci_block};
}

sub _raw_fci_block {
    my ($self) = @_;
    return $self->{_raw_fci_block};
}

########################################################################
package RtcpPayload::PacketStatusChunk;

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

    $self->{t} = $self->{_io}->read_bits_int(1);
    if ($self->t() == 0) {
        $self->{s2} = $self->{_io}->read_bits_int(2);
    }
    if ($self->t() == 1) {
        $self->{s1} = $self->{_io}->read_bits_int(1);
    }
    if ($self->t() == 0) {
        $self->{rle} = $self->{_io}->read_bits_int(13);
    }
    if ($self->t() == 1) {
        $self->{symbol_list} = $self->{_io}->read_bits_int(14);
    }
}

sub s {
    my ($self) = @_;
    return $self->{s} if ($self->{s});
    $self->{s} = ($self->t() == 0 ? $self->s2() : ($self->s1() == 0 ? 1 : 0));
    return $self->{s};
}

sub t {
    my ($self) = @_;
    return $self->{t};
}

sub s2 {
    my ($self) = @_;
    return $self->{s2};
}

sub s1 {
    my ($self) = @_;
    return $self->{s1};
}

sub rle {
    my ($self) = @_;
    return $self->{rle};
}

sub symbol_list {
    my ($self) = @_;
    return $self->{symbol_list};
}

########################################################################
package RtcpPayload::PsfbAfbPacket;

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

    $self->{uid} = $self->{_io}->read_u4be();
    my $_on = $self->uid();
    if ($_on == 1380273474) {
        $self->{_raw_contents} = $self->{_io}->read_bytes_full();
        my $io__raw_contents = IO::KaitaiStruct::Stream->new($self->{_raw_contents});
        $self->{contents} = RtcpPayload::PsfbAfbRembPacket->new($io__raw_contents, $self, $self->{_root});
    }
    else {
        $self->{contents} = $self->{_io}->read_bytes_full();
    }
}

sub uid {
    my ($self) = @_;
    return $self->{uid};
}

sub contents {
    my ($self) = @_;
    return $self->{contents};
}

sub _raw_contents {
    my ($self) = @_;
    return $self->{_raw_contents};
}

1;

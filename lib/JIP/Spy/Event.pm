package JIP::Spy::Event;

use strict;
use warnings;
use version 0.77;

use English qw(-no_match_vars);

our $VERSION = version->declare('v0.0.1');

sub new {
    my ($class, %param) = @ARG;

    return bless (
        {
            method     => $param{'method'},
            arguments  => $param{'arguments'},
            want_array => $param{'want_array'},
            times      => $param{'times'},
        },
        $class,
    );
}

sub method {
    my ($self) = @ARG;

    return $self->{'method'};
}

sub arguments {
    my ($self) = @ARG;

    return $self->{'arguments'};
}

sub want_array {
    my ($self) = @ARG;

    return $self->{'want_array'};
}

sub times {
    my ($self) = @ARG;

    return $self->{'times'};
}

1;

package JIP::Spy::Event;

use strict;
use warnings;
use version 0.77;

use English qw(-no_match_vars);

our $VERSION = version->declare('v0.0.5');

sub new {
    my ( $class, %param ) = @ARG;

    return bless(
        {
            method     => $param{method},
            arguments  => $param{arguments},
            want_array => $param{want_array},
            times      => $param{times},
        },
        $class,
    );
}

sub method {
    my ($self) = @ARG;

    return $self->{method};
}

sub arguments {
    my ($self) = @ARG;

    return $self->{arguments};
}

sub want_array {
    my ($self) = @ARG;

    return $self->{want_array};
}

sub times {
    my ($self) = @ARG;

    return $self->{times};
}

1;

__END__

=head1 NAME

JIP::Spy::Event - Object representation of an individual call to a spied method

=head1 VERSION

This document describes L<JIP::Spy::Event> version C<v0.0.5>.

=head1 SYNOPSIS

    use JIP::Spy::Event;

    my $spy_event = JIP::Spy::Event->new(
        method     => 'method_name',
        arguments  => [],
        want_array => 1,
        times      => 42,
    );

    $spy_event->method();     # 'method_name'
    $spy_event->arguments();  # []
    $spy_event->want_array(); # 1
    $spy_event->times();      # 42

=head1 ATTRIBUTES

L<JIP::Spy::Event> implements the following attributes.

=head2 method

    $string = $spy_event->method();

Method name.

=head2 arguments

    $arrayref = $spy_event->arguments();

Returns a list of the arguments passed to method.

=head2 want_array

    $want_array = $spy_event->want_array(); # 1/q{}/undef

Returns result of built in function C<wantarray>.

=head2 times

    $count = $spy_event->times();

The number of times the C<method> was called.

=head1 DIAGNOSTICS

None.

=head1 DEPENDENCIES

Perl 5.10.1 or later.

=head1 CONFIGURATION AND ENVIRONMENT

L<JIP::Spy::Event> requires no configuration files or environment variables.

=head1 AUTHOR

Volodymyr Zhavoronkov, C<< <flyweight at yandex dot ru> >>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2019-2023 Volodymyr Zhavoronkov.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut



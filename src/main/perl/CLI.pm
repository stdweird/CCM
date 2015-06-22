# ${license-info}
# ${developer-info}
# ${author-info}
# ${build-info}

package EDG::WP4::CCM::App::Main;

use strict;
use warnings;
use LC::Exception qw (SUCCESS);

use parent(CAF::Object);

# Initialize CCM::App::Main with CCM::App::Options 
# instance and any other arguments
sub _initialize
{
    my ($self, $app, @args) = @_;

    $self->{log} = $app;
    $self->{app} = $app;
    $self->{ARGS} = @args;

    return SUCCESS;
}

# Convenience method for $self->{app}->option()
sub option
{
    my ($self, $name) = @_;
    return $self->{app}->option($name);
}

1;

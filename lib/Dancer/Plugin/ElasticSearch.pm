package Dancer::Plugin::ElasticSearch;

# ABSTRACT: An ElasticSearch wrapper for Dancer

use Dancer qw(:syntax);
use Dancer::Plugin;

use ElasticSearch;

my $Connection;

register es => sub {
    return $Connection or _create_connection();
};

sub _create_connection {
    my $settings = plugin_setting;
    my $cxn      = ElasticSearch->new(%$settings)
        or die q(Error creating ElasticSearch connection);
    return $Connection = $cxn;
}

register_plugin;

true;

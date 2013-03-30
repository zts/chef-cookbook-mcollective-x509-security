
## Installing from github
default['mcollective-x509-security']['github']['url_base'] = "https://raw.github.com/VendaTech/mcollective-x509-security"
default['mcollective-x509-security']['github']['revision'] = "master"

# Two versions of the plugin are available - for mcollective 1.2 and 2.x
default['mcollective-x509-security']['mco_version'] = 2


# Key and Cert locations
default['mcollective-x509-security']['certs']['server_key'] = '/etc/mcollective/server_key.pem'
default['mcollective-x509-security']['certs']['server_cert'] = '/etc/mcollective/server_cert.pem'
default['mcollective-x509-security']['certs']['client_key'] = '/etc/mcollective/client_key.pem'
default['mcollective-x509-security']['certs']['client_cert'] = '/etc/mcollective/client_cert.pem'
default['mcollective-x509-security']['certs']['ca_cert'] = '/etc/mcollective/server_cacert.pem'

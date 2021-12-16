package 'gcc'
package 'zlib'
package 'zlib-devel'
package 'pcre'
package 'pcre-devel'
package 'openssl'
package 'openssl-devel'
package 'geoip-devel'

template '/tmp/hello.txt' do
source 'config.erb'
#variables(ver: node['nginx']['version'])
end

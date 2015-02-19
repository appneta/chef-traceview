majorver = node['platform_version'].to_i.to_s
arch = node['kernel']['machine']

yum_repository "tracelytics" do
    url "http://yum.tracelytics.com/#{majorver}/#{arch}"
    gpgkey 'https://yum.tracelytics.com/RPM-GPG-KEY-tracelytics'
    description 'Tracelytics repository'
    action :create
end

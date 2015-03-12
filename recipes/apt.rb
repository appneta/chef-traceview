include_recipe "apt"

remote_file "/tmp/tracelytics.key" do
    source "https://apt.tracelytics.com/tracelytics-apt-key.pub"
    mode "0644"
    checksum "6c560210a2265cba05edcba6629b8e3383db414bab94a8c89d1369ad5b56691e"
end

execute "add-apt-key" do
    command "apt-key add /tmp/tracelytics.key"
    action :run
    not_if "apt-key list | grep 03311F21"
end

apt_repository "tracelytics" do
    uri "http://apt.tracelytics.com/"
    components ["main"]
    distribution node[:lsb][:codename]
end


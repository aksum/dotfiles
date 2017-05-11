import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    '.molecule/ansible_inventory').get_hosts('all')


def test_tmux_is_installed(host):
    tmux = host.package("tmux")
    assert tmux.is_installed


def test_tmux_file(host):
    f = host.file("/home/root/.tmux.conf")
    assert f.exists
    assert f.is_file
    assert f.user == 'root'
    assert f.group == 'root'

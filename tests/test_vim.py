import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    '.molecule/ansible_inventory').get_hosts('all')


def test_vim_is_installed(host):
    vim = host.package("vim")
    assert vim.is_installed


def test_vim_file(host):
    f = host.file("/home/root/.vimrc")
    assert f.exists
    assert f.is_file
    assert f.user == 'root'
    assert f.group == 'root'

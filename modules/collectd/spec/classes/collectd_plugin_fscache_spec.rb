require 'spec_helper'

describe 'collectd::plugin::fscache', type: :class do
  let :facts do
    {
      collectd_version: '4.7.0',
      operatingsystemmajrelease: '7',
      python_dir: '/usr/local/lib/python2.7/dist-packages'
    }
  end

  context ':ensure => present' do
    let :facts do
      {
        osfamily: 'FreeBSD',
        operatingsystem: 'FreeBSD',
        os: { family: 'FreeBSD' },
        collectd_version: '4.7.0',
        operatingsystemmajrelease: '7',
        python_dir: '/usr/local/lib/python2.7/dist-packages'
      }
    end

    it 'Will create 10-fscache.conf' do
      is_expected.to contain_file('fscache.load').with(ensure: 'present',
                                                       path: '/usr/local/etc/collectd/10-fscache.conf',
                                                       content: %r{\#\ Generated by Puppet\nLoadPlugin fscache\n})
    end
  end

  context ':ensure => absent' do
    let :facts do
      {
        osfamily: 'FreeBSD',
        operatingsystem: 'FreeBSD',
        os: { family: 'FreeBSD' },
        collectd_version: '4.7.0',
        operatingsystemmajrelease: '7',
        python_dir: '/usr/local/lib/python2.7/dist-packages'
      }
    end
    let :params do
      { ensure: 'absent' }
    end

    it 'Will not create 10-fscache.conf' do
      is_expected.to contain_file('fscache.load').with(ensure: 'absent',
                                                       path: '/usr/local/etc/collectd/10-fscache.conf')
    end
  end
end

require 'spec_helper'

describe 'keepalived::vrrp::instance', type: :define do
  let (:title) { '_NAME_' }
  let (:facts) { debian_facts }
  let (:pre_condition) { '$concat_basedir = "/tmp"' }
  let (:mandatory_params) do
    {
      interface: '',
      priority: 10,
      state: '',
      virtual_ipaddress: [],
      virtual_router_id: 10
    }
  end

  describe 'without parameters' do
    it do
      expect { is_expected.to create_class('keepalived') }.to raise_error(Puppet::Error)
    end
  end

  describe 'with parameter interface' do
    let (:params) do
      mandatory_params.merge(
        interface: '_VALUE_'
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /interface.*_VALUE_/
        )
    }
  end

  describe 'with parameter priority' do
    [1, 100, 254].each do |valid_priority|
      context "with valid #{valid_priority}" do
        let (:params) do
          mandatory_params.merge(
            priority: valid_priority
          )
        end

        it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
              'content' => /\spriority\s+#{valid_priority}$/
            )
        }
      end
    end

    ['__VALUE__', -1, 0, 255, 500].each do |invalid_priority|
      context "with invalid #{invalid_priority}" do
        let (:params) do
          mandatory_params.merge(
            priority: invalid_priority
          )
        end

        it {
          expect { is_expected.to create_keepalived__vrrp__instance('_NAME_') }.to \
            raise_error(Puppet::Error, /priority must be an integer 1 >= and <= 254/)
        }
      end
    end
  end

  describe 'with parameter state' do
    let (:params) do
      mandatory_params.merge(
        state: '_VALUE_'
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /state.*_VALUE_/
        )
    }
  end

  describe 'with parameter virtual_ipaddress' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress: ['_VALUE_']
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /_VALUE_/
        )
    }
  end

  describe 'with parameter track_interface' do
    let (:params) do
      mandatory_params.merge(
        track_interface: ['_VALUE_'],
        virtual_ipaddress: ['_VALUE_']
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /_VALUE_/
        )
    }
  end

  describe 'with parameter notify_script' do
    let (:params) do
      mandatory_params.merge(
        notify_script: '_VALUE_'
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /_VALUE_/
        )
    }
  end

  describe 'with parameter smtp_alert' do
    let (:params) do
      mandatory_params.merge(
        smtp_alert: true
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /smtp_alert/
        )
    }
  end

  describe 'with parameter nopreempt' do
    let (:params) do
      mandatory_params.merge(
        nopreempt: true
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /nopreempt/
        )
    }
  end

  describe 'with parameter notify_script_master' do
    let (:params) do
      mandatory_params.merge(
        notify_script_master: '_VALUE_'
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /notify_master.*_VALUE_/
        )
    }
  end

  describe 'with parameter notify_script_backup' do
    let (:params) do
      mandatory_params.merge(
        notify_script_backup: '_VALUE_'
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /notify_backup.*_VALUE_/
        )
    }
  end

  describe 'with parameter notify_script_fault' do
    let (:params) do
      mandatory_params.merge(
        notify_script_fault: '_VALUE_'
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /notify_fault.*_VALUE_/
        )
    }
  end

  describe 'with parameter notify_script_stop' do
    let (:params) do
      mandatory_params.merge(
        notify_script_stop: '_VALUE_'
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /notify_stop.*_VALUE_/
        )
    }
  end

  describe 'with parameter notify_script' do
    let (:params) do
      mandatory_params.merge(
        notify_script: '_VALUE_'
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /notify.*_VALUE_/
        )
    }
  end

  describe 'with parameter virtual_router_id' do
    [1, 100, 255].each do |valid_router_id|
      context "with valid #{valid_router_id}" do
        let (:params) do
          mandatory_params.merge(
            virtual_router_id: valid_router_id
          )
        end

        it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
              'content' => /\svirtual_router_id\s+#{valid_router_id}$/
            )
        }
      end
    end

    ['__VALUE__', -1, 0, 256, 500].each do |invalid_router_id|
      context "with invalid #{invalid_router_id}" do
        let (:params) do
          mandatory_params.merge(
            virtual_router_id: invalid_router_id
          )
        end

        it {
          expect { is_expected.to create_keepalived__vrrp__instance('_NAME_') }.to \
            raise_error(Puppet::Error, /virtual_router_id must be an integer >= 1 and <= 255/)
        }
      end
    end
  end

  describe 'with parameter auth_type' do
    let (:params) do
      mandatory_params.merge(
        auth_type: '_VALUE_'
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /auth_type.*_VALUE_/
        )
    }
  end

  describe 'with parameter auth_pass' do
    let (:params) do
      mandatory_params.merge(
        auth_type: '_AUTH_TYPE_',
        auth_pass: '_VALUE_'
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /auth_pass.*_VALUE_/
        )
    }
  end

  describe 'with parameter track_script' do
    let (:params) do
      mandatory_params.merge(
        track_script: ['_VALUE_']
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /track_script/,
          'content' => /_VALUE_/
        )
    }
  end

  describe 'with parameter lvs_interface' do
    let (:params) do
      mandatory_params.merge(
        lvs_interface: '_VALUE_'
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /lvs_sync_daemon_interface _VALUE_/
        )
    }
  end

  describe 'with parameter advert_int' do
    let (:params) do
      mandatory_params.merge(
        advert_int: '_VALUE_'
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /advert_int/,
          'content' => /_VALUE_/
        )
    }
  end

  describe 'with parameter garp_master_delay' do
    let (:params) do
      mandatory_params.merge(
        garp_master_delay: '_VALUE_'
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /garp_master_delay/,
          'content' => /_VALUE_/
        )
    }
  end

  describe 'with parameter garp_master_refresh' do
    let (:params) do
      mandatory_params.merge(
        garp_master_refresh: '_VALUE_'
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /garp_master_refresh/,
          'content' => /_VALUE_/
        )
    }
  end

  describe 'with parameter virtual_ipaddress_int' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_ipaddress: ['192.168.1.1']
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.1 dev _VALUE_/
        )
    }
  end

  describe 'with virtual_ipaddress as hash' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_ipaddress: { 'ip' => '192.168.1.1' }
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /^\s+192.168.1.1 dev _VALUE_/
        )
    }
  end

  describe 'with virtual_ipaddress as array of hashes' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_ipaddress: [{ 'ip' => '192.168.1.1' },
                            { 'ip' => '192.168.1.2' }]
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.1 dev _VALUE_/
        )
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.2 dev _VALUE_/
        )
    }
  end

  describe 'with virtual_ipaddress as array of hashes and array of ips' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_ipaddress: [{ 'ip' => '192.168.1.1' },
                            { 'ip' => ['192.168.1.2', '192.168.1.3'] }]
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.1 dev _VALUE_/
        )
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.2 dev _VALUE_/
        )
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.3 dev _VALUE_/
        )
    }
  end

  # device in hash overrides anything
  describe 'with virtual_ipaddress as hash containing device' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_ipaddress: [{ 'ip' => '192.168.1.1',
                              'dev' => '_DEV_' }]
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.1 dev _DEV_/
        )
    }
  end
  describe 'with virtual_ipaddress as hash containing device and array of ips' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_ipaddress: [{ 'ip' => ['192.168.1.1', '192.168.1.2'],
                              'dev' => '_DEV_' }]
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.1 dev _DEV_/
        )
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.2 dev _DEV_/
        )
    }
  end

  describe 'with virtual_ipaddress as hash containing label' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_ipaddress: [{ 'ip' => '192.168.1.1',
                              'label' => '_LABEL_' }]
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.1 dev _VALUE_ label _LABEL_/
        )
    }
  end

  describe 'with virtual_ipaddress as hash containing brd' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_ipaddress: [{ 'ip' => '192.168.1.1',
                              'brd' => '_BRD_' }]
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.1 dev _VALUE_ brd _BRD_/
        )
    }
  end

  describe 'with virtual_ipaddress as hash containing scope' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_ipaddress: [{ 'ip' => '192.168.1.1',
                              'scope' => '_SCOPE_' }]
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.1 dev _VALUE_ scope _SCOPE_/
        )
    }
  end

  describe 'with parameter virtual_ipaddress_excluded' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_ipaddress_excluded: ['192.168.1.1']
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.1 dev _VALUE_/
        )
    }
  end

  describe 'with virtual_ipaddress_excluded as hash' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_ipaddress_excluded: { 'ip' => '192.168.1.1' }
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /^\s+192.168.1.1 dev _VALUE_/
        )
    }
  end

  describe 'with virtual_ipaddress_excluded as hash with array of ips' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_ipaddress_excluded: { 'ip' => ['192.168.1.1', '192.168.1.2'] }
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /^\s+192.168.1.1 dev _VALUE_/
        )
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /^\s+192.168.1.2 dev _VALUE_/
        )
    }
  end

  describe 'with virtual_ipaddress_excluded as array of hashes' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_ipaddress_excluded: [{ 'ip' => '192.168.1.1' },
                                     { 'ip' => '192.168.1.2' }]
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.1 dev _VALUE_/
        )
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.2 dev _VALUE_/
        )
    }
  end

  # device in hash overrides anything
  describe 'with virtual_ipaddress_excluded as hash containing device' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_ipaddress_excluded: [{ 'ip' => '192.168.1.1',
                                       'dev' => '_DEV_' }]
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.1 dev _DEV_/
        )
    }
  end
  describe 'with virtual_ipaddress_excluded as hash containing device and array of ips' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_ipaddress_excluded: [{ 'ip' => ['192.168.1.1', '192.168.1.2'],
                                       'dev' => '_DEV_' }]
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.1 dev _DEV_/
        )
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.2 dev _DEV_/
        )
    }
  end

  describe 'with virtual_ipaddress_excluded as hash containing label' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_ipaddress_excluded: [{ 'ip' => '192.168.1.1',
                                       'label' => '_LABEL_' }]
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.1 dev _VALUE_ label _LABEL_/
        )
    }
  end

  describe 'with virtual_ipaddress_excluded as hash containing brd' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_ipaddress_excluded: [{ 'ip' => '192.168.1.1',
                                       'brd' => '_BRD_' }]
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.1 dev _VALUE_ brd _BRD_/
        )
    }
  end

  describe 'with virtual_ipaddress_excluded as hash containing scope' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_ipaddress_excluded: [{ 'ip' => '192.168.1.1',
                                       'scope' => '_SCOPE_' }]
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /192.168.1.1 dev _VALUE_ scope _SCOPE_/
        )
    }
  end

  describe 'with virtual_routes as hash' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_routes: { 'to' => '10.0.1.0/24', 'via' => '192.168.0.1' }
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /^\s+to 10.0.1.0\/24 via 192.168.0.1/
        )
    }
  end

  describe 'with virtual_routes as array of hashes' do
    let (:params) do
      mandatory_params.merge(
        virtual_routes: [{ 'to' => '10.0.1.0/24', 'via' => '192.168.0.1' },
                         { 'to' => '10.0.2.0/24', 'via' => '192.168.0.2' }]
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /^\s+to 10.0.1.0\/24 via 192.168.0.1/
        )
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /^\s+to 10.0.2.0\/24 via 192.168.0.2/
        )
    }
  end

  # device in hash overrides anything
  describe 'with virtual_routes as hash containing device parameter' do
    let (:params) do
      mandatory_params.merge(
        virtual_routes: [{ 'to' => '10.0.1.0/24',
                           'via' => '192.168.0.1',
                           'dev' => '_DEV_' }]
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /dev _DEV_ to 10.0.1.0\/24 via 192.168.0.1/
        )
    }
  end

  describe 'with virtual_routes as hash containing src parameter' do
    let (:params) do
      mandatory_params.merge(
        virtual_routes: [{ 'to' => '10.0.1.0/24',
                           'via' => '192.168.0.1',
                           'src' => '_SOURCE_' }]
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /src _SOURCE_ to 10.0.1.0\/24 via 192.168.0.1/
        )
    }
  end

  describe 'with virtual_routes as hash containing scope parameter' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_routes: [{ 'to' => '10.0.1.0/24',
                           'via'   => '192.168.0.1',
                           'scope' => '_SCOPE_' }]
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /scope _SCOPE_ to 10.0.1.0\/24 via 192.168.0.1/
        )
    }
  end

  describe 'with virtual_routes as hash containing table parameter' do
    let (:params) do
      mandatory_params.merge(
        virtual_ipaddress_int: '_VALUE_',
        virtual_routes: [{ 'to' => '10.0.1.0/24',
                           'via'   => '192.168.0.1',
                           'table' => '_TABLE_' }]
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /table _TABLE_ to 10.0.1.0\/24 via 192.168.0.1/
        )
    }
  end

  describe 'with parameter unicast_source_ip' do
    let (:params) do
      mandatory_params.merge(
        unicast_source_ip: '_VALUE_'
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /unicast_src_ip.*_VALUE_/
        )
    }
  end

  describe 'with parameter multicast_source_ip' do
    let (:params) do
      mandatory_params.merge(
        multicast_source_ip: '_VALUE_'
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /mcast_src_ip.*_VALUE_/
        )
    }
  end

  describe 'with unicast_peers as array containing unicast peer ip addresses' do
    let (:params) do
      mandatory_params.merge(
        unicast_peers: ['10.0.1.0', '10.0.2.0']
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /10.0.1.0/
        )
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /10.0.2.0/
        )
    }
  end

  describe 'with dont_track_primary' do
    let (:params) do
      mandatory_params.merge(
        dont_track_primary: true
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /dont_track_primary/
        )
    }
  end

  describe 'with use_vmac' do
    let (:params) do
      mandatory_params.merge(
        use_vmac: true
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /use_vmac/
        )
    }
  end

  describe 'with use_vmac => "vrrp250"' do
    let (:params) do
      mandatory_params.merge(
        use_vmac: 'vrrp250'
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /\suse_vmac\s+vrrp250$/
        )
    }
  end

  describe 'with vmac_xmit_base' do
    let (:params) do
      mandatory_params.merge(
        use_vmac: true,
        vmac_xmit_base: true
      )
    end

    it { is_expected.to create_keepalived__vrrp__instance('_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /vmac_xmit_base/
        )
    }
  end
end

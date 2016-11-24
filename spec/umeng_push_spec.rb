require 'spec_helper'

describe UmengPush do
  it 'has a version number' do
    expect(UmengPush::VERSION).not_to be nil
  end

  describe '#configure' do
    let(:config) { UmengPush.configuration }
    let(:default_config) { UmengPush.configuration }
    it 'has a default config' do
      expect(config.ios_appkey).to eq 'ios_appkey'
    end

    it 'default production_mode is false' do
      expect(config.production_mode).to eq 'false'
    end

    describe 'change configuration' do
      before :each do
        UmengPush.configure do |config|
          config.ios_appkey = 'new_ios_appkey'
          config.android_appkey = 'new_android_appkey'
          config.ios_app_master_secret = 'new_ios_secret'
          config.android_app_master_secret = 'new_android_secret'
          config.production_mode = 'true'
        end
      end

      it 'configure ok' do
        expect(config.ios_appkey).to eq 'new_ios_appkey'
      end
    end
  end
end

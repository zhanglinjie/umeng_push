if Rails.env.production?
  UmengPush.configure do |config|
    config.ios_appkey = 'ios_appkey'
    config.ios_app_master_secret = 'ios_app_master_secret'
    config.android_appkey = 'android_appkey'
    config.android_app_master_secret = 'android_app_master_secret'
    config.production_mode = 'true'
  end
else
  UmengPush.configure do |config|
    config.ios_appkey = 'ios_appkey'
    config.ios_app_master_secret = 'ios_app_master_secret'
    config.android_appkey = 'android_appkey'
    config.android_app_master_secret = 'android_app_master_secret'
    config.production_mode = 'false'
  end
end

require 'digest/md5'
require 'httpi'
require 'json'

module UmengPush
  class Client
    attr_accessor :platform, :appkey, :app_master_secret, :production_mode
    def initialize(platform, appkey, app_master_secret, production_mode=false)
      @platform = platform
      @appkey = appkey
      @app_master_secret = app_master_secret
      @production_mode = production_mode
    end

    def self.iOS
      Client.new(
        "iOS",
        UmengPush.configuration.ios_appkey,
        UmengPush.configuration.ios_app_master_secret,
        UmengPush.configuration.production_mode
      )
    end

    def self.android
      Client.new(
        "android",
        UmengPush.configuration.android_appkey,
        UmengPush.configuration.android_app_master_secret,
        UmengPush.configuration.production_mode
      )
    end

    # 消息发送
    def send_message(params={})
      post("/api/send", params.merge({
          apikey: apikey,
          timestamp: timestamp,
          production_mode: production_mode
        }))
    end

    # 单播
    def unicast(device_token, params={})
      send_message(params.merge({
          type: "unicast",
          device_tokens: device_token
        })
    end

    # 组播
    def listcast(device_tokens=[], params={})
      send_message(params.merge({
          type: "listcast",
          device_tokens: device_tokens.join(",")
        })
    end

    # 广播
    def broadcast(params={})
      send_message(params.merge({
          type: "broadcast"
        })
    end

    # 组播
    def groupcast(filter={}, params={})
      send_message(params.merge({
          type: "groupcast",
          filter: filter
        })
    end

    # 查询任务
    def check_task(task_id)
      post("/api/status", {
          appkey: appkey,
          timestamp: timestamp,
          task_id: task_id
        })
    end

    # 取消任务
    def cancel_task(task_id)
      post("/api/cancel", {
          appkey: appkey,
          timestamp: timestamp,
          task_id: task_id
        })
    end

    private
    def post(url, payload)
      params = compact_params(payload)
      sign = sign(url, params)
      response
      begin
        request = HTTPI::Request.new
        request.url = "#{UmengPush::HOST}#{url}?sign=#{sign}"
        request.open_timeout = 3
        request.read_timeout = 3
        request.body = params.to_json
        response = HTTPI.post(request)
      rescue => e
        raise ResponseError.new("0", data: {}, message: e.message)
      end
      response_body_json = JSON.load(response.body)
      check_response!(response_body_json)
      response_body_json
    end

    def check_response!(response_body_json)
      if response_body_json['ret'] != 'SUCCESS'
        raise ResponseError.new(response_body_json['data']['error_code'], data: response_body_json['data'])
      end
    end

    def sign(url, payload)
      Digest::MD5.hexdigest('POST' + UmengPush::HOST + url + payload.to_json + app_master_secret)
    end

    def timestamp
      Time.now.to_i.to_s
    end

    def compact_params(params)
      custom_compact = Proc.new { |k, v| v.delete_if(&custom_compact) if v.kind_of?(Hash);  v.blank? }
      params.delete_if &custom_compact
    end
  end
end
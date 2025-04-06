# frozen_string_literal: true

module ConnpassApiV2
  # connpass API client
  class Client
    autoload :EventMethods, "connpass_api_v2/client/event_methods"
    autoload :GroupMethods, "connpass_api_v2/client/group_methods"
    autoload :UserMethods,  "connpass_api_v2/client/user_methods"

    include EventMethods
    include GroupMethods
    include UserMethods

    API_ENDPOINT = "https://connpass.com/api/v2"

    # @param api_key [String]
    def initialize(api_key)
      @api_key = api_key
    end

    # @return [String]
    def inspect
      # NOTE: hide @api_key
      %Q(#<ConnpassApiV2::Client:0x#{"%016X" % object_id} @api_key="*****************">)
    end

    # @param param [Object]
    #
    # @return [String,nil]
    def self.joined_param(param)
      return nil unless param

      Array(param).join(",")
    end

    # Convert to `yyyymmdd` formatted string
    #
    # @param param [String,Date,nil]
    #
    # @return [String,nil]
    def self.to_ymd(param)
      return nil unless param

      return param.strftime("%Y%m%d") if param.is_a?(Date)

      param
    end

    # Convert to `yyyymm` formatted string
    #
    # @param param [String,Date,nil]
    #
    # @return [String,nil]
    def self.to_ym(param)
      return nil unless param

      return param.strftime("%Y%m") if param.is_a?(Date)

      param
    end

    # @param order [Integer,Symbol,nil]
    #
    # @return [Integer,nil]
    def self.to_order_num(order)
      order_to_num = {
        updated_at: 1,
        started_at: 2,
        newest:     3,
      }

      order_to_num[order] || order # steep:ignore
    end

    private

    # @return [Faraday::Connection]
    def connection
      request_headers = {
        "User-Agent" => "connpass_api_v2-ruby/v#{VERSION} (+https://github.com/sue445/connpass_api_v2-ruby)",
        "Content-Type" => "application/json",
        "X-Api-Key" => @api_key,
      }

      Faraday.new(url: API_ENDPOINT, headers: request_headers) do |conn|
        conn.request :json
        conn.response :mashify, mash_class: Response
        conn.response :json
        conn.response :raise_error

        conn.adapter Faraday.default_adapter
      end
    end
  end
end

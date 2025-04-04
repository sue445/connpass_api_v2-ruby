# frozen_string_literal: true

module ConnpassApiV2
  class Client
    # @param api_key [String]
    def initialize(api_key)
      @api_key = api_key
    end

    # Search events
    #
    # @param event_id [Integer,Array<Integer>,nil]
    # @param keyword [String,Array<String>,nil]
    # @param keyword_or [String,Array<String>,nil]
    # @param ym [String,Array<String>,Date,Array<Date>,nil] string is `yyyymm` format
    # @param ymd [String,Array<String>,Date,Array<Date>,nil] string is `yyyymmdd` format
    # @param nickname [String,Array<String>,nil]
    # @param owner_nickname [String,Array<String>,nil]
    # @param group_id [Integer,Array<Integer>,nil]
    # @param subdomain [String,Array<String>,nil]
    # @param prefecture [String,Array<String>,nil]
    # @param order [Integer,Symbol,nil] `:updated_at` (1), `:started_at` (2), `:newest` (3)
    # @param start [Integer,nil]
    # @param count [Integer,nil]
    #
    # @return [ConnpassApiV2::Response]
    #
    # @see https://connpass.com/about/api/v2/#tag/%E3%82%A4%E3%83%99%E3%83%B3%E3%83%88/operation/connpass_event_event_api_v2_views_event_search
    def get_events(event_id: nil, keyword: nil, keyword_or: nil, ym: nil, ymd: nil, nickname: nil, owner_nickname: nil,
                   group_id: nil, subdomain: nil, prefecture: nil, order: nil, start: nil, count: nil)
    end

    # Convert to `yyyymmdd` formatted string
    #
    # @param param [String,Date,nil]
    #
    # @return [String,nil]
    def self.to_ymd(param)
      return nil unless param

      return param.strftime("%Y%m%d") if param.respond_to?(:strftime)

      param
    end

    # Convert to `yyyymm` formatted string
    #
    # @param param [String,Date,nil]
    #
    # @return [String,nil]
    def self.to_ym(param)
      return nil unless param

      return param.strftime("%Y%m") if param.respond_to?(:strftime)

      param
    end

    # @param order [Integer,Symbol,nil]
    #
    # @return [Integer]
    def self.to_order_num(order)
      order_to_num = {
        updated_at: 1,
        started_at: 2,
        newest:     3,
      }

      order_to_num[order] || order
    end
  end
end

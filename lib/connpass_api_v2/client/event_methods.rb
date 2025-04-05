# frozen_string_literal: true

module ConnpassApiV2
  class Client
    module EventMethods
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
        params = {
          event_id:       Client.joined_param(event_id),
          keyword:        Client.joined_param(keyword),
          keyword_or:     Client.joined_param(keyword_or),
          nickname:       Client.joined_param(nickname),
          owner_nickname: Client.joined_param(owner_nickname),
          group_id:       Client.joined_param(group_id),
          subdomain:      Client.joined_param(subdomain),
          prefecture:     Client.joined_param(prefecture),
          order:          Client.to_order_num(order),
          start:          start,
          count:          count,
        }

        if ym
          values = Array(ym).map do |v|
            # @type var v: String | Date
            Client.to_ym(v)
          end
          params[:ym] = Client.joined_param(values)
        end

        if ymd
          values = Array(ymd).map do |v|
            # @type var v: String | Date
            Client.to_ymd(v)
          end
          params[:ymd] = Client.joined_param(values)
        end

        connection.get("events/", params.compact).body
      end
    end
  end
end

# frozen_string_literal: true

module ConnpassApiV2
  class Client
    # connpass group endpoints (`/api/v2/groups`)
    module GroupMethods
      # Search groups
      #
      # @param subdomain [String,Array<String>,nil]
      # @param start [Integer,nil]
      # @param count [Integer,nil]
      #
      # @return [ConnpassApiV2::Response]
      #
      # @see https://connpass.com/about/api/v2/#tag/%E3%82%B0%E3%83%AB%E3%83%BC%E3%83%97/operation/connpass_group_group_api_v2_views_group_search
      def get_groups(subdomain: nil, start: nil, count: nil)
        params = {
          subdomain: Client.joined_param(subdomain),
          start:     start,
          count:     count,
        }

        connection.get("groups/", params.compact).body # steep:ignore NoMethod
      end
    end
  end
end

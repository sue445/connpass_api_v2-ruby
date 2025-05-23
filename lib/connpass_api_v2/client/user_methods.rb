# frozen_string_literal: true

module ConnpassApiV2
  class Client
    # connpass user endpoints (`/api/v2/users`)
    module UserMethods
      # Search users
      #
      # @param nickname [String,Array<String>,nil]
      # @param start [Integer,nil]
      # @param count [Integer,nil]
      #
      # @return [ConnpassApiV2::Response]
      #
      # @see https://connpass.com/about/api/v2/#tag/%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC/operation/connpass_account_account_api_v2_views_user_search
      def get_users(nickname: nil, start: nil, count: nil)
        params = {
          nickname: Client.joined_param(nickname),
          start:    start,
          count:    count,
        }

        connection.get("users/", params.compact).body # steep:ignore NoMethod
      end

      # Get user groups
      #
      # @param nickname [String]
      # @param start [Integer,nil]
      # @param count [Integer,nil]
      #
      # @return [ConnpassApiV2::Response]
      #
      # @see https://connpass.com/about/api/v2/#tag/%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC/operation/connpass_account_account_api_v2_views_user_group
      def get_user_groups(nickname, start: nil, count: nil)
        params = {
          start: start,
          count: count,
        }

        connection.get("users/#{nickname}/groups/", params.compact).body # steep:ignore NoMethod
      end

      # Get user attended events
      #
      # @param nickname [String]
      # @param start [Integer,nil]
      # @param count [Integer,nil]
      #
      # @return [ConnpassApiV2::Response]
      #
      # @see https://connpass.com/about/api/v2/#tag/%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC/operation/connpass_account_account_api_v2_views_user_attended_event
      def get_user_attended_events(nickname, start: nil, count: nil)
        params = {
          start: start,
          count: count,
        }

        connection.get("users/#{nickname}/attended_events/", params.compact).body # steep:ignore NoMethod
      end

      # Get user presenter events
      #
      # @param nickname [String]
      # @param start [Integer,nil]
      # @param count [Integer,nil]
      #
      # @return [ConnpassApiV2::Response]
      #
      # @see https://connpass.com/about/api/v2/#tag/%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC/operation/connpass_account_account_api_v2_views_user_presenter_event
      def get_user_presenter_events(nickname, start: nil, count: nil)
        params = {
          start: start,
          count: count,
        }

        connection.get("users/#{nickname}/presenter_events/", params.compact).body # steep:ignore NoMethod
      end
    end
  end
end

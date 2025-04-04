# frozen_string_literal: true

require_relative "connpass_api_v2/version"

require "hashie/mash"
require "faraday"
require "faraday/mashify"

module ConnpassApiV2
  class Error < StandardError; end

  autoload :Client,   "connpass_api_v2/client"
  autoload :Response, "connpass_api_v2/response"

  # @param api_key [String]
  #
  # @return [ConnpassApiV2::Client]
  def self.client(api_key)
    Client.new(api_key)
  end
end

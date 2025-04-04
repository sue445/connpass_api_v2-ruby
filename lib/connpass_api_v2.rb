# frozen_string_literal: true

require_relative "connpass_api_v2/version"

require "hashie/mash"

module ConnpassApiV2
  class Error < StandardError; end

  autoload :Client,   "connpass_api_v2/client"
  autoload :Response, "connpass_api_v2/response"
end

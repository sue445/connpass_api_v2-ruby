# frozen_string_literal: true

RSpec.describe ConnpassApiV2::Client do
  let(:client)  {  ConnpassApiV2::Client.new(api_key) }

  let(:api_key) { "thisissecret" }

  let(:request_headers) do
    {
      "Accept" => "*/*",
      "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
      "Content-Type" => "application/json",
      "User-Agent" => "connpass_api_v2-ruby/v#{ConnpassApiV2::VERSION} (+https://github.com/sue445/connpass_api_v2-ruby)",
      "X-API-KEY" => api_key,
    }
  end

  let(:response_headers) { { "Content-Type" =>  "application/json" } }

  describe "#get_events" do
    context "without params" do
      subject { client.get_events }

      before do
        stub_request(:get, "https://connpass.com/api/v2/events/").
          with(headers: request_headers).
          to_return(status: 200, headers: response_headers, body: fixture("get_events.json"))
      end

      its(:results_returned) { should eq 1 }
      its(:results_available) { should eq 91 }
      its(:results_start) { should eq 1 }
      its("events.count") { should eq 1 }
    end

    context "with params" do
      subject do
        client.get_events(
          event_id:       event_id,
          keyword:        keyword,
          keyword_or:     keyword_or,
          ym:             ym,
          ymd:            ymd,
          nickname:       nickname,
          owner_nickname: owner_nickname,
          group_id:       group_id,
          subdomain:      subdomain,
          prefecture:     prefecture,
          order:          order,
          start:          start,
          count:          count,
        )
      end

      let(:event_id)       { 364 }
      let(:keyword)        { "Ruby" }
      let(:keyword_or)     { "Go" }
      let(:ym)             { "202504" }
      let(:ymd)            { "20240401" }
      let(:nickname)       { "sue445" }
      let(:owner_nickname) { "owner" }
      let(:group_id)       { 1 }
      let(:subdomain)      { "bpstudy" }
      let(:prefecture)     { "online" }
      let(:order)          { :updated_at }
      let(:start)          { 1 }
      let(:count)          { 100 }

      before do
        stub_request(:get, "https://connpass.com/api/v2/events/").
          with(headers: request_headers).
          to_return(status: 200, headers: response_headers, body: fixture("get_events.json"))
      end

      its(:results_returned) { should eq 1 }
      its(:results_available) { should eq 91 }
      its(:results_start) { should eq 1 }
      its("events.count") { should eq 1 }
    end
  end
end

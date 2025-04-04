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

  describe ".to_ymd" do
    subject { ConnpassApiV2::Client.to_ymd(param) }

    using RSpec::Parameterized::TableSyntax

    where(:param, :expected) do
      nil                  | nil
      "20250401"           | "20250401"
      Date.new(2025, 4, 1) | "20250401"
    end

    with_them do
      it { should eq expected }
    end
  end

  describe ".to_ym" do
    subject { ConnpassApiV2::Client.to_ym(param) }

    using RSpec::Parameterized::TableSyntax

    where(:param, :expected) do
      nil                  | nil
      "202504"             | "202504"
      Date.new(2025, 4, 1) | "202504"
    end

    with_them do
      it { should eq expected }
    end
  end

  describe ".to_order_num" do
    subject { ConnpassApiV2::Client.to_order_num(order) }

    using RSpec::Parameterized::TableSyntax

    where(:order, :expected) do
      nil         | nil
      1           | 1
      :updated_at | 1
      :started_at | 2
      :newest     | 3
    end

    with_them do
      it { should eq expected }
    end
  end
end

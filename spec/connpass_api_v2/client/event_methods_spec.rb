# frozen_string_literal: true

RSpec.describe ConnpassApiV2::Client::EventMethods do
  include_context :api_variables

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

      let(:event_id)       { [364, 123] }
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
        stub_request(:get, "https://connpass.com/api/v2/events/?count=100&event_id=364,123&group_id=1&keyword=Ruby&keyword_or=Go&nickname=sue445&order=1&owner_nickname=owner&prefecture=online&start=1&subdomain=bpstudy&ym=202504&ymd=20240401").
          with(headers: request_headers).
          to_return(status: 200, headers: response_headers, body: fixture("get_events.json"))
      end

      its(:results_returned) { should eq 1 }
      its(:results_available) { should eq 91 }
      its(:results_start) { should eq 1 }
      its("events.count") { should eq 1 }
    end
  end

  describe "#get_event_presentations" do
    let(:event_id) { 364 }

    context "without params" do
      subject { client.get_event_presentations(event_id) }

      before do
        stub_request(:get, "https://connpass.com/api/v2/events/364/presentations/").
          with(headers: request_headers).
          to_return(status: 200, headers: response_headers, body: fixture("get_event_presentations.json"))
      end

      its(:results_returned)     { should eq 1 }
      its(:results_available)    { should eq 91 }
      its(:results_start)        { should eq 1 }
      its("presentations.count") { should eq 1 }
    end

    context "with params" do
      subject do
        client.get_event_presentations(event_id, start: start, count: count)
      end

      let(:event_id) { 364 }
      let(:start)    { 1 }
      let(:count)    { 100 }

      before do
        stub_request(:get, "https://connpass.com/api/v2/events/364/presentations/?count=100&start=1").
          with(headers: request_headers).
          to_return(status: 200, headers: response_headers, body: fixture("get_event_presentations.json"))
      end

      its(:results_returned)     { should eq 1 }
      its(:results_available)    { should eq 91 }
      its(:results_start)        { should eq 1 }
      its("presentations.count") { should eq 1 }
    end
  end
end

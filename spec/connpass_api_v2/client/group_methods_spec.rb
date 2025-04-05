# frozen_string_literal: true

RSpec.describe ConnpassApiV2::Client::GroupMethods do
  include_context :api_variables

  describe "#get_groups" do
    context "without params" do
      subject { client.get_groups }

      before do
        stub_request(:get, "https://connpass.com/api/v2/groups/").
          with(headers: request_headers).
          to_return(status: 200, headers: response_headers, body: fixture("get_groups.json"))
      end

      its(:results_returned) { should eq 1 }
      its(:results_available) { should eq 91 }
      its(:results_start) { should eq 1 }
      its("groups.count") { should eq 1 }
    end

    context "with params" do
      subject do
        client.get_groups(
          subdomain: subdomain,
          start:     start,
          count:     count,
        )
      end

      let(:subdomain) { "bpstudy" }
      let(:start)     { 1 }
      let(:count)     { 100 }

      before do
        stub_request(:get, "https://connpass.com/api/v2/groups/?count=100&start=1&subdomain=bpstudy").
          with(headers: request_headers).
          to_return(status: 200, headers: response_headers, body: fixture("get_groups.json"))
      end

      its(:results_returned) { should eq 1 }
      its(:results_available) { should eq 91 }
      its(:results_start) { should eq 1 }
      its("groups.count") { should eq 1 }
    end
  end
end

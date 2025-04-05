# frozen_string_literal: true

RSpec.describe ConnpassApiV2::Client::UserMethods do
  include_context :api_variables

  describe "#get_users" do
    context "without params" do
      subject { client.get_users }

      before do
        stub_request(:get, "https://connpass.com/api/v2/users/").
          with(headers: request_headers).
          to_return(status: 200, headers: response_headers, body: fixture("get_users.json"))
      end

      its(:results_returned)  { should eq 1 }
      its(:results_available) { should eq 91 }
      its(:results_start)     { should eq 1 }
      its("users.count")      { should eq 1 }
    end

    context "with params" do
      subject do
        client.get_users(
          nickname: nickname,
          start:    start,
          count:    count,
        )
      end

      let(:nickname) { "sue445" }
      let(:start)    { 1 }
      let(:count)    { 100 }

      before do
        stub_request(:get, "https://connpass.com/api/v2/users/?count=100&nickname=sue445&start=1").
          with(headers: request_headers).
          to_return(status: 200, headers: response_headers, body: fixture("get_users.json"))
      end

      its(:results_returned)  { should eq 1 }
      its(:results_available) { should eq 91 }
      its(:results_start)     { should eq 1 }
      its("users.count")      { should eq 1 }
    end
  end

  describe "#get_user_groups" do
    let(:nickname) { "sue445" }

    context "without params" do
      subject { client.get_user_groups(nickname) }

      before do
        stub_request(:get, "https://connpass.com/api/v2/users/sue445/groups/").
          with(headers: request_headers).
          to_return(status: 200, headers: response_headers, body: fixture("get_user_groups.json"))
      end

      its(:results_returned)  { should eq 1 }
      its(:results_available) { should eq 91 }
      its(:results_start)     { should eq 1 }
      its("groups.count")     { should eq 1 }
    end

    context "with params" do
      subject do
        client.get_user_groups(nickname, start: start, count: count)
      end

      let(:start) { 1 }
      let(:count) { 100 }

      before do
        stub_request(:get, "https://connpass.com/api/v2/users/sue445/groups/?count=100&start=1").
          with(headers: request_headers).
          to_return(status: 200, headers: response_headers, body: fixture("get_user_groups.json"))
      end

      its(:results_returned)  { should eq 1 }
      its(:results_available) { should eq 91 }
      its(:results_start)     { should eq 1 }
      its("groups.count")     { should eq 1 }
    end
  end
end

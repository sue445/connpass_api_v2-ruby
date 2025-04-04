# frozen_string_literal: true

RSpec.describe ConnpassApiV2 do
  describe ".client" do
    subject { ConnpassApiV2.client(api_key) }

    let(:api_key) { "thisissecret" }

    it { should be_an_instance_of ConnpassApiV2::Client }
  end
end

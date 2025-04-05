# frozen_string_literal: true

RSpec.describe ConnpassApiV2::Client do
  describe "#inspect" do
    subject { client.inspect }

    include_context :api_variables

    it { should be_start_with "#<ConnpassApiV2::Client:0x" }
    it { should_not include api_key }
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

  describe ".joined_param" do
    subject { ConnpassApiV2::Client.joined_param(param) }

    using RSpec::Parameterized::TableSyntax

    where(:param, :expected) do
      nil            | nil
      1              | "1"
      [1, 2]         | "1,2"
      "foo"          | "foo"
      ["foo", "bar"] | "foo,bar"
    end

    with_them do
      it { should eq expected }
    end
  end
end

require "rails_helper"

RSpec.describe SearchInputHelper, type: :helper do
  describe "#search_tag" do
    let(:field) { :query }
    let(:value) { "search term" }
    let(:options) { { placeholder: "Search...", input_class: "custom-class" } }

    subject { helper.search_tag(field, value, options) }

    it { is_expected.to be_kind_of(String) }
    it { is_expected.to include("Search...") }
    it { is_expected.to have_selector('svg', count: 1) }
    it { is_expected.to have_selector('input', count: 1) }
  end
end

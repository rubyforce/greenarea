require 'spec_helper'

describe ProjectDecorator do
  describe ".address" do
    let(:decorated) { create(:project, {street: "Slobodskaya 91", city: "Minsk", country: "Belarus"}).decorate }

    it { expect(decorated.address).to eq("Slobodskaya 91 Minsk Belarus") }
  end

  describe ".days_to_close" do
    let(:decorated) { create(:project, finish_investment: 2.days.from_now).decorate }

    it { expect(decorated.days_to_close).to eq(2) }
  end

  describe ".updated_at" do
    let(:decorated) { create(:project, updated_at: Date.parse("12.07.2013")).decorate }

    it { expect(decorated.updated_at).to eq("Friday, July 12") }
  end

  describe ".investment_type" do
    let(:decorated) { create(:project, investment_type: "loan").decorate }

    it { expect(decorated.investment_type).to eq("Loan") }
  end

  describe '.per_share' do
    let(:decorated) { create(:project, shares: 10, price: 100).decorate }

    it { expect(decorated.per_share).to eq(10) }
  end
end


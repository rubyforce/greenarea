require 'spec_helper'

describe SubscriptionsController do
  describe 'POST /create' do
    context 'with valid' do
      before { post :create, email: 'kate@example.com' }

      it { expect(Subscription.count).to eq(1) }
    end

    context 'with invalid' do
      before { post :create, email: '' }

      it { expect(Subscription.count).to eq(0) }
    end

    context 'with duplicating email' do
      before do
        Subscription.create(email: 'fred@example.com')
        post :create, email: 'fred@example.com'
      end

      it { expect(Subscription.count).to eq(1) }
    end
  end
end


require 'spec_helper'

describe Authentication do
  it { should belong_to(:user) }
  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:user_id) }
end

describe Authentication do
  describe '#find_user_by_auth' do
    let!(:kate) { create(:authentication, email: 'kate@example.com', provider: 'google', uid: 'google-id') }
    let!(:kate) { create(:authentication, email: 'kate@example.com', provider: 'linkedin', uid: 'linkedin-id') }
    let!(:fred) { create(:authentication, email: 'fred@example.com', provider: 'facebook', uid: 'facebook-id', email: 'fred@example.com') }
    let(:auth)  { double('auth', provider: 'facebook', uid: 'facebook-id', info: { 'email' => 'fred@example.com' }) }

    it 'should be possible to find people by auth' do
      user = Authentication.find_user_by_auth(auth)
      expect(user).to eq(fred.user)
    end
  end
end


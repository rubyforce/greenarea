require 'spec_helper'

describe UsersController do
  context 'when logged in' do
    before { logged_in(:user) }

    describe 'POST /follow' do
      let!(:user) { create(:user) }

      before { post :follow, id: user.to_param }

      it { should respond_with(:success) }

      it 'should allow current user to be as a follower of the user' do
        expect(current_user.reload.following?(user)).to be_true
      end

      it 'should create activity for the project' do
        expect(current_user.activities).to have(1).item
        expect(current_user.activities[0].key).to eq("user.user_following")
        expect(current_user.activities[0].owner).to eq(user)
      end

      it 'should create activity for the current user' do
        expect(user.activities).to have(1).item
        expect(user.activities[0].key).to eq("user.user_followed_by")
        expect(user.activities[0].owner).to eq(current_user)
      end
    end

    describe 'POST /unfollow' do
      let!(:user) { create(:user) }

      before { current_user.follow(user) }
      before { post :unfollow, id: user.to_param }

      it { should respond_with(:success) }

      it 'should allow current user to be as a follower of the user' do
        expect(current_user.reload.following?(user)).to be_false
      end
    end
  end
end


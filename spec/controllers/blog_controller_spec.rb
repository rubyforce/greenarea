require 'spec_helper'

describe BlogController do
  describe 'GET :index' do
    let!(:posts) { create_list(:post, 2) }

    before { get :index }

    it { should respond_with(:success) }
    it { should render_template('index') }

    it 'should pick up posts for blog' do
      collection = assigns(:posts)
      expect(collection).to have(2).items
      expect(collection).to include(posts[0])
      expect(collection).to include(posts[1])
    end
  end
end


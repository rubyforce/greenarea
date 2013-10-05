require 'spec_helper'

describe ContactsController do
	render_views

	describe '#new' do
		before { get :new }

		it { should respond_with(:success) }
	end

	describe '#create' do
		context 'on create a new contact' do
			before { post :create, contact: attributes_for(:contact), format: :js }

			it { expect(assigns(:contact).reload).not_to be_new_record }
			it { should respond_with(200) }
		end
	end

	describe '#create with empty fields' do
		context 'empty fields' do
			before { post :create, format: :js }

			it { should respond_with(200) }
		end
	end
end


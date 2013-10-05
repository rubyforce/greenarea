ActiveAdmin.register User do
  index do
    column :name
    column :email
    column :created_at
    default_actions
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :created_at

  form do |f|
    f.inputs "Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.inputs "Details" do
      f.input :title
      f.input :first_name
      f.input :last_name
      f.input :middle_name
      f.input :avatar
    end
    f.inputs 'Address' do
      f.input :phone
      f.input :country
      f.input :state
      f.input :city
      f.input :street
    end
    f.inputs 'Social' do
      f.input :facebook_link
      f.input :twitter_link
      f.input :linkedin_link
      f.input :google_plus_link
    end
    f.inputs "Administration" do
      f.input :status
      f.input :role
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end

    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end

      super
    end
  end
end


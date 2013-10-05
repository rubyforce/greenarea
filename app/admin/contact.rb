ActiveAdmin.register Contact do
  index do
    column :name
    column :email
    column :message
    default_actions
  end

  filter :name
  filter :email

  controller do
    def permitted_params
      params.permit!
    end
  end
end


ActiveAdmin.register Post do
  index do
    column :title
    column :created_at
    default_actions
  end

  filter :title
  filter :created_at

  controller do
    def permitted_params
      params.permit!
    end
  end
end

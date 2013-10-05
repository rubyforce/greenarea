ActiveAdmin.register Investment do
  index do
    column :project
    column :created_at
    default_actions
  end

  filter :project
  filter :created_at

  controller do
    def permitted_params
      params.permit!
    end
  end
end

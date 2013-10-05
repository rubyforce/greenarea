ActiveAdmin.register Project do
  index do
    column :name
    column :percent
    column :raised
    column :created_at
    default_actions
  end

  filter :name
  filter :created_at

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :image
    end
    f.inputs "Address (for showing on the google maps)" do
      f.input :country
      f.input :city
      f.input :street
    end
    f.inputs "Content" do
      f.input :description
      f.input :short_description
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end


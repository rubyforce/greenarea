module DashboardHelper
  def projects_json(projects)
    projects.to_json(only: [:id, :name, :latitude, :longitude], methods: [:image_url])
  end

  def user_json(user)
    user.to_json(only: [:latitude, :longitude])
  end
end


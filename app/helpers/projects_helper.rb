module ProjectsHelper
  def project_json(project)
    project.to_json(only: [:id, :name, :latitude, :longitude], methods: [:image_url])
  end
end


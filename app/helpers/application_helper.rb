module ApplicationHelper
  include FacebookShare

  def projects_json(projects)
    projects.to_json(only: [:id, :name, :latitude, :longitude], methods: [:image_url])
  end

  def signature(options = {})
    Base64.encode64(
      OpenSSL::HMAC.digest(
        OpenSSL::Digest::Digest.new('sha1'),
        Rails.configuration.s3.secret,
        policy({ secret_access_key: Rails.configuration.s3.access_key })
      )
    ).gsub(/\n/, '')
  end

  def policy(options = {})
    Base64.encode64( {
      expiration: 30.minutes.from_now.utc.strftime('%Y-%m-%dT%H:%M:%S.000Z'),
        conditions: [
          { bucket: Rails.configuration.s3.bucket },
          { acl: 'public-read' },
          { success_action_status: '201' },
          ['starts-with', '$key', '']
        ]
      }.to_json
    ).gsub(/\n|\r/, '')
  end

  def active_menu_item(item)
    controller_name == item ? "active" : ""
  end
end


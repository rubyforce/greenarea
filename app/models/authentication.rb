class Authentication < ActiveRecord::Base
  belongs_to :user

  validates :provider, :uid, :email, :user_id, presence: true

  def self.find_user_by_auth(auth)
    authentication = where(provider: auth.provider).
                     where(uid: auth.uid).
                     where(email: auth.info['email']).
                     first
    authentication.try(:user)
  end
end


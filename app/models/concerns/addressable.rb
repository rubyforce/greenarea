module Addressable
  extend ActiveSupport::Concern

  included do
    def address
      "#{street} #{city} #{country}".strip
    end

    def address_changed?
      street_changed? && city_changed? && country_changed?
    end

    before_save do
      return unless address_changed? || (longitude.blank? && latitude.blank?)

      begin
        coordinates = Geocoder.coordinates(address)

        return unless coordinates.present?

        self.longitude = coordinates[1]
        self.latitude = coordinates[0]
      rescue => boom
        # TODO: place here exception notifier like honeybadger for tracking
        # such of error things in the production environment.
        Rails.logger.error boom.message
      end
    end
  end

end


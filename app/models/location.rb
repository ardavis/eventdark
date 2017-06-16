class Location < ApplicationRecord
  has_many :events

  def google_map(options={})
    height = options.delete(:height) || 300
    width = options.delete(:width) || 600

    "#{GOOGLE_MAPS_URL}?center=#{name}&size=#{width}x#{height}&#{options.to_query}&key=#{ENV['google_maps_api_key']}"
  end

end


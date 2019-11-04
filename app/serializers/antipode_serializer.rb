class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location_name,
             :summary,
             :current_temperature,
             :search_location

end

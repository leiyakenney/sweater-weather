class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location_name,
             :forecast 
  attribute :summary,
            :temperature
end

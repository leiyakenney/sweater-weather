class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :summary,
             :temperature
end

module V1
  class Root < Grape::API
    version 'v1'
    format :json
    content_type :json, 'application/json'

    mount V1::Waittimes
    mount V1::Shops
    add_swagger_documentation
  end
end
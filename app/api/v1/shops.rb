module V1
    class Shops < Grape::API
        resource :shops do
          desc 'get all shop and wait data'
          get do
            @shops = Shop.joins(:wait_times).all
            present @shops
            # present @shops, with: V1::Entities::ShopEntity 
          end
        end
    end
  end
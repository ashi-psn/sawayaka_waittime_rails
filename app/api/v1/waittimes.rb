module V1
  class Waittimes < Grape::API
      resource :wait_times do
        desc 'user list'
        get do
          @waittimes = WaitTime.all
          present @waittimes, with: V1::Entities::WaitTimeEntity 
        end
      end
  end
end
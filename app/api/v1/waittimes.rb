module V1
  class Waittimes < Grape::API
      resource :wait_times do
        desc 'user list'
        get do
          present WaitTime.all
        end
      end
  end
end
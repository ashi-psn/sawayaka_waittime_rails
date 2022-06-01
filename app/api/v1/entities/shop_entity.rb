module V1
    module Entities
        class ShopEntity < Grape::Entity
            expose :id,  documentation: { type: 'integer', required: true }
            expose :name, documentation: { type: 'string', required: true }
            expose :lat, documentation: { type: 'float', required: true }
            expose :lng, documentation: { type: 'float', required: true }
            expose :last_wait_times, documentation: { type: 'wait_time_entity', required: false }
        end
    end
end
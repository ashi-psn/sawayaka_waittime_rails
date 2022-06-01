module V1
    module Entities
        class WaitTimeEntity < Grape::Entity
            expose :id,  documentation: { type: 'integer', required: true }
            expose :set, documentation: { type: 'string', required: true }
            expose :minutes, documentation: { type: 'string', required: true }
            expose :shop, documentation: { type: 'shop', required: true }
        end
    end
end
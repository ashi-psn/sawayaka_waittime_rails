class Shop < ApplicationRecord
    has_many :wait_times
    accepts_nested_attributes_for :wait_times

    def last_wait_times
        wait_times.last
    end
end

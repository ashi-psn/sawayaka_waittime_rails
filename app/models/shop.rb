class Shop < ApplicationRecord
    has_many :wait_times
    accepts_nested_attributes_for :wait_times

    def last_wait_times
        wait_times.last
    end

    def today_wait_times
        wait_times.where("created_at >= ?", zone.now.beginning_of_day)
    end
end

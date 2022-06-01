class Shop < ApplicationRecord
    has_many :wait_times
    accepts_nested_attributes_for :wait_times
end

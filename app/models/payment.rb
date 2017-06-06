class Payment < ActiveRecord::Base
  belongs_to :reservation_id
end

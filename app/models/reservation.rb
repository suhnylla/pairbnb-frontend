class Reservation < ActiveRecord::Base
	belongs_to :listing
    belongs_to :user
    belongs_to :payment

    # before_save :check_overlap

    def check_if_overlap?
		if self.listing.reservations.where('(start_date BETWEEN ? AND ?) OR (end_date BETWEEN ? AND ?)', self.start_date, self.end_date, self.start_date, self.end_date).count > 0
			true
		else
			false
		end
    end



    # def check_overlap
    # 	# self  	
    # 	if @reversation.check_if_overlap?
    #   		redirect_to root_path
    # 	else
    #   			@reservation.save
    # 	end
    # end
end

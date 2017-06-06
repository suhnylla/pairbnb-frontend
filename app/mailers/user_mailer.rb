class UserMailer < ApplicationMailer
	default from: 'testing.email.nextacademy@gmail.com'
	# # after_action :set_delivery_options,
 #               	:prevent_delivery_to_guests,
 #               	:set_business_headersyh
 
  	def welcome_email(user)
    	@user = user
    	@url  = 'http://localhost:3000'
    	# email_with_name = %("#{@user.name}" <#{@user.email}>)
  		mail(to: @user.email, subject: 'Welcome to My Awesome Site')
   
    	# attachments.inline['image.jpg'] = File.read('/path/to/image.jpg')
  	end
  end
  

#   	def receive(email)
#     page = Page.find_by(address: email.to.first)
#     page.emails.create(
#       subject: email.subject,
#       body: email.body
#     )
 
#     	if email.has_attachments?
#       		email.attachments.each do |attachment|
#         	page.attachments.create({
#           	file: attachment,
#           	description: email.subject
#         	})
#       		end
#     	end
#   	end

#   	def feedback_message(business, user)
#     	@business = business
#     	@user = user
#     	mail
#   	end
 
#   	def campaign_message(business, user)
#     	@business = business
#     	@user = user
#   	end


#   	private
 
#     def set_delivery_options
#       # You have access to the mail instance,
#       # @business and @user instance variables here
#       if @business && @business.has_smtp_settings?
#         mail.delivery_method.settings.merge!(@business.smtp_settings)
#       end
#     end
 
#     def prevent_delivery_to_guests
#       if @user && @user.guest?
#         mail.perform_deliveries = false
#       end
#     end
 
#     def set_business_headers
#       if @business
#         headers["X-SMTPAPI-CATEGORY"] = @business.code
#       end
#     end
# end



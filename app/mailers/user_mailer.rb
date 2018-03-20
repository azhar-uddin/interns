class UserMailer < ApplicationMailer
	default from: 'admin@interns.com'

	def registration_confirmation(user)
		@user = user
		mail(:to => "#{user.first_name} <#{user.email}>", :subject => "Registration Confirmation")
	end

end

class SignUpMailer < ApplicationMailer
  default from: 'donotreply@acadws.com.sg'

  def new_sign_up_email(params)
    @form_info = params
    mail(to: 'admin@acadws.com.sg', subject: 'New Student Sign Up')
  end
end

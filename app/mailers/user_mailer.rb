class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

    # def welcome_email
    #     @user = params[:user]
    #     @url  = 'http://example.com/login'
    #     mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    # end

    def message_email
        @user = User.first
        email = params[:email]
        @subject = params[:subject]
        @massage = params[:message]
        mail(to: 'canedoguido@hotmail.com', subject: subject)
    end
end

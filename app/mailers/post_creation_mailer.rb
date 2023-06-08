class PostCreationMailer < ApplicationMailer
  def post_created
    @user = params[:user]
    @post = params[:post]

    mail(to: @user&.email, subject: 'Your new post was created')
  end
end


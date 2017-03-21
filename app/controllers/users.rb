class MakersBnB < Sinatra::Base

  post '/users' do

    @user = User.create(
      full_name: params[:full_name],
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:confirm_password]
    )

  end

end

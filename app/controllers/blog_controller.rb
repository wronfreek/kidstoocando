class BlogController < ApplicationController
  def index
    @myClient = Tumblr::Client.new({
      :consumer_key => 'nTyPLwePBR5CPKpDzWbC8FPIMEQC7D6xeFEfsoNAadwvSQAHrb',
      :consumer_secret => 'W9o3IHpxN8Pww3slDMMuYy7w8TsPq2MHZYlZMXquYd2AdAQsaU',
      :oauth_token => '4oaDt1FIzTXuKGJNeZ0iBk42KIavtRp639iyAi061GbWUDGJPd',
      :oauth_token_secret => 'yAD3EFCjL0C2qI8UBfK0MxHQUMrtrlntmF0zbG1H6CHv8btsa2'
    })

    @posts = @myClient.posts("kidstoocando.tumblr.com")
    @posts = Kaminari.paginate_array(@posts["posts"]).page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def post
    @myClient = Tumblr::Client.new({
      :consumer_key => 'nTyPLwePBR5CPKpDzWbC8FPIMEQC7D6xeFEfsoNAadwvSQAHrb',
      :consumer_secret => 'W9o3IHpxN8Pww3slDMMuYy7w8TsPq2MHZYlZMXquYd2AdAQsaU',
      :oauth_token => '4oaDt1FIzTXuKGJNeZ0iBk42KIavtRp639iyAi061GbWUDGJPd',
      :oauth_token_secret => 'yAD3EFCjL0C2qI8UBfK0MxHQUMrtrlntmF0zbG1H6CHv8btsa2'
    })
    @id = params[:id]
    @post = @myClient.posts("kidstoocando.tumblr.com", :id => @id)

    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end
end

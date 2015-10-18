class MainController < ApplicationController
  def index
    @contact = Contact.new
  end

  def contact
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to root_url
      flash[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      redirect_to root_url
      flash[:error] = 'Cannot send message.'
    end
  end
end

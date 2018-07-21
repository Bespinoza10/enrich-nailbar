class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      redirect_to root_path, notice: "Thank you. We will get in touch with you as soon as possible."
    else
      redirect_to root_path, notice: "Sorry can't send. Please try again."
    end
  end

end
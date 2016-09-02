class ContactsController < ApplicationController
  def add
    @contact = Contact.new
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.address = params[:address]
    if @contact.save
      render 'add.html.erb'
    else
      render text: "contact could not be saved"
    end
  end

  def delete
  end

  def contact_list
    @contacts = Contact.all
  end

  def edit
    @contact = Contact.find(params[:id])
  end
  def update
    @contact = Contact.find(params[:id])
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.address = params[:address]
    if @contact.save
      render 'add.html.erb'
    else
      render text: "contact could not be saved"
    end
  end
end

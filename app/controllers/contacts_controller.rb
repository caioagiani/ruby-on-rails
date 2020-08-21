class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /contacts
  def index
    @contacts = Contact.all

    ## only: [:name, :email, :birthdate]
    ## except: [:name, :email, :birthdate]
    ## render json: @contacts.map { |contact| contact.attributes.merge({ author: "Caio Agiani" }) }
    ## render json: @contacts, methods: :author

    render json: @contacts
  end

  # GET /contacts/1
  def show
    ## render json: @contact.attributes.merge({ author: "Caio Agiani"})
    
    render json: @contact.to_br
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(:name, :email, :birthdate, :kind_id)
    end
end

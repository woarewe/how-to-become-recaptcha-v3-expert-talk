class ContactInquiriesController < ApplicationController
  before_action :set_contact_inquiry, only: %i[ show edit update destroy ]

  # GET /contact_inquiries or /contact_inquiries.json
  def index
    @contact_inquiries = ContactInquiry.all
  end

  # GET /contact_inquiries/1 or /contact_inquiries/1.json
  def show
  end

  # GET /contact_inquiries/new
  def new
    @contact_inquiry = ContactInquiry.new
  end

  # GET /contact_inquiries/1/edit
  def edit
  end

  # POST /contact_inquiries or /contact_inquiries.json
  def create
    @contact_inquiry = ContactInquiry.new(contact_inquiry_params)

    respond_to do |format|
      if @contact_inquiry.save
        format.html { redirect_to @contact_inquiry, notice: "Contact inquiry was successfully created." }
        format.json { render :show, status: :created, location: @contact_inquiry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact_inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_inquiries/1 or /contact_inquiries/1.json
  def update
    respond_to do |format|
      if @contact_inquiry.update(contact_inquiry_params)
        format.html { redirect_to @contact_inquiry, notice: "Contact inquiry was successfully updated." }
        format.json { render :show, status: :ok, location: @contact_inquiry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact_inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_inquiries/1 or /contact_inquiries/1.json
  def destroy
    @contact_inquiry.destroy
    respond_to do |format|
      format.html { redirect_to contact_inquiries_url, notice: "Contact inquiry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_inquiry
      @contact_inquiry = ContactInquiry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_inquiry_params
      params.require(:contact_inquiry).permit(:name, :email, :description, :recaptcha_token)
    end
end

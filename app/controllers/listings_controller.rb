class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_listing, only: %i[ show ]
  before_action :set_user_listing, only: [:update, :edit, :destroy]
  before_action :set_categories, :set_materials, only: [:new, :edit]

  # GET /listings or /listings.json
  def index
    @listings = Listing.search(params[:search])
    @listings_search = Listing.search(params[:search])
  end

  # GET /listings/1 or /listings/1.json
  def show
    stripe_session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      client_reference_id: current_user ? current_user.id : nil,
      customer_email: current_user ? current_user.email : nil,
      line_items: [{
        amount:@listing.price,
        name:@listing.name,
        description:@listing.description,
        currency: 'aud',
        quantity: 1
      }],
      payment_intent_data: {
        metadata: {
          listing_id: @listing.id,
          user_id: current_user ? current_user.id : nil
        }
      },
      success_url: "#{root_url}payments/success?listingId=#{@listing.id}",
      cancel_url: "#{root_url}listings"
    )
    @session_id = stripe_session.id
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    @listing = current_user.listings.new(listing_params)
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def set_user_listing
      @listing = current_user.listings.find_by_id(params[:id])
      if @listing == nil
        flash[:alert] = "You dont have Permissions"
        redirect_to listings_path
      end
    end

    def set_categories
      @categories = Category.all
    end

    def set_materials
      @materials = Material.all
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:name, :category_id, :price, :description, :picture, :search, material_ids: [])
    end
end

class DeliveryOfficesController < ApplicationController
  before_action :set_delivery_office, only: [:show, :edit, :update, :destroy]

  # GET /delivery_offices
  # GET /delivery_offices.json
  def index
    if params[:postcode] && params[:distance]
      postcode_response = postcode_look_up params[:postcode]
      distance_in_meters = params[:distance].to_i * 1609
      @delivery_offices = DeliveryOffice.search_in_radius(postcode_response.longitude, postcode_response.latitude, distance_in_meters)
    else
      @delivery_offices = DeliveryOffice.all
    end
  end

  # GET /delivery_offices/1
  # GET /delivery_offices/1.json
  def show
  end

  # GET /delivery_offices/new
  def new
    @delivery_office = DeliveryOffice.new
  end

  # GET /delivery_offices/1/edit
  def edit
  end

  # POST /delivery_offices
  # POST /delivery_offices.json
  def create
    @delivery_office = DeliveryOffice.new(delivery_office_params)

    respond_to do |format|
      if @delivery_office.save
        format.html { redirect_to @delivery_office, notice: 'Delivery office was successfully created.' }
        format.json { render :show, status: :created, location: @delivery_office }
      else
        format.html { render :new }
        format.json { render json: @delivery_office.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delivery_offices/1
  # PATCH/PUT /delivery_offices/1.json
  def update
    respond_to do |format|
      if @delivery_office.update(delivery_office_params)
        format.html { redirect_to @delivery_office, notice: 'Delivery office was successfully updated.' }
        format.json { render :show, status: :ok, location: @delivery_office }
      else
        format.html { render :edit }
        format.json { render json: @delivery_office.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_offices/1
  # DELETE /delivery_offices/1.json
  def destroy
    @delivery_office.destroy
    respond_to do |format|
      format.html { redirect_to delivery_offices_url, notice: 'Delivery office was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery_office
      @delivery_office = DeliveryOffice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_office_params
      params.require(:delivery_office).permit(:name, :postcode)
    end

    def postcode_look_up _postcode
      pio = Postcodes::IO.new
      pio.lookup(_postcode)
    end

end

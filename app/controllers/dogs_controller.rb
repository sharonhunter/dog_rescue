class DogsController < ApplicationController
  before_action :authorize, only: [:new, :edit, :update, :destroy]
  before_action :set_dog, only: [:show, :edit, :update, :destroy]


  # GET /dogs
  # GET /dogs.json
  #def index
    #@dogs = Dog.all
    #@dogs = Dog.where(nil) # creates an anonymous scope
    #@dogs = @dogs.by_name(params[:name]) if params[:name].present?
    #@dogs = @dogs.by_breed(params[:breed]) if params[:breed].present?
    # gender search not yet working
    # @dogs = @dogs.by_gender(params[:gender]) if params[:gender].present?
  #end

  def index
      #@dogs = Dog.all
      if params[:search]
        @dogs = Dog.search(params[:search]).order("created_at DESC")
      else
       @dogs = Dog.all.order("created_at DESC")
      end
  end

  # GET /dogs/1
  # GET /dogs/1.json
  def show
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit
  end

  # POST /dogs
  # POST /dogs.json
  def create
    @dog = Dog.new(dog_params)

    respond_to do |format|
      if @dog.save
        format.html { redirect_to @dog, notice: 'New dog was successfully created.' }
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogs/1
  # PATCH/PUT /dogs/1.json
  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to @dog, notice: 'This dog was successfully updated.' }
        format.json { render :show, status: :ok, location: @dog }
      else
        format.html { render :edit }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1
  # DELETE /dogs/1.json
  def destroy
    @dog.destroy
    respond_to do |format|
      format.html { redirect_to dogs_url, notice: 'This entry was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_params
      params.require(:dog).permit(:image, :name, :age, :gender, :breed, :secondary_breed, :heartworm_status, :temperament, :activity_level, :info, :available, :contact_name, :contact_phone)
    end
end

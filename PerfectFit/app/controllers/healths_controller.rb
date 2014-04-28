class HealthsController < ApplicationController
  before_action :set_health, only: [:show, :edit, :update, :destroy]

  # GET /healths
  # GET /healths.json
  def index
    @user = current_user
    @healths = @user.healths.all
  end

  # GET /healths/1
  # GET /healths/1.json
  def show
  end

  # GET /healths/new
  def new
    @health = Health.new
    @health.user_id = current_user.id
  end

  # GET /healths/1/edit
  def edit
  end

  # POST /healths
  # POST /healths.json
  def create
    @health = Health.new(health_params)

    respond_to do |format|
      if @health.save
        format.html { redirect_to "/dashboard", notice: 'Health was successfully created.' }
        format.json { render action: 'show', status: :created, location: @health }
      else
        format.html { render action: 'new' }
        format.json { render json: @health.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /healths/1
  # PATCH/PUT /healths/1.json
  def update
    @health.user_id = current_user
    respond_to do |format|
      if @health.update(health_params)
        format.html { redirect_to "/dashboard", notice: 'Health was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @health.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /healths/1
  # DELETE /healths/1.json
  def destroy
    @health.destroy
    respond_to do |format|
      format.html { redirect_to "/dashboard" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health
      @health = Health.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def health_params
      params.require(:health).permit(:user_id, :log_type, :weight, :food, :calories, :BPM, :BP, :BMI, :date, :sleep, :cholesterol, :hours, :minutes, :sleep_text)
    end
end

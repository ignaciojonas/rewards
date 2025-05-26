class RewardTypesController < ApplicationController
  before_action :set_reward_type, only: %i[ show edit update destroy ]

  # GET /reward_types or /reward_types.json
  def index
    @reward_types = RewardType.all
  end

  # GET /reward_types/1 or /reward_types/1.json
  def show
  end

  # GET /reward_types/new
  def new
    @reward_type = RewardType.new
  end

  # GET /reward_types/1/edit
  def edit
  end

  # POST /reward_types or /reward_types.json
  def create
    @reward_type = RewardType.new(reward_type_params)

    respond_to do |format|
      if @reward_type.save
        format.html { redirect_to @reward_type, notice: "Reward type was successfully created." }
        format.json { render :show, status: :created, location: @reward_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reward_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reward_types/1 or /reward_types/1.json
  def update
    respond_to do |format|
      if @reward_type.update(reward_type_params)
        format.html { redirect_to @reward_type, notice: "Reward type was successfully updated." }
        format.json { render :show, status: :ok, location: @reward_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reward_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reward_types/1 or /reward_types/1.json
  def destroy
    @reward_type.destroy!

    respond_to do |format|
      format.html { redirect_to reward_types_path, status: :see_other, notice: "Reward type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward_type
      @reward_type = RewardType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def reward_type_params
      params.expect(reward_type: [ :name, :description ])
    end
end

class RewardsController < ApplicationController
  before_action :set_reward, only: %i[ show edit update destroy ]

  # GET /rewards or /rewards.json
  def index
     @rewards = Reward.order("#{sort_column} #{sort_direction}").page(params[:page]).per(5)
  end

  # GET /rewards/1 or /rewards/1.json
  def show
  end

  # GET /rewards/new
  def new
    @reward = Reward.new
  end

  # GET /rewards/1/edit
  def edit
  end

  # POST /rewards or /rewards.json
  def create
    @reward = Reward.new(reward_params)

    respond_to do |format|
      if @reward.save
        format.html { redirect_to @reward, notice: "Reward was successfully created." }
        format.json { render :show, status: :created, location: @reward }
        format.turbo_stream do
          render turbo_stream: 
          [
            turbo_stream.append("rewards", partial: "rewards/reward", locals: { reward: @reward }),
            turbo_stream.replace("new_reward", partial: "rewards/form", locals: { reward: Reward.new })
        ]
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("new_reward", partial: "rewards/form", locals: { reward: @reward })
        end
      end
    end
  end

  # PATCH/PUT /rewards/1 or /rewards/1.json
  def update
    respond_to do |format|
      if @reward.update(reward_params)
        format.html { redirect_to @reward, notice: "Reward was successfully updated." }
        format.json { render :show, status: :ok, location: @reward }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rewards/1 or /rewards/1.json
  def destroy
    @reward.destroy!

    respond_to do |format|
      format.html { redirect_to rewards_path, status: :see_other, notice: "Reward was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward
      @reward = Reward.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def reward_params
      params.expect(reward: [ :recipient, :reward_type_id, :amount ])
    end

    def sort_column
      # List of allowed columns to sort by
      %w[recipient reward_type_id amount status sent_at delivery_times].include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end

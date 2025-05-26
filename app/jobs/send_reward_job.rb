class SendRewardJob < ApplicationJob
  queue_as :default
  retry_on StandardError, attempts: 3

  def perform(*args)
    # Check if the reward is already sent
    return if args.empty? || args.first[:reward_id].nil?

    reward = Reward.find_by(id: args.first[:reward_id])
    return unless reward
    delivery_times = [reward.delivery_times, Time.current.to_s].compact.reject(&:empty?).join(', ')
    reward.update(delivery_times: delivery_times)
    Rails.logger.info "Processing SendRewardJob for reward ID: #{reward.id}"

    if Random.rand(1..10) < 0.3 # Simulate a 30% chance of failure
      Rails.logger.error "Retrying SendRewardJob due to: Simulated error sending reward"
      reward.update(status: :failed, sent_at: nil)
      raise "Simulated error sending reward" 
    end

    puts "Sending reward to #{reward.recipient} of type #{reward.reward_type.name}"

    # Mark the reward as sent
    reward.update(sent_at: Time.current, status: :sent)
  end
end

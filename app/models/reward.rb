class Reward < ApplicationRecord
  belongs_to :reward_type

  validates :recipient, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :reward_type, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: false

  enum :status, { pending: 0, sent: 1, failed: 2 }

  after_create :send_reward

  def send_reward
    SendRewardJob.perform_later(reward_id: id)
  end
end

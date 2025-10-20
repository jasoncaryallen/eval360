class Training < ActiveRecord::Base
  has_many :participants, -> { order "first_name ASC" }, inverse_of: :training, dependent: :destroy
  accepts_nested_attributes_for :participants
  belongs_to :questionnaire

  validates_presence_of :questionnaire

  class << self
    def ransackable_attributes(auth_object = nil)
      %w[name start_date end_date city state status]
    end

    def send_self_eval_reminders
      email_block do |participant|
        participant.remind unless participant.self_evaluation.completed?
      end
    end

    def send_add_peers_reminders
      email_block do |participant|
        if participant.self_evaluation.completed? && participant.total_peer_evaluations.zero?
          participant.remind_to_add_peers
        end
      end
    end

    def send_remind_peers_reminders
      email_block do |participant|
        if participant.total_peer_evaluations > 0 && participant.completed_peer_evaluations < 10
          participant.remind_to_remind_peers
        end
      end
    end

    private

    def email_block
      upcoming_trainings = Training.includes(:participants).where("deadline IN (?)", DateTime.now..21.days.from_now)
      upcoming_trainings.each do |training|
        training.participants.each do |participant|
          yield(participant) unless participant.do_not_remind?
        end
      end
    end
  end
  def formatted_date
    if start_date && end_date
      "#{start_date.strftime("%B %e")} - #{end_date.strftime("%e, %Y")}"
    end
  end

  def formatted_deadline
    deadline&.strftime("%B %e, %Y")
  end

  def formatted_start_date
    start_date&.strftime("%B %e, %Y")
  end

  def formatted_end_date
    end_date&.strftime("%B %e, %Y")
  end
end

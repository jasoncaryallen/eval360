class LegacyMeanScores < ActiveRecord::Base
  def self.mean_scores(key)
    return unless key
    where(key: key).pluck(:value)
  end
end

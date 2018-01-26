class Score
  attr_reader :rolls

  def initialize(rolls)
    @rolls = rolls
  end

  def final_score
    rolls.inject(0) do |sum, x|
      if x != '-' && x != '/'
        sum + x
      else
        sum + 0
      end
    end
  end
end

class Score
  attr_reader :rolls

  def initialize(rolls)
    @rolls = rolls
  end

  def final_score
    sum = 0
    rolls.each_with_index do |x, i|
      if x != '-' && x != '/' && x != 'X'
        sum = sum + x
      elsif x == '/'
        sum = sum + rolls[i+1] + 1
      elsif x == 'X'
        sum = sum + 10 + check_roll(rolls[i+1],i)
      else
        sum = sum + 0
      end
    end
    return sum
  end

  def check_roll(roll,i)
    if roll == 'X'
      10 + get_roll(rolls[i+2])
    else
      get_roll(roll) + get_roll(rolls[i+3])
    end

  end

  def get_roll(roll)
    if roll == 'X'
      10
    elsif roll == '-'
      0
    else
      roll
    end
  end
end

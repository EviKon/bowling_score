class Score
  attr_reader :rolls

  def initialize(rolls)
    @rolls = rolls
  end

  def final_score
    if count_rolls <= rolls.size
      score
    else
      score + extra_score
    end
  end

  def score
    sum = 0

    rolls.each_with_index do |x, i|
      if x != '-' && x != '/' && x != 'X'
        sum = sum + x
      elsif x == '/' && i == count_rolls - 1
        sum = sum + 10 - get_roll(rolls[i-1])
      elsif x == '/'
        sum = sum + rolls[i+1] + 10 - get_roll(rolls[i-1])
      elsif x == 'X' && i == count_rolls - 1
        sum = sum + 10
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
    elsif i > 19
      0
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
      roll || 0
    end
  end

  def count_rolls
    20 - how_many_X_rolls
  end

  def how_many_X_rolls
    count = 0

    rolls.each do |x|
      if x == 'X'
        count = count + 1
      end
    end
    return count
  end

  def extra_score
    if rolls.size == count_rolls + 1
      rolls.last
    else
      rolls.last + rolls[-2]
    end
  end
end

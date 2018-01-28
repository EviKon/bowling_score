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

  private

  def score
    sum = 0

    rolls.each_with_index do |x, i|
      sum = sum + the_score_of_the_roll(x, i)
    end
    return sum
  end

  def the_score_of_the_roll(x, i)
    if it_is_a_number(x)
      x
    elsif it_is_a_spare_on_the_final_roll(x, i)
      final_spare_score(i)
    elsif it_is_a_spare(x)
      spare_score(i)
    elsif it_is_a_strike_on_the_final_roll(x, i)
      10
    elsif it_is_a_strike(x)
      strike_score(i)
    else
      0
    end
  end

  def it_is_a_number(x)
    x != '-' && x != '/' && x != 'X'
  end

  def it_is_a_spare_on_the_final_roll(x, i)
    x == '/' && i >= count_rolls - 1
  end

  def it_is_a_spare(x)
    x == '/'
  end

  def it_is_a_strike_on_the_final_roll(x, i)
    x == 'X' && i >= count_rolls - 1
  end

  def it_is_a_strike(x)
    x == 'X'
  end

  def final_spare_score(i)
    10 - get_roll(rolls[i-1])
  end

  def spare_score(i)
    rolls[i+1] + 10 - get_roll(rolls[i-1])
  end

  def strike_score(i)
    10 + check_roll(rolls[i+1],i)
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
    if how_many_X_rolls > 10
      10
    else
      20 - how_many_X_rolls
    end
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
    if there_is_an_extra_roll
      get_roll(rolls.last)
    else
      get_roll(rolls.last) + get_roll(rolls[-2])
    end
  end

  def there_is_an_extra_roll
    rolls.size == count_rolls + 1
  end
end

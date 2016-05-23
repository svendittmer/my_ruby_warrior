class Player
  def play_turn(warrior)
    @health ||= warrior.health
    if warrior.feel.empty?
      if warrior.health < 15 && @health <= warrior.health
        warrior.rest!
      else
        warrior.walk!
      end
    else
      warrior.attack!
    end
    @health = warrior.health
  end
end

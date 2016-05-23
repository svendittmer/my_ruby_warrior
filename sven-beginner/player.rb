require "warrior.rb"
class Player
  def play_turn(_warrior)
    warrior.update(_warrior)
    if warrior.panic?
      warrior.walk! :backward
      return
    end
    unless warrior.all_captives_saved?
      if warrior.feel(:backward).empty?
        warrior.walk!(:backward)
      else
        warrior.rescue!(:backward)
      end
      return
    end
    if warrior.feel.empty?
      if warrior.safe?
        if warrior.would_like_to_rest?
          warrior.rest!
        else
          warrior.walk!
        end
      else
        warrior.walk!
      end
    else
      if warrior.feel.captive?
        warrior.rescue!
      else
        warrior.attack!
      end
    end
  end

  def warrior
    Warrior.instance
  end
end

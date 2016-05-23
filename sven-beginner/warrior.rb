require 'singleton'
require 'forwardable'
class Warrior
  include Singleton
  extend Forwardable

  def_delegators :@warrior, :feel, :attack!, :rest!, :walk!, :rescue!

  attr_accessor :health

  def initialize
    @health = 20
    @health_delta = 0
    @captives_saved = 0
  end

  def update(warrior)
    @warrior = warrior
    @health_delta = warrior.health - @health
    @health = warrior.health
  end

  def rescue!(direction = :forward)
    @captives_saved += 1
    @warrior.rescue!(direction)
  end

  def under_attack?
    @health_delta < 0
  end

  def safe?
    !under_attack?
  end

  def panic?
    @health < 10 && under_attack?
  end

  def would_like_to_rest?
    @health < 20
  end

  def all_captives_saved?
    @captives_saved > 0
  end
end

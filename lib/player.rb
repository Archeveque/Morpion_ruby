class Player
  attr_accessor :name
  @@all_players = []

  def initialize(name)
    @name = name
   @@all_players << self
  end

  def self.all
    @@all_players
  end
end

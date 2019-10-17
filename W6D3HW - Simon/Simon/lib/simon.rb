
require "byebug"
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over == true
    if @game_over == true
      game_over_message
      reset_game
    end
  end

  def take_turn
    show_sequence 
    require_sequence
    round_success_message  if @game_over == false
    @sequence_length += 1 if @game_over == false
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    puts "Enter Sequence:"
    input = gets.chomp
    @game_over = true if input != show_sequence
  end

  def add_random_color
    @seq << COLORS.sample


  end

  def round_success_message
    puts "Good Job!"
  end

  def game_over_message
    puts "You Lost!"
  end

  def reset_game
    @sequence_length = 1 
    @game_over = false
    @seq = []
  end
end

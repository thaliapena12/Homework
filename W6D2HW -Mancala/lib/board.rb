class Board
  require "byebug"
  attr_accessor :cups, :stone

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    i = 0
    while i < @cups.length
        4.times do
          @cups[i] << :stone unless  i == 6 || i == 13 
        end
      
      i += 1
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !start_pos.between?(0,14)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    current_count = @cups[start_pos].count
    current = @cups[start_pos]
    @cups[start_pos].clear
    
      idx = start_pos  
    until current_count == 0
      current_count -= 1
      idx += 1
      idx = 0 if idx > 13
      if idx == 13
        @cups[13] << :stone if current_player_name == @name1
      elsif  idx == 6
          @cups[6] << :stone if current_player_name == @name2
      else
          @cups[idx] << :stone
      end
      
    end
    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if @cups[ending_cup_idx].count == 1
      :switch
    elsif ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
     @cups[0..5].all?{|cup| cup.empty?} || @cups[7..12].all?{|cup| cup.empty?}
  end

  def winner
    player1_cup = @cups[6].count
    player2_cup = @cups[13].count
      if player1_cup > player2_cup
        return @name1
      elsif player2_cup > player1_cup
        return @name2
      else
        :draw
      end



  end
end

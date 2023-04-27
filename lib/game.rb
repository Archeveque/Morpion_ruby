

class Game
  def initialisation
  all_players = @@all_players
  cases = ["A1","A2","A3","B1","B2","B3","C1","C2","C3"]
  end
  def rando(choices)
    9.times do
      chose.push(rand(0..2))
    end
  end
  #board = cases.zip(chose)
  nb=0

  def deco
    print"   "
    print"+----"*3
    puts "+"
  end

  def boardcase (choices,nb) #print a row
    nb_base = nb
    deco
    print "   |"
    3.times do               #Print the top of 3 case
      if choices[nb]==1
        print " xx |"
      else
        if
          choices[nb]==2
          print " oo |"
        else
          print " .. |"
        end
      end
      nb = nb+1
    end
    puts " "
    nb=nb_base
    print "   |"
    3.times do               #print the bottom of 3 case
      if choices[nb]==1
        print " xx |"
      else
        if
          choices[nb]==2
          print " oo |"
        else
          print " .. |"
        end
      end
      nb=nb+1
     end
    puts " "
  end

  def win_condition(choices,all_players)
    p=1
    2.times do      #check for each player
      nb=0
      3.times do |i|                                             #check rows
        if choices[nb] == p && choices[nb+1] == p && choices[nb+2] == p
          puts "#{all_players[p-1].name} gagne (ligne #{i+1})"
          exit
        end
        nb = nb+3
      end
      nb = 0
      3.times do |i|                                             #check columns
        if choices[nb] == p && choices[nb+3] == p && choices[nb+6] == p
          puts "#{all_players[p-1].name} gagne (colonne #{i+1})"
          exit
        end
        nb = nb +1
      end
        if choices[0] == p && choices[4] == p && choices[8] == p       #check diagonal1
          puts "#{all_players[p-1].name} gagne (diago 1)"
          exit
        end
        if choices[2] == p && choices[4] == p && choices[6] == p       #check diagonal2
          puts "#{all_players[p-1].name} gagne (diago 2)"
          exit
        end
      p= p+1
    end
  end

  def player_phase(choices,turn,all_players)
    if turn.even?()
      player = 2
    else
      player = 1
    end
    player_name=player - 1
    puts "  Tour de #{all_players[player_name].name}"
    while choices!=255
      puts "changez une valeur ?"
      change_play=gets.chomp.to_i
      if choices[change_play].nil? && change_play <=8
        choices[change_play]=player
        puts " "
        break
      else
        puts "non"
      end
    end
  end

  def morpion(player1,player2)
    all_players =[]
    all_players << player1
    all_players << player2
    choices = [nil,nil,nil,nil,nil,nil,nil,nil,nil]
    turn =1
    10.times do
      nb=0
      puts " " + "/"*20
      puts "        Tour #{turn}"
      puts " " + "/"*20
      3.times do
        boardcase(choices,nb)
        nb = nb +3
      end
      deco
      win_condition(choices,all_players)
      if choices.any? { |a| a.nil?}
        player_phase(choices,turn,all_players)
        turn = turn +1
      else 
        puts "Egalitée"
      end
    end
  end
end

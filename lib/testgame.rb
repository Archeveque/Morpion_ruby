cases = ["A1","A2","A3","B1","B2","B3","C1","C2","C3"]
chose = [nil,nil,nil,nil,nil,nil,nil,nil,nil]
def rando(chose)
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
def boardcase (chose,nb)
  nb_base = nb
  deco
  print "   |"
  3.times do
    if chose[nb]==1
      print " xx |"
    else
      if
        chose[nb]==2
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
  3.times do
    if chose[nb]==1
      print " xx |"
    else
      if
        chose[nb]==2
        print " oo |"
      else
        print " .. |"
      end
    end
    nb=nb+1
   end
  puts " "
end
def win_condition(chose)
  p=1
2.times do
  nb=0
  3.times do |i|                                             #regarde les lignes
    if chose[nb] == p && chose[nb+1] == p && chose[nb+2] == p
      puts "J#{p} gagne (ligne #{i+1})"
      exit
    end
    nb = nb+3
  end
  nb = 0
  3.times do |i|                                             #regarde les collones
    if chose[nb] == p && chose[nb+3] == p && chose [nb+6] == p
      puts "J#{p} gagne (collone #{i+1})"
      exit
    end
    nb = nb +1
  end
  if chose[0] == p && chose[4] == p && chose [8] == p
    puts "J#{p} gagne (diago 1)"
    exit
  end
  if chose[2] == p && chose[4] == p && chose [6] == p
    puts "J#{p} gagne (diago 2)"
    exit
  end
  p= p+1
end
end

def player_phase(chose,turn)
  puts turn.even?()
  if turn.even?()
    player = 1
  else
    player = 2
  end
  puts "  Tour J#{player}"
  while chose!=255
  puts "changez une valeur ?"
  change_play=gets.chomp.to_i
  if chose[change_play].nil? && change_play <=8
  chose[change_play]=player
  print chose
  puts " "
  break
  else
    puts "non"
  end
end
end

turn =1
10.times do
nb=0
print
puts " " + "/"*20
puts "        Tour #{turn}"
puts " " + "/"*20
  3.times do
    boardcase(chose,nb)
    nb = nb +3
  end
  deco
  win_condition(chose)
  if chose.any? { |a| a.nil?}
   player_phase(chose,turn)
   turn = turn +1
  else 
    puts "Egalitée"
  end
end

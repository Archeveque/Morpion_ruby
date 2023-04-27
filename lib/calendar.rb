class Visual_Grid

  def initialize(rows, cols, cell_width, cell_height, header_array)
    puts ("+"+"-"*(cell_width))*rows+"+"
   
    for x in 0..(header_array.length-1)
      if header_array[x].length.even?
        print ("|"+" "*((cell_width-header_array[x].length)/2) + header_array[x] + " "*((cell_width+1-header_array[x].length)/2))
      else
        print ("|"+" "*((cell_width-header_array[x].length)/2) + header_array[x] + " "*((cell_width-header_array[x].length)/2))
      end
    end

    print "|"

    puts ""

    puts ("+"+"-"*(cell_width))*rows+"+"
    for c in 1..cols
 
      for i in 1..cell_height
        puts ("|"+" "*cell_width)*rows+"|"
      end
 
      puts ("+"+"-"*(cell_width))*rows+"+"
    end
 
  end

end

calendar = Visual_Grid.new(7, 4, 15, 5, ["lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi", "dimanche"])



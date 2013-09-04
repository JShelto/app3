module RecipesHelper


  def blank_message
    case rand(1..6)
      when 1
        "Sorry, I couldn't find anything.Maybe you need more time...?"
      when 2
        "No results found. Did you try specifying a course?"    
      when 3
        "Far out! Maybe you shouldn't specify a course...?"
      when 4
        "That sounds good, but I didn't find anything."
      when 5
        "Do you really even have time to be cooking right now?"
      when 6
        "???"
    end
  end

end

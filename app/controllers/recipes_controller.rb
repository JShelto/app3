class RecipesController < ApplicationController

  def index
    @params = params
  end

  def search
    @hours = params[:hours]
    @minutes = params[:minutes]
    @seconds = ((@hours.to_i * 60) + @minutes.to_i) * 60
    @course = params[:courses]
    @search = params[:search].split.join("+")
    @score = params[:rating]

    if @course == "Lunch" || "Snacks"
      @course = "Lunch and Snacks"
    end

    if @course == "Breakfasts"
      @course = "Breakfast and Soups"
    end


    yumid = YUMMLY_APP_ID
    yumkey = YUMMLY_APP_KEY

    #calls the Yummly API with search params to return an index of recipes
    if @course.blank?
      @url = URI::encode("api.yummly.com/v1/api/recipes?_app_id="+yumid+"&_app_key="+yumkey+"&q=#{@search}&maxTotalTimeInSeconds=#{@seconds}")
    else
      @url = URI::encode("api.yummly.com/v1/api/recipes?_app_id="+yumid+"&_app_key="+yumkey+"&q=#{@search}&allowedCourse[]=course^course-#{@course}&maxTotalTimeInSeconds=#{@seconds}")
    end

    @response = JSON.load(open(@url))["matches"].map {|listing| 
      {"image" => listing["smallImageUrls"].first,
      "time" => listing["totalTimeInSeconds"].to_i / 60,
      "name" => listing["recipeName"],
      "recipeId" => listing["id"],
      "items" => listing["ingredients"]}
    }

  end

  def show

    yumid = YUMMLY_APP_ID
    yumkey = YUMMLY_APP_KEY
    
    #calls the Yummly API to return the JSON for a specific recipe, and extracts the sourceRecipeUrl
    @url_y = "http://api.yummly.com/v1/api/recipe/#{params[:id]}?_app_id="+yumid+"&_app_key="+yumkey
    @title = JSON.load(open(@url_y))['name']
    @img = JSON.load(open(@url_y))["images"].map { |pic|
      {"bigPic" => pic["hostedLargeUrl"]}
    }
    @site = JSON.load(open(@url_y))['source']['sourceRecipeUrl']
    @location = JSON.load(open(@url_y))['source']['sourceDisplayName']
    @ingredients = JSON.load(open(@url_y))["ingredientLines"]
    @snippet = JSON.load(open(@url_y))['attribution']['html']
    @prep = JSON.load(open(@url_y))['totalTime']

  end

end
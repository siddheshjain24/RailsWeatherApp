class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    
    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=85027&distance=25&API_KEY=0FE5FE29-264A-4605-92A7-721A03454919'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)  # Corrected: Net::HTTP should be capitalized
    @output = JSON.parse(@response)  # Parse the JSON response
    

    if @output.empty?
      @final_output = 'error'
    else 
      @final_output = @output[0]['AQI']
    end


 
  end
end

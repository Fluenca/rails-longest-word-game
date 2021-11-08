require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
  @letters = [*('a'..'z')].sample(10)
  end

  def score
    @response = URI.open("https://wagon-dictionary.herokuapp.com/#{params[:word]}").read
    @parsed = JSON.parse(@response)
      case
      when params[:game].split.include?(params[:word].split) != true
        @wrong = 'Sorry your word can not be made out of the letters.'
      when @parsed['found'] == false
        @wrong = 'Sorry your word does not seem to exist in the english language.'
      end
  end
end

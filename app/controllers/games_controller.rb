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
      when params[:word].split(//).to_set.subset?(params[:game].split(//).to_set) != true
        @wrong = 'Sorry your word can not be made out of the letters.'
      when @parsed['found'] == false
        @wrong = 'Sorry your word does not seem to exist in the english language.'
      else
        @wrong = 'Congrats your word is a valid english word!'
      end
  end
end

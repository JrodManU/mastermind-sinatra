require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?

require './code_handler.rb'

get '/' do
  erb :game
end

require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?

require_relative 'code_handler'

enable :sessions
set :session_secret, 'tjwa9*&%Y28woHTGN@Y#8tysejzhg#O*53lWy'

get '/' do
  if !session['code_handler']
    session['code_handler'] = CodeHandler.new
  end

  message = ''
  correct = false
  if params['restart']
     session['code_handler'].new_code
  end
  if params['guess']
    guess = params['guess']
    if  session['code_handler'].valid_code(guess)
      message =  session['code_handler'].rate(guess)
      correct =  session['code_handler'].correct_code(guess)
    else
      message = 'Please make sure your guess is 4 letters and a-f only.'
    end
  end
  erb :game, :locals => { :message => message, :correct => correct }
end

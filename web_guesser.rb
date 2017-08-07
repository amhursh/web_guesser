require 'sinatra'
require 'sinatra/reloader'

RAND_NUM = rand(101)

def check_guess(guess)
  counter_incrementor
  if guess == 0
    "By the way..."
  elsif guess > RAND_NUM && (guess - RAND_NUM) > 5
    "Way Too high!"
  elsif guess < RAND_NUM && (RAND_NUM - guess) > 5
    "Way Too low!"
  elsif guess > RAND_NUM
    "Too high!"
  elsif guess < RAND_NUM
    "Too low!"
  else
    "You got it right!"
  end
end

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:rand_num => RAND_NUM, :message => message}
end

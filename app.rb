require 'rubygems'
require 'sinatra'

class App < Sinatra::Base
	get "/" do
		erb :index
  end
end


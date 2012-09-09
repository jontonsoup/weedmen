require 'rubygems'
require 'sinatra'
require 'pony'
require 'rack-flash'


enable :sessions
use Rack::Flash

get "/" do

	erb :index
end

post "/" do
	if not params[:name].nil?
		name = params[:name]
		mail = params[:mail]
		body = params[:body]
		moo = params[:moo]
		if moo == 'moo'
        	Pony.mail(:to => 'friedmanj98@gmail.com', :from => "#{mail}", :subject => "Inquiry from #{name}", :body => "#{body}", :via => :smtp)



        	flash[:notice] = "Thanks! We will get back to you shortly."
        else
        	flash[:error] = "You must enter the correct cow sound..."
        end
    end
    erb :index
end


require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :index
    end

    get '/teams' do
      @team = Team.new(params[:team])

      params[:team][:super_hero].each do |content|
        Super_hero.new(content)
      end

      @team = Team.all


      erb :'teams'
    end


end

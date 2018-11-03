require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team = Team.new(params[:team][:name], params[:team][:motto])

      params[:team][:members].each do |content|
        Member.new(content[:name], content[:power], content[:bio])
      end

      @members = Member.all


      erb :team
    end
end

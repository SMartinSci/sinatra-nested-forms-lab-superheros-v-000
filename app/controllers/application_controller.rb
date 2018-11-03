require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team = Team.new(params[:team][:name], params[:team][:motto])

      params[:team][:team_members].each do |content|
        Team_member.new(content[:name], content[:power], content[:bio])
      end

      @team_members = Team_member.all


      erb :team
    end
end

require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team_name = params[:team][:name]
      @team_motto = params[:team][:motto]
      @hero_power && @hero_name = []
      @hero_power = []
      @hero_bio = []
      @whole_team = params[:team][:members]
      @whole_team.each do |i_hero|
      @hero_name << i_hero[:name]
      @hero_bio << i_hero[:bio]
      @hero_power << i_hero[:power]
    end

      # Initial attempt without individual models:
      # @team = Team.new(params[:team][:name], params[:team][:motto])
      #
      # params[:team][:members].each do |content|
      #   Member.new(content[:name], content[:power], content[:bio])
      # end
      #
      # @members = Member.all

      erb :team
    end
end

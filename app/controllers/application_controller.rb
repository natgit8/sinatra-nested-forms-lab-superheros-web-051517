require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :team
    end

    # post '/' do
    #   # puts params
    #   erb :super_hero
    # end

    post '/team' do
      @team = Team.new(params[:team])
      params[:team][:heroes].each do |info|
        Hero.new(info)
      end
      @heroes = Hero.all

      erb :super_hero
    end

end

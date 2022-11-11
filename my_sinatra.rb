require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/base'


module MyAppModule
  class App < Sinatra::Base
    register Sinatra::Namespace

    get '/' do
      'Hello My Sinatra - Easy and Wide world!'
    end

    # Перенаправление запроса
    get '/redirect' do
      redirect to('/hello/World')
    end

    # Именованные параметры в качестве переменных блока
    get '/hello/:name' do |n|
      "Hello #{n}!"
    end

    # get %r{/hello/([\w]+)} do |c|
    #   "Hello, #{c}!"
    # end

    # Использование маски ‘splat’
    get '/say/*/to/*' do
      params['splat'].to_s
    end

    # Параметры блока
    get '/download/*.*' do |path, ext|
      [path, ext].to_s
    end

    # Необязательные параметры в шаблонах маршрутов
    get '/jobs.?:format?' do
      'Да, работает этот маршрут!'
    end

    get '/hello/:name' do
      "Sinatra приветствует тебя, #{params[:name]}!"
    end

    namespace '/api/v1' do
      get "/*" do
        "I'm in the namespace /api/v1"
      end
    end

    get '/*' do
      "I don't know what is the #{params[:splat]}. It's what you typed."
    end

  end
end

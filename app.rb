fail 'Missing ENV: GITHUB_ID & GITHUB_SECRET' unless ENV['GITHUB_ID'] && ENV['GITHUB_SECRET']

require 'bundler/setup'
require 'sinatra'
require 'oa-oauth'

use OmniAuth::Strategies::GitHub, ENV['GITHUB_ID'], ENV['GITHUB_SECRET']

set :sessions, true

get '/' do
  redirect to('/auth/github')
end

get '/auth/github/callback' do
  raise request.env
  # raise request.env['omniauth.auth']
end

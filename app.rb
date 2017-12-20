require 'sinatra/base'
require './lib/blockchain.rb'

class App < Sinatra::Base

@blockchain = BlockChain.new
  get '/' do
    @chain = @blockchain.chain
    erb :index
  end

  get '/transaction/new' do
    erb :new
  end

  post '/transaction/new' do
    @blockchain.add_block({sender: params[:sender], recipient: params[:recipient], amount: params[:amount]})
    redirect '/'
  end





end

require 'sinatra/base'
require './lib/blockchain.rb'

class App < Sinatra::Base

  before do
    @blockchain = BlockChain.instance
  end

  get '/' do
    @blockchain = BlockChain.instance
  end

  get '/transaction' do
    @chain = @blockchain.chain
    erb :index
  end

  get '/transaction/new' do
    p @blockchain.chain
    erb :new
  end

  post '/transaction/new' do
    @blockchain.add_block({sender: params[:sender], recipient: params[:recipient], amount: params[:amount]})
    redirect '/transaction'
  end
end

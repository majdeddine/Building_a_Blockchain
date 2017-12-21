require 'sinatra/base'
require './lib/blockchain.rb'
require './lib/user'
require './lib/transaction'

class App < Sinatra::Base

  before do
    @blockchain = BlockChain.instance
  end

  get '/' do
    @chain = @blockchain.chain.reverse
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

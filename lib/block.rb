require 'digest'
require 'json'
class Block
  attr_accessor :index, :previous_hash
  attr_reader :timestamps, :hash, :nonce

  def initialize(transaction)
    @index = 0
    @previous_hash= ''
    @transaction = transaction.to_json
    @timestamps = "#{Time.now()}"
    @nonce = 0
  end

  def sha256(hash)
    Digest::SHA256.hexdigest(hash).to_s
  end

  def calculate_hash
      @hash = sha256(@index.to_s + @timestamps + @transaction + @previous_hash + @nonce.to_s)
  end

  def mine_block(difficulty)

    while @hash[0..difficulty] != ['0'*difficulty] do
      @nonce+=1
      calculate_hash
    end
  end
  end

end

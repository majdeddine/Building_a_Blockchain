require 'digest'
require 'json'
class Block
  attr_accessor :index, :previous_hash, :nonce
  attr_reader :timestamps, :hash

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

  def mine_block()
    while @hash[-2..-1] != '00' do
      @nonce+=1
      puts @hash
      self.calculate_hash

    end
  end

end

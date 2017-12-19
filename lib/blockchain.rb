require './lib/block'
class BlockChain

  attr_reader :chain

  def initialize()
    @chain = [create_genesis_block()]
    # @block = block
  end

  def create_genesis_block
    return Block.new('')
  end
  
end

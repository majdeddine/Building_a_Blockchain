require './lib/block'
class BlockChain
  attr_accessor :difficulty
  attr_reader :chain

  def initialize()
    @chain = [create_genesis_block()]
    @difficulty = 4
  end

  def create_genesis_block
    block = Block.new('')
    block.calculate_hash
    return block
  end

  def last_block
    return @chain.last
  end

  def add_block(transaction)
    block = Block.new(transaction)
    block.index = @chain.size
    block.previous_hash = @chain.last.hash
    block.calculate_hash
    block.mine_block(@difficulty)
    @chain << block
  end

end

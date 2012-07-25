require 'trello'
require 'git'

class TrelloBranch

  attr_reader :board, :logger

  def initialize(board_id)
    @board = Trello::Board.find(board_id)
    @logger = Logger.new(STDOUT)
  end

  def checkout_card(short_id)
    logger.info "TrelloBranch: Looking up card ##{short_id}"
    c = card(short_id)
    branch_name = branch_name_for_card(c)

    logger.info "TrelloBranch: Checking out branch: #{branch_name}"
    checkout_branch(branch_name)
  end

private

  def card(short_id)
    board.cards.detect{|c| c.short_id == short_id}
  end

  def branch_name_for_card(c)
    short_desc = c.name.downcase.gsub(/\W+/, '-')[0..40]
    "tr_#{c.id}_#{short_desc}"
  end

  def checkout_branch(branch_name)
    g = Git.open('.', log: logger)
    g.branch(branch_name).checkout
  end

end

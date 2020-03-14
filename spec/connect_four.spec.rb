# frozen_string_literal: true

require_relative '../lib/connect_four/game.rb'

# rubocop:disable Metrics/BlockLength
describe Game do
  subject { Game.new }

  it 'declares a winner if there is a horizontal line of the same four consecutive color' do
    subject.board.grid = [['*', '*', '*', '*', '*', '*', '*'],
                          ['*', '*', '*', '*', '*', '*', '*'],
                          ['*', '*', '*', '*', '*', '*', '*'],
                          ['*', '*', '*', '*', '*', '*', '*'],
                          ['●', '●', '●', '*', '*', '*', '*'],
                          ['○', '○', '○', '○', '*', '*', '*']]
    subject.send(:check_win)
    expect(subject.winner.name).to eql('Player1')
  end

  it 'declares a winner if there is a vertical line of the same four consecutive color' do
    subject.board.grid = [['●', '*', '*', '*', '*', '*', '*'],
                          ['●', '○', '*', '*', '*', '*', '*'],
                          ['●', '○', '*', '*', '*', '*', '*'],
                          ['●', '○', '*', '*', '*', '*', '*'],
                          ['○', '●', '*', '○', '*', '*', '*'],
                          ['●', '○', '*', '○', '*', '*', '*']]
    subject.current_player = subject.player2
    subject.send(:check_win)
    expect(subject.winner.name).to eql('Player2')
  end

  it 'declares a winner if there is a bashslash diagonal line of the same four consecutive color' do
    subject.board.grid = [['*', '*', '*', '*', '*', '*', '*'],
                          ['*', '*', '*', '*', '*', '*', '*'],
                          ['○', '*', '*', '*', '*', '*', '*'],
                          ['●', '○', '*', '*', '*', '*', '○'],
                          ['●', '●', '○', '*', '*', '*', '○'],
                          ['●', '●', '●', '○', '*', '*', '○']]
    subject.send(:check_win)
    expect(subject.winner.name).to eql('Player1')
  end

  it 'declares a winner if there is a forward slash diagonal line of the the same four consecutive color' do
    subject.board.grid = [['*', '*', '*', '*', '*', '*', '*'],
                          ['*', '*', '*', '*', '*', '*', '*'],
                          ['*', '*', '*', '*', '*', '*', '●'],
                          ['*', '*', '*', '*', '*', '●', '○'],
                          ['*', '*', '*', '*', '●', '○', '○'],
                          ['●', '*', '*', '●', '○', '○', '○']]
    subject.current_player = subject.player2
    subject.send(:check_win)
    expect(subject.winner.name).to eql('Player2')
  end

  it 'declares a draw if there is no available cell left' do
    subject.board.grid = [['●', '●', '●', '○', '●', '●', '●'],
                          ['○', '○', '○', '●', '○', '○', '○'],
                          ['●', '●', '○', '○', '○', '●', '○'],
                          ['○', '○', '●', '●', '○', '○', '●'],
                          ['●', '●', '○', '○', '●', '●', '○'],
                          ['●', '●', '○', '○', '●', '○', '●']]
    subject.send(:check_draw)
    expect(subject.draw).to eql(true)
  end
end

describe Board do
  subject { Board.new }

  it 'creates seven column and six row grid' do
    expected = [['*', '*', '*', '*', '*', '*', '*'],
                ['*', '*', '*', '*', '*', '*', '*'],
                ['*', '*', '*', '*', '*', '*', '*'],
                ['*', '*', '*', '*', '*', '*', '*'],
                ['*', '*', '*', '*', '*', '*', '*'],
                ['*', '*', '*', '*', '*', '*', '*']]
    expect(subject.grid).to eql(expected)
  end

  # it 'checks for '

  it 'updates the grid' do
    expected = [['*', '*', '*', '*', '*', '*', '*'],
                ['*', '*', '*', '*', '*', '*', '*'],
                ['*', '*', '*', '*', '*', '*', '*'],
                ['*', '*', '*', '*', '*', '*', '*'],
                ['*', '*', '*', '*', '*', '*', '*'],
                ['*', '*', '*', '●', '*', '*', '*']]

    pick_column = 4
    subject.update_grid(pick_column - 1, '●')
    expect(subject.grid).to eql(expected)
  end
end

describe Player do
  subject { Player.new('Player1', '○') }

  it 'creates player' do
    expect(subject.class.name).to eql('Player')
  end
end
# rubocop:enable Metrics/BlockLength

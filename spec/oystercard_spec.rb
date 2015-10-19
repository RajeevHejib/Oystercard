require 'oystercard'

describe Oystercard do
  it 'has an existing balance' do
    expect(subject).to respond_to(:balance)
  end
end

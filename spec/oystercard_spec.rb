require 'oystercard'

describe Oystercard do
  it 'has an existing balance' do
    expect(subject).to respond_to(:balance)
  end

  it 'increase balance by the amount specified in top-up' do
    expect{subject.top_up(10)}.to change{subject.balance}.by(10)
  end
end

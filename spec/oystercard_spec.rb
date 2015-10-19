require 'oystercard'

describe Oystercard do
  it 'has an existing balance' do
    expect(subject).to respond_to(:balance)
  end

  context 'Topping up' do
    it 'increases the balance by the amount specified in top-up' do
      expect{subject.top_up(10)}.to change{subject.balance}.by(10)
    end

    it 'raises an error if the top-up would take the balance over 90' do
      expect{subject.top_up(Oystercard::LIMIT + 1)}.to raise_error "This would take the balance over #{Oystercard::LIMIT}"
    end
  end

  context 'Spending money' do
    it 'deducts money from the card when make a journey' do
      expect{subject.deduct(10)}.to change{subject.balance}.by(-10)
    end
  end

end

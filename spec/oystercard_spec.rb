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

  context 'Making journeys' do
    it 'displays the journey status, initialized as false' do
      expect(subject.in_journey?).to eq false
    end

    it 'changes in_journey to true when touch_in is invoked' do
      allow(subject).to receive(:balance).and_return(Oystercard::MINIMUM_FARE)
      expect(subject.touch_in).to eq true
    end

    it 'changes in_journey to false when touch_out is invoked' do
      expect(subject.touch_out).to eq false
    end

    it 'raises an error if balance is £1 or less when touch_in invoked' do
      expect{subject.touch_in}.to raise_error "Insufficient balance"
    end
  end


end

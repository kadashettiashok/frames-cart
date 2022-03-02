require 'rails_helper'

describe Lense, type: :model do
  subject do
    Lense.new(color: nil, description: 'description', prescription_type: 'fashion', stock: 5, price: 20)
  end

  it 'color shoud present' do
    lense = Lense.new(color: 'Frame', description: 'description', prescription_type: 'fashion', stock: 5, price: 20)
    expect(lense.color?).to eq(true)
  end

  it 'is not valid without name' do
    expect(subject.color?).to eq(false)
  end

  it 'is not valid without status' do
    subject.price
    expect(subject.price > 0).to eq(true)
  end

  it 'stock should not be zero' do
    expect(subject.stock == 0).to eq(false)
  end
end

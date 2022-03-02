require 'rails_helper'

describe Frame, type: :model do
  subject {
    Frame.new(name: 'Frame', description: 'description', status: 'active', stock: 5, price: 20)
  }

  it 'name shoud present' do
    frame = Frame.new(name: 'Frame', description: 'description', status: 'active', stock: 5, price: 20)
    expect(frame.name?).to eq(true)
  end

  it 'is not valid without name' do
    subject.name = nil
    expect(subject.name?).to eq(false)
  end

  it 'is not valid without status' do
    subject.status = nil
    expect(subject.status?).to eq(false)
  end

  it 'is not valid without password' do
    expect(subject.stock?).to eq(true)
  end
end
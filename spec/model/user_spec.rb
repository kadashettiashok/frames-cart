require 'rails_helper'

describe User, type: :model do
  subject do
    User.new(name: 'Abcd', email: 'abcd@gmail.com', password: '123456', role: 'admin', currency: "usd")
  end

  it 'name shoud present' do
    user = User.new(name: 'Abcd', email: 'abcd@gmail.com', password: '123456', role: 'user', currency: "usd")
    expect(user.name?).to eq(true)
  end

  it 'is not valid without name' do
    subject.name = nil
    expect(subject.name?).to eq(false)
  end

  it 'is not valid without email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  #   describe 'validations' do
  #     it { is_expected.to validate_presence_of :name }
  #     it { is_expected.to validate_presence_of :email }
  #     it { is_expected.to validate_presence_of :password }
  #     it { is_expected.to validate_presence_of :role }
  #   end
end

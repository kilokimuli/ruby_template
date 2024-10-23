require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = FactoryBot.build(:user)  # Use the factory to build a user
    expect(user).to be_valid
  end

  it 'is not valid without a first name' do
    user = FactoryBot.build(:user, first_name: nil)  # Use the factory and override first_name
    expect(user).not_to be_valid
  end

  it 'is not valid without a last name' do
    user = FactoryBot.build(:user, last_name: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid without an email' do
    user = FactoryBot.build(:user, email: nil)
    expect(user).not_to be_valid
  end
  
  it 'is not valid with a duplicate email' do
    FactoryBot.create(:user, email: 'test@example.com')  # Create a user with this email
    user = FactoryBot.build(:user, email: 'test@example.com')  # Attempt to create another user with the same email
    expect(user).not_to be_valid
  end
end

require 'user'

RSpec.describe User do
  describe '.all' do
    it 'returns all users, wrapped in a User instance' do
      user = User.create(email: 'test@example.com', password: 'password123')

      users = User.all
      emails = users.map(&:email)

      expect(emails).to include 'test@example.com'
    end
  end

  describe '.create' do
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(email: 'test@example.com', password: 'password123')
    end

    it 'creates a new user' do
      user = User.create(email: 'test@example.com', password: 'password123')

      expect(user.id).not_to be_nil
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'test@example.com', password: 'password123')

      expect(User.find(user.id).email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end
end
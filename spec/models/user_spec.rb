require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before :each do
      @user = User.new({ name: 'Joe', email: 'joes@email.com', password: '12345678', password_confirmation: '12345678', last_name: 'Schmoe' })
    end

    it 'must save successfully when all field are correctly filled' do
      @user.save
      expect(@user.save).to eq true 
    end
    
    it 'must check password and password_confirmation match' do
      @user.password_confirmation = '1111'
      @user.save
      expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end

    it 'must require password and password_confirmation' do
      @user.password = nil
      @user.password_confirmation = nil
      @user.save
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end
    it 'must require first name' do
      @user.name = nil
      @user.save
      expect(@user.errors.full_messages).to include ("Name can't be blank")
    end
    it 'must require last name' do
      @user.last_name = nil
      @user.save
      expect(@user.errors.full_messages).to include ("Last name can't be blank")
    end
    it 'must require email' do
      @user.email = nil
      @user.save
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end

    it 'must check email for uniquness regardless of cases' do
      @user.save
      @user2 = User.new ({ name: 'Joe', email: 'JOES@EMAIL.COM', password: '1234', password_confirmation: '1234', last_name: 'Schmoe' })
      @user2.save
      expect(@user2.errors.full_messages).to include ("Email has already been taken")
    end

    it 'must check the password is at least 8 characters long' do
      @user.password = "1234"
      @user.password_confirmation = "1234"
      @user.save
      expect(@user.errors.full_messages).to include ("Password is too short (minimum is 8 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    before :each do
      @user = User.new({ name: 'Joe', email: 'joes@email.COM', password: '12345678', password_confirmation: '12345678', last_name: 'Schmoe' })
      @user.save
    end
    it 'must successully authenticate and create a session if password matches' do
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to eq @user
    end

    it 'should be able to remove leading and trailing white space in email address' do
      expect(User.authenticate_with_credentials(' joes@email.COM  ', @user.password)).to eq @user
    end

    it 'should be case insensitive for email address' do
      expect(User.authenticate_with_credentials('JOES@EMAIL.com', @user.password)).to eq @user
    end
  end
end

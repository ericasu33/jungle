require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(
      :first_name => 'John',
      :last_name => 'Smith',
      :email => 'john@smith.com',
      :password => '123',
      :password_confirmation => '123'
    )
  end

  describe 'User Validation' do
    it 'should register user successfully' do
      @user.save!
    end

    it 'user fails to register is no password is given' do
      @user.password = nil

      @user.save
      expect(@user.errors.full_messages).to eq(["Password can't be blank"])
    end

    it 'user fails to register if no password_confirmation is given' do
      @user.password_confirmation = nil

      @user.save
      expect(@user.errors.full_messages).to eq(["Password confirmation can't be blank"])
    end

    it 'user fails to register if password and password confirmation does not match' do
      @user.password = '123'
      @user.password_confirmation ='456'
      
      @user.save
      expect(@user.errors.full_messages).to eq(["Password confirmation doesn't match Password"])
    end

    it 'user fails to register if password is not within 3 to 10 characters' do
      @user.password = '1'
      @user.password_confirmation ='1'
      

      @user.save
      expect(@user.errors.full_messages).to eq(["Password is too short (minimum is 3 characters)"])
    end

    it 'user fails to register if email is not unique(not case sensitive)' do
      @user1 = User.new(
        :first_name => 'John',
        :last_name => 'Smithe',
        :email => 'John@smith.com',
        :password => '123',
        :password_confirmation => '123'
    )

      @user.save
      @user1.save
      expect(@user1.errors.full_messages).to eq(["Email has already been taken"])
    end

    it 'user fails to register if no email in given' do
      @user.email = nil

      @user.save
      expect(@user.errors.full_messages).to eq(["Email can't be blank"])
    end

    it 'user fails to register if no first_name is give' do
      @user.first_name = nil

      @user.save
      expect(@user.errors.full_messages).to eq(["First name can't be blank"])
    end

    it 'user fails to register if no last_name is given' do
      @user.last_name = nil

      @user.save
      expect(@user.errors.full_messages).to eq(["Last name can't be blank"])
    end
  end

  describe '.authenticate_with_credentials' do
    it 'user login would fail is given wrong password' do
      @user.save
      expect(User.authenticate_with_credentials("john@smith.com", "1")).to be_nil
    end

     it 'user should still login if user inputs wrong case' do
      @user.save
      expect(User.authenticate_with_credentials("John@smith.com", "123")).to eq(@user)
    end

    it 'user should still login if there are spaces before or after their email' do
      @user.save
      expect(User.authenticate_with_credentials(" john@smith.com", "123")).to eq(@user)
    end

  end

end

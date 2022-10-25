require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here
    before(:each) do
      @user = User.new do |u|
        u.first_name = 'Nick'
        u.last_name = 'Holm'
        u.email = 'nick416holm@gmail.com'
        u.password = '123'
        u.password_confirmation = '123'
      end
    end

    it "is valid with all of the required fields" do
      expect(@user).to be_valid
    end

    it "is not valid without a first name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "is not valid without a last name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    

    it "is not vaild without an email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid if email is not unique' do
      @user.save

      user_email_not_unique = User.new do |u|
        u.first_name = 'Joe'
        u.last_name = 'Beef'
        u.email = 'nick416holm@gmail.com'
        u.password = '123'
        u.password_confirmation = '123'
      end

      user_email_not_unique.save

      expect(user_email_not_unique).to_not be_valid
    end

    it "is not valid without a password" do 
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it "is not valid without a password confirmation" do 
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it "is not valid if password and  password_confirmation do not match" do
      @user.password = '123'
      @user.password_confirmation = '1234'
      expect(@user).to_not be_valid
    end

    it "should have a password of at least 3 characters" do
      @user.password = "hi"
      expect(@user).to_not be_valid
    end
  
  end

  # describe '.authenticate_with_credentials' do
  #   # examples for this class method here
  #   before(:each) do
  #     @user = User.new do |u|
  #       u.first_name = 'Nick'
  #       u.last_name = 'Holm'
  #       u.email = 'nick416holm@gmail.com'
  #       u.password = '123'
  #       u.password_confirmation = '123'
  #     end
  #   end
  # end



end

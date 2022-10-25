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

    it 'is valid with all of the required fields' do
      expect(@user).to be_valid
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

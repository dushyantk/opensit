require 'spec_helper'

describe User do
  it 'should create a user' do
    create :user
    user = User.first
    expect(User.count).to eq 1
    expect(user.username).to eq 'buddha'
  end

  it "should not allow username's that match a route name" do
    expect { create :user, username: 'front' }.to raise_error(
      ActiveRecord::RecordInvalid,
      "Validation failed: 'front' is reserved."
    )
  end

  it "should not allow spaces in the username" do
    expect { create :user, username: 'dan bartlett', email: 'dan@dan.com' }.to raise_error(
      ActiveRecord::RecordInvalid,
      "Validation failed: Username cannot contain spaces."
    )
  end
end

# == Schema Information
#
# Table name: users
#
#  authentication_token   :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_name       :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  city                   :string(255)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  country                :string(255)
#  created_at             :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  default_sit_length     :integer          default(30)
#  dob                    :date
#  email                  :string(255)
#  encrypted_password     :string(128)      default(""), not null
#  failed_attempts        :integer          default(0)
#  first_name             :string(255)
#  gender                 :integer
#  id                     :integer          not null, primary key
#  last_name              :string(255)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  locked_at              :datetime
#  password_salt          :string(255)
#  practice               :text
#  private_diary          :boolean
#  private_stream         :boolean          default(FALSE)
#  remember_created_at    :datetime
#  remember_token         :string(255)
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sign_in_count          :integer          default(0)
#  style                  :string(100)
#  unlock_token           :string(255)
#  updated_at             :datetime
#  user_type              :integer
#  username               :string(255)
#  website                :string(100)
#  who                    :text
#  why                    :text
#

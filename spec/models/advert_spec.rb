require 'rails_helper'

RSpec.describe Advert, :type => :model do
  it{ should have_db_column(:description).of_type(:text).with_options( null: false ) }

  it{ should validate_presence_of(:description) }
end

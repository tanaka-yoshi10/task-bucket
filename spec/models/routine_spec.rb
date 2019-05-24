require 'rails_helper'

RSpec.describe Routine, type: :model do
  it 'has a valid factory' do
    expect(build(:routine)).to be_valid
  end
end

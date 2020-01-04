require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:date_of_birth) }
  end
  describe 'Association' do
  	it { is_expected.to have_many(:books) }
  	it { is_expected.to have_many(:author_books) }
  end
end

require 'rails_helper'

RSpec.describe Book, type: :model do
	describe 'Validations' do
	  it { is_expected.to validate_presence_of(:title) }
	end

	describe 'Association' do
  	it { is_expected.to have_many(:authors) }
  	it { is_expected.to have_many(:author_books) }
  end
end

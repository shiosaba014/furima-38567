require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  it 'test' do
    @item.name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Name can't be blank"
  end
end

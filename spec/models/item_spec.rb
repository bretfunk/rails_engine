require 'rails_helper'

RSpec.describe Item, type: :model do
    it { should have_many(:invoice_items) }
    it { should have_many(:invoices) }
    it { should have_many(:transactions) }
    it { should belong_to(:merchant) }
end

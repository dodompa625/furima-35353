require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe "購入" do

    context '購入に成功する場合' do
      it "全て正しく入力されていれば出品される" do
        @order_address = build(:order_address)
        expect(@order_address).to be_valid
      end

      it "postal_codeを入力すると保存できる" do
        @order_address = build(:order_address, postal_code: "123-2345")
        expect(@order_address).to be_valid
      end

      it "prefectureを選択すると保存できる" do
        @order_address = build(:order_address, prefecture_id: 2)
        expect(@order_address).to be_valid
      end

      it "cityを入力すると保存できる" do
        @order_address = build(:order_address, city:  "品川区")
        expect(@order_address).to be_valid
      end

      it "house_numberを入力すると保存できる" do
        @order_address = build(:order_address, house_number: "東品川1-1")
        expect(@order_address).to be_valid
      end

      it "building_nameは空でも保存できること" do
        @order_address = build(:order_address, building_name: nil)
        expect(@order_address).to be_valid
      end

      it "receiver_telephoneを入力すると保存できる" do
        @order_address = build(:order_address, receiver_telephone: 12345678910)
        expect(@order_address).to be_valid
      end

      it "tokenがあれば保存ができること" do
        @order_address = build(:order_address, token: "tok_abcdefghijk00000000000000000")
        expect(@order_address).to be_valid
      end

    end



    context '購入に失敗する場合' do
      it "postal_codeが空だと保存できないこと" do
        @order_address = build(:order_address, postal_code: nil)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと" do
        @order_address = build(:order_address, postal_code: "2210844")
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "prefectureを選択していないと保存できないこと" do
        @order_address = build(:order_address, prefecture_id: nil)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityを選択していないと保存できないこと" do
        @order_address = build(:order_address, city: nil)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it "house_numberを選択していないと保存できないこと" do
        @order_address = build(:order_address, house_number: nil)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it "receiver_telephoneを選択していないと保存できないこと" do
        @order_address = build(:order_address, receiver_telephone: nil)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Receiver telephone can't be blank")
      end

      it "receiver_telephoneが半角のハイフンを含んだ形式だと保存できないこと" do
        @order_address = build(:order_address, receiver_telephone: "123-4567-8910")
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Receiver telephone is invalid")
      end

      it "tokenが空では登録できないこと" do
        @order_address = build(:order_address, token: nil)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
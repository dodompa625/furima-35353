require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "商品出品" do

    context '商品出品に成功する場合' do
      it "全て正しく入力されていれば出品される" do
        product = build(:product)
        expect(product).to be_valid
      end

        it "商品画像をアップロードすると登録できる" do
        product = build(:product, product_image: "product.img")
        expect(product).to be_valid
      end

      it "商品名を入力すると出品できる" do
        product = build(:product, product_name: "あいうえお")
        expect(product).to be_valid
      end
  
      it "商品説明を入力すると登録できる" do
        product = build(:product, text: "これは商品の紹介です。")
        expect(product).to be_valid
      end

      it 'カテゴリーを選択すると登録できる' do
        product = build(:product, category_id: "2")
        expect(product).to be_valid
      end
  
      it '商品の状態を選択すると登録できる' do
        product = build(:product, status_id: "2")
        expect(product).to be_valid
      end

      it '配送料の負担を選択すると登録できる' do
        product = build(:product, delivery_fee_id: "2")
        expect(product).to be_valid
      end

      it "発送元の地域を選択すると登録できる" do
        product = build(:product, prefecture_id: "13")
        expect(product).to be_valid
      end
  
      it "発送までの日数を選択すると登録できる" do
        product = build(:product, delivery_date_id: "2")
        expect(product).to be_valid
      end
  
      it '価格を入力すると登録できる' do
        product = build(:product, price: "400")
        expect(product).to be_valid
      end
    end
  
  
    context '商品出品に失敗する場合' do
  
      it "商品画像が空だと登録できない" do
        product = build(:product, product_image: nil)
        product.valid?
        expect(product.errors.full_messages).to include("Product image can't be blank")
      end
  
      it "商品名が空だと登録できない" do
        product = build(:product, product_name: nil)
        product.valid?
        expect(product.errors.full_messages).to include("Product name can't be blank")
      end
  
      it "商品説明が空だと登録できない" do
        product = build(:product, text: nil)
        product.valid?
        expect(product.errors.full_messages).to include("Text can't be blank")
      end

      it "カテゴリーが選択されてないと登録できない" do
        product = build(:product, category_id: nil)
        product.valid?
        expect(product.errors.full_messages).to include("Category can't be blank")
      end

      it "商品の状態が空だと登録できない" do
        product = build(:product, status_id: nil)
        product.valid?
        expect(product.errors.full_messages).to include("Status can't be blank")
      end

      it "配送料の負担が空だと登録できない" do
        product = build(:product, delivery_fee_id: nil)
        product.valid?
        expect(product.errors.full_messages).to include("Delivery fee can't be blank")
      end

      it "発送元の地域が空だと登録できない" do
        product = build(:product, prefecture_id: nil)
        product.valid?
        expect(product.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "発送までの日数が空だと登録できない" do
        product = build(:product, delivery_date_id: nil)
        product.valid?
        expect(product.errors.full_messages).to include("Delivery date can't be blank")
      end

      it "価格が空だと登録できない" do
        product = build(:product, price: nil)
        product.valid?
        expect(product.errors.full_messages).to include("Price can't be blank")
      end

      it "価格が300円未満だと登録できない" do
        product = build(:product, price: "299")
        product.valid?
        expect(product.errors.full_messages).to include("Price must be greater than 299")
      end

      it "価格が10,000,000円以上だと登録できない" do
        product = build(:product, price: "10000000")
        product.valid?
        expect(product.errors.full_messages).to include("Price must be less than 10000000")
      end

      it "価格は半角数字でなければ登録できない" do
        product = build(:product, price: "５００")
        product.valid?
        expect(product.errors.full_messages).to include("Price is not a number")
      end

    end
  end
end




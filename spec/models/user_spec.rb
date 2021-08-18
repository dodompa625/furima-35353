require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
   context 'ユーザ登録に失敗する場合' do


    it "nicknameが空だと登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailは一意性でないと登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it "emailは＠を含まないと登録できない" do
      user = build(:user, email: "kkkgmail.com")
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end

    it "passwordが空では登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it "password_confirmationが空では登録できない" do
      user = build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it "パスワードとパスワード（確認用）の値が一致していないと登録できない" do
      user = build(:user, password: "000000", password_confirmation: "000001")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "パスワードは、全角だと登録できない" do
      user = build(:user, password: "ああああああ", password_confirmation: "ああああああ")
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end

    it "パスワードは、英字のみだと登録できない" do
      user = build(:user, password: "aaaaaa", password_confirmation: "aaaaaa")
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end

    it "パスワードは、数字のみだと登録できない" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end


    it 'first_nameが空では登録できない' do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it "first_nameは、全角（漢字・ひらがな・カタカナ）入力でなければ登録できない" do
      user = build(:user, first_name: "masako")
      user.valid?
      expect(user.errors.full_messages).to include("First name is invalid")
    end
    
    it 'first_name_kanaが空では登録できない' do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "first_name_kanaは、全角（カタカナ）入力でなければ登録できない" do
      user = build(:user, first_name_kana: "masako")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana is invalid")
    end

    it 'last_nameが空では登録できない' do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it "last_nameは、全角（漢字・ひらがな・カタカナ）入力でなければ登録できない" do
      user = build(:user, last_name: "sugita")
      user.valid?
      expect(user.errors.full_messages).to include("Last name is invalid")
    end

    it 'last_name_kanaが空では登録できない' do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "last_name_kanaは、全角（カタカナ）入力でなければ登録できない" do
      user = build(:user, last_name_kana: "sugita")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana is invalid")
    end

    it 'birthday(year)が空では登録できない' do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end

   end
  end
end

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
   context 'ユーザ登録に成功する場合' do

    it "全て正しく入力されていれば登録される" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameを入力すると登録できる" do
      user = build(:user,  nickname: "あいうえお")
      expect(user).to be_valid
    end

    it "emailを入力すると登録できる" do
      user = build(:user, email: "aaa@gmail.com")
      expect(user).to be_valid
    end

    it "emailは一意性だと登録できる" do
      user = FactoryBot.create(:user, email: 'test@test.co.jp')
      another_user = FactoryBot.build(:user, email: 'kkk@test.co.jp')
      expect(another_user).to be_valid
    end

    it "emailは＠を含むと登録できる" do
      user = build(:user, email: "aaa@gmail.com")
      expect(user).to be_valid
    end

    it "passwordを入力すると登録できる" do
      user = build(:user, password: "aiueo123")
      expect(user).to be_valid
    end

    it 'passwordが6文字以上であれば登録できる' do
      user = build(:user, password: "aiueo123")
      expect(user).to be_valid
    end

    it "パスワードとパスワード（確認用）の値が一致していると登録できる" do
      user = build(:user, password: "aiueo123", password_confirmation: "aiueo123")
      expect(user).to be_valid
    end

    it "パスワードは、半角英数字混合で入力すると登録できる" do
      user = build(:user, password: "aiueo123")
      expect(user).to be_valid
    end

    it 'first_nameを入力すると登録できる' do
      user = build(:user, first_name: "雅子")
      expect(user).to be_valid
    end

    it "first_nameは、全角（漢字・ひらがな・カタカナ）入力すると登録できる" do
      user = build(:user, first_name: "まさこ")
      expect(user).to be_valid
    end
    
    it 'first_name_kanaを入力すると登録できる' do
      user = build(:user, first_name_kana: "マサコ")
      expect(user).to be_valid
    end

    it "first_name_kanaは、カタカナ入力すると登録できる" do
      user = build(:user, first_name_kana: "マサコ")
      expect(user).to be_valid
    end

    it 'last_nameを入力すると登録できる' do
      user = build(:user, last_name: "田中")
      expect(user).to be_valid
    end

    it "last_nameは、全角（漢字・ひらがな・カタカナ）入力すると登録できる" do
      user = build(:user, last_name: "たなか")
      expect(user).to be_valid
    end

    it 'last_name_kanaを入力すると登録できる' do
      user = build(:user, last_name_kana: "タナカ")
      expect(user).to be_valid
    end

    it "last_name_kanaは、全角（カタカナ）入力すると登録できる" do
      user = build(:user, first_name_kana: "タナカ")
      expect(user).to be_valid
    end

    it 'birthdayを入力すると登録できる' do
      user = build(:user, birthday: "2020-02-02")
      expect(user).to be_valid
    end
   end
  end
end
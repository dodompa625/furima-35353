require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do

    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "山田", last_name_kana: "やまだ", first_name: "幸子", first_name_kana: "さちこ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000", last_name: "山田", last_name_kana: "やまだ", first_name: "幸子", first_name_kana: "さちこ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailは一意性でないと登録できない" do
      user = FactoryBot.create(:user, email: 'test@test.co.jp')
      another_user = FactoryBot.build(:user, email: 'test@test.co.jp')
      # user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "山田", last_name_kana: "やまだ", first_name: "幸子", first_name_kana: "さちこ", birthday: "2000-01-01")
      # another_user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "山田", last_name_kana: "やまだ", first_name: "幸子", first_name_kana: "さちこ", birthday: "2000-01-01")
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it "emailは＠を含まないと登録できない" do
      user = User.new(nickname: "abe", email: "kkkgmail.com", password: "000000", password_confirmation: "000000", last_name: "山田", last_name_kana: "やまだ", first_name: "幸子", first_name_kana: "さちこ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end

    it "passwordが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "", password_confirmation: "00000000", last_name: "山田", last_name_kana: "やまだ", first_name: "幸子", first_name_kana: "さちこ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000", password_confirmation: "00000", last_name: "山田", last_name_kana: "やまだ", first_name: "幸子", first_name_kana: "さちこ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it "パスワードとパスワード（確認用）の値が一致していないと登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "000001", password_confirmation: "000000", last_name: "山田", last_name_kana: "やまだ", first_name: "幸子", first_name_kana: "さちこ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが空では登録できない' do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "000000", password_confirmation: "000000", last_name: "", last_name_kana: "やまだ", first_name: "幸子", first_name_kana: "さちこ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_name_kanaが空では登録できない' do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "000000", password_confirmation: "000000", last_name: "山田", last_name_kana: "", first_name: "幸子", first_name_kana: "さちこ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_nameが空では登録できない' do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "000000", password_confirmation: "000000", last_name: "山田", last_name_kana: "やまだ", first_name: "", first_name_kana: "さちこ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_name_kanaが空では登録できない' do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "000000", password_confirmation: "000000", last_name: "山田", last_name_kana: "やまだ", first_name: "幸子", first_name_kana: "", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'birthdayが空では登録できない' do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "000000", password_confirmation: "000000", last_name: "", last_name_kana: "やまだ", first_name: "幸子", first_name_kana: "さちこ", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end

# require 'factories/users'
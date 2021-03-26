require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '登録できる時' do
      it 'nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birth_dataが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationは6文字以上の半角英数字混合であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.last_name = '漢字ひらがなカタカナ'
        expect(@user).to be_valid
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.first_name = '漢字ひらがなカタカナ'
        expect(@user).to be_valid
      end
      it 'last_name_kanaは全角（カタカナ）であれば登録できる' do
        @user.last_name_kana = 'カナ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaは全角（カタカナ）であれば登録できる' do
        @user.first_name_kana = 'カナ'
        expect(@user).to be_valid
      end
    end

    context '登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@を含まないと登録できない' do
        @user.email = 'hoge.hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは半角英数字混合以外では登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = 'a12345'
        @user.password_confirmation = 'b12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.first_name = 'test'
        @user.valid?        
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it 'last_name_kanaは全角（カタカナ）以外では登録できない' do
        @user.last_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      end
      it 'first_name_kanaは全角（カタカナ）以外では登録できない' do
        @user.first_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end
      it 'birth_dataが空では登録できない' do
        @user.birth_data = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth data can't be blank")
      end
    end
  end
end
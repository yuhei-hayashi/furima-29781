require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録が上手くいくとき' do
      it "nickname,email,password,password_confirmation,first_name,last_name,first_name_reading,last_name_reading,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上なら登録できる" do
        @user.password = "aaa111"
        @user.password_confirmation = "aaa111"
        expect(@user).to be_valid
      end
      it "first_nameが全角かな、全角カナ、漢字なら登録できる" do
        @user.first_name = "あア亜"
        expect(@user).to be_valid
      end
      it "last_nameが全角かな、全角カナ、漢字なら登録できる" do
        @user.last_name = "あア亜"
        expect(@user).to be_valid
      end
      it "first_name_readingが全角カナなら登録できる" do
        @user.first_name_reading = "アアア"
        expect(@user).to be_valid
      end
      it "last_name_readingが全角カナなら登録できる" do
        @user.first_name_reading = "アアア"
        expect(@user).to be_valid
      end
    end
    context '新規登録が上手くいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        second_user = FactoryBot.build(:user)
        second_user.email = @user.email
        second_user.valid?
        expect(second_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が含まれていない場合登録できない" do
        @user.email = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "aaaaa"
        @user.password_confirmation = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordとpassword_confirmationが異なる値だと登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "bbbbbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordに英数字両方が含まれていないと登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input Input both letters and numbers.")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角かな、全角カナ、漢字以外なら登録できない" do
        @user.first_name = "aA1"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが全角かな、全角カナ、漢字以外なら登録できない" do
        @user.last_name = "aA1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it "first_name_readingが空だと登録できない" do
        @user.first_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it "first_name_readingが全角カナ以外なら登録できない" do
        @user.first_name_reading = "あ亜"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters.")
      end
      it "last_name_readingが空だと登録できない" do
        @user.last_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end
      it "last_name_readingが全角カナ以外なら登録できない" do
        @user.last_name_reading = "あ亜"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading is invalid. Input full-width katakana characters.")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

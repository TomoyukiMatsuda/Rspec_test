# Rails では自動でrequireされているので不要だが、通常ファイルを読み込む必要ある
require 'spec_helper'

# RSpec.describe はテストのグループ化を宣言している
# it はテストをexampleという単位にまとめる役割をする
# expect(X).to eq Y は「XがYに等しくなることを期待する」という意味になる
# １つのexampleの中に複数のエクスペクテーションを書くのもOKだが、
# どのexpectがあパスするのかしないのかが予想できないため原則１つのexpectとする
RSpec.describe Hello do
  it "message return hello" do
    expect(Hello.new.message).to eq "hello"
  end
end

RSpec.describe "四則演算" do
  it '1+1 は 2 になること' do
    expect(1+1).to eq 2
  end
end

# クラスUserを渡している
# contextに文脈や状況を記述するとわかりやすくなる
# beforeで共通の前準備をする、before do・・end の中で囲まれた部分はexampleの実行前に毎回呼ばれる
RSpec.describe User do
  describe '#greet' do # インスタンスメソッドのgreetメソッドをテストしますよという意味 '#greet'
    let(:user) { User.new(params) }
    let(:params) { { name: 'たろう', age: age } }
    subject { user.greet } # オブジェクトを一箇所にまとめて、is_expectedにできる

    context '12歳以下の場合' do
      let(:age) { 12 }
      it { is_expected.to eq 'ぼくはたろうだよ。'}
    end

    context '13歳以上の場合' do
      let(:age) { 13 }
      it { is_expected.to eq '僕はたろうです。'}
    end
  end
end
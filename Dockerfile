# ベースとなるイメージを選択
FROM ruby:2.5

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    yarn

# コンテナ側にフォルダを自動で作成して、コマンドを実行
WORKDIR /product-register

# コンテナ側にGemfileとGemfile.lockをコピー
COPY Gemfile Gemfile.lock /product-register

# bundle installを実行する
RUN bundle install

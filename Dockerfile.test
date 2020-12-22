FROM ruby

RUN gem install fast_excel

ARG TRAVIS_COMMIT
ARG TRAVIS_BRANCH
ARG GIT_REPO

RUN echo "source 'https://rubygems.org'" > Gemfile

RUN [ -z "$TRAVIS_COMMIT" ] && \
  echo "gem 'fast_excel', git: 'https://github.com/Paxa/fast_excel.git'" >> Gemfile || true
RUN [ -z "$TRAVIS_COMMIT" ] || \
  echo "gem 'fast_excel', git: 'https://github.com/${GIT_REPO}.git', branch: '$TRAVIS_BRANCH', ref: '$TRAVIS_COMMIT'" >> Gemfile

RUN cat Gemfile
RUN bundle
require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/hscc'
require_relative '../apps/main/application'

Hanami.configure do
  mount Main::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/hscc_development.sqlite3'
    #    adapter :sql, 'postgres://localhost/hscc_development'
    #    adapter :sql, 'mysql://localhost/hscc_development'
    #
    adapter :sql, ENV['DATABASE_URL']

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/hscc/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery do
      development :test
      test        :test
      # production :smtp, address: ENV['SMTP_PORT'], port: 1025
    end
  end
end

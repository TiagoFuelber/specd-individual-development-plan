# frozen_string_literal: true

require "sinatra/base"
require "sinatra/activerecord"

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    set :database_file, "config/database.yml"
  end

  configure :development, :test do
    set :host_authorization, { permitted_hosts: [] }
  end

  get "/health" do
    content_type :json
    { status: "ok" }.to_json
  end
end

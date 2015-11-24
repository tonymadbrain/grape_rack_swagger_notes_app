require 'rack'
require 'rubygems'
require 'bundler/setup'
require 'grape'
require './app/core'

use ActiveRecord::ConnectionAdapters::ConnectionManagement

run Notes

use Rack::Static,
  :urls => ["/images", "/lib", "/js", "/css"],
  :root => "public/swagger_ui"

map '/swagger-ui' do
  run lambda { |env|
    [
      200,
      {
        'Content-Type'  => 'txt-html',
        'Cache-Control' => 'public, max-age=86400'
      },
      File.open('public/swagger_ui/index.html', File::RDONLY)
    ]
  }
end

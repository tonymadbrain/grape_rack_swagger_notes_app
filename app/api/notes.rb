class Notes < Grape::API

  version 'v1', using: :header, vendor: 'tonymadbrain'
  format :json

  resource 'notes' do

    get '/test' do
      { data: "TEST" }
    end

  end

  add_swagger_documentation \
    :info => {
      :title => "Notes API"
    },
    :hide_documentation_path => true,
    :mount_path => "/swagger_doc",
    :markdown => false,
    :api_version => 'v1'

  before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
  end

end

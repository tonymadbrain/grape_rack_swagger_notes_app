class Notes < Grape::API

  version 'v1', using: :header, vendor: 'tonymadbrain'
    format :json

  resource 'notes' do

    get '/test' do
      { data: "TEST" }
    end
  end
end

class Notes < Grape::API

  version 'v1', using: :header, vendor: 'tonymadbrain'
  format :json

  resource 'notes' do

    desc 'Test endpoint'
    get '/test' do
      { data: "TEST" }
    end

    desc 'List all notes.'
    get '/' do
      Note.all
    end

    desc 'Create a note.'
    params do
      requires :author, type: String, desc: 'Author'
      requires :title, type: String, desc: 'Title'
      requires :content, type: String, desc: 'Body'
      optional :summary, type: String, desc: 'Summary'
      optional :private, type: Boolean, desc: 'Private'
      optional :valuation, type: Integer, desc: 'Valuation'
    end
    post '/' do
      Note.create params
    end

    desc 'Read a note.'
    params do
      requires :id, type: String, desc: 'Note id'
    end
    get '/:id' do
      Note.find params[:id]
    end

    desc 'Update a note.'
    params do
      requires :id, type: String, desc: 'Note id'
      requires :author, type: String, desc: 'Author'
      requires :title, type: String, desc: 'Title'
      requires :content, type: String, desc: 'Body'
      optional :summary, type: String, desc: 'Summary'
      optional :private, type: Boolean, desc: 'Private'
      optional :valuation, type: Integer, desc: 'Valuation'
    end
    put '/:id' do
      if Note.find(params[:id]).update(params.reject{|k,v| k=='id'})
        Note.find params[:id]
      else
        false
      end
    end

    desc 'Delete a note.'
    params do
      requires :id, type: String, desc: 'Note id'
    end
    delete '/:id' do
      Note.find(params[:id]).destroy
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

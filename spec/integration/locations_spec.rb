require 'swagger_helper'

describe 'Locations API' do
  path '/locations' do
    post 'Create a location' do
      consumes 'application/json', 'application/xml'
       parameter name: :location, in: :body, schema: {
         type: :object,
         properties: {
           city: { type: :string },
           country: { type: :string }
         },
         required: [ 'city', 'country']
       }
       response '201', 'location created' do
         let(:location) { { city: "taco town", country: "Taco Bell"} }
         run_test!
       end

       response '422', 'invalid request' do
         let(:location) { { city: 'Foo' } }
         run_test!
       end
    end
  end

  path '/locations/{id}' do
    get 'Retrieves a location' do
      tags 'locations'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'location found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            city: { type: :string },
            country: { type: :string }
          },
          required: [ 'id', 'title', 'content' ]

        let(:id) { Location.create(city: 'foo', country: 'bar').id }
        run_test!
      end

      response '404', 'blog not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end

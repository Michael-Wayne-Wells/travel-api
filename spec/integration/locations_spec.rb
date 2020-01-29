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
end

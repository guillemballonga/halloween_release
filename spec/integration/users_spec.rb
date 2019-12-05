require 'swagger_helper'

describe 'Users API' do

  path '/users' do

    post 'Creates a user' do
      tags 'Users'
      description 'Add a user'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          first_name: { type: :string }
        },
        required: [ 'name', 'email' ]
      }

      response '201', 'user created' do
        let(:user) { { name: 'elmer', email: 'elmer_03_12@hotmail.com' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/users/{id}' do

    get 'Retrieves a user' do
      tags 'Users'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string },
            email: { type: :string },
            first_name: { type: :string }
          },
          required: [ 'id', 'name', 'email' ]

        let(:id) { User.create(name: 'foo', email: 'bar@hotmail.com', first_name: 'paola').id }
        run_test!
      end

      response '404', 'pet not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
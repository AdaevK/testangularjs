require 'rails_helper'

RSpec.describe 'routes for Advert' do
  it{ expect(get('/api/adverts')).to route_to( action: 'index', controller: 'api/adverts' ) }
  it{ expect(post('/api/adverts')).to route_to( action: 'create', controller: 'api/adverts' ) }
  it{ expect(get('/api/adverts/1')).to route_to( action: 'show', controller: 'api/adverts', id: '1' ) }
end

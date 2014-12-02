require 'rails_helper'

RSpec.describe 'routes for Advert' do
  it{ expect(get('/adverts')).to route_to( action: 'index', controller: 'adverts' ) }
  it{ expect(post('/adverts')).to route_to( action: 'create', controller: 'adverts' ) }
  it{ expect(get('/adverts/1')).to route_to( action: 'show', controller: 'adverts', id: '1' ) }
end

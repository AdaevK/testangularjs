require 'rails_helper'

RSpec.describe 'routes for Photos' do

  it{ expect(post( "/api/photos" )).to route_to( action: 'create', controller: 'api/photos' ) }
  it{ expect(delete( "/api/photos/1" )).to route_to( action: 'destroy', controller: 'api/photos', id: '1' ) }
end

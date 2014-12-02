require 'rails_helper'

RSpec.describe 'routes for Photos' do

  it{ expect(post( "/photos" )).to route_to( action: 'create', controller: 'photos' ) }
  it{ expect(delete( "/photos/1" )).to route_to( action: 'destroy', controller: 'photos', id: '1' ) }
end

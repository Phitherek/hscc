require 'spec_helper'
require_relative '../../../../apps/main/controllers/home/index'

describe Main::Controllers::Home::Index do
  let(:action) { Main::Controllers::Home::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end

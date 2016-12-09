require 'spec_helper'
require_relative '../../../../apps/main/views/home/index'

describe Main::Views::Home::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/main/templates/home/index.html.haml') }
  let(:view)      { Main::Views::Home::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end

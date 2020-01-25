# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NoticeDecorator do
  let(:notice) { Notice.new.extend NoticeDecorator }
  subject { notice }
  it { should be_a Notice }
end

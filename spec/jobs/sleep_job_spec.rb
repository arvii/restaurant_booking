require 'rails_helper'

RSpec.describe SleepJob, type: :job do
  it 'spec_name' do
    allow_any_instance_of(Object).to receive(:sleep)
    expect_any_instance_of(Object).to receive(:sleep)
    described_class.perform_now
  end
end

require "spec_helper"

describe Raft::Node do
  it 'exists' do
    expect(Raft::Node.new.class).to be(Raft::Node)
  end
end

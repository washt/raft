require "spec_helper"

describe Raft::Node do
  context 'when the node is initialized' do
    let(:node) { Raft::Node.new }

    it 'should be in a follower state' do
      expect(node.type).to eq 'FOLLOWER'
    end
  end
end

require "spec_helper"

describe Raft::Node do
  context 'when the node is initialized' do
    let(:node) { Raft::Node.new }

    it 'should be in a follower state' do
      expect(node.type).to eq :FOLLOWER
    end

    it 'should initialize with a heartbeat timeout between 150ms and 300ms' do
      expect(node.heartbeat_timeout.class).to be Integer
      expect(node.heartbeat_timeout).to be >= 150
      expect(node.heartbeat_timeout).to be <= 300
    end
  end
end

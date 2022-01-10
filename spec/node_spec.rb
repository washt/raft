require "spec_helper"

describe Raft::Node do
  context 'when the node is initialized' do
    let(:node) { Raft::Node.new }

    it 'should be in a follower state' do
      expect(node.type).to eq :FOLLOWER
    end

    it 'should initialize with a heartbeat timeout between 150ms and 300ms' do
      expect(node.heartbeat_timeout.class).to be Float
      expect(node.heartbeat_timeout).to be >= 0.15
      expect(node.heartbeat_timeout).to be <= 0.3
    end

    it 'should initialize with a heatbeat timer' do
      expect(node.heartbeat_start.class).to be Time
    end

    it 'should initialize with a commitIndex and lastApplied indeces to 0' do
      expect(node.commit_index).to be 0
      expect(node.last_applied).to be 0
    end
  end
end

module Raft
# Raft provides the following guarantees
# Election Safety:
#   at most one leader can be elected in a given term.
# Leader Append-Only:
#   a leader never overwrites or deletes entries in its log; it only appends new entries.
# Log Matching:
#   if two logs contain an entry with the same index and term, then the logs are identical in all entries up through the given index.
# Leader Completeness:
#   if a log entry is committed in a given term, then that entry will be present in the logs of the leaders for all higher-numbered terms.
# State Machine Safety:
#   if a server has applied a log entry at a given index to its state machine, no other server will ever apply a different log entry for the same index.
  class Node
    # think of a node as a database that stores a single value
    # clients can send values to this server
    # a node can be in one of three states: leader, follower, or candidate
    # all nodes initialize in a follower state
    # if followers don't hear from a leader they can become a candidate
    # a candidate requests votes from other nodes, and they reply with their vote
    # a candidate becomes a leader if it gets the majority of node votes, called Leader Election
    attr_reader :type, :heartbeat_timeout

    def initialize
      rules = { :follower => :FOLLOWER, :candidate => :CANDIDATE, :leader => :LEADER }

      @type = rules[:follower]
      @heartbeat_timeout = rand(150..300)
    end
  end
end

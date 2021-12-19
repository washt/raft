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
    attr_reader :type

    def initialize()
      rules = { :follower => :FOLLOWER, :candidate => :CANDIDATE, :leader => :LEADER }

      @type = rules[:follower]
    end
  end
end

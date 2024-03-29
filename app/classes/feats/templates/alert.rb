class Feats::Templates::Alert < Feats::Base
  def initialize
    @title = 'Alert'
    @prerequisites = nil
    @features = {
      "Alert": "
        Always on the lookout for danger, you gain the following benefits:
        You gain a +5 bonus to initiative.
        You can't be surprised while you are conscious.
        Other creatures don't gain advantage on attack rolls against you as a result of being unseen by you.
      "
    }
  end
end

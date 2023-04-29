class Adventure::Create < Adventure::Base

  def call
    build_adventure
    validate_adventure
    adventure.save!
  end

  private

  def build_adventure
    context.adventure = performer.mastered_adventures.build(adventure_params)
  end

  def adventure_params
    context.adventure_params
  end
end

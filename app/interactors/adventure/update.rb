class Adventure::Update < Adventure::Base

  def call
    assign_attributes
    validate_adventure
    adventure.save!
  end

  private

  def assign_attributes
    adventure.assign_attributes(adventure_params)
  end

  def adventure_params
    context.adventure_params
  end
end

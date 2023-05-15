class Race::Create < Race::Base

  def call
    check_params
    build_race
    validate_model
    race.save!
  end

  private

  def check_params
    context.fail!(errors: 'Race params are missing') unless context.race_params
  end

  def build_race
    context.race = performer.races.build(context.race_params)
  end
end

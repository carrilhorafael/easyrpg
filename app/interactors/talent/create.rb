class Talent::Create < Talent::Base

  def call
    check_params
    build_talent
    validate_model
    talent.save!
  end

  private

  def check_params
    context.fail!(errors: 'Talent params are missing') unless context.talent_params
  end

  def build_talent
    context.talent = performer.talents.build(talent_params)
  end

  def talent_params
    context.talent_params
  end
end

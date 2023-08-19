class Backstory::Create < Backstory::Base

  def call
    check_params
    build_backstory
    validate_model
    backstory.save!
  end

  private

  def check_params
    context.fail!(errors: 'Backstory params are missing') unless context.backstory_params
  end

  def build_backstory
    context.backstory = performer.backstories.build(backstory_params)
  end

  def backstory_params
    context.backstory_params
  end
end

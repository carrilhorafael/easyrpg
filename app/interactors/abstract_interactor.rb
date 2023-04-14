class AbstractInteractor
  include Interactor

  def performer
    context.performer
  end
end

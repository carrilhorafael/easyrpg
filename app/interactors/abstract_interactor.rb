class AbstractInteractor
  include Interactor

  after :resource_reload

  def performer
    context.performer
  end

  def resource
    raise NotImplementedError
  end

  def resource_reload
    resource.reload
  end
end

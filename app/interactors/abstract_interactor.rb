class AbstractInteractor
  include Interactor

  def performer
    context.performer
  end

  def resource
    raise NotImplementedError
  end

  def adventure
    raise NotImplementedError
  end

  def session
  end

  def reload_resource
    resource.reload
  end

  def log_text
  end

  def log_extra
    {}
  end

  def generate_activity_log
    return unless log_text.present?

    ActivityLog.log!(
      text: log_text,
      performer: performer,
      adventure: adventure,
      session: session,
      extra: log_extra,
      activity: self.class.name.underscore.gsub('/', '::')
    )
  end
end

class Adventure::InitiateSession < Adventure::Base
  after :generate_activity_log
  after :reload_resource

  def call
    check_consistency
    check_action_permission

    build_session
    validate_session
    session.save!
  end

  private

    def check_consistency
      if adventure.sessions.find_by(finished_at: nil)
        context.fail!(errors: {adventure: 'já possui sessões iniciadas'})
      end
    end

    def check_action_permission
      unless adventure.mastered_by? performer
        context.fail!(errors: {adventure: 'não pertence ao jogador'})
      end
    end

    def build_session
      context.session = adventure.sessions.build(session_params)
      session.date = Date.today
    end

    def validate_session
      context.fail!(errors: session.errors) unless session.valid?
    end

    def session_params
      context.session_params
    end

    def log_text
      I18n.t('activity_log.adventure.initiate_session', performer_name: performer.name, adventure_name: adventure.name, session_id: session.uid)
    end
end

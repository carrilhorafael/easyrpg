class Adventure::UpdateSession < Adventure::Base
  after :generate_activity_log
  after :reload_resource

  def call
    check_action_permission

    assign_attributes
    validate_session
    session.save!
  end

  private

    def check_action_permission
      unless adventure.mastered_by? performer
        context.fail!(errors: {adventure: 'não pertence ao jogador'})
      end
    end

    def assign_attributes
      session.assign_attributes(session_params)
    end

    def validate_session
      context.fail!(errors: session.errors) unless session.valid?
    end

    def session_params
      context.session_params
    end

    def session
      context.session
    end

    def log_text
      I18n.t('activity_log.adventure.update_session', performer_name: performer.name, adventure_name: adventure.name, session_id: session.uid)
    end
end

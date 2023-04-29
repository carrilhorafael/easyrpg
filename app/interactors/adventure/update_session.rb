class Adventure::UpdateSession < Adventure::Base
  after :generate_activity_log

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

    def generate_activity_log
      ActivityLog.log!(
        text: "#{performer.name} atualizou informações da sessão #{session.date} da aventura #{adventure.name}",
        performer: performer,
        adventure: adventure,
        session: session,
        activity: 'adventure::update_session'
      )
    end
end

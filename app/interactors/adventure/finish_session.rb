class Adventure::FinishSession < Adventure::Base

  def call
    check_consistency
    check_action_permission

    assign_attributes
    validate_session
    session.save!
  end

  private

    def check_consistency
      if session.finished?
        context.fail!(errors: {adventure: 'sessão já finalizada'})
      end
    end

    def check_action_permission
      unless adventure.mastered_by? performer
        context.fail!(errors: {adventure: 'não pertence ao jogador'})
      end
    end

    def assign_attributes
      session.finished_at = Time.now
    end

    def validate_session
      context.fail!(errors: session.errors) unless session.valid?
    end

    def session
      context.session
    end
end

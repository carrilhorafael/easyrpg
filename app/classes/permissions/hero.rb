class Permissions::Hero
  PERMISSIONS = {
    update: ->(hero, performer) { hero.player == performer || hero.adventure&.gamemaster == performer },
    show: ->(hero, performer) { hero.player == performer || hero.adventure&.gamemaster == performer },
    destroy: ->(hero, performer) { hero.player == performer }
  }

  def initialize(hero)
    @hero = hero
  end

  def can?(performer, action: nil)
    PERMISSIONS[action]&.call(@hero, performer) || false
  end
end

module TestsHelper
  TEST_LEVELS = { 1 => :easy, 2 => :medium, 3 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
    case test.level
      when 1 then t('difficulty_level.easy')
      when 2 then t('difficulty_level.medium')
      when 3 then t('difficulty_level.hard')
      else t('difficulty_level.hero')
    end
  end

  def test_timer(test)
    test.timer ? t('.timer', time: test.timer) : t('.unlimited')
  end
end

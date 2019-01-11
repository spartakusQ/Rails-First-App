class CreateUserBadgesService
  attr_reader :badges

  def initialize(passing_tests)
    @user = passing_tests.user
    @test = passing_tests.test
    @passing_tests = passing_tests
    @badges = []
  end

  def badges_award!
    Badge.all.find_each do |badge|
      create_badge(badge.name) if send("passed_#{badge.name}?", badge.rule)
    end
  end

  private

  def passed_success_category?(title)
    category = Category.find_by(title: title)
    success_tests.map(&:test_id).uniq.count == category.tests.count
  end

  def passed_success_on_first_try?(_value)
    PassingTest.where(user: @user, test: @test).count == 1 if @passing_test.success?
  end

  def passed_success_all_level?(level)
    Test.where(level: level).map(&:id) == success_tests.map(&:test_id).uniq
  end

  def success_tests
    PassingTest.where(user: @user, test: @test, current_question: nil).select(&:success?)
  end

  def create_badge(rule)
    badge = Badge.find_by(rule: rule)
    badge_record = @user.user_badges.create(badge: badge)
    badge_record.save
  end

end

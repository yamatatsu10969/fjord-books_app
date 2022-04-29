# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    me = User.new
    she = User.new
    report = Report.new(user: me)
    assert report.editable?(me)
    assert_not report.editable?(she)
  end

  test '#created_on' do
    time = Time.zone.now
    report = Report.new(created_at: time.to_date)
    assert_equal time.to_date, report.created_on
  end
end

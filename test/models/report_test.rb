# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    report = Report.new(user: users(:one))
    assert report.editable?(users(:one))
    assert_not report.editable?(users(:two))
  end

  test '#created_on' do
    time = Time.zone.now
    report = Report.new(created_at: time.to_date)
    assert_equal time.to_date, report.created_on
  end
end

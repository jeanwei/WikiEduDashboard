# frozen_string_literal: true
# == Schema Information
#
# Table name: alerts
#
#  id             :integer          not null, primary key
#  course_id      :integer
#  user_id        :integer
#  article_id     :integer
#  revision_id    :integer
#  type           :string(255)
#  email_sent_at  :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  message        :text(65535)
#  target_user_id :integer
#  subject_id     :integer
#

# Alert for a course that has become moderately active in mainspace, intended for
# Wiki Ed's communication staff to follow up with media outlets related to the course.
# Similar to ProductiveCourseAlert, but with a different productivity threshold
class SurveyResponseAlert < Alert
  def main_subject
    user.username
  end

  def url
    user_profile_url
  end
end
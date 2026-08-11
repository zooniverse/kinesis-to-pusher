# frozen_string_literal: true

module Models
  class TalkComment < Base
    def attributes
      {
        id: data['id'],
        project_id: data['project_id'],
        board_id: data['board_id'],
        discussion_id: data['discussion_id'],
        focus_id: data['focus_id'],
        focus_type: data['focus_type'],
        user_id: data['user_id'],
        section: data['section'],
        body: data['body'],
        created_at: data['created_at'],
        url: data['url']
    }.tap do |attrs|
        attrs[:geo] = Geo.locate(data['user_ip']) if ENV['GEOLOCATION_ENABLED'] == 'true'
      end
    end
  end
end

module EventsHelper

  def started_at_value(event)
    event.persisted? ? event.started_at.strftime("%m/%d/%Y %H:%M %p") : nil
  end

  def ended_at_value(event)
    event.persisted? ? event.ended_at.strftime("%m/%d/%Y %H:%M %p") : nil
  end

end
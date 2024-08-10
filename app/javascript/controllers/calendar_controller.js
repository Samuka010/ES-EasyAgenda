import { Controller } from "@hotwired/stimulus"
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid'

export default class extends Controller {
  static targets = ['container']
  static values = {
    events: Array
  }
  connect() {
    const events = this.eventsValue.map((item) => ({
      title: item.name,
      start: item.started_at,
      end: item.finished_at,
      url: `/events/${item.id}/edit`
    }));

    this.calendar = new Calendar(this.containerTarget, {
      plugins: [dayGridPlugin],
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: ''
      },
      events,
    });

    this.calendar.render();
  }
}

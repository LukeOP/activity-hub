export function useCalendarEventFormatter() {
  
  const formatEvent = (data, user_id) => {
    // console.log(data)
    let calendarEvents = []
    // console.log(data)
    data.forEach(element => {
    // console.log(element)
      let newEvent = {
        id: element.id,
        title: element.calendar.title ? element.calendar.title : element.reference.data.student.first_name + ' ' + element.reference.data.student.last_name,
        startTime: element.reference.data.attributes.start,
        endTime: element.reference.data.attributes.end,
        daysOfWeek: [getWeekDay(element.reference.data.attributes.day)],
        startRecur: element.reference.data.attributes.start_date,
        reference_type: element.calendar.type,
        reference_type_id: element.reference.data.id,
        endRecur: element.reference.data.attributes.end_date || null,
        color: getColor(element.calendar.user_id, user_id),
        location: element.reference.data.school.room,
        tutor: getTutor(element.reference.data.tutor, user_id),
        attendance: element.reference.data.attendance,
        lesson: element.reference.data
      }
      calendarEvents.push(newEvent)
    });
    // console.log(calendarEvents)
    return calendarEvents
  }

  function getWeekDay(day){
    let dayNum = 0
    if(day === 'Monday') dayNum = 1
    if(day === 'Tuesday') dayNum = 2
    if(day === 'Wednesday') dayNum = 3
    if(day === 'Thursday') dayNum = 4
    if(day === 'Friday') dayNum = 5
    return dayNum
  }

  function getColor(event_user_id, user_id){
    if(event_user_id == user_id) return '#3B6580'
    return '#BBB'
  }
  
  function getTutor(tutor, user_id){
    if(tutor.id != user_id) {
      return `${tutor.first_name} ${tutor.last_name} - `;
    }
    return ""
  }

  return formatEvent;
}
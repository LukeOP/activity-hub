export function useCalendarEventFormatter() {
  
  const formatEvent = (data, user_id) => {
    let calendarEvents = []
    // console.log(data)
    data.forEach(element => {
    // console.log(element)
      let newEvent = {
        id: element.id,
        title: element.calendar.title ? element.calendar.title : element.reference_type[0].student.first_name + ' ' + element.reference_type[0].student.last_name,
        startTime: element.reference_type[0].attributes.start,
        endTime: element.reference_type[0].attributes.end,
        daysOfWeek: [getWeekDay(element.reference_type[0].attributes.day)],
        startRecur: element.reference_type[0].attributes.start_date,
        reference_type: element.calendar.type,
        reference_type_id: element.reference_type[0].id,
        endRecur: element.reference_type[0].attributes.end_date || null,
        color: getColor(element.calendar.user_id, user_id),
        location: element.reference_type[0].school.room,
        tutor: getTutor(element.reference_type[0].tutor, user_id),
        attendance: element.reference_type[0].attendance
        
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
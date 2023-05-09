
export function useCalendarEventFormatter() {
  
  const formatEvent = (data) => {
    let calendarEvents = []
    // console.log(data)
    data.forEach(element => {
      // console.log(element)

      let newEvent = {
        id: element.id,
        title: element.reference_type[0].student.first_name + ' ' + element.reference_type[0].student.last_name,
        startTime: element.reference_type[0].attributes.start,
        endTime: element.reference_type[0].attributes.end,
        daysOfWeek: [getWeekDay(element.reference_type[0].attributes.day)],
        startRecur: element.reference_type[0].attributes.start_date,
        reference_type: element.calendar.type,
        reference_type_id: element.reference_type[0].id,
        // endRecur: '2024-03-20'
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

  return formatEvent;
}
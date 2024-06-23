export const notificationOptions = [
    {id: 1, type: 'lesson', description: 'New Lesson Requests', requiresPermission: ['LESSONS_R', 'LESSONS_V']},
    {id: 2, type: 'lesson', description: 'Lessons Assigned to You', requiresPermission: ['LESSONS_R', 'LESSONS_V']},
    {id: 3, type: 'lesson', description: 'School Lesson Set to Active', requiresPermission: ['LESSONS_C']},
    {id: 4, type: 'lesson', description: 'School Lesson Cancellation Request', requiresPermission: ['LESSONS_C', 'LESSONS_D']},
    {id: 5, type: 'lesson', description: 'Lesson Attendance is Overdue', requiresPermission: ['LESSONS_R', 'LESSONS_V']},
    {id: 6, type: 'lesson', description: 'Lesson Details Have Changed', requiresPermission: ['LESSONS_C', 'LESSONS_E',]},
    // 
    {id: 7, type: 'event', description: 'You\'ve Been Linked to an Event', requiresPermission: ['EVENTS_R', 'EVENTS_V']},
    {id: 8, type: 'event', description: 'Another User Has Been Linked to an Event', requiresPermission: ["EVENTS_E", "EVENTS_C"]},
    {id: 9, type: 'event', description: 'You\'ve Been Assigned to an Event Job', requiresPermission: ['EVENTS_R', 'EVENTS_V']},
    {id: 10, type: 'event', description: 'Another User Has Been Assigned to an Event Job', requiresPermission: ["EVENTS_E", "EVENTS_C"]},
    // 
    {id: 11, type: 'hire', description: 'Instrument Hire Overdue', requiresPermission: ['HIRES_E', 'HIRES_C']},
    // 
    {id: 12, type: 'user', description: 'School Invitation Request', requiresPermission: ['all']},
    {id: 13, type: 'user', description: 'New School User', requiresPermission: ['STAFF_E', 'STAFF_C']},
    {id: 14, type: 'user', description: 'Your Access Permissions Have Been Updated', requiresPermission: ['all']},
    {id: 15, type: 'user', description: 'Other User\'s Access Permissions Have Been Updated', requiresPermission: ['admin']},
]
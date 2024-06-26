export function newLessonRequestTemplate(lesson, dataId= '', school_id= null, recipient = 'administrator'){
    return {
        recipient: recipient,
        icon: 'fa-solid fa-graduation-cap',
        header: 'New Lesson Request Recieved',
        details: `A ${lesson} lesson request has been recieved`,
        school_id: school_id,
        route: 'LessonRequestReview',
        dataType: 'lessonRequest',
        dataId: dataId
    }
}
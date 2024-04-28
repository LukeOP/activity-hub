<template>
    <div>
        <header id="heading" class="guide-section">
            <h1 class="guide-h1">Lesson Management</h1>

            <ul class="guide-list">
                <li><a href="#summary">Summary</a></li>
                <li><a href="#lesson_list">Lessons List</a></li>
                <li><a href="#lesson_details">Lesson Details</a></li>
                <li><a href="#lesson_edit">Editing Lesson Details</a></li>
                <li><a href="#lesson_edit_video">Lesson Edit - Video Example</a></li>
                <li><a href="#lesson_planner">Lesson Planner</a></li>
                <li><a href="#lesson_notes">Lesson Notes</a></li>
            </ul>
        </header>

        <section id="summary" class="guide-section">
            <h2 class="guide-h2">Summary</h2>
            <p>Lesson Manangement is the heart of Activity Hub. This is where you can view, edit and manage your instrument lessons easily, with attendance options and lesson notes to make this a one-stop-shop for tutors. For administrators it provides easy viewing of when lessons are occuring and how many active lessons are in place on any given day. The ability to add attendance records and funding tags makes this a powerful section.</p>
            <img class="guide-img box-shadow" src="/images/user_guides/lesson_summary.png" alt="Lesson List Example">
            <figure>An example of the Lessons List table.</figure>
            <hr>
        </section>

        <section id="lesson_list" class="guide-section">
            <h2 class="guide-h2">Lessons List</h2>
            <p>The Lessons List screen is easily access by selecting 'Lessons' from the navigation bar. Here you will find details of all assigned lessons including the status of those lessons (Active, Pending, or Waiting). Depending on your permission access level you may be able to see all lessons for your accociated schools or just the lessons assigned to you.</p>
            <p>The example below shows how the Lessons List screen appears to the tutor Ethan Montgomery who only has resticted viewing access to this page.</p>
            <img class="guide-img box-shadow" src="/images/user_guides/tutor_lessons_list.png" alt="Tutor Lesson List">
            <figure>Ethan is able to quickly see the lessons he has been assigned to including one lesson (William Tran) that is currently marked as pending because it doesn't yet have a lesson day or time.</figure>
            <p>Selecting a lesson by clicking on it will take the user to the <a href="#lesson_details">Lesson Details</a> section where they can make edits to the lesson, view attendance or make lesson notes.</p>
            <hr>
        </section>
        
        <section id="lesson_details" class="guide-section">
            <h2 class="guide-h2">Lesson Details</h2>
            <p>The Lesson Details page is a quick summary of the lesson information.</p>
            <img src="/images/user_guides/lesson_details_active.png" alt="Lesson Details Page" class="guide-img box-shadow">
            <figure>The Lesson Details page for Leo Lee's Bass lessons. Notice the school name 'Pinecrest School' in the subheader.</figure>

            <h3 class="guide-h3">Header Options:</h3>
            <p>The header section details the student name and instrument in the title and includes the school name in the subheader</p>
            <div>The header options include links to:
                <ul>
                    <li><a href="#lesson_notes">View Notes</a></li>
                    <li><router-link to="">View Student</router-link></li>
                    <li><router-link to="">View Attendance</router-link></li>
                </ul>
            </div>

            <h3 class="guide-h3">Lesson Details:</h3>
            <p>This top section contains information on student lesson attendance and the basic detals for the lesson including the day, time and status.</p>
            <img src="/images/user_guides/lesson_details_details.png" alt="Lesson Details Page" class="guide-img box-shadow">
            
            <h4 class="guide-h4">Attendance Snapshot</h4>
            <p>The Attendance Snapshot displays a bar representing the culminating attendance values for all previous lessons.</p>
            <ul>
                <li>Blue for Present</li>
                <li>Orange for Late</li>
                <li>Red for Absent</li>
            </ul>

            <h3 class="guide-h3">Contact Details:</h3>
            <p>This section displays the stored student, Primary Caregiver and Secondary Caregiver contact details. If no details are stored for a secondary caregiver, their contact section will not appear. </p>
            <img src="/images/user_guides/lesson_details_contact.png" alt="Lesson Details Contact Information" class="guide-img box-shadow">
            <figure>Contact details for the student, Primary Caregiver and Secondary Caregiver are displayed.</figure>

            <h3 class="guide-h3" id="lesson_details_notes">Lesson Notes:</h3>
            <p>This section displays the most recent lesson notes associated with this lesson. Notes are by default only visible to the user who created them and can be used for planning and progress comments.</p>
            <img src="/images/user_guides/lesson_details_notes.png" alt="Lesson Details Notes" class="guide-img box-shadow">
            <figure>Lesson notes to track progress and next steps.</figure>
            <hr>
        </section>

        <section id="lesson_edit" class="guide-section">
            <h2 class="guide-h2">Editing Lesson Details</h2>
            <p>Lesson details can be edited from the 'Edit Lesson' Actions Sidebar option as shown or for a pending lesson through the 'Complete Lesson Setup' pop up on the page.</p>
            <img src="/images/user_guides/lesson_edit.png" alt="Lesson Edit Details" class="guide-img box-shadow w-50 img-align-top">
            <img src="/images/user_guides/lesson_setup.png" alt="Lesson Setup Details" class="guide-img box-shadow w-25">
            <figure>The Actions Sidebar shows available options for the selected lesson.</figure>
            <p>Depending on your schools permissions settings you will see options</p>
            <img src="/images/user_guides/lesson_edit_tutor.png" alt="Lesson Edit Details As Tutor" class="guide-img box-shadow w-50 img-align-top">
            <img src="/images/user_guides/lesson_edit_admin.png" alt="Lesson Edit Details As Admin" class="guide-img box-shadow w-50">
            <figure>An example of Tutor and Administrator options.</figure>

            <h3 class="guide-h3">Day and Time:</h3>
            <p>Here you can set the Day of the week, the start time and the duration for the lesson. Durations can range between 10 and 60 minutes in 5 minute intervals.</p>
            <p>'Link to school terms' will set attendance requirements only during the school term. With this option selected the lesson will not be required to have attendance marked during school holiday periods as set by the school. This option requires a higher permission level (Lesson Edit) to toggle.</p>

            <h3 class="guide-h3">Lesson Dates:</h3>
            <p>This section sets the start and end dates for the lessons. A start date must be set before the lesson can be marked 'Active' and attendance can be recorded or displayed in the <a href="#lesson_planner">Lesson Planner</a>. End Date is not a required field; however, setting it will stop attendance requirements beyond that date which can be useful for the end of the school year.</p>

            <h3 class="guide-h3">Financial:</h3>
            <p>This section can only be set by someone with a higher permission level (Lesson Edit) and allows the editing of the funding type for this lesson based on options set in the school setup. </p>
            <hr>
        </section>

        <section id="lesson_edit_video" class="guide-section">
            <h2 class="guide-h2">Lesson Edit - Video Example</h2>
            <video class="guide-video" controls>
                <source src="/images/user_guides/lesson_edit_set_active.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
            <hr>
        </section>

        <section id="lesson_planner" class="guide-section">
            <h2 class="guide-h2">Lesson Planner</h2>
            <p>The Lesson Planner provides quick access to the lessons on a particular day. From here you can mark attendance, or write planning and progress comments. It is intended that as a tutor is teaching during the day this will be the primary location for their administration. The Lesson Planner can be accessed from the Lessons List, or by selecting the Lessons Tile on the Dashboard.</p>
            <img src="/images/user_guides/lesson_planner_list2.png" alt="Lesson Planner List" class="guide-img box-shadow">
            <figure>A tutors Lesson Planner showing fully marked attendance (5 present and 1 late).</figure>
            <p>From the Lesson Planner it is easy to see what lessons are occuring that day with lesson times, students, tutors, instruments, and rooms clearly labelled. Attendance records are coloured for quick identification.</p>
            <div class="guide-flex-center">
                <img src="/images/user_guides/attendance_icons.png" alt="Lesson Attendance Icons" class="guide-img">
            </div>
            <ul>
                <li>Blue for Present</li>
                <li>Orange for Late</li>
                <li>Red for Unexplained Absences</li>
                <li>Dark Grey for Cancelled/No Lesson (such as illness or a school trip)</li>
                <li>Light Grey for Unmarked</li>
            </ul>

            <h3 class="guide-h3">Planner Actions</h3>
            <p>Clicking anywhere on a lesson will bring up the Lesson Actions. Here you can select to mark attendance (if the lesson is either today or in the past), view the lesson details, or write a lesson comment.</p>
            <div class="guide-flex-center">
                <div>
                    <img src="/images/user_guides/planner_options.png" alt="Planner Actions" class="guide-img box-shadow">
                    <figure>The Lessons Actions menu.</figure>
                </div>
            </div>

            <h4 class="guide-h4">Attendance</h4>
            <p>The attendance action will allow you to select the attendance and optionally adjust the start time (e.g., if the student was late.). Once submitted it remains editable in the same menu if required.</p>
            <div class="guide-flex-center">
                <div>
                    <img src="/images/user_guides/lesson_record_attendance.png" alt="Planner Actions" class="guide-img box-shadow">
                    <figure>The Attendance Action showing available attendance options.</figure>
                </div>
            </div>
            <video class="guide-video" controls>
                <source src="/images/user_guides/planner_marking_attendance.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
            <figure>Video example of adding attendance using the Lesson Planner.</figure>

            <h4 class="guide-h4">View Lesson Details</h4>
            <p>This option will take you to the <a href="#lesson_details">Lesson Details</a> screen.</p>

            <h4 class="guide-h4" id="planner_lesson_notes">Lesson Notes</h4>
            <p>The Lesson Notes section provides a convenient space to take a few digital notes for each lesson. While you are able to write anything in these sections a Planning, Progress and Next Steps section has been created. These notes will be recorded against the student's lesson and are only viewable by the creator by default to maintain privacy.</p>
            <div class="guide-flex-center">
                <div>
                    <img src="/images/user_guides/planner_lesson_notes.png" alt="Planner Actions" class="guide-img box-shadow">
                    <figure>The Lesson Notes section with space to display notes for each lesson.</figure>
                </div>
            </div>
            <p>Lesson notes can be recalled in the <a href="#lesson_details_notes">Lesson Details</a> page or viewed in the planner. Additionally, you can look at the previous lessons notes as you are writing your next ones.</p>
            <div class="guide-flex-center">
                <div>
                    <img src="/images/user_guides/planner_lesson_notes_previous.png" alt="Planner Actions" class="guide-img box-shadow">
                    <figure>Lesson notes are carried over to the next lesson to assist with planning.</figure>
                </div>
            </div>

            <hr>
        </section>

        <section id="lesson_notes" class="guide-section">
            <h2 class="guide-h2">Lesson Notes</h2>
            <p>Lesson specific notes can be created in the <a href="#planner_lesson_notes">Lesson Planner</a>; however, if more general notes are required they can be created from the 'View Notes' Lesson Details header option, or from the Actions Sidebar.</p>
            <p>When in the Lesson Notes page, you will see all notes recorded for that lesson, whether it was for a specific lesson or was created as a general note.</p>
            <img src="/images/user_guides/lesson_notes_page.png" alt="Planner Actions" class="guide-img box-shadow">
            <figure>Lesson comments created for Leo Lee's bass lessons.</figure>

            <p>General notes can be created from the Actions Sidebar.</p>
            <div class="guide-flex-center">
                <div class="w-75">
                    <img src="/images/user_guides/lesson_notes_general.png" alt="Planner Actions" class="guide-img box-shadow">
                    <figure>General comments can be made about the overall lesson.</figure>
                </div>
            </div>
        </section>

    </div>
</template>

<script setup>

</script>

<style lang="scss" scoped>

</style>
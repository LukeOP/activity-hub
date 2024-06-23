<template>
    <div id="attendanceReview">
        <div class="headerLine">
            <div class="text-primary">Attendance Review</div>
            <div class="link">Attendance Overview</div>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <td class="funding">:::</td>
                    <td>Date</td>
                    <td>Time</td>
                    <td>Student</td>
                    <td>Instrument</td>
                    <td class="attendance">Attendance</td>
                    <td>Tutor</td>
                    <td>School</td>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(data, index) in dummyData" :key="index">
                    <td class="funding"><div class="funding-icon">{{ data.funding }}</div></td>
                    <td>{{ data.date }}</td>
                    <td>{{ data.time }}</td>
                    <td>{{ data.student }}</td>
                    <td>{{ data.instrument }}</td>
                    <td class="attendance"><div :class="data.attendance">{{ data.attendance }}</div></td>
                    <td>{{ data.tutor }}</td>
                    <td>{{ data.school }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script setup>
import moment from 'moment';

const dummyData = [
    {funding: 'P', date: moment().subtract(1, 'days').format('YYYY-MM-DD'), time: '9:00am', student: 'Liam Chang', instrument: 'Piano', attendance: 'Present', tutor: 'Nathan Thompson', school: 'Pinecrest School'},
    {funding: 'P', date: moment().subtract(1, 'days').format('YYYY-MM-DD'), time: '9:00am', student: 'Aadam Jarvis', instrument: 'Guitar', attendance: 'Present', tutor: 'Ethan Montgomery', school: 'Pinecrest School'},
    {funding: 'P', date: moment().subtract(1, 'days').format('YYYY-MM-DD'), time: '9:20am', student: 'Fleur Villa', instrument: 'Piano', attendance: 'Present', tutor: 'Nathan Thompson', school: 'Pinecrest School'},
    {funding: 'F', date: moment().subtract(1, 'days').format('YYYY-MM-DD'), time: '9:40am', student: 'Tabitha Collier', instrument: 'Drums', attendance: 'Present', tutor: 'Libby Medina', school: 'Pinecrest School'},
    {funding: 'P', date: moment().subtract(1, 'days').format('YYYY-MM-DD'), time: '10:00am', student: 'Barbara Andrade', instrument: 'Guitar', attendance: 'Late', tutor: 'Ethan Montgomery', school: 'Pinecrest School'},
    {funding: 'P', date: moment().subtract(1, 'days').format('YYYY-MM-DD'), time: '10:10am', student: 'Frederic Malone', instrument: 'Piano', attendance: 'Present', tutor: 'Nathan Thompson', school: 'Pinecrest School'},
    {funding: 'P', date: moment().subtract(1, 'days').format('YYYY-MM-DD'), time: '10:30am', student: 'Danyal Sims', instrument: 'Drums', attendance: 'Present', tutor: 'Libby Medina', school: 'Pinecrest School'},
    {funding: 'F', date: moment().subtract(1, 'days').format('YYYY-MM-DD'), time: '10:50am', student: 'Valerie Buck', instrument: 'Piano', attendance: 'Absent', tutor: 'Nathan Thompson', school: 'Pinecrest School'},
    {funding: 'F', date: moment().subtract(1, 'days').format('YYYY-MM-DD'), time: '11:00am', student: 'Eshal Marquez', instrument: 'Guitar', attendance: 'Present', tutor: 'Ethan Montgomery', school: 'Pinecrest School'},
    {funding: 'P', date: moment().subtract(1, 'days').format('YYYY-MM-DD'), time: '11:20am', student: 'Felix Morgan', instrument: 'Piano', attendance: 'Present', tutor: 'Nathan Thompson', school: 'Pinecrest School'},
    {funding: 'P', date: moment().subtract(1, 'days').format('YYYY-MM-DD'), time: '11:40am', student: 'Bianca Mcdaniel', instrument: 'Drums', attendance: 'Present', tutor: 'Libby Medina', school: 'Pinecrest School'},
]

</script>

<style lang="scss" scoped>
.headerLine {
    width: 95%;
    margin: 0 auto;
    border-bottom: 1px solid $ah-primary;
    display: flex;
    justify-content: space-between;
    margin-bottom: 1rem;
}
.table {
    width: 95%;
    margin: 0 auto;
    thead > tr > td {
        background-color: $ah-primary;
        color: white;
        font-size: 0.5rem;
        padding: 2px;
    }
    tbody > tr > td {
        font-size: 0.5rem;
        padding: 4px 2px;
    }
}
.link {
    display: flex;
    align-items: center;
    color: $ah-primary;
    border: 1px solid $ah-primary;
    padding: 3px;
    font-size: 0.45rem;
    margin-bottom: 3px;
    border-radius: 0.25rem;
}
.funding {
    width: 20px;
}
.attendance {
    text-align: center;
    color: white;
}
.Present {
    padding: 1px 0px;
    background-color: $ah-primary;
}
.Late {
    background-color: $ah-secondary;
}
.Absent {
    background-color: $ah-red;
}
.funding-icon {
    background-color: $ah-primary;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    width: 15px;
    height: 15px;
}

</style>
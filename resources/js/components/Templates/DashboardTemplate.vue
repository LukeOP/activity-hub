<template>
    <div id="dashboard">
        <div class="tiles">
            <div class="tile user-element">
                <i class="fa-solid fa-circle primary"></i>
                <div class="text">
                    <div class="line1">28</div>
                    <div class="line2">Hired Instruments</div>
                </div>
            </div>
            <div class="tile user-element"><i class="fa-solid fa-circle secondary"></i>
                <div class="text">
                    <div class="line1">16</div>
                    <div class="line2">Upcoming Events</div>
                </div></div>
            <div class="tile user-element"><i class="fa-solid fa-circle green"></i>
                <div class="text">
                    <div class="line1">327</div>
                    <div class="line2">Active Lessons</div>
                </div></div>
        </div>
        <div class="lessonTile user-element">
            <div class="header"><span>Lessons By Date</span></div>
            <div class="date-row">
                <div id="date">{{ moment().format('dddd - MMMM Do') }}</div>
                <div id="date-picker">
                    <div><<</div>
                    <div><</div>
                    <div class=" center">Today</div>
                    <div>></div>
                    <div>>></div>
                </div>
            </div>
            <div class="attendance-row">
                <div class="attendance-box"><i class="fa-solid fa-circle primary"></i><div class="text">Present: 24</div></div>
                <div class="attendance-box"><i class="fa-solid fa-circle secondary"></i><div class="text">Late: 3</div></div>
                <div class="attendance-box"><i class="fa-solid fa-circle red"></i><div class="text">Absent: 0</div></div>
                <div class="attendance-box"><i class="fa-solid fa-circle grey"></i><div class="text">Unmarked: 15</div></div>
            </div>
        </div>
        <div class="eventTile user-element">
            <div class="header"><span>Upcoming Events</span></div>
            <div class="events-row">
                <div class="event-single">
                    <div class="event-title event-title1">Melody Showcase</div>
                    <div class="event-date">
                        <div class="date">{{ moment().add(15, 'days').format('YYYY-MM-DD') }}<i class="fa-solid fa-triangle-exclamation" style="color: red;"></i></div>
                    </div>
                </div>
                <div class="event-single">
                    <div class="event-title event-title2">Symphony Soirée</div>
                    <div class="event-date">
                        <div class="date">{{ moment().add(32, 'days').format('YYYY-MM-DD') }}<i class="fa-solid fa-triangle-exclamation"></i></div>
                    </div>
                </div>
                <div class="event-single">
                    <div class="event-title event-title3">Senior Orchestra at Primary School</div>
                    <div class="event-date">
                        <div class="date">{{ moment().add(47, 'days').format('YYYY-MM-DD') }}<i class="fa-solid fa-triangle-exclamation"></i></div>
                    </div>
                </div>
                <div class="event-single">
                    <div class="event-title event-title4">Award Ceremony Practice</div>
                    <div class="event-date">
                        <div class="date">{{ moment().add(51, 'days').format('YYYY-MM-DD') }}<i class="fa-solid fa-triangle-exclamation"></i></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import moment from 'moment';


</script>

<style lang="scss" scoped>
.user-element {
    min-height: 0;
}
#dashboard {
    position: relative;
    height: 100%;
    width: 100%;
    // padding: 10px;
    .tiles {
        display: flex;
        justify-content: space-between;
        gap: 15px;
        width: 90%;
        margin: 0px auto;
        .tile {
            width: 200px;
            height: 60px;
            background-color: white;
            border-radius: 0.25rem;
            display: flex;
            align-items: center;
            .fa-solid {
                font-size: 2rem;
            }
            .text {
                padding-left: 10px;
                line-height: 15px;
                .line1 {
                    font-weight: bold;
                }
                .line2 {
                    font-size: 0.75rem;
                }
            }
        }
    }
    .lessonTile {
        width: 90%;
        min-height: 100px;
        margin: 0 auto;
        background-color: white;
        margin-bottom: 10px;
        .date-row {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            #date {
                width: fit-content;
                height: 10px;
                // background-color: #EEF2F5;
                border-radius: 0.5rem;
            }
            #date-picker {
                display: flex;
                gap: 2px;
                div {
                    width: 20px;
                    height: 20px;
                    background-color: $ah-primary;
                    border-radius: 0.25rem;
                    color: white;
                    text-align: center;
                    font-size: 0.75rem;
                }
                .center {
                    width: 50px
                }
            }
        }
        .attendance-row {
            width: 98%;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            .attendance-box {
                display: flex;
                align-items: center;
                padding-left: 10px;
                height: 30px;
                width: 24%;
                border: 1px solid $ah-grey;
                .fa-solid {
                    font-size: 1rem;
                }
                .text {
                    font-size: 0.5rem;
                    // width: 60px;
                    // height: 10px;
                    margin-left: 10px;
                    // border-radius: 0.5rem;
                    // background-color: $ah-grey-lightest;
                }
            }
        }
    }
    .eventTile {
        width: 90%;
        height: 150px;
        margin: 0 auto;
        background-color: white;
        .events-row {
            .event-single {
                display: flex;
                justify-content: space-between;
                padding: 10px;
                font-size: 0.65rem;
                .event-title {
                    height: 10px;
                    // background-color: #EEF2F5;
                }
                .event-title1 {
                    width: 250px;
                }
                .event-title2 {
                    width: 200px;
                }
                .event-title3 {
                    width: 430px;
                }
                .event-title4 {
                    width: 370px;
                }
                .event-date {
                    .date {
                        height: 10px;
                        width: fit-content;
                        // background-color: #EEF2F5;
                    }
                }
            }
        }
    }
    .header {
        border-bottom: 1px solid $ah-grey;
        span {
            margin-left: 10px;
        }
    }
    .primary {
        color: $ah-primary;
    }
    .secondary {
        color: $ah-secondary;
    }
    .red {
        color: $ah-red;
    }
    .grey {
        color: $ah-grey;
    }
    .green {
        color: $ah-green;
    }
    .fa-triangle-exclamation {
        margin-left: 10px;
        color: transparent;
    }
}

</style>
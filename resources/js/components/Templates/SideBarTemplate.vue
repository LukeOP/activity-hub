<template>
    <div id="sideBarTemplate">
        <div class="sideBar">
            <img style="background-color: white;" src="images/ActivityHub_Logo_Main_250W.png" alt="">
            <ul>
                <li :class="{active: activeMenu === 'dashboard'}"><span v-html="icons.house" class="icon fill-white"></span>Dashboard</li>
                <li :class="{active: activeMenu === 'lessons'}"><span v-html="icons.chalkboard" class="icon fill-white"></span>Lessons</li>
                <li :class="{active: activeMenu === 'attendance'}"><span v-html="icons.attendance" class="icon fill-white"></span>Attendance</li>
                <li :class="{active: activeMenu === 'events'}"><span v-html="icons.ticket" class="icon fill-white"></span>Events</li>
                <li :class="{active: activeMenu === 'instruments'}"><span v-html="icons.guitar" class="icon fill-white"></span>Instruments</li>
                <li :class="{active: activeMenu === 'students'}"><span v-html="icons.children" class="icon fill-white"></span>Students</li>
                <li :class="{active: activeMenu === 'staff'}"><span v-html="icons.userGroup" class="icon fill-white"></span>Staff</li>
            </ul>
        </div>
        <div class="mainContent">
            <slot></slot>
        </div>
    </div>
</template>

<script setup>
import { icons } from '../../images/icons/icons';

const props = defineProps({activeMenu: String})

</script>

<style lang="scss" scoped>
#sideBarTemplate {
    display: flex;
    .sideBar {
        background-color: $ah-primary;
        width: 170px;
        img {
            width: 100%;
        }
        ul {
            list-style: none;
            color: lighten($ah-primary, 55%);
            padding: 0;
            li {
                display: flex;
                font-size: 0.75rem;
                padding: 8px 5px;
                border-left: 5px solid $ah-primary;
                .icon {
                    display: inline-flex;
                    height: 1.25rem;
                    width: 25px;
                    margin-right: 5px;
                }
            }
        }
        .active {
            background-color: $ah-primary-light;
            border-left-color: lighten($ah-primary, 25%);
        }
    }
    .mainContent {
        width: 100%;
        background-color: #FCFCFC;
    }
}

</style>
<template>
    <div id="main">
        <!-- <section id="header-bar">Header Bar</section> -->
        <transition name="menu-animation">
            <section id="menu-bar" v-if="menu || !mobileFormat">
                <menu>
                    <!-- <div class="link-group">
                        Common Elements
                        <div class="link-group-links">
                            <router-link :to="{name: 'GuideDashboard'}"><s>Navigation Sidebar</s></router-link>
                            <router-link :to="{name: 'GuideDashboard'}"><s>Actions Sidebar</s></router-link>
                            <router-link :to="{name: 'GuideDashboard'}"><s>Filter Sidebar</s></router-link>
                        </div>
                    </div>
                    <hr> -->
                    <div class="link-group">
                        <a href="./dashboard#heading" @click="selectedSection = 'dashboard'">Dashboard</a>
                        <div class="link-group-links">
                            <a href="./dashboard#summary">Summary</a>
                            <a href="./dashboard#summary">Tiles</a>
                        </div>
                    </div>
                    <div class="link-group">
                        <a href="./lessons#heading" @click="selectedSection = 'lessons'">Lesson Management</a>
                        <div class="link-group-links">
                            <a href="./lessons#summary">Summary</a>
                            <a href="./lessons#lesson_list">Lessons List</a>
                            <a href="./lessons#lesson_details">Details</a>
                            <a href="./lessons#lesson_edit">Editing Lesson Details</a>
                            <a href="./lessons#lesson_edit_video">Editing Video Example</a>
                            <a href="./lessons#lesson_planner">Planner / Attendance</a>
                            <a href="./lessons#lesson_notes">Notes</a>
                        </div>
                    </div>
                    <div class="link-group">
                        <a href="./attendance#heading">Attendance</a>
                        <div class="link-group-links">
                            <a href="./attendance#summary">Summary</a>
                            <a href="./attendance#review">Review</a>
                            <a href="./attendance#individual_records">Individual Records</a>
                            <a href="./attendance#overview">Overview</a>
                        </div>
                    </div>
                    <!-- <div class="link-group"><s>
                        Events
                        <div class="link-group-links">
                            <router-link :to="{name: 'GuideLessons'}">Summary</router-link>
                        </div></s>
                    </div>
                    <div class="link-group"><s>
                        Instruments
                        <div class="link-group-links">
                            <router-link :to="{name: 'GuideLessons'}">Summary</router-link>
                        </div></s>
                    </div>
                    <div class="link-group"><s>
                        Students
                        <div class="link-group-links">
                            <router-link :to="{name: 'GuideLessons'}">Summary</router-link>
                        </div></s>
                    </div>
                    <div class="link-group"><s>
                        Staff
                        <div class="link-group-links">
                            <router-link :to="{name: 'GuideLessons'}">Summary</router-link>
                        </div></s>
                    </div>
                    <div class="link-group"><s>
                        School Setup
                        <div class="link-group-links">
                            <router-link :to="{name: 'GuideLessons'}">Summary</router-link>
                        </div></s>
                    </div> -->
                </menu>
            </section>
        </transition>
        <section id="document-section">
            <div id="header">
                <div id="logo">
                    <img src="/images/ActivityHub_01.png" alt="" style="height: 60px;">
                </div>
                <div id="menu-icon">
                    <i class="fa-solid fa-2x" :class="{'fa-xmark': menu, 'fa-bars': !menu}" @click="menu = !menu"></i>
                </div>
            </div>
            <div id="content-container">
                <router-view></router-view>
            </div>
        </section>
    </div>
</template>

<script setup>
import { ref } from 'vue'
import { useWindowSize } from '../../../composables/useWindowSize';

const { mobileFormat } = useWindowSize()

const selectedSection = ref('dashboard')
const menu = ref(false)

</script>

<style lang="scss" scoped>
#main {
    display: grid;
    grid-template-columns: 30% auto auto;
    gap: 10px;
    background-color: #FCFCFC;
    section {
        background-color: #FCFCFC;
    }
    #menu-bar {
        padding-top: 10rem;
        height: 600px;
        min-height: calc(100vh - 110px);
        display: flex;
        justify-content: flex-end;
        position: sticky;
        position: -webkit-sticky;
        top: 0;
        menu {
            width: 230px;
            overflow-y: auto;
            .link-group {
                font-weight: bold;
                a {
                    color: black;
                }
                .link-group-links {
                    font-weight: 300;
                    a {
                    padding-left: 20px;
                        display: block;
                        color: black;
                        text-decoration: none;
                        &:hover {
                            color: $ah-primary;
                        }
                    }
                }
            }
        }
    }
    #document-section {
        padding-top: 8rem;
        grid-column-start: 2;
        grid-column-end: 4;
        background-color: white;
        padding-left: 40px;
        box-shadow: inset 5px 0px 15px $ah-grey-lightest;
        #header {
            display: none;
        }
        #content-container {
            padding: 40px;
            max-width: 900px;
            // background-color: aqua;
        }
    }
}
@media (max-width: 768px) {
    #main {
        display: block;
        #menu-bar {
            min-height: fit-content;
            height: fit-content;
            padding: 2rem;
            top: 90px;
            height: fit-content;
            position: absolute;
            width: 100%;
            z-index: 1;
            box-shadow: 0px 5px 5px $ah-grey-lightest;
            background-color: #FFF;
            menu {
                width: 100%;
                text-align: left;
                .link-group {
                font-weight: bold;
                a {
                    color: black;
                    text-decoration: none;
                }
                .link-group-links {
                    font-weight: 300;
                    a {
                        padding-left: 1rem;
                        display: block;
                        color: black;
                        text-decoration: none;
                        margin-bottom: 0.5rem;
                        &:hover {
                            color: $ah-primary;
                        }
                    }
                }
            }
            }
        }
        #document-section {
            min-height: fit-content;
            box-shadow: none;
            width: 100%;
            padding: 1rem;
            #header {
                height: 75px;
                width: 100%;
                padding: 0px 2rem;
                display: flex;
                align-items: center;
                justify-content: space-between;
                // border-bottom: 1px solid $ah-grey-lightest;
                z-index: 5;
                #logo {
                    max-height: 80px;
                }
                #menu-icon {
                    width: 40px;
                    height: 40px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }
            }
        }
    }
}
.menu-animation-leave-active,
.menu-animation-enter-active {
    transition: all 0.5s ease;
}
.menu-animation-enter-from,
.menu-animation-leave-to {
    transform: translateX(-100%);
}
</style>
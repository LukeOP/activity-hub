<template>
    <div id="main">
        <!-- <section id="header-bar">Header Bar</section> -->
        <section id="menu-bar">
            <menu>
                <div class="link-group">
                    Common Elements
                    <div class="link-group-links">
                        <router-link :to="{name: 'GuideDashboard'}"><s>Navigation Sidebar</s></router-link>
                        <router-link :to="{name: 'GuideDashboard'}"><s>Actions Sidebar</s></router-link>
                        <router-link :to="{name: 'GuideDashboard'}"><s>Filter Sidebar</s></router-link>
                    </div>
                </div>
                <hr>
                <div class="link-group">
                    Dashboard
                    <div class="link-group-links">
                        <a href="./dashboard#summary">Dashboard</a>
                    </div>
                </div>
                <div class="link-group">
                    Lesson Management
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
                <div class="link-group"><s>
                    Attendance
                    <div class="link-group-links">
                        <router-link :to="{name: 'GuideLessons'}">Summary</router-link>
                    </div></s>
                </div>
                <div class="link-group"><s>
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
                </div>
            </menu>
        </section>
        <section id="document-section">
            <div id="content-container">
                <router-view></router-view>
            </div>
        </section>
    </div>
</template>

<script setup>

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
            .link-group {
                font-weight: bold;
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
        #content-container {
            padding: 40px;
            max-width: 900px;
            // background-color: aqua;
        }
    }
}
@media (max-width: 768px) {
    #main {
        display: flex;
        flex-direction: column;
        #menu-bar {
            display: block;
            min-height: fit-content;
            height: fit-content;
            menu {
                width: 100%;
                text-align: center;
            }
        }
        #document-section {
            min-height: fit-content
        }
    }
}

</style>
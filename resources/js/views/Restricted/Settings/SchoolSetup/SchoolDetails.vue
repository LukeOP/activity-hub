<template>
    <div>
        <div id="header" style="display: flex;">
            <div>
                <img style="height: 150px" :src="school.logo" alt="">
            </div>
            <div id="school_name">
                {{ school.name }}
                <div style="color: grey; font-size: 15px;">{{ school.address }}</div>
            </div>
        </div>
        <hr />
        <div id="menu_options">
            <div v-for="item in menuItems" :key="item"
                :class="{active: activeTab == item}" @click="setActive(item)">
                {{ item }}
            </div>
        </div>
        <component :is="currentComponent" class="my-4" :school="school"></component>
        <pre>
            <!-- {{ school }} -->
        </pre>
    </div>
</template>

<script setup>
import { ref, computed } from 'vue';
import { useSchoolStore } from '../../../../stores/schools'
import LessonSetup from './LessonSetup.vue'
import SchoolDetailsSetup from './SchoolDetailsSetup.vue'

const schoolStore = useSchoolStore()
const school = schoolStore.getSchool

const currentComponent = computed(() => {
    if(activeTab.value == 'Details') return SchoolDetailsSetup
    if(activeTab.value == 'Lessons') return LessonSetup
})

const activeTab = ref('Details')

const menuItems = ['Details', 'Lessons']

function setActive(value){
    activeTab.value = value
}

</script>

<style lang="scss" scoped>
#school_name {
    color: $ah-primary;
    font-size: 50px;
    margin:auto;
    margin-left: 3rem;
}
#menu_options {
    display: flex;
    div {
        color: black;
        margin-right: 1rem;
        padding: 5px 10px;
        &:hover {
            color: $ah-primary;
            cursor: pointer;
        }
    }
    .active {
        color: $ah-primary;
        border-bottom: 2px solid $ah-primary;
    }
}


</style>
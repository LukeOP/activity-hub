<template>
    <div>
        <h2>Schools you are an Administrator for:</h2>
        <div class="user-element school-tile" @click="viewSchool(school)" style="display: flex;" v-for="(school, index) in user.getAdminSchools" :key="index">
            <div style="min-width: 100px;">
                <img style="height: 80px" :src="school.logo" alt="">
            </div>
            <div>
                {{ school.name }}
            </div>
        </div>
        <div v-if="user.getAdminSchools.length < 1">
        <p>You are not an adminstrator for any schools.</p></div>
    </div>
</template>

<script setup>
import { useUserStore } from '/resources/js/stores/user';
import { useSchoolStore } from '/resources/js/stores/schools';
import { useRouter } from 'vue-router';

const user = useUserStore()
const schoolStore = useSchoolStore()
const router = useRouter()

function viewSchool(school){
    schoolStore.setSchool(school)
    router.push({
        name: 'SchoolDetails'
    })
}

</script>

<style lang="scss" scoped>
.school-tile {
    min-height: 100px;
    max-width: 50%;
    &:hover {
        cursor: pointer;
        box-shadow: 0 5px 10px $ah-grey
    }
}
@media (max-width: 768px) {
    .school-tile {
        max-width: 100%;
        margin-bottom: 1rem;
    }
}

</style>
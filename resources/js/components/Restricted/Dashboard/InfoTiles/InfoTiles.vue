<template>
    <div id="tile-list">
        <SingleTile class="tile" v-for="(tile, index) in tileArray" :key="index"
        :icon="tile.icon" :color="tile.color" :boldText="tile.boldText" :subText="tile.subText" type="info" :link="tile.link"
        />
    </div>
</template>

<script setup>
import useApi from '/resources/js/composables/useApi';
import SingleTile from './SingleTile.vue';
import { ref } from 'vue';
import { useUserStore } from '/resources/js/stores/user';

const tileArray = ref([])
const user = useUserStore()

const { data: lessons, fetchData: fetchLessons } = useApi('lessons')
fetchLessons().then(()=> {
    let active = lessons.value.filter(l => l.attributes.status == 'Active')
    let info = {boldText: `${active.length}`, subText: 'Active Lessons', icon: 'users', color: 'green', link: 'LessonsList'}
    tileArray.value.push(info)
})

const { data: instruments, fetchData: fetchInstruments } = useApi('instruments')
if(user.hasPermissionAny('HIRES_V')){
    fetchInstruments().then(()=> {
        let hiredOut = instruments.value.filter(i => i.attributes.state.id == 2)
        let info = {boldText: `${hiredOut.length}`, subText: 'Hired Instruments', icon: 'users', color: 'blue', link: 'HiresList'}
        tileArray.value.push(info)
    })
}


</script>

<style lang="scss" scoped>
#tile-list {
    width: 100%;
    display: inline-flex;
    // justify-content: space-between;
    .tile {
        margin-right: 2rem;
        &:last-of-type {
            margin-right: 0rem;
        }
    }
}
@media (max-width: 768px){
    #tile-list {
        display: none;
        .tile {
            margin-right: 0;
        }
    }
}

</style>
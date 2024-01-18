<template>
    <div class="tile user-element" @click="newRoute(link)">
        <div class="image">
            <TileIconSVG :status="icon" :icon="icon" :color="color" />
        </div>
        <div class="text">
            <div class="boldText">{{ boldText }}</div>
            <div class="subText">{{ subText }}</div>
        </div>
    </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import TileIconSVG from '/resources/js/components/Layouts/MainLayout/Elements/SVG/TileIconSVG.vue';

const router = useRouter()

const props = defineProps({
    icon: String, 
    color: String,
    boldText: String, 
    subText: String, 
    type: String,
    link: String
})

function newRoute(routeName){
    console.log('click');
    router.push({
        name: routeName
    })
}


</script>

<style lang="scss" scoped>
.user-element {
    min-height: 0px;
}
.tile {
    width: 300px;
    height: 100px;
    display: flex;
    &:hover {
        box-shadow: 0px 10px 10px $ah-grey;
        cursor: pointer;
    }
}
.image {
    display: flex;
    padding: 0 20px;
    justify-content: center;
}
.text {
    display: flex;
    flex-direction: column;
    justify-content: center;
    .boldText {
        font-weight: bold;
        font-size: 1.5rem;
        line-height: 1;
    }
}

</style>
<template>
    <div id="btn-container">
        <button class="btn btn-primary me-2" id="btn2" @click="subtractDay">&lt;</button>
        <button class="btn btn-primary me-2" id="btn1" @click="getToday">Today</button>
        <button class="btn btn-primary" id="btn3" @click="addDay">></button>
    </div>
</template>

<script setup>
import moment from 'moment';
import { ref, watch } from 'vue';

const selectedDate = ref(moment())
const emit = defineEmits(['selectedDate'])

// Manipulate Selected Day
function addDay(){
  selectedDate.value = moment(selectedDate.value).add(1, 'days')
}
function getToday(){
  selectedDate.value = moment()
}
function subtractDay(){
  selectedDate.value = moment(selectedDate.value).subtract(1, 'days')
}

watch(() => selectedDate.value, (newValue) => {
    emit('selectedDate', newValue)
})

</script>

<style lang="scss" scoped>

</style>
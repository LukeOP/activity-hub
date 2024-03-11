<template>
    <td>{{invitation.reference}}</td>
    <td>{{invitation.email}}</td>
    <td>{{formatDate(invitation.created_at)}}</td>
    <td>
      <span v-if="showCode">{{invitation.code}}<i class="fa-solid fa-eye-slash ms-2" @click="showCode = !showCode"></i></span>
      <span v-else>******<i class="fa-solid fa-eye ms-2" @click="showCode = !showCode"></i></span>
    </td>
</template>

<script setup>
import moment from 'moment';
import { ref } from 'vue';

const props = defineProps({invitation: Object})

const showCode = ref(false)

function formatDate(date){
  return moment(date).format('DD-MM-YYYY')
}

</script>

<style lang="scss" scoped>

</style>
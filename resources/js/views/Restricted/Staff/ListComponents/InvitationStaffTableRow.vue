<template>
    <td>{{invitation.reference}}</td>
    <td>{{invitation.email}}</td>
    <td>{{formatDate(invitation.created_at)}}</td>
    <td>
      <span v-if="showCode">{{invitation.code}}<i class="fa-solid fa-eye-slash ms-2" @click="showCode = !showCode"></i></span>
      <span v-else>******<i class="fa-solid fa-eye ms-2" @click="showCode = !showCode"></i></span>
    </td>
    <td style="width: 40px;" @click="deleteInvitation()"><i class="fa-solid fa-trash"></i></td>
</template>

<script setup>
import moment from 'moment';
import { ref } from 'vue';
import { useModalStore } from '@/stores/modal'
import { useAppStore } from '@/stores/appStore'

const props = defineProps({invitation: Object})
const modal = useModalStore()
const appStore = useAppStore()

const showCode = ref(false)

function formatDate(date){
  return moment(date).format('DD-MM-YYYY')
}

function deleteInvitation(){
  appStore.setItems(props.invitation)
  modal.open('InvitationDelete')
}

</script>

<style lang="scss" scoped>
.fa-trash:hover{
  color: $ah-red;
  cursor: pointer;
}

</style>
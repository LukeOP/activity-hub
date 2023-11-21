<template>
  <div>
    <section v-if="invitations">
      <component :is="InvitationComponent" :invitations="staffStore.getSchoolInvites" v-if="invitations.length > 0"/>
    </section>
  </div>
</template>

<script setup>
import { useWindowSize } from '/resources/js/composables/useWindowSize';
import { useStaffStore } from '/resources/js/stores/staff';
import { computed, ref } from 'vue';
import useApi from '/resources/js/composables/useApi';
import { useSchoolStore } from '/resources/js/stores/schools';
import InvitationTable from './InvitationTable.vue';


// Initiate Stores
const schoolStore = useSchoolStore()
const staffStore = useStaffStore()

// Initiate Composables
const { windowSize } = useWindowSize()

// Get appropriate component based on window size
const InvitationComponent = computed(() => {
  return windowSize.value.width > 1030 ? InvitationTable : InvitationTable
})

// Fetch school staff Invitations from database and add to store
const { data: invitations, fetchData } = useApi('school-invitations/' + schoolStore.getSchool.id)
fetchData().then(()=>{
  staffStore.setSchoolInvites(invitations.value)
})


</script>

<style lang="scss" scoped>

</style>
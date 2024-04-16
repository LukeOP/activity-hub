<template>
  <!-- <div v-if="invitations && invitations.length > 0"> -->
  <div>
    <h3 class="mt-5">Invitations Pending:</h3>
    <p>Awaiting user(s) to accept invitation to join {{schoolStore.getSchool.name}}.</p>

    <section id="table-header-section">
      <table role="table" id="staff-table">
       <thead role="rowgroup" id="table-head">
         <tr role="row" class="table-heading">
           <th>Reference:</th>
           <th>Email:</th>
           <th>Invitation Sent:</th>
           <th>Join Code:</th>
           <th style="width: 40px;"></th>
         </tr>
       </thead>
      </table>
    </section>

    <section id="table-body-section" style="overflow-y:auto">
      <table>
      <tbody id="staff-data">
        <tr class="staff-row" v-for="invitation in invitations" :key="invitation.id">
          <InvitationStaffTableRow :invitation="invitation" />
        </tr>  
      </tbody>
    </table>

    </section>
  </div>
</template>

<script setup>
import InvitationStaffTableRow from './InvitationStaffTableRow.vue';
import { useSchoolStore } from '/resources/js/stores/schools';

const schoolStore = useSchoolStore()

const props = defineProps({invitations: Array})

  
</script>

<style lang="scss" scoped>
#staff-data{
  tr:hover {
    background-color: white;
    cursor: default;
  }
}
i:hover {
  cursor: pointer;
}
.fa-trash:hover {
  color: $ah-red;
}
</style>
<template>
  <div id="parent-details" class="section row">
    <h2>Contact Details:</h2>
    <div id="student" class="col col-12 col-sm-6 col-md-3">
      <h2>Student:</h2>
      <span v-if="student.contacts">
        <span v-if="student.year_level">
          <h3>Year Level:</h3>
          {{student.year_level}}<br/>
        </span>
        <span v-if="student.contacts.student.email">
          <h3>Email:</h3>
          {{student.contacts.student.email}}<br/>
        </span>
        <span v-if="student.contacts.student.mobile">
          <h3>Mobile:</h3>
          {{student.contacts.student.mobile}}<br/>
        </span>
      </span>
      <span v-if="student.contacts == null">
        <p>No contact details have been provided</p>
        <div class="btn btn-outline-primary" @click="modal.open('StudentEditContacts')">Add Contact Details</div>
      </span>
    </div>
    <div id="primary-caregiver" class="col col-12 col-sm-6 col-md-3">
      <h2>Primary Caregiver:</h2>
      <span v-if="student.contacts">
        <span v-if="student.contacts.pc.name">
          <h3>Name:</h3>
          {{student.contacts.pc.name}}<br/>
        </span>
        <span v-if="student.contacts.pc.relationship">
          <h3>Relationship:</h3>
          {{student.contacts.pc.relationship}}<br/>
        </span>
        <span v-if="student.contacts.pc.email">
          <h3>Email:</h3>
          {{student.contacts.pc.email}}<br/>
        </span>
        <span v-if="student.contacts.pc.mobile">
          <h3>Mobile:</h3>
          {{student.contacts.pc.mobile}}<br/>
        </span>
      </span>
      <span v-if="student.contacts == null || student.contacts.pc.name == null">
        <p>No caregiver details have been provided</p>
        <div class="btn btn-outline-primary" @click="modal.open('StudentEditCaregiverContacts')">Add Caregiver Contact Details</div>
      </span>
    </div>
    <div id="secondary-caregiver" class="col col-12 col-sm-6 col-md-3">
      <h2>Secondary Caregiver:</h2>
      <span v-if="student.contacts">
        <span v-if="student.contacts.sc.name">
          <h3>Name:</h3>
          {{student.contacts.sc.name}}<br/>
        </span>
        <span v-if="student.contacts.sc.relationship">
          <h3>Relationship:</h3>
          {{student.contacts.sc.relationship}}<br/>
        </span>
        <span v-if="student.contacts.sc.email">
          <h3>Email:</h3>
          {{student.contacts.sc.email}}<br/>
        </span>
        <span v-if="student.contacts.sc.mobile">
          <h3>Mobile:</h3>
          {{student.contacts.sc.mobile}}<br/>
        </span>
      </span>
    </div>
  </div>
</template>

<script setup>
import { useModalStore } from '/resources/js/stores/modal';

const props = defineProps({student: Object})

const modal = useModalStore()
</script>


<style lang="scss" scoped>
h2 {
  color: $ah-primary-dark;
  font-size: 1.5rem;
}
h3 {
  font-size: 1rem;
  display: inline-block;
  color: $ah-primary-dark;
  font-weight: bold;
  margin-right: 0.3rem;
}
.section {
  padding: 10px;
  border-bottom: 1px dashed $ah-primary;
}
#student, #primary-caregiver, #secondary-caregiver {
  border-left: 4px solid;
  margin-bottom: 2rem;
}
#student {
  border-color: $ah-primary;
  margin-left: 10px;
}
#primary-caregiver {
  border-color: $ah-primary-light;
}
#secondary-caregiver {
  border-color: $ah-primary-lighter;
}

@media (max-width: 768px) {
#student, #primary-caregiver, #secondary-caregiver {
  margin-bottom: 0.5rem;
  padding: 15px 10px;
}
  #student{
    background-color: lighten($ah-primary-background, 6%);
  }
  #primary-caregiver{
    background-color: lighten($ah-secondary-background, 6%);
  }
  #secondary-caregiver{
    background-color: $ah-grey-background;
  }
}
</style>
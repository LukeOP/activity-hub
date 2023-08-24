<template>
  <div class="mt-1">
    <div class="header">
      <span class="name">{{staff.first_name}} {{staff.last_name}}</span>
      <span class="school">{{schoolStore.getSchool.name}}</span>
    </div>
    
    <div class="body row">
      <div class="col col-12 col-md-6">
        <section>
          <h3>Contact Details:</h3>
          <h4>Email:<span>{{staff.email}}</span></h4>
          <h4>Phone:<span>{{staff.phone}}</span></h4>
        </section>
      </div>
      <div class="col col-12 col-md-6">
        <section>
          <h3>School Details:</h3>
          <h4>Position:<span>{{staff.position.title}}</span></h4>
          <h4>Subjects:</h4>
          <div v-for="subject in staff.subjects" :key="subject.index" class="subject">{{subject.title}}<span class="delete"><i class="fa-solid fa-trash" @click="deleteSubject(subject)"></i></span></div>
          <input type="text" class="form-control" placeholder="Add subject..." @keyup.enter="addSubject" v-model="newSubject">
        </section>
      </div>
      <section>
        <SchoolPermissions />
      </section>
      
     
    </div>
    <!-- <pre>{{staff}}</pre> -->

  </div>
</template>

<script setup>
import { computed, ref } from "vue";
import { useStaffStore } from "../../../stores/staff";
import { useSchoolStore } from "../../../stores/schools";
import axiosClient from "../../../axios";
import { useModalStore } from "../../../stores/modal";
import SchoolPermissions from './Details/Permissions.vue'

const staffStore = useStaffStore()
const staff = staffStore.getStaff
const schoolStore = useSchoolStore()
const modal = useModalStore()

// Subject Adding and Removing
const newSubject = ref('')
function addSubject(){
  axiosClient.post('user-subjects', {user_id: staff.id, school_id: schoolStore.getSchool.id, subject: newSubject.value})
  .then(res => {
    staff.subjects.push(res.data.data)
  })
  newSubject.value = ''
}
function deleteSubject(subject){
  staffStore.setSubject(subject)
  modal.open('StaffDeleteSubject')
}

</script>

<style lang="scss" scoped>
.header{
  border-bottom: 3px solid $ah-primary;
  display: flex;
  justify-content:space-between;
  align-items: flex-end;
  .name {
    font-size: 2rem;
    color: $ah-primary;
    margin-left: 10px;
  }
  .school {
    color: $ah-primary;
  }
}
.body {
  h3 {
    color: $ah-primary;
  }
  section {
    margin-bottom: 2rem;
  }
  padding: 10px;
  span {
    margin-left: 1rem;
    font-size: 1rem;
  }
  .subject {
    border: 1px solid $ah-primary-light;
    background: $ah-primary-light;
    color: white;
    padding-left: 10px;
    padding-right: 10px;
    padding-top: 5px;
    padding-bottom: 5px;
    border-radius: 5px;
    margin-bottom: 0.25rem;

    .delete {
      float: right;
      color: white;
      cursor: pointer;
      &:hover {
        color: $ah-secondary;
      }
    }
  }
}

</style>
<template>
  <div class="mt-1">
    <HeaderLine :heading="staff.full_name" :school="currentSchool.name"/>
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
          <h4>Position:
            <span v-if="!editingPosition">{{staff.position.title}}</span>
            <i v-if="user.hasPermission('STAFF_E', currentSchool.id)" @click="editingPosition = !editingPosition" class="fa-solid fa-pen-to-square ms-2 float-end" />
            <form v-if="editingPosition" @submit.prevent="handlePositionEdit(staff.position.title)" class="d-flex">
              <input type="text" class="form-control" style="border-radius:0.5rem 0 0 0.5rem" v-model="staff.position.title">
              <button class="btn btn-primary unselectable" style="border-radius:0 0.5rem 0.5rem 0; width:100px">save</button>
            </form>
            
            </h4>
          <h4>Subjects:</h4>
          <div v-for="subject in staff.subjects" :key="subject.index" class="subject">{{subject.title}}<span class="delete" v-if="user.hasPermission('STAFF_E', currentSchool.id)"><i class="fa-solid fa-trash" @click="deleteSubject(subject)"></i></span></div>
          <input v-if="user.hasPermission('STAFF_E', currentSchool.id)"
          type="text" class="form-control" placeholder="Add subject..." @keyup.enter="addSubject" v-model="newSubject">
        </section>
      </div>
      <section>
        <SchoolPermissions />
      </section>
      
     
    </div>

  </div>
</template>

<script setup>
import { computed, ref, watch } from "vue";
import { useStaffStore } from "../../../stores/staff";
import { useSchoolStore } from "../../../stores/schools";
import axiosClient from "../../../axios";
import { useModalStore } from "../../../stores/modal";
import SchoolPermissions from './Details/Permissions.vue'
import HeaderLine from "../../../components/Layouts/MainLayout/Elements/HeaderLine.vue";
import { useUserStore } from "../../../stores/user";
import { useActionsStore } from "@/stores/actions";

const staffStore = useStaffStore()
const staff = staffStore.getStaff
const schoolStore = useSchoolStore()
const currentSchool = schoolStore.getSchool
const modal = useModalStore()
const user = useUserStore()
const actions = useActionsStore()

const editingPosition = ref(false)

// Subject Adding and Removing
const newSubject = ref('')
function addSubject(){
  axiosClient.post('user-subjects', {user_id: staff.id, school_id: currentSchool.id, subject: newSubject.value})
  .then(res => {
    staff.subjects.push(res.data)
  })
  newSubject.value = ''
}
function deleteSubject(subject){
  staffStore.setSubject(subject)
  modal.open('StaffDeleteSubject')
}

function handlePositionEdit(position){
  axiosClient.patch(`user-position/${staff.position.id}`, {position: position}).then(res =>{
    editingPosition.value = false
  })
}

function setActions(){
  const actionsArray = []
  if(user.hasPermission('Administrator', currentSchool.id) && !staffStore.getStaff.permissions.some(p => p.type === 'Administrator') && user.attributes.id != staff.id){
    actionsArray.push({ header: 'Promote to Administrator', to: { name: 'StaffDetails' }, modal: 'PromoteToAdmin', icon: 'fa-solid fa-star', additional: true, green: true})
  }
  if(user.hasPermission('Administrator', currentSchool.id) && staffStore.getStaff.permissions.some(p => p.type === 'Administrator')&& user.attributes.id != staff.id){
    actionsArray.push({ header: 'Demote Administrator', to: { name: 'StaffDetails' }, modal: 'DemoteAdmin', icon: 'fa-solid fa-user-slash', additional: true, red: true})
  }
  // if(user.hasPermission('STAFF_D', currentSchool.id) && user.attributes.id != staff.id){
  //   actionsArray.push({ header: 'Unlink From School', to: { name: 'StaffDetails' }, modal: 'UnlinkUser', icon: 'fa-solid fa-link-slash', additional: true, red: true})
  // }
  actions.setItems(actionsArray)
}
setActions()

watch(() => staffStore.getStaff.permissions, (newValue) => {
  setActions()
}, {deep: true})

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
<template>
  <div class="staff-card" :class="{active: activeComponent}" @click="activeComponent = !activeComponent">
    <div class="main-content">
      <div class="staff-content">
        <div>{{staff.full_name}}</div>
        <div>{{staff.position.title}}</div>
      </div>
      <div class="staff-flag">
        <i class="fa-solid fa-magnifying-glass ms-2" :class="{active: activeComponent}" @click="StaffDetails"></i>
        <i v-if="isAdmin(staff)" class="fa-solid fa-star ms-2" :class="{active: activeComponent}"></i>
      </div>
    </div>
    <div class="hidden-content" v-if="activeComponent">
      <div>Email: {{ staff.email }}</div>
      <div>Phone: {{ staff.phone }}</div>
    </div>
  </div>
</template>

<script setup>
import moment from "moment"
import { useStaffStore } from "/resources/js/stores/staff"
import { ref } from "vue"
import { useRouter } from "vue-router"
const props = defineProps({staff:Object})

const router = useRouter()
const staffStore = useStaffStore()

const activeComponent = ref(false)

function StaffDetails(){
  staffStore.setStaff(props.staff)
  router.push({
    name: 'StaffDetails'
  })
}

function isAdmin(member){
  return member.permissions.some(m => m.type === 'Administrator')
}

</script>

<style lang="scss" scoped>
.staff-card{
  .main-content {
    display: flex;
    padding: 10px;
    .staff-content {
      flex-grow: 2;
    }
    .staff-flag {
      width: 60px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-direction: row-reverse;
      .fa-solid {
        color: $ah-primary;
        padding: 5px;
        border: 1px solid $ah-primary;
        border-radius: 6px;
        margin-top: 7px;
      }
      .fa-star {
        border-color: transparent;
      }
    }
  }
  .hidden-content {
    padding: 10px;
  }
}
.active {
  background-color: $ah-primary-light;
  color: lighten($ah-primary-light, 50%);
  border-bottom: 1px solid $ah-grey;
  .main-content .staff-flag {
    .fa-solid {
      color: lighten($ah-primary-light, 50%);
      border: 1px solid lighten($ah-primary-light, 50%);
    }
    .fa-star {
      border-color: transparent;
    }
  }
}

</style>
<template>
  <div>
    <HeaderLine heading="Settings" 
      link1="Privacy Policy" link2="IP Policy"
      @link1="routeChange('Privacy')"
      @link2="routeChange('IPPolicy')"
      />
    <div class="user-element" @click="routeChange('NotificationPreferences')">
      <div class="icon">
        <i class="fa-solid fa-bell fa-2x"></i>
      </div>
      <div class="content">
        <div class="setting-name">Notification Preferences</div>
        <div class="setting-description">Select what you are notified about.</div>
      </div>
    </div>
    <div class="user-element" @click="routeChange('SchoolSetup')">
      <div class="icon">
        <i class="fa-solid fa-gear fa-2x"></i>
      </div>
      <div class="content">
        <div class="setting-name">School Setup</div>
        <div class="setting-description">Edit school images, and data used for forms and visual display.</div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import HeaderLine from '../../../components/Layouts/MainLayout/Elements/HeaderLine.vue';

const router = useRouter()

function routeChange(route_name){
  router.push({
    name: route_name
  })
}

</script>

<style lang="scss" scoped>
.user-element {
  min-height: 80px;
  display: flex;
  &:hover {
    cursor: pointer;
    box-shadow: 0 0 10px $ah-grey;
    .fa-gear {
      color: $ah-primary;
    }
  }
  .icon {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100px;
    .fa-gear {
      display: inline-block;
    }
  }
  .content {
    .setting-name{
      color: $ah-primary;
      font-size: 20px;
    }
  }
}
</style>./Policies/Privacy.vue
<template>
  <div style="font-family: 'Arial', sans-serif; background-color: #f4f4f4; color: #333;">
    
    <div style="padding: 15px 0">
      <div style="max-width: 600px; margin: 10px auto; display: flex; height: 100px;">
        <img style="width: 150px; margin-left: 10px;"  src="/images/ActivityHub_Logo_Main_250W.png" alt="Activity Hub Logo">
      </div>
      <div style="max-width: 600px; margin: 0 auto; padding: 20px; background-color: #fff; border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
        
        <div id="header-box" style="border-bottom: 1px solid lightgrey; margin-bottom: 1rem;">
          <h2 style="color: #3B6580; font-size: 1.5rem;">A New Lesson Request Has Been Received</h2>
        </div>

        <!-- <p>Hi {{ $data->user->first_name }},</p> -->
        <p>Hi User,</p>
        <p>A new lesson request has been received for the form: <span style="color: #3B6580; font-weight: bold;">FORM</span> <br>
          You can review it in the <a href="https://activityhub.co.nz/manage/lessons/requests">Lesson Request Management</a> section</p>
        <p>Regards,
          <br>
          The Activity Hub Team.
        </p>
      </div>
    </div>

  </div>
  
</template>

<script setup>

</script>

<style lang="scss" scoped>

</style>
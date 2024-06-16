<template>
  <div class="text-center">
    <h2>Enter Invite Code</h2>
    <form @submit.prevent="checkCode">
      <input type="text" class="text-center form-control" v-model="code" :maxlength="6" required>
      <!-- <input
        v-for="(field, index) in fields"
        :key="index"
        v-model="field.value"
        :maxlength="1"
        class="char-input text-center"
        @input="handleInput(index)"
        ref="inputFields"
        required
      /> -->
      <!-- <input type="submit" class="btn btn-secondary submit" value="Submit"> -->
      <ButtonLoading button-class="btn-primary submit" style="margin-left: auto; margin-right: auto;" inputmode="submit" :loading="checking" >Submit</ButtonLoading>
      <p class="text-center error">{{error}}</p>
    </form>
    <div v-if="result" class="result">
      <span>{{result.school.name}}</span>
      <ButtonLoading buttonClass="btn-primary join" :loading="isDisabled" @btn-click="handleJoin" >Join Staff</ButtonLoading>
      <!-- <button class="btn btn-primary join" @click="handleJoin" :disabled="isDisabled">Join Staff</button> -->
    </div>
  </div>
</template>

<script setup>
import { ref, watch } from "vue";
import axiosClient from "../../../../axios";
import { useModalStore } from "../../../../stores/modal";
import { useSchoolStore } from "../../../../stores/schools";
import { useUserStore } from "../../../../stores/user";
import ButtonLoading from "../../../../components/Layouts/MainLayout/Elements/Buttons/ButtonLoading.vue";
import useApi from "../../../../composables/useApi";

const user = useUserStore()
const modal = useModalStore()
const schoolStore = useSchoolStore()

  const fields = [
    { value: "" },
    { value: "" },
    { value: "" },
    { value: "" },
    { value: "" },
    { value: "" },
  ];

  const inputFields = ref([])
  const error = ref('')
  const code = ref('')
  const result = ref(null)
  const isDisabled = ref(false)
  const checking = ref(false)

    const handleInput = (currentIndex) => {
      if (fields[currentIndex].value.length === 1) {
        const nextIndex = currentIndex + 1;
        if (nextIndex < fields.length) {
          inputFields.value[nextIndex].focus();
        }
      }
    };

    // Watch for changes in the input values and trigger moving to the next field
    fields.forEach((field, index) => {
      watch(() => field.value, () => {
        handleInput(index);
      });
    });

    const checkCode = () => {
      checking.value = true
      error.value = ''
      result.value = null
      // let concatenatedValue = fields.map(field => field.value).join('');
      // axiosClient.get(`school-invitation/${concatenatedValue}`).then(res => {
      axiosClient.get(`school-invitation/${code.value}`).then(res => {
        result.value = res.data
        checking.value = false
      }).catch(err => {
        error.value = 'Invalid Code'
        checking.value = false
      })
    };
    
    async function handleJoin(){
      isDisabled.value = true
      let error = 0

      try {
        await useApi('user-school', {user_id: user.attributes.id, school_id: result.value.school.id}, 'POST').fetchData()
        await useApi('user-position', {user_id: user.attributes.id, school_id: result.value.school.id}, 'POST').fetchData()
        await useApi('user-permissions', {user_id: user.attributes.id, school_id: result.value.school.id, permission_type: 'Access'}, 'POST').fetchData()
        await useApi('user-linked-to-school', {user_id: user.attributes.id, school_id: result.value.school.id, invitation: result.value}, 'POST').fetchData()
        await useApi(`school-invitations/${result.value.id}`, null, 'DELETE').fetchData()
        isDisabled.value = false
        schoolStore.setSchool(result.value.school.id)
        modal.open('InviteCodeSuccess')
      } catch (error) {
        isDisabled.value = false
      }

      // Link user with the school
      // await axiosClient.post('user-school', {user_id: user.attributes.id, school_id: result.value.school.id})
      //   .then(response => {
      //     // Do something with the response, if needed
      //     // console.log('user school success')
      //   })
      //   .catch(err => {
      //     // console.log(error.message)
      //     // console.log('user school error')
      //     error++
      //   });

      // if(error === 0){
        // Assign user a basic position at the newly assigned school
        // await axiosClient.post('user-position', {user_id: user.attributes.id, school_id: result.value.school.id})
        //   .then(response => {
        //     // Do something with the response, if needed
        //     // console.log('user postion success')
        //   })
        //   .catch(err => {
        //     // console.log(error.message)
        //     // console.log('user position error')
        //     error++
        //   });
      // }
      
      // if(error === 0){
        // Assign user a basic permission at the newly assigned school
      //   await axiosClient.post('user-permissions', {user_id: user.attributes.id, school_id: result.value.school.id, permission_type: 'Access'})
      //     .then(response => {
      //       // Do something with the response, if needed
      //       // console.log('user permission success')
      //     })
      //     .catch(err => {
      //       // console.log(error.message)
      //       // console.log('user permission error')
      //       error++
      //     });
      // }
      
      // if(error === 0){
        // Let the administrator know the user has joined the school
      //   await axiosClient.post('user-linked-to-school', {user_id: user.attributes.id, school_id: result.value.school.id, invitation: result.value})
      //     .then(response => {
      //     })
      //     .catch(err => {
      //       error++
      //     });
      // }

      // if(error === 0){
        // Delete the invitation
      //   await axiosClient.delete(`school-invitations/${result.value.id}`)
      //     .then(response => {
      //       // Do something with the response, if needed
      //       // console.log('invitation delete success')
      //     })
      //     .catch(err => {
      //       // console.log(error.message)
      //       // console.log('invitation delete error')
      //       error++
      //     });
      // }
      // if(error === 0){
        schoolStore.setSchool(result.value.school.id)
        modal.open('InviteCodeSuccess')
      // }
    }

</script>

<style lang="scss" scoped>
h2 {
  padding-bottom: 1rem;
  border-bottom: 2px solid $ah-primary;
  margin-bottom: 1rem;
}
.char-input {
  background: #EFF2F5;
  border: none;
  width: 4rem;
  margin-right: 1rem;
  border-radius: 0.5rem;
  padding: 10px;
  font-size: 2rem;
}
.submit {
  width: 300px;
  margin-top: 1rem;
}
.error {
  color: $ah-red;
  padding: 10px;
}
.result {
  display: flex;
  align-items: center;
  margin-left: auto;
  margin-right: auto;
  background: #EFF2F5;
  width: fit-content;
  border-radius: 0.75rem;
  padding: 10px;
}
.join {
  margin-left: 2rem;
}
</style>
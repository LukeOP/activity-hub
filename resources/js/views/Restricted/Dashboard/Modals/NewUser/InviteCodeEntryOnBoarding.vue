<template>
  <div class="text-center">
    <h2>Enter Invite Code</h2>
    <p>This will be provided by the school.<br>
    If you have not received one and are expecting to, please contact the school administrator.</p>
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
      <input type="submit" class="btn btn-secondary submit" value="Submit">
      <p class="text-center error">{{error}}</p>
    </form>
    <div v-if="result" class="result">
      <span>{{result.school.name}}</span>
      <span class="btn btn-primary join" @click="handleJoin">Join Staff</span>
    </div>
    <button class="btn btn-grey float-start" style="width: 100px;" @click="back">Back</button>
  </div>
</template>

<script setup>
import { ref, watch } from "vue";
import axiosClient from "../../../../../axios";
import { useModalStore } from "../../../../../stores/modal";
import { useSchoolStore } from "../../../../../stores/schools";
import { useUserStore } from "../../../../../stores/user";

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
  const code = ref('')
  const error = ref('')
  const result = ref(null)

    const handleInput = (currentIndex) => {
      if (fields[currentIndex].value.length === 1) {
        const nextIndex = currentIndex + 1;
        if (nextIndex < fields.length) {
          inputFields.value[nextIndex].focus();
        }
      }
    };

    function back(){
      modal.open('CreateOrJoin')
    }

    // Watch for changes in the input values and trigger moving to the next field
    fields.forEach((field, index) => {
      watch(() => field.value, () => {
        handleInput(index);
      });
    });

    function checkCode(){
      error.value = ''
      result.value = null
      // let concatenatedValue = fields.map(field => field.value).join('');
      // axiosClient.get(`school-invitation/${concatenatedValue}`).then(res => {
      axiosClient.get(`school-invitation/${code.value}`).then(res => {
        result.value = res.data
      }).catch(err => {
        error.value = 'Invalid Code'
      })
    };
    
    async function handleJoin(){
      let error = 0

      // Link user with the school
      await axiosClient.post('user-school', {user_id: user.attributes.id, school_id: result.value.school.id})
        .then(response => {
          // Do something with the response, if needed
          // console.log('user school success')
        })
        .catch(error => {
          // console.log(error.message)
          // console.log('user school error')
          error++
        });

      if(error === 0){
        // Assign user a basic position at the newly assigned school
        await axiosClient.post('user-position', {user_id: user.attributes.id, school_id: result.value.school.id})
          .then(response => {
            // Do something with the response, if needed
            // console.log('user postion success')
          })
          .catch(error => {
            // console.log(error.message)
            // console.log('user position error')
            error++
          });
      }
      
      if(error === 0){
        // Assign user a basic permission at the newly assigned school
        await axiosClient.post('user-permissions', {user_id: user.attributes.id, school_id: result.value.school.id, permission_type: 'Access'})
          .then(response => {
            // Do something with the response, if needed
            // console.log('user permission success')
          })
          .catch(error => {
            // console.log(error.message)
            // console.log('user permission error')
          });
      }

      if(error === 0){
        // Delete the invitation
        await axiosClient.delete(`school-invitations/${result.value.id}`)
          .then(response => {
            // Do something with the response, if needed
            // console.log('invitation delete success')
          })
          .catch(error => {
            // console.log(error.message)
            // console.log('invitation delete error')
          });
      }
      if(error === 0){
        schoolStore.setSchool(result.value.school)
        modal.open('InviteCodeSuccessOnBoarding')
      }
    }

</script>

<style lang="scss" scoped>
h2 {
  padding-bottom: 1rem;
  border-bottom: 2px solid $ah-secondary;
  margin-bottom: 1rem;
}
input[type="text"] {
  background: #EFF2F5;
  border: none;
  margin-right: 1rem;
  border-radius: 0.5rem;
  padding: 10px;
  font-size: 2rem;
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
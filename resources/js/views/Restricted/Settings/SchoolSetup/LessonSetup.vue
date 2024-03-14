<template>
    <section>
        <div class="row">
            <div class="col col-12 col-md-6">
                <h2>Lesson Options</h2>
                <h3>Funding Types:</h3>
                <div v-for="fundingOption in schoolStore.getSchool.data.funding" :key="fundingOption" class="option">
                    {{fundingOption.value}}
                    <span class="delete" v-if="user.hasPermission('STAFF_E', school.id)">
                        <i class="fa-solid fa-trash" @click="deleteFundingOption(fundingOption)"></i>
                    </span>
                </div>
                  <input v-if="user.hasPermission('STAFF_E', school.id)"
                  type="text" class="form-control" placeholder="Add option..." @keyup.enter="addFundingOption" v-model="newFundingOption">
            </div>
            </div>
    </section>
</template>

<script setup>
import { ref } from 'vue';
import { useUserStore } from '../../../../stores/user';
import axiosClient from '../../../../axios';
import { useSchoolStore } from '../../../../stores/schools';

const props = defineProps({school: Object})
const newFundingOption = ref('')
const user = useUserStore()
const schoolStore = useSchoolStore()

function deleteFundingOption(option){
    axiosClient.delete('school-data/' + option.id).then(()=> {
        user.removeFundingData(option)
    })
}

function addFundingOption(){
    axiosClient.post('/school-data', {school_id: props.school.id, type: 'funding type', value: newFundingOption.value})
    .then((res)=>{
        user.addFundingData(res.data);
        newFundingOption.value = ''
    })
}

</script>

<style lang="scss" scoped>
.option {
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
</style>
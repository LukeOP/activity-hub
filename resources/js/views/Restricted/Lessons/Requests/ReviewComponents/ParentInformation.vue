<template>
    <section v-if="selectedStudent && (request.parent.email != null || request.parent.name != null || request.parent.phone != null)">
        <div class="row mt-4">
          <div class="col col-12 col-md-6">
            <h4 class="mt-2">Parent / Caregiver Information:</h4>
          </div>
          <div class="col col-12 col-md-6">
            <h4 v-if="selectedStudent" class="mt-2">Reviewed Parent / Caregiver Information:</h4>
          </div>
        </div>
  
        <div class="row" v-for="field in contactDetailsArray" :key="field">
          <div class="col col-12 col-md-6">
            <label v-if="field.if && field.value">{{ field.label }}
              <input :type="field.type" class="form-control" :value="field.value" disabled>
            </label>
          </div>
          <div v-if="selectedStudent" class="col col-12 col-md-6" :class="{divider: field.divider}">
            <label v-if="field.if">{{ field.label }}
              <span>
                <input :type="field.type" class="form-control" v-model="selectedStudent.contacts[field.sub][field.item]" :disabled="field.disabled" :required="field.required">
                <span v-if="!field.disabled" class="copy-btn" @click="copyField(field)">copy provided</span>
              </span>
            </label>
          </div>
        </div>
        <hr />
    </section>
</template>

<script setup>
import { ref } from 'vue';

const props = defineProps({request: Object, selectedStudent: Object})

const contactDetailsArray = ref([
{if: props.request.parent.name, sub: 'pc', item: 'name', label: 'Primary Parent / Caregiver Name', type: 'text', value: props.request.parent.name, required: true},
{if: props.request.parent.email, sub: 'pc', item: 'email', label: 'Primary Parent / Caregiver Email', type: 'email', value: props.request.parent.email, required: true},
{if: props.request.parent.phone, sub: 'pc', item: 'mobile', label: 'Primary Parent / Caregiver Phone Number', type: 'phone', value: props.request.parent.phone, divider: true, required: true},
{if: props.request.parent.name, sub: 'sc', item: 'name', label: 'Secondary Parent / Caregiver Name', type: 'text', value: null},
{if: props.request.parent.email, sub: 'sc', item: 'email', label: 'Secondary Parent / Caregiver Email', type: 'email', value: null},
{if: props.request.parent.phone, sub: 'sc', item: 'mobile', label: 'Secondary Parent / Caregiver Phone Number', type: 'phone', value: null},
])

// Copy data from request to student data.
function copyField(field){
  if(field.item === 'name' && field.sub === 'pc') props.selectedStudent.contacts.pc.name = props.request.parent.name
  if(field.item === 'email' && field.sub === 'pc') props.selectedStudent.contacts.pc.email = props.request.parent.email
  if(field.item === 'mobile' && field.sub === 'pc') props.selectedStudent.contacts.pc.mobile = props.request.parent.phone
  if(field.item === 'name' && field.sub === 'sc') props.selectedStudent.contacts.sc.name = props.request.parent.name
  if(field.item === 'email' && field.sub === 'sc') props.selectedStudent.contacts.sc.email = props.request.parent.email
  if(field.item === 'mobile' && field.sub === 'sc') props.selectedStudent.contacts.sc.mobile = props.request.parent.phone
}

</script>

<style lang="scss" scoped>

label, input, select {
  margin-bottom: 0.5rem;
  width: 100%;
  span {
    display: flex;
    .form-control {
      border-top-right-radius: 0;
      border-bottom-right-radius: 0;
    }
    .copy-btn {
      max-height: 37.03px;
      // border: 1px solid $ah-primary;
      background-color: $ah-primary;
      color: white;
      padding: 0.375rem 0.75rem;
      border-radius: 0 0.375rem 0.375rem 0;
      min-width: fit-content;
      &:hover {
        cursor: pointer;
        background-color: $ah-primary-dark;
      }
    }
  }
}

.divider {
  border-bottom: 1px dashed $ah-primary;
  margin-bottom: 0.5rem;
}
</style>
<template>
  <div v-if="request">
    <HeaderLine heading="Lesson Request Review" :school="request.school.name" />
    <div class="w-100" style="text-align: end;"><span class="text-primary">Form:</span> {{ request.attributes.form.description }}</div>
    
    <form @submit.prevent="assignLesson">
      <StudentInformation :request="request" @selectedStudent="setSelectedStudent" />
      <ParentInformation v-if="selectedStudent" :request="request" :selectedStudent="selectedStudent" />
      <LessonInformation v-if="selectedStudent" :request="request" :selectedStudent="selectedStudent" @lessonData="setLessonData" />
      <ReviewConfirmation v-if="lessonData" :selectedStudent="selectedStudent" :assigningLesson="assigningLesson" :lessonDetails="lessonData" @emailCheckboxes="setEmailList"/>
    </form>
  </div>
</template>

<script setup>
import { onMounted, ref } from "vue";
import { useRouter } from "vue-router";
import useApi from "../../../../composables/useApi";
import { useLessonsStore } from "../../../../stores/lessons";
import { useToastStore } from "/resources/js/stores/toast";
import { useUserStore } from "/resources/js/stores/user";
import { useActionsStore } from "/resources/js/stores/actions";
import HeaderLine from "/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue";
import { useStaffStore } from "../../../../stores/staff";
import { useSchoolStore } from "../../../../stores/schools";

import StudentInformation from "./ReviewComponents/StudentInformation.vue"
import ParentInformation from "./ReviewComponents/ParentInformation.vue"
import LessonInformation from "./ReviewComponents/LessonInformation.vue"
import ReviewConfirmation from "./ReviewComponents/ReviewConfirmation.vue";

// NEW METHODS
  function setSelectedStudent(student){
    selectedStudent.value = student
  }
  function setLessonData(lesson){
    lessonData.value = lesson
  }
  function setEmailList(list) {
    emailList.value = list
  }

// NEW METHODS END


// Init Stores
const lessonStore = useLessonsStore()
const staffStore = useStaffStore()
const schoolStore = useSchoolStore()
const user = useUserStore()
const actions = useActionsStore()
const router = useRouter()

// Init variables
const request = lessonStore.getRequest
const selectedStudent = ref(null)
const assigningLesson = ref(false)
const lessonData = ref(null)
const emailList = ref({student: false, pc: false, sc: false})

//Student Data

// Set side actions available on this page
const actionArray = []
if(user.hasPermissionAny('LESSONS_REQ_D')){
  actionArray.push({ header: 'Delete Request', to: { name: 'LessonRequestReview' }, modal: 'DeleteRequest', red: true, icon: 'fa-solid fa-trash'})
}
actions.setItems(actionArray)


async function assignLesson(){
  assigningLesson.value = true

  // Update Student Contacts
  await useApi('student-contacts/' + selectedStudent.value.id, formatLessonData(selectedStudent.value.contacts), 'PATCH').fetchData();

  // Create new lesson
  const { data, fetchData} = useApi('lessons', lessonData.value, 'POST', true)
  await fetchData();

  // Delete the lesson request
  await useApi('lesson-requests/' + request.id, null, 'DELETE').fetchData();


  // Send emails to tutor, students and caregivers
  SendEmails(data.value.data)

  assigningLesson.value = false

  router.push({
    name: 'RequestsList'
  })
}

function formatLessonData(data){
  // Initialize an empty object to store transformed fields
  let formattedLessonData = {};

  // Extract student details
  formattedLessonData['student_mobile'] = data.student.mobile ?? "";
  formattedLessonData['student_email'] = data.student.email ?? "";

  // Extract primary contact (pc) details
  formattedLessonData['pc_mobile'] = data.pc.mobile ?? "";
  formattedLessonData['pc_name'] = data.pc.name ?? "";
  formattedLessonData['pc_email'] = data.pc.email ?? "";

  // Extract secondary contact (sc) details
  formattedLessonData['sc_mobile'] = data.sc.mobile ?? "";
  formattedLessonData['sc_name'] = data.sc.name ?? "";
  formattedLessonData['sc_email'] = data.sc.email ?? "";

  return formattedLessonData;
}

async function SendEmails(data){
  await useApi('/email-lesson-assigned-tutor', data, 'POST').fetchData();
  if (emailList.value.student) {
    await useApi('/email-lesson-assigned-student', data, 'POST').fetchData();
  }
  if (emailList.value.pc) {
    await useApi('/email-lesson-assigned-caregiver/pc', data, 'POST').fetchData();
  }
  if (emailList.value.sc) {
    await useApi('/email-lesson-assigned-caregiver/sc', data, 'POST').fetchData();
  }
}

onMounted(() => {
  staffStore.fetchStaff(schoolStore.getSchool.id);
});

</script>

<style lang="scss" scoped>
form {
  margin-bottom: 3rem;
}
</style>
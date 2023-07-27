<template>
  <div id="parent-details" class="section row" v-if="lesson.student.contacts">
      <h2>Contact Details:</h2>
      <div id="student" class="col col-12 col-sm-6 col-md-3" v-if="lesson.student.contacts.student.email">
        <h2>Student:</h2>
        <h3>Name:</h3>
        {{lesson.student.first_name}} {{lesson.student.last_name}}<br/>
        <h3>Year Level:</h3>
        {{lesson.student.year_level}}<br/>
        <h3>Email:</h3>
        {{lesson.student.contacts.student.email}}<br/>
        <h3>Mobile:</h3>
        {{lesson.student.contacts.student.mobile}}<br/>
      </div>
      <div id="primary-carer" class="col col-12 col-sm-6 col-md-3" v-if="lesson.student.contacts.pc.name">
        <h2>Primary Carer:</h2>
        <h3>Name:</h3>
        {{lesson.student.contacts.pc.name}}<br/>
        <h3>Relationship:</h3>
        {{lesson.student.contacts.pc.relationship}}<br/>
        <h3>Email:</h3>
        {{lesson.student.contacts.pc.email}}<br/>
        <h3>Mobile:</h3>
        {{lesson.student.contacts.pc.mobile}}<br/>
      </div>
      <div id="secondary-carer" class="col col-12 col-sm-6 col-md-3" v-if="lesson.student.contacts.sc.name">
        <h2>Secondary Carer:</h2>
        <h3>Name:</h3>
        {{lesson.student.contacts.sc.name}}<br/>
        <h3>Relationship:</h3>
        {{lesson.student.contacts.sc.relationship}}<br/>
        <h3>Email:</h3>
        {{lesson.student.contacts.sc.email}}<br/>
        <h3>Mobile:</h3>
        {{lesson.student.contacts.sc.mobile}}<br/>
      </div>
    </div>
</template>

<script>
export default {
  props: {
    lesson: Object
  }

}
</script>

<style lang="scss" scoped>
h2 {
  color: $ah-primary-dark;
  font-size: 1.5rem;
}
h3 {
  font-size: 1rem;
  display: inline-block;
  color: $ah-primary-dark;
  font-weight: bold;
  margin-right: 0.3rem;
}
.section {
  padding: 10px;
  border-bottom: 1px dashed $ah-primary;
}
#student, #primary-carer, #secondary-carer {
  border-left: 4px solid;
  margin-bottom: 2rem;
}
#student {
  border-color: $ah-primary;
}
#primary-carer {
  border-color: $ah-secondary;
}
#secondary-carer {
  border-color: $ah-background-dark;
}

</style>
<template>
  <div id="parent-details" class="section row" v-if="student.contacts != null">
    <h2>Contact Details:</h2>
    <div id="student" class="col col-12 col-sm-6 col-md-3" v-if="student.contacts.student.email">
      <h2>Student:</h2>
      <h3>Name:</h3>
      {{student.first_name}} {{student.last_name}}<br/>
      <h3>Year Level:</h3>
      {{student.year_level}}<br/>
      <h3>Email:</h3>
      {{student.contacts.student.email}}<br/>
      <h3>Mobile:</h3>
      {{student.contacts.student.mobile}}<br/>
    </div>
    <div id="primary-carer" class="col col-12 col-sm-6 col-md-3" v-if="student.contacts.pc.name">
      <h2>Primary Carer:</h2>
      <h3>Name:</h3>
      {{student.contacts.pc.name}}<br/>
      <h3>Relationship:</h3>
      {{student.contacts.pc.relationship}}<br/>
      <h3>Email:</h3>
      {{student.contacts.pc.email}}<br/>
      <h3>Mobile:</h3>
      {{student.contacts.pc.mobile}}<br/>
    </div>
    <div id="secondary-carer" class="col col-12 col-sm-6 col-md-3" v-if="student.contacts.sc.name">
      <h2>Secondary Carer:</h2>
      <h3>Name:</h3>
      {{student.contacts.sc.name}}<br/>
      <h3>Relationship:</h3>
      {{student.contacts.sc.relationship}}<br/>
      <h3>Email:</h3>
      {{student.contacts.sc.email}}<br/>
      <h3>Mobile:</h3>
      {{student.contacts.sc.mobile}}<br/>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    student: Object
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

@media (max-width: 768px) {
#student, #primary-carer, #secondary-carer {
  margin-bottom: 0.5rem;
  padding: 15px 10px;
}
  #student{
    background-color: lighten($ah-primary-background, 6%);
  }
  #primary-carer{
    background-color: lighten($ah-secondary-background, 6%);
  }
  #secondary-carer{
    background-color: $ah-grey-background;
  }
}
</style>
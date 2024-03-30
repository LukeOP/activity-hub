import { defineStore } from "pinia";
import useApi from '/resources/js/composables/useApi';

function getState(){
    return {
      currentSchool: {},
      schools: [],
      loading: false
    }
}

export const useSchoolStore = defineStore('schools', {
  state: () => (getState()),
  actions: {
    async fetchSchools() {
      this.loading = true;
      const { data: schools, error, fetchData } = useApi('schools');
      try {
        await fetchData();
        if (error.value) {
          throw new Error(error.value)
        }
        // Update store state with fetched data
        this.setSchools(schools.value)
        this.setSchool(schools.value[0])
      } catch (error) {
        console.error('Error fetching data: ', error);
      } finally {
        this.loading = false;
      }
    },
    setSchool(schoolObject){
      this.currentSchool = schoolObject
    },
    setSchoolFromId(school_id){
      this.currentSchool = this.schools.find(s => s.id == school_id)
    },
    setSchools(schoolsArray){
      this.schools = schoolsArray
    },
    updateSchool(schoolObject){
      this.schools = this.schools.filter(s => s.id != schoolObject.id)
      this.schools = [schoolObject, ...this.schools]
      this.currentSchool = schoolObject
    },
    reset(){
      this.currentSchool = {}
      this.schools = []
    }
  },
  getters: {
    getSchool(){
      return this.currentSchool
    },
    getSchools(){
      return this.schools
    },
    getFunding(){
      var fundingTypeSet = new Set();
    
      this.currentSchool.data.funding.forEach(function(funding){
        fundingTypeSet.add(funding.value)
      })
    
      return Array.from(fundingTypeSet)
    }
  }
})

import { useLessonsStore } from "../../../../stores/lessons";
import LessonPlanner from "./LessonPlanner.vue";

const plannerRoutes = [
  { path: 'planner',
    children: [
        { path: '', name: 'LessonPlanner', component: LessonPlanner, meta: { title: 'Day Planner', breadcrumb: 'Planner', section: 'Lessons', depth: 2},
        beforeEnter: () => checkEventObject('LessonsList')},
    ]}
] 

function checkEventObject(redirect){
  const lessonStore = useLessonsStore()
  if(Object.keys(lessonStore.getLessonsData) == 0) return { name: redirect}
  else return true
}

export default plannerRoutes;

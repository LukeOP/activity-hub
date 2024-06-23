import { useLessonsStore } from "../../../../stores/lessons";
import LessonPlanner from "./LessonPlanner.vue";

const plannerRoutes = [
  { path: 'planner',
    children: [
        { path: '', name: 'LessonPlanner', component: LessonPlanner, meta: { title: 'Day Planner', breadcrumb: 'Planner', section: 'Lessons', depth: 2}}
    ]}
] 


export default plannerRoutes;

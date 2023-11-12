import Home from '../components/Public/Home.vue';
import Login from '../components/Public/AuthenticateUser/LoginUser.vue';
import RegisterUser from '../components/Public/AuthenticateUser/RegisterUser.vue';
import LessonSignUpForm from '../components/Public/Forms/LessonSignup.vue'

const publicRoutes = [
  {
    path: '/',
    name: 'Public-Home',
    component: Home,
    redirect: {name: 'Login'},
    children: [
      { path: 'user-login', name: 'Login', component: Login },
      { path: 'registration', name: 'Register', component: RegisterUser, },
      { path: 'forms/:id', name: 'LessonSignUp', component: LessonSignUpForm, }
    ]
  },
  
];

export default publicRoutes;

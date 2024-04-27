import Home from '../views/Public/Home.vue';
import NotFoundPublic from '../views/Public/NotFoundPublic.vue'
import Login from '../views/Public/AuthenticateUser/LoginUser.vue';
import Demo from '../views/Public/AuthenticateUser/LoginDemo.vue';
import RecoverAccount from '../views/Public/AuthenticateUser/RecoverAccount.vue';
import SetPassword from '../views/Public/AuthenticateUser/SetPassword.vue';
import RegisterUser from '../views/Public/AuthenticateUser/RegisterUser.vue';
import RegisterConfirm from '../views/Public/AuthenticateUser/RegisterConfirm.vue';
import EmailVerified from '../views/Public/AuthenticateUser/EmailVerified.vue';
import LessonSignUpForm from '../views/Public/Forms/LessonSignup.vue'

import AuthLayout from '../components/Layouts/PublicLayout/AuthLayout.vue'

import UserGuideLayout from '../components/Layouts/UserGuideLayout/UserGuideLayout.vue';
import GuideDashboard from '../views/UserGuide/GuideDashboard.vue';
import GuideLessons from '../views/UserGuide/GuideLessons.vue';

const publicRoutes = [
  {
    path: '/',
    name: 'Public-Home',
    component: AuthLayout,
    redirect: {name: 'Login'},
    children: [
      { path: 'user-login', name: 'Login', component: Login, meta: {title: 'Login'}},
      { path: 'demo', name: 'DemoLogin', component: Demo, meta: {title: 'Login Demo'}},
      { path: 'registration', name: 'Register', component: RegisterUser, meta: {title: 'Register'} },
      { path: 'registration-confirm', name: 'RegisterConfirm', component: RegisterConfirm, meta: {title: 'Register'} },
      { path: 'email-verified', name: 'EmailVerified', component: EmailVerified, meta: {title: 'Register'} },
      { path: 'recover-account', name: 'RecoverAccount', component: RecoverAccount, meta: {title: 'Account Recovery'} },
      { path: 'password', name: 'Password', component: SetPassword, meta: {title: 'Reset Password'} },
    ]
  },
  { path: '/user-guide', name: 'UserGuide', component: UserGuideLayout, redirect: { name: 'GuideDashboard' }, meta: { title: 'User Docs'},
    children: [
      { path: 'dashboard', name: 'GuideDashboard', component: GuideDashboard },
      { path: 'lessons', name: 'GuideLessons', component: GuideLessons },
    ]
  },
  { path: '/forms/:id', name: 'LessonSignUp', component: LessonSignUpForm, meta: {title: 'Lesson Signup'}},
  { path: '/home', name: 'Home', component: Home, meta: {title: 'Welcome'} },
  { path: '/not-found', name: 'NotFoundPublic', component: NotFoundPublic, redirect: '/' }
  
];

export default publicRoutes;

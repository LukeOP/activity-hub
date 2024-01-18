import Home from '../components/Public/Home.vue';
import NotFound from '../components/Public/NotFound.vue'
import Login from '../components/Public/AuthenticateUser/LoginUser.vue';
import RecoverAccount from '../components/Public/AuthenticateUser/RecoverAccount.vue';
import SetPassword from '../components/Public/AuthenticateUser/SetPassword.vue';
import RegisterUser from '../components/Public/AuthenticateUser/RegisterUser.vue';
import RegisterConfirm from '../components/Public/AuthenticateUser/RegisterConfirm.vue';
import EmailVerified from '../components/Public/AuthenticateUser/EmailVerified.vue';
import LessonSignUpForm from '../components/Public/Forms/LessonSignup.vue'

import MainLayout from '../components/Layouts/PublicLayout/MainLayout.vue'
import AuthLayout from '../components/Layouts/PublicLayout/AuthLayout.vue'

const publicRoutes = [
  {
    path: '/',
    name: 'Public-Home',
    component: AuthLayout,
    redirect: {name: 'Login'},
    children: [
      { path: 'user-login', name: 'Login', component: Login, meta: {title: 'Login'}},
      { path: 'registration', name: 'Register', component: RegisterUser, meta: {title: 'Register'} },
      { path: 'registration-confirm', name: 'RegisterConfirm', component: RegisterConfirm, meta: {title: 'Register'} },
      { path: 'email-verified', name: 'EmailVerified', component: EmailVerified, meta: {title: 'Register'} },
      { path: 'recover-account', name: 'RecoverAccount', component: RecoverAccount, meta: {title: 'Account Recovery'} },
      { path: 'password', name: 'Password', component: SetPassword, meta: {title: 'Reset Password'} },
      { path: 'forms/:id', name: 'LessonSignUp', component: LessonSignUpForm, meta: {title: 'Lesson Signup'} },

      { path: 'home', name: 'Home', component: Home, meta: {title: 'Welcome'} },


      {path: '/:pathMatch(.*)*', name: 'NotFound', component: NotFound, meta: {title: '404 Not Found'}}
    ]
  },
];

export default publicRoutes;

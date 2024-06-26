import { useAppStore } from '../stores/appStore';
import { useUserStore } from '../stores/user';
import useApi from './useApi'

export function checkForNotifications(){
    const user = useUserStore()
    const appStore = useAppStore()
    const {data, fetchData} = useApi('notifications-new/' + appStore.routeChangeTime)
    fetchData()
    .then(()=>{
        if(data.value.data.length > 0){
            user.notifications.active = [...user.notifications.active, ...data.value.data]
        }
    })
}
import { useUserStore } from "../stores/user";


export function usePermissions() {
    const user = useUserStore()

    function checkPermissions(permissionsArray) {
        let permitted = false

        permissionsArray.forEach(permission => {
          if (user.hasPermissionAny(permission)) {
            permitted = true
          }
        })
    
        return permitted
    }
    
    return {
    checkPermissions
    }
    
}
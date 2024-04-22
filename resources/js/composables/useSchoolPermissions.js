import { useUserStore } from "../stores/user";


export function useSchoolPermissions() {
    const user = useUserStore()

    function checkSchoolPermissions(permissionsArray, school_id) {
        let permitted = false

        permissionsArray.forEach(permission => {
          if (user.hasPermission(permission, school_id)) {
            permitted = true
          }
        })
    
        return permitted
    }
    
    return {
    checkSchoolPermissions
    }
    
}
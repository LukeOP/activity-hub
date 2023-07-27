export default function useSorter() {
  function sort(value, propertyName) {
    // console.log('Values:' ,value);

    value.sort((a, b) => {
      const propertyA = getProperty(a, propertyName).toUpperCase();
      const propertyB = getProperty(b, propertyName).toUpperCase();

      if (propertyA < propertyB) {
        return -1;
      }
      if (propertyA > propertyB) {
        return 1;
      }

      return 0;
    });
  }

  function getProperty(obj, path) {
    // Split the path into nested property names
    const properties = path.split('.');
    let value = obj;

    // Traverse the object to access the nested property
    for (const property of properties) {
      value = value[property];
      if (value === undefined) {
        break;
      }
    }

    return value;
  }

  return { sort };
}

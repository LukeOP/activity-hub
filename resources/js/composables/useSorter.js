export default function useSorter() {
  function sort(value, propertyName, sortOrder = 'asc') {
    value.sort((a, b) => {
      const propertyA = getProperty(a, propertyName);
      const propertyB = getProperty(b, propertyName);

      let result = 0;
      if (typeof propertyA === 'number' && typeof propertyB === 'number') {
        result = propertyA - propertyB;
      } else {
        // Convert to uppercase if the property is not a number
        const stringPropertyA = String(propertyA).toUpperCase();
        const stringPropertyB = String(propertyB).toUpperCase();

        if (stringPropertyA < stringPropertyB) {
          result = -1;
        } else if (stringPropertyA > stringPropertyB) {
          result = 1;
        }
      }

      // Apply descending order if sortOrder is 'desc'
      if (sortOrder === 'desc') {
        result *= -1;
      }
      return result;
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

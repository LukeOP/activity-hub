export default function useSearch() {
  function search(array, inputValue) {
    // console.log(array, inputValue)
    if (!array) {
      // console.log('rejecting array')
      return [];
    }
    if (!inputValue) {
      // console.log('rejecting input')
      return array;
    }
    
    const filteredItems = [];

    function recursiveSearch(obj) {
      for (const key in obj) {
        if (typeof obj[key] === 'string' && obj[key].toLowerCase().includes(inputValue.toLowerCase())) {
          filteredItems.push(obj);
          break;
        } else if (typeof obj[key] === 'object') {
          recursiveSearch(obj[key]);
        }
      }
    }

    array.forEach(item => {
      recursiveSearch(item);
    });

    return filteredItems;
  }
  
  return { search };
}
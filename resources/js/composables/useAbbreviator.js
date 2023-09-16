export default function useAbbreviator(){
  const abbreviate = (string) => {
    // Split the string into words
    const words = string.split(' ');

    // Initialize an empty string to store the abbreviation
    let abbreviation = '';

    // Iterate through the words and extract the first letter of each word
    for (const word of words) {
      // Check if the word is not empty (to handle extra spaces)
      if (word.length > 0) {
        abbreviation += word[0].toUpperCase(); // Convert to uppercase
      }
    }

    return abbreviation ;
  }
  return { abbreviate }
}
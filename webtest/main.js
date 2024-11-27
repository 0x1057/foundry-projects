const jsonString = '{"name": "Jane Doe", "yearOfBirth": 1900}';
const obj = JSON.parse(jsonString);
console.log(obj.name);

const stringification = JSON.stringify(obj);
console.log(stringification);
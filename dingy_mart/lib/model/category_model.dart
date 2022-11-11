
enum CategoryModel{
  winterWear,
  topWear,
  bottomWear,
  footWear,
  innerWear,
  sportsWear,
  accessories,
  mobiles,
  electronics,
  home,
}
enumToString(categories){
  return categories.forEach((category) => category.value.toString());
}

class Api {


  static const String _baseUrl = "https://mager-spot-api-v54ppgzx2a-et.a.run.app/api/v1";

  static String getRegisterEndpoint() => "$_baseUrl/register";
  static String getLoginEndpoint() => "$_baseUrl/login";
  static String getAuthEmailEndpoint() => "$_baseUrl/auth-email";
  static String getUpdateUserEndpoint() => "$_baseUrl/update-user";
  static String getUpdatePhotoEndpoint() => "$_baseUrl/update-photo";
  static String getLoginUserEndpoint() => "$_baseUrl/login-user";
  static String getCreateFoodPostEndpoint() => "$_baseUrl/food-post";
  static String getFoodPostsEndpoint() => "$_baseUrl/food-post/";
  static String getFoodPostEndpoint() => "$_baseUrl/food-post/bb110f3a-0197-4173-adb8-fd1df97b54bf";

  static String getCreateCommentEndpoint() => "$_baseUrl/food-post/bb110f3a-0197-4173-adb8-fd1df97b54bf/comment";
  static String getContactLinkEndPoint() => "$_baseUrl/food-post/bb110f3a-0197-4173-adb8-fd1df97b54bf/contact";
  static String getShowHistoryEndpoint() => "$_baseUrl/history";

  
}
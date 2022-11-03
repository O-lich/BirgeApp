class LoginModel {

final String? value;
final String response;

  LoginModel({required this.value, required this.response});
  String? validator() {
    if (value!.isEmpty) {
      return response;
    } else {
      return null;
    }
  }
}
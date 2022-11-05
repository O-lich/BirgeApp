class LoginViewModel {
  final String? value;
  final String response;

  LoginViewModel({required this.value, required this.response});

  String? validator() {
    if (value!.isEmpty) {
      return response;
    } else {
      return null;
    }
  }
}

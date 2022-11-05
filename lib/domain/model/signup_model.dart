class SignUpViewModel {
  final String? value;
  final String response;

  SignUpViewModel({required this.value, required this.response});

  String? validator() {
    if (value!.isEmpty) {
      return response;
    } else {
      return null;
    }
  }
}
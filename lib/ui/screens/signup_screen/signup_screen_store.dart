import 'package:mobx/mobx.dart';

part 'signup_screen_store.g.dart';


class SignUpScreenStore = _SignUpScreenStore
    with _$SignUpScreenStore;

abstract class _SignUpScreenStore with Store {
    @observable
    late String username;
    
    @action
    void setUsername(String value) {
        username = value;
    }
}


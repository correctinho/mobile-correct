import 'dart:async';
import 'package:mobx/mobx.dart';
part 'token_controller.g.dart';

class TokenController = _TokenControllerBase with _$TokenController;

abstract class _TokenControllerBase with Store {
  @observable
  String token = '852793';

  @observable
  int time = 60;

  @action
  startTimer() async {
    const oneSec = Duration(seconds: 1);
    Timer timer;

    timer = Timer.periodic(oneSec, (timer) {
      if (time == 0) {
        timer.cancel();
      } else {
        time--;
      }
    });
  }
}

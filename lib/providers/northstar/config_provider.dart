import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config_provider.g.dart';

class Cashier{

}

@riverpod
class Notifier extends _$Notifier{
  @override
  Cashier build(){
    return Cashier();
  }
}
import 'package:bs_commerce/app/modules/main/bindings/main_binding.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'local_source_bindings.dart';
import 'remote_source_bindings.dart';
import 'repository_bindings.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    RepositoryBindings().dependencies();
    RemoteSourceBindings().dependencies();
    LocalSourceBindings().dependencies();
  }
}

import 'package:tut_app/app/extensions.dart';

import '../../app/constants.dart';
import '../response/responses.dart';
import '../../domain/model/models.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDoMain() {
    return Customer(
      this?.id.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.numOfNotifications.orZero() ?? Constants.zero,
    );
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contact toDoMain() {
    return Contact(
      this?.phone.orEmpty() ?? Constants.empty,
      this?.email.orEmpty() ?? Constants.empty,
      this?.link.orEmpty() ?? Constants.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDoMain() {
    return Authentication(
      this?.customer.toDoMain(),
      this?.contacts.toDoMain(),
    );
  }
}

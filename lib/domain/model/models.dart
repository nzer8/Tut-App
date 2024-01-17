// todo:  onBoarding Model
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(
      {required this.title, required this.subTitle, required this.image});
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfObject;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numOfObject, this.currentIndex);
}

// todo: End onBoarding Model
//------------------------------------
// #todo login models
class Customer {
  String id;
  String name;
  int numOfNotifications;

  Customer(this.id, this.name, this.numOfNotifications);
}

class Contact {
  String phone;
  String email;
  String link;

  Contact(this.phone, this.email, this.link);
}

class Authentication {
  Customer? customer;
  Contact? contacts;

  Authentication(this.customer, this.contacts);
}

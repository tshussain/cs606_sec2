

class Vehicle {
  pressHorn() {
    print("beep");
  }
}

class CustomizedVehicle extends Vehicle {
  pressHorn() {
    for (int i=0; i < 10; i++ ) {
      print("beeeep");
    }
  }
}

class TractorTrailer extends Vehicle {
  pressHorn() {
    print("uuurrrrhhhh");
  }
}




mixin classA {
  // String val="A";
  methodA() {
    print("A");
  }
}

class classB {
  // String val = "B";
  methodA() {
    print("B");
  }
}

class classC {
  methodC() {
    print("C");
  }
}

class MixItUp with classA, classB, classC {
  methodD() {
    methodA();
    methodC();
    // print(val);
  }
}
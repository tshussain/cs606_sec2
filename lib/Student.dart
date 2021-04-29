

import 'package:flutter/cupertino.dart';

class Student {
  int _studentID;
  @protected
  String firstName, lastName;
  Map<int, double> _gradesByCourse;

  int get studentID => _studentID;

  // String get firstName => _firstName;
  //
  // get lastName => _lastName;

  addGrade(int courseNum, double grade) {
    Map<int, double> newGrade = {courseNum: grade} ;
    _gradesByCourse.addAll(newGrade);
  }

  Map<int, double> getAllGrades() {
    return Map.from(_gradesByCourse);
  }
}


class SummerStudent2 extends Student {
  String _remedialPlan;

  printName() {
    print(firstName);
  }
}

class Teacher2 {

  lookAtGrades(SummerStudent2 student) {
    Map<int, double> allGrades = student.getAllGrades();

    Map<int, double> newGrade = {100: 75};
    allGrades.addAll(newGrade);

    print(student.firstName);
  }

}

import 'Student.dart';

class Teacher2 {

  lookAtGrades(SummerStudent2 student) {
    Map<int, double> allGrades = student.getAllGrades();

    Map<int, double> newGrade = {100: 75};
    allGrades.addAll(newGrade);

    print(student.firstName);
  }

}
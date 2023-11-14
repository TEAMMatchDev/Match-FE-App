import 'package:get/get.dart';

import '../../../model/enum/project_type.dart';

class TutorialController extends GetxController {
  RxInt selectTypeIdx = (-1).obs;
  List<ProjectType> projectTypes = [
    ProjectType.EARTH,
    ProjectType.ANIMAL,
    ProjectType.CHILDREN
  ];
}

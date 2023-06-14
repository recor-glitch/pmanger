import 'package:pmanager/data/project/dto/create_project_dto_dart';
import 'package:pmanager/domain/project/entity/ProjectEntity.dart';

abstract class ProjectApi {
  Future<ProjectEntity> createProject(CreateProjectDto dto);
  Future<List<ProjectEntity>> getAllProjects();
}

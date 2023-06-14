import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pmanager/data/project/api/ProjectApi.dart';
import 'package:pmanager/data/project/dto/create_project_dto_dart';
import 'package:pmanager/domain/project/entity/ProjectEntity.dart';

class ProjectApiImpl implements ProjectApi {
  CollectionReference store = FirebaseFirestore.instance.collection('projects');
  @override
  Future<ProjectEntity> createProject(CreateProjectDto dto) async {
    try {
      await store.doc(dto.title).set(dto);
      var doc = await store.doc(dto.title).get();
      return ProjectEntity.fromJson(doc.data() as Map);
    } on FirebaseException {
      throw FirebaseException(plugin: 'server error');
    } on Exception catch (exception) {
      throw Exception(exception);
    }
  }

  @override
  Future<List<ProjectEntity>> getAllProjects() async {
    try {
      var qsnap = await store.get();
      return [
        ...qsnap.docs.map((doc) => ProjectEntity.fromJson(doc.data() as Map))
      ];
    } on FirebaseException {
      throw FirebaseException(plugin: 'server error');
    } on Exception catch (exception) {
      throw Exception(exception);
    }
  }
}

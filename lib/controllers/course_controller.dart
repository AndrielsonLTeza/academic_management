import 'package:flutter/material.dart';
import '../models/course.dart';
import '../repositories/course_repository.dart';

class CourseController extends ChangeNotifier {
  final CourseRepository _repository = CourseRepository();
  List<Course> _courses = [];

  List<Course> get courses => _courses;

  Future<void> carregarCursos() async {
    _courses = await _repository.listar();
    notifyListeners();
  }

  Future<void> adicionarCurso(Course course) async {
    await _repository.inserir(course);
    await carregarCursos();
  }

  Future<void> atualizarCurso(Course course) async {
    await _repository.atualizar(course);
    await carregarCursos();
  }

  Future<void> removerCurso(int id) async {
    await _repository.remover(id);
    await carregarCursos();
  }
}

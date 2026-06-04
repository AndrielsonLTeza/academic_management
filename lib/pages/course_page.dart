import 'package:flutter/material.dart';
import '../models/course.dart';
import '../controllers/course_controller.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final CourseController _controller = CourseController();

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _durationController = TextEditingController();
  final _coordinatorController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.carregarCursos().then((_) => setState(() {}));
  }

  void _limparFormulario() {
    _nameController.clear();
    _durationController.clear();
    _coordinatorController.clear();
    _descriptionController.clear();
  }

  void _mostrarFormulario({Course? course}) {
    if (course != null) {
      _nameController.text = course.name;
      _durationController.text = course.duration.toString();
      _coordinatorController.text = course.coordinator;
      _descriptionController.text = course.description;
    } else {
      _limparFormulario();
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                course == null ? 'Cadastrar Curso' : 'Editar Curso',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome do Curso'),
                validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
              ),
              TextFormField(
                controller: _durationController,
                decoration: const InputDecoration(
                  labelText: 'Duração (Semestres)',
                ),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
              ),
              TextFormField(
                controller: _coordinatorController,
                decoration: const InputDecoration(labelText: 'Coordenador'),
                validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Descrição'),
                maxLines: 2,
                validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final novoCurso = Course(
                      courseId: course?.courseId,
                      name: _nameController.text,
                      duration: int.parse(_durationController.text),
                      coordinator: _coordinatorController.text,
                      description: _descriptionController.text,
                    );

                    if (course == null) {
                      await _controller.adicionarCurso(novoCurso);
                      _exibirSnackBar('Curso cadastrado com sucesso!');
                    } else {
                      await _controller.atualizarCurso(novoCurso);
                      _exibirSnackBar('Curso atualizado com sucesso!');
                    }
                    Navigator.pop(context);
                    setState(() {});
                  }
                },
                child: Text(course == null ? 'Salvar' : 'Atualizar'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmarRemocao(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar Remoção'),
        content: const Text('Deseja realmente excluir este curso?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              await _controller.removerCurso(id);
              Navigator.pop(context);
              setState(() {});
              _exibirSnackBar('Curso removido!');
            },
            child: const Text('Excluir', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _exibirSnackBar(String mensagem) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensagem)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestão de Cursos - Sistema Acadêmico')),
      body: _controller.courses.isEmpty
          ? const Center(child: Text('Nenhum curso cadastrado.'))
          : ListView.builder(
              itemCount: _controller.courses.length,
              itemBuilder: (context, index) {
                final curso = _controller.courses[index];
                return ListTile(
                  title: Text(curso.name),
                  subtitle: Text(
                    'Coord: ${curso.coordinator} | ${curso.duration} semestres',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _mostrarFormulario(course: curso),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _confirmarRemocao(curso.courseId!),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mostrarFormulario(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

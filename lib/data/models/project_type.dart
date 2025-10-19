class ProjectType {
  final String id;
  final String name;

  const ProjectType({required this.id, required this.name});
}

const prototype = ProjectType(id: 'PROTOTYPE', name: 'Prototype');
const nonPrototype = ProjectType(id: 'NON_PROTOTYPE', name: 'Non-Prototype');

const projectTypeList = [prototype, nonPrototype];

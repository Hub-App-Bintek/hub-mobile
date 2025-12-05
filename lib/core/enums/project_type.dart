class ProjectType {
  final String id;
  final String name;

  const ProjectType({required this.id, required this.name});
}

const consultation = ProjectType(id: 'CONSULTATION', name: "Konsultasi");
const licensing = ProjectType(id: 'LICENSING', name: 'Perizinan');
const construction = ProjectType(id: 'CONSTRUCTION', name: 'Konstruksi');
const monitoring = ProjectType(id: 'MONITORING', name: 'Pengawasan');

const projectTypes = [consultation, licensing, construction, monitoring];

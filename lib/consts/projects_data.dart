class ProjectItem {
  final String title;
  final String description;
  final List<String> tags;
  final String? url;
  final String? actionLabel;
  final String? statusBadge;

  const ProjectItem({
    required this.title,
    required this.description,
    required this.tags,
    this.url,
    this.actionLabel,
    this.statusBadge,
  });
}

final List<ProjectItem> kProjects = [
  const ProjectItem(
    title: "Homeplants",
    description:
        "An indoor plant care and tracking mobile application to keep houseplants thriving.",
    tags: ["Mobile App", "Plant Care"],
    statusBadge: "Google Play · Internal Testers",
  ),
  const ProjectItem(
    title: "Homeplants — iOS (Native)",
    description:
        "A native SwiftUI rebuild of Homeplants, built to compare cross-platform vs. native architecture against the Flutter version.",
    tags: ["SwiftUI", "iOS", "Golang", "API"],
    statusBadge: "Native Counterpart",
  ),
  const ProjectItem(
    title: "Plants API",
    description:
        "A plant management and care backend service built purely with Golang and PostgreSQL.",
    tags: ["Golang", "PostgreSQL", "REST API"],
    statusBadge: "Backend Service",
  ),
  const ProjectItem(
    title: "FlutterconKE App",
    description:
        "Open source contributor to the official Flutter Kenya conference app.",
    tags: ["Flutter", "Open Source", "Contributor"],
    url: "https://github.com/droidconKE/flutterconKEApp",
    actionLabel: "View on GitHub",
  ),
  const ProjectItem(
    title: "This Portfolio",
    description:
        "An open-source, minimalist one-pager portfolio built with Flutter Web and hosted on GitHub Pages.",
    tags: ["Flutter Web", "Dart", "Open Source"],
    url: "https://github.com/KendiJ/kendi-j/tree/main/lib",
    actionLabel: "View on GitHub",
  ),
  const ProjectItem(
    title: "ML Playground",
    description:
        "Hands-on machine learning experiments, practical data science models, and notebook explorations.",
    tags: ["Python", "Machine Learning", "Jupyter"],
    url: "https://github.com/KendiJ/ml_playground",
    actionLabel: "View on GitHub",
    statusBadge: "In Progress",
  ),
];

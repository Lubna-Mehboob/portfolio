class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;

  final String webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    required this.webLink,
  });
}

List<ProjectUtils> myProjects = [
  ProjectUtils(
      image: 'lib/assets/images/pinpng.PNG',
      title: 'A simple Todo App',
      subtitle:
          'This ToDo app is built using the MVC architecture, featuring a splash screen, login, and signup pages. It allows users to add, edit, and delete tasks with an intuitive interface.',
      webLink: 'https://github.com/Lubna-Mehboob/todoApp.git'),
  ProjectUtils(
      image: 'lib/assets/images/pinpng.PNG',
      title: 'A simple Todo App',
      subtitle:
          'This ToDo app is built using the MVC architecture, featuring a splash screen, login, and signup pages. It allows users to add, edit, and delete tasks with an intuitive interface.',
      webLink: 'https://github.com/Lubna-Mehboob/todoApp'),
];
List<ProjectUtils> hobbyProjects = [
  ProjectUtils(
      image: 'lib/assets/images/pinpng.PNG',
      title: 'CountDown Timer App',
      subtitle:
          'This ToDo app is built using the MVC architecture, featuring a splash screen, login, and signup pages. It allows users to add, edit, and delete tasks with an intuitive interface.',
      webLink: 'https://github.com/Lubna-Mehboob/counter.git'),
  ProjectUtils(
      image: 'lib/assets/images/pinpng.PNG',
      title: 'WhatsApp Clone',
      subtitle:
          'This project showcases a well-organized MVC (Model-View-Controller) architecture designed for a WhatsApp-like application. ',
      webLink: 'https://github.com/Lubna-Mehboob/WhatsApp-Architecture.git'),
];

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Приём у врача',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFffffff),
      ),
      home: const DocumentScreen(),
    );
  }
}

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffffff),
        title: const Text(
          'Новый документ',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFE0E0E0),
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/photo.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  _buildInfoItem(
                    title: 'Ирина',
                    icon: Icons.person_outline_sharp,
                  ),
                  _buildInfoItem(
                    title: '22 мая (вт), 16:00',
                    description: 'Дата получения документа',
                    icon: Icons.calendar_today_outlined,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoItem(
                    title: 'Клиника «Фомина»',
                    description: 'Бульвар Перервинский, д. 4',
                    icon: Icons.local_hospital_outlined,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoItem(
                    title: 'Стоматолог',
                    icon: Icons.vaccines,
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xFFfff2d9),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: const Text(
                            'Клиника прислала документ после приёма. Чтобы добавить его в медкарту и посмотреть содержание, нужно будет указать дату рождения пациента. Это проверка для безопасности данных.',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Positioned(
                          right: -10,
                          bottom: -10,
                          child: Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFFf9d1ad),
                                width: 4,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'i',
                                style: TextStyle(
                                  color: Color(0xFFf9d1ad),
                                  fontSize: 35,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          // Кнопки, прикрепленные к низу
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1a5dd0),
                      foregroundColor: const Color(0xFFffffff),
                      minimumSize: const Size.fromHeight(45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Добавить в медкарту',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFf6f9ff),
                      foregroundColor: const Color(0xFF1a5dd0),
                      minimumSize: const Size.fromHeight(45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Удалить',
                      style: TextStyle(fontSize: 17),
                    ),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildInfoItem({
    required String title,
    String? description,
    required IconData icon,
  }) {
    final hasDescription = description != null;
    return Padding(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
            color: Colors.grey[600],
          ),
          const SizedBox(width: 25),
          Expanded(
            child: SizedBox(
              height: hasDescription ? 48 : 48,
              child: Column(
                mainAxisAlignment: hasDescription
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (hasDescription)
                    Text(
                      description!,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[600],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
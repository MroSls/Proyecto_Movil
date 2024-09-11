import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> labels = ['pc gamer', 'pc escolar', 'pc oficina', 'armar pc'];
    final List<List<String>> images = [
      ['assets/images/gamer1.png', 'assets/images/gamer2.png'], // pc gamer
      [], // pc escolar (sin imágenes)
      ['assets/images/oficina1.png', 'assets/images/oficina2.png'], // pc oficina
      ['assets/images/pcbuild.png', 'assets/images/pcbuild2.png'], // armar pc
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 6, 78),
        title: const Text(
          'Doctor pc´s',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 255, 213),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          itemCount: labels.length,
          separatorBuilder: (context, index) => const SizedBox(height: 5),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (labels[index] == 'armar pc') {
                  Navigator.pushNamed(context, '/buildyourpc');
                } else {
                  Navigator.pushNamed(context, '/builds');
                }
              },
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: images[index].isNotEmpty
                          ? PageView.builder(
                              itemCount: images[index].length,
                              itemBuilder: (context, imgIndex) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    images[index][imgIndex],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                );
                              },
                            )
                          : const Center(
                              child: Text(
                                'No images available',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      labels[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

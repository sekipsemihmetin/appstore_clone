import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Store Listeleme',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const AppStoreListingScreen(),
    );
  }
}

class AppStoreListingScreen extends StatelessWidget {
  const AppStoreListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Uygulamalar',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 22,
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Arama çubuğu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Uygulamaları ara',
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ),

            // Öne Çıkan Uygulama (gibi görsel)
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
              child: Text(
                'ÖNE ÇIKAN',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),

            // Öne Çıkan Uygulama Detayı - ChatGPT
            _buildFeaturedApp(),

            // Olmazsa Olmazlar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Olmazsa olmazlar ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '✨',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Tümünü Gör',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // Olmazsa Olmazlar App Listesi
            _buildMustHaveAppList([
              AppItem(
                  name: 'Google Fotoğraflar',
                  category: 'Fotoğraf ve video depolama',
                  iconPath: 'assets/images/icons8-google-photos-48.png',

              ),
              AppItem(
                  name: 'Canva: foto, video düzenle',
                  category: 'Kolaj AI fotoğraf birleştirme',
                  iconPath: 'assets/images/icons8-canva-48.png',

              ),
            ]),

            _buildSectionHeader('Popüler Uygulamalar'),
            _buildGridList([
              AppItem(name: 'Instagram', category: 'Sosyal Medya', iconPath: 'assets/images/icons8-instagram-logo-94.png'),
              AppItem(name: 'Spotify', category: 'Eğlence', iconPath: 'assets/images/icons8-spotify-50.png'),
              AppItem(name: 'Netflix', category: 'Müzik', iconPath: 'assets/images/icons8-netflix-48.png'),
              AppItem(name: 'WhatsApp', category: 'Mesajlaşma', iconPath: 'assets/images/icons8-whatsapp-logo-94.png'),
              AppItem(name: 'YouTube', category: 'Video', iconPath: 'assets/images/icons8-youtube-48.png'),
              AppItem(name: 'TikTok', category: 'Video', iconPath: 'assets/images/icons8-tiktok-64.png'),
            ]),

            // Öne Çıkan Uygulamalar
            _buildSectionHeader('Öne Çıkan Uygulamalar'),
            _buildFeaturedAppList([
              FeaturedAppItem(
                name: 'ChatGPT',
                developer: 'OpenAI',
                iconPath: 'assets/images/icons8-chatgpt-30.png',
                description: 'Yapay zeka ile sohbet edin',
                bannerColor: Colors.purple.shade800,
              ),
              FeaturedAppItem(
                name: 'Getir',
                developer: 'Getir',
                iconPath: 'assets/images/getir_icon.webp',
                description: 'Dakikalar içinde kapınızda',
                bannerColor: Colors.indigo.shade800,
              ),
              FeaturedAppItem(
                name: 'Disney+',
                developer: 'Disney',
                iconPath: 'assets/images/icons8-disney-50.png',
                description: 'Film ve diziler',
                bannerColor: Colors.blue.shade900,
              ),
            ]),

            // Yeni Uygulamalar
            _buildSectionHeader('Yeni Uygulamalar'),
            _buildAppList([
              AppItem(name: 'Canva', category: 'Fotoğraf & Video', iconPath: 'assets/images/icons8-canva-48.png'),
              AppItem(name: 'Google One', category: 'Üretkenlik', iconPath: 'assets/images/icons8-google-one-48.png'),
              AppItem(name: 'Notion', category: 'Üretkenlik', iconPath: 'assets/images/icons8-notion-50.png'),
              AppItem(name: 'Telegram', category: 'Mesajlaşma', iconPath: 'assets/images/icons8-telegram-48.png'),
            ]),

            const SizedBox(height: 24),

            // Ücretsiz Uygulamalar
            _buildSectionHeader('Ücretsiz Uygulamalar'),
            _buildAppList([
              AppItem(name: 'Google Fotoğraflar', category: 'Fotoğraf & Video', iconPath: 'assets/images/icons8-google-photos-48.png'),
              AppItem(name: 'Gmail', category: 'Üretkenlik', iconPath: 'assets/images/icons8-gmail-48.png'),
              AppItem(name: 'Google Haritalar', category: 'Navigasyon', iconPath: 'assets/images/icons8-google-maps-48.png'),
              AppItem(name: 'Google Drive', category: 'Üretkenlik', iconPath: 'assets/images/icons8-google-drive-48.png'),
            ]),

            const SizedBox(height: 60),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.today),
            label: 'Bugün',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.rocket),
            label: 'Oyunlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_stack_3d_up_fill),
            label: 'Uygulamalar',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.game_controller_solid),
            label: 'Arcade',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Ara',
          ),
        ],
      ),
    );
  }

  // Öne Çıkan Uygulama (ChatGPT)
  Widget _buildFeaturedApp() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF1E1A43), // Koyu mor renk
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 56,
                    height: 56,
                    color: Colors.white,
                    child: Center(
                      child: Image.asset(
                        'assets/images/icons8-chatgpt-30.png',
                        width: 42,
                        height: 42,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'ChatGPT',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Üretkenlik',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'İNDİR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Alt kısımdaki tanıtım metni ve görsel
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ChatGPT ile tanış',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Keşfet, yarat, fikir bul',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // ChatGPT pembe nokta deseni görseli
                    color: const Color(0xFF1E1A43),
                  ),
                  child: Center(
                    // Pembe noktalı desen burada oluşturulabilir
                    child: Image.asset(
                      'assets/images/WhatsApp Image 2025-05-18 at 18.15.59.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text(
                      'Uygulama İçi Satın Alımlar',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Bölüm başlığı
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Tümünü Gör',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  // Olmazsa olmazlar uygulaması listesi
  Widget _buildMustHaveAppList(List<AppItem> apps) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: apps.length,
      itemBuilder: (context, index) {
        final app = apps[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    app.iconPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      app.name,
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Text(
                      app.category,
                      style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.cloud_download,
                  color: Colors.blue,
                  size: 28,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Izgara uygulama listesi
  Widget _buildGridList(List<AppItem> apps) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.75,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: apps.length,
      itemBuilder: (context, index) {
        final app = apps[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade800,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  app.iconPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              app.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              app.category,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [


              ],
            ),
          ],
        );
      },
    );
  }

  // Normal uygulama listesi
  Widget _buildAppList(List<AppItem> apps) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: apps.length,
      itemBuilder: (context, index) {
        final app = apps[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade800,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    app.iconPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      app.name,
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Text(
                      app.category,
                      style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                    ),
                    Row(
                      children: [


                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'İNDİR',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Öne çıkan uygulama listesi
  Widget _buildFeaturedAppList(List<FeaturedAppItem> apps) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: apps.length,
        itemBuilder: (context, index) {
          final app = apps[index];
          return Container(
            width: 280,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: app.bannerColor,
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          app.iconPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(app.name, style: const TextStyle(fontWeight: FontWeight.w500)),
                        Text(app.developer, style: TextStyle(color: Colors.grey.shade300, fontSize: 12)),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'İNDİR',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  app.description,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Ücretsiz uygulama',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Modeller
class AppItem {
  final String name;
  final String category;
  final String iconPath;


  AppItem({
    required this.name,
    required this.category,
    required this.iconPath,

  });
}

class FeaturedAppItem {
  final String name;
  final String developer;
  final String iconPath;
  final String description;
  final Color bannerColor;

  FeaturedAppItem({
    required this.name,
    required this.developer,
    required this.iconPath,
    required this.description,
    required this.bannerColor,
  });
}
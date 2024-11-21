import 'package:cano/view/screen/cafe_info/cafe_info_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'add_cafe_bottomsheet.dart';

class CafeInfoScreen extends ConsumerWidget {
  const CafeInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('카페051 부경대점'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () => showAddCafeBottomSheet(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width, // 부모 너비에 맞춤
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Image.asset(
                    'assets/images/051_background1.png',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/051_background2.png',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/051_background3.png',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/051_background4.png',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/051_background5.png',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '카페051 부경대점',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '- 부산광역시 남구 대연동 77',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '영업 종료: 10:00~21:00',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      SizedBox(width: 5),
                      Text('4.8 (100+)'),
                      SizedBox(width: 10),
                      Icon(Icons.favorite, color: Colors.red),
                      SizedBox(width: 5),
                      Text('21,020'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '# 좋은 원두 # 아메리카노 맛집',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Divider(height: 32),
                  DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        const TabBar(
                          labelColor: Colors.brown,
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Tab(text: '메뉴'),
                            Tab(text: '위치'),
                            Tab(text: '정보'),
                          ],
                        ),
                        SizedBox(
                          height: 300,
                          child: TabBarView(
                            children: [
                              _buildMenuTab(),
                              const Center(
                                  child: CafeLocationScreen()), // 위치 탭 내용 추가 필요
                              const Center(child: Text('정보')), // 정보 탭 내용 추가 필요
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuTab() {
    final menuItems = [
      {
        'name': '아메리카노 (215ml)',
        'rating': '4.8 (100+)',
        'price': '2,000원',
        'description': 'ICE / HOT\n콜롬비아 싱글오리진의 깊은 균형리티 커피',
        'isBestSeller': true,
        'image': 'assets/images/051_americano.jpg',
      },
      {
        'name': '복숭아 아이스티 (290ml)',
        'rating': '5.0 (100+)',
        'price': '3,300원',
        'description': 'Only Ice\n시원한 복숭아 아이스티',
        'isBestSeller': true,
        'image': 'assets/images/051_icetea.jpg',
      },
      {
        'name': '설향 우유 (290ml)',
        'rating': '5.0 (100+)',
        'price': '5,600원',
        'description': 'Only Ice\n카페 051 시그니쳐 메뉴',
        'isBestSeller': true,
        'image': 'assets/images/051_snowmilk.jpg',
      },
      {
        'name': '바닐라 라떼(225ml)',
        'rating': '5.0 (100+)',
        'price': '3,300원',
        'description': 'ICE / HOT\n수제 바닐라 시럽이 들어간 라떼',
        'isBestSeller': false,
        'image': 'assets/images/051_vanilalatte.jpg',
      },
    ];

    return ListView.builder(
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return _buildMenuItem(
          name: item['name'] as String,
          rating: item['rating'] as String,
          price: item['price'] as String,
          description: item['description'] as String,
          isBestSeller: item['isBestSeller'] as bool,
          image: item['image'] as String,
        );
      },
    );
  }

  Widget _buildMenuItem({
    required String name,
    required String rating,
    required String price,
    required String description,
    required String image,
    bool isBestSeller = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    image,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            if (isBestSeller)
                              Container(
                                margin: const EdgeInsets.only(left: 8.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                color: Colors.brown,
                                child: const Text(
                                  '대표',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text('별점: $rating'),
                        const SizedBox(height: 4),
                        Text('가격: $price'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}

void showAddCafeBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    builder: (context) => const AddCafeBottomSheet(),
  );
}

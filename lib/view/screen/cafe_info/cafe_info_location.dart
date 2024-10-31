import 'package:cano/desginsystem/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// CafeLocationScreen 위젯
class CafeLocationScreen extends ConsumerWidget {
  const CafeLocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // cafeLocationProvider로 위치 정보 관리
    const cafeLocation = LatLng(35.136122, 129.103453);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 위치 텍스트와 지도
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '부산 남구 용소로21번길 45 1층 카페051 부경대점',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '대한통 50-86',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            // 구글 지도
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border:
                    Border.all(color: AppColors.primary, width: 2), // 테두리 추가
                borderRadius: BorderRadius.circular(2),
              ),
              child: SizedBox(
                height: 200,
                child: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: cafeLocation,
                    zoom: 15,
                  ),
                  markers: {
                    const Marker(
                      markerId: MarkerId('cafe051'),
                      position: cafeLocation,
                      infoWindow: InfoWindow(title: '카페051 부경대점'),
                    ),
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

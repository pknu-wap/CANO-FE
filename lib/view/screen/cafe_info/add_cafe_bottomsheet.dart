import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

// 초기 카페 위치를 설정하는 Provider
final cafeLocationProvider = StateProvider<LatLng>((ref) {
  return const LatLng(35.1796, 129.0756); // 부산 위치 예시
});

// 구글맵 컨트롤러 Provider
final googleMapControllerProvider = StateProvider<GoogleMapController?>((ref) => null);

class AddCafeBottomSheet extends ConsumerWidget {
  const AddCafeBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cafeLocation = ref.watch(cafeLocationProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 1.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 검색창
                TextField(
                  decoration: InputDecoration(
                    hintText: '주소를 입력하세요',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onSubmitted: (address) {
                    _searchAddressAndUpdateMap(address, ref);
                  },
                ),
                const SizedBox(height: 16),

                // 지도
                SizedBox(
                  height: 250,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: cafeLocation,
                      zoom: 15,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      ref.read(googleMapControllerProvider.notifier).state = controller;
                    },
                    markers: {
                      Marker(
                        markerId: MarkerId('cafeLocation'),
                        position: cafeLocation,
                        infoWindow: InfoWindow(title: '카페 위치'),
                      ),
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // 작성완료 버튼
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('작성완료'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _searchAddressAndUpdateMap(String address, WidgetRef ref) async {
    try {
      // 주소를 위도와 경도로 변환
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        final location = locations.first;
        final newLatLng = LatLng(location.latitude, location.longitude);

        // 지도 위치를 업데이트
        ref.read(cafeLocationProvider.notifier).state = newLatLng;

        // 구글맵 카메라 이동
        final controller = ref.read(googleMapControllerProvider);
        if (controller != null) {
          controller.animateCamera(CameraUpdate.newLatLng(newLatLng));
        }
      }
    } catch (e) {
      print('주소 검색 중 오류 발생: $e');
      ScaffoldMessenger.of(ref.context).showSnackBar(
        const SnackBar(content: Text("주소를 찾을 수 없습니다.")),
      );
    }
  }
}



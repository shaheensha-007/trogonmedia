import 'package:flutter/material.dart';
import '../../Model/Home_Model/HomeModel.dart';

class HeroBannerSlider extends StatelessWidget {
  final List<HeroBanners> banners;
  const HeroBannerSlider({required this.banners});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: banners.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(banners[index].image!),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(colors: [Colors.black54, Colors.transparent]),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(banners[index].title!,
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          );
        },
      ),
    );
  }
}
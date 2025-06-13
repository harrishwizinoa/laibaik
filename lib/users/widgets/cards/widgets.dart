
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/themes.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const SectionHeader({super.key, required this.title, this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "poppins-semibold",
            ),
          ),
          if (onSeeAll != null)
            ShaderMask(
              shaderCallback: (bounds) => AppColors.primaryGradient.createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              ),
              child: GestureDetector(
                onTap: onSeeAll,
                child: const Text(
                  'See All',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: "poppins-bold",
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Reusable Card Widget
class CardWidget extends StatefulWidget {
  final Map<String, dynamic> data;
  final String cardType; // 'food', 'mind', or 'all'
  final double? width;
  final double? height;

  const CardWidget({
    super.key,
    required this.data,
    required this.cardType,
    this.width,
    this.height,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool _isLiked = false;

  String _getStarIcon(double rating) {
    if (rating >= 0.0 && rating <= 1.9) return 'assets/icons/0star.svg';
    if (rating >= 2.0 && rating <= 2.4) return 'assets/icons/1star.svg';
    if (rating >= 2.5 && rating <= 2.9) return 'assets/icons/2star.svg';
    if (rating >= 3.0 && rating <= 3.4) return 'assets/icons/3star.svg';
    if (rating >= 3.5 && rating <= 3.9) return 'assets/icons/4star.svg';
    if (rating >= 4.0 && rating <= 5.0) return 'assets/icons/5star.svg';
    return 'assets/icons/0star.svg';
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.isEmpty) {
      return const SizedBox.shrink();
    }

    final double rating = double.tryParse(widget.data['rating']?.toString() ?? '0.0') ?? 0.0;
    final String starIcon = _getStarIcon(rating);

    if (widget.cardType == 'mind') {
      return Container(
        width: widget.width ?? 100,
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 70,
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.data['image'] ?? ''),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.data['name'] ?? 'Unknown',
              style: const TextStyle(
                fontFamily: "poppins-semibold",
                color: Color(0xff424242),
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    if (widget.cardType == 'food') {
      return Container(
        height: widget.height ?? 200,
        width: widget.width ?? 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(widget.data['image'] ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () => setState(() => _isLiked = !_isLiked),
                    child: SvgPicture.asset(
                      _isLiked ? 'assets/icons/like.svg' : 'assets/icons/nonlike1.svg',
                      height: 22,
                      width: 22,
                    ),
                  ),
                ),
                Positioned(
                  left: 14,
                  bottom: 10,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${widget.data['discount'] ?? 'No discount'}\n",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: "poppins-bold",
                          ),
                        ),
                        TextSpan(
                          text: widget.data['maxDiscount'] ?? 'N/A',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 9,
                            color: Color(0xFFDEDEDE),
                            fontFamily: "poppins-medium",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 8),
              child: Text(
                widget.data['name'] ?? 'Unknown',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  fontFamily: "poppins-bold",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Row(
                children: [
                  SvgPicture.asset(starIcon, height: 12, width: 12),
                  const SizedBox(width: 2),
                  Text(
                    widget.data['rating']?.toString() ?? '0.0',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontFamily: "poppins-bold",
                    ),
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset('assets/icons/clock.svg', height: 12, width: 12),
                  const SizedBox(width: 2),
                  Text(
                    widget.data['time'] ?? 'N/A',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontFamily: "poppins-bold",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                widget.data['cuisine'] ?? 'Unknown',
                style: const TextStyle(
                  color: Color(0xff6E6F71),
                  fontWeight: FontWeight.w200,
                  fontSize: 12,
                  fontFamily: "poppins",
                ),
              ),
            ),
          ],
        ),
      );
    }

    // All Card
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: widget.height ?? 130,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 130,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                        image: NetworkImage(widget.data['image'] ?? ''),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 16,
                    child: GestureDetector(
                      onTap: () => setState(() => _isLiked = !_isLiked),
                      child: SvgPicture.asset(
                        _isLiked ? 'assets/icons/like.svg' : 'assets/icons/nonlike1.svg',
                        height: 28,
                        width: 18,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 14,
                    bottom: 10,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${widget.data['discount'] ?? 'No discount'}\n",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: "poppins-bold",
                            ),
                          ),
                          TextSpan(
                            text: widget.data['maxDiscount'] ?? 'N/A',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Color(0xFFDEDEDE),
                              fontFamily: "poppins-medium",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data['name'] ?? 'Unknown',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: "poppins-bold",
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(starIcon, height: 14, width: 14),
                        const SizedBox(width: 2),
                        Text(
                          widget.data['rating']?.toString() ?? '0.0',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "poppins-bold",
                          ),
                        ),
                        const SizedBox(width: 4),
                        SvgPicture.asset('assets/icons/clock.svg', height: 16, width: 16),
                        const SizedBox(width: 2),
                        Text(
                          widget.data['time'] ?? 'N/A',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "poppins-bold",
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        widget.data['cuisine'] ?? 'Unknown',
                        style: const TextStyle(
                          color: Color(0xff6E6F71),
                          fontWeight: FontWeight.w200,
                          fontSize: 10,
                          fontFamily: "poppins",
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 2,),
                    if (widget.data['extraDiscount'] == true)
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/discount.svg', height: 14, width: 14),
                          const SizedBox(width: 2),
                          const Text(
                            "Extra discount",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, fontFamily: "poppins"),
                          ),
                        ],
                      ),

                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/delivary.svg', height: 16, width: 16),
                        const SizedBox(width: 2),
                        Text(
                          widget.data['freeDelivery'] == true
                              ? "Free delivery"
                              : "Delivery: ${widget.data['deliveryPrice'] ?? 'N/A'}",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10, fontFamily: "poppins"),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/themes.dart';
import '../../../widgets/cards/widgets.dart';

class Viewhotel extends StatefulWidget {
  const Viewhotel({super.key});

  @override
  State<Viewhotel> createState() => _ViewhotelState();
}

class _ViewhotelState extends State<Viewhotel> {
  final ScrollController _scrollController = ScrollController();
  bool _showSafeArea = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 25 && _showSafeArea) {
        setState(() {
          _showSafeArea = false;
        });
      }
      else if (_scrollController.offset <= 25 && !_showSafeArea) {
        setState(() {
          _showSafeArea = true;
        });
      }
      print(_scrollController.offset);
      print(_showSafeArea);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> TopViewData = [
      "assets/images/china.png",
      "assets/images/china.png",
      "assets/images/china.png",
      "assets/images/china.png",
    ];

    Widget content = Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 16,
                  right: 16,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Row(
                            children: [
                              Spacer(),
                              const Icon(
                                Icons.person_add_alt_1,
                                color: Colors.white,
                                size: 14,
                              ),
                              Spacer(),
                              Text(
                                "Group Order",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: "poppins",
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.more_vert, color: Colors.white),
                    ],
                  ),
                ),
                Positioned(
                  top: 110,
                  left: 16,
                  right: 16,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 12.0,
                                top: 12,
                              ),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/china.png",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "hotel name",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "poppins-bold",
                                        ),
                                      ),
                                      SizedBox(width: 100),
                                      SvgPicture.asset(
                                        "assets/icons/like.svg",
                                        width: 20,
                                        height: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Image.asset("assets/icons/info.png"),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "chinese,arabian",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "poppins",
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/5star.svg",
                                        width: 20,
                                        height: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "4.5",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "poppins-bold",
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "See 12 Reviews",
                                        style: TextStyle(
                                          fontFamily: "poppins",
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Spacer(),
                            SvgPicture.asset("assets/icons/clock.svg"),
                            SizedBox(width: 2),
                            Text(
                              "20-30 mins",
                              style: TextStyle(fontFamily: "poppins-bold"),
                            ),
                            Spacer(),
                            Container(
                              width: 2,
                              height: 30,
                              color: Color(0XFFF1F0F5),
                            ),
                            Spacer(),
                            SvgPicture.asset("assets/icons/delivary.svg"),
                            SizedBox(width: 2),
                            Text(
                              "OMR 0.3584",
                              style: TextStyle(fontFamily: "poppins-bold"),
                            ),
                            Spacer(),
                            Container(
                              width: 2,
                              height: 30,
                              color: Color(0XFFF1F0F5),
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Text(
                                  "Delivered By",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "poppins-medium",
                                  ),
                                ),
                                Row(
                                  children: [
                                    ShaderMask(
                                      shaderCallback:
                                          (bounds) => AppColors.primaryGradient
                                              .createShader(
                                                Rect.fromLTWH(
                                                  0,
                                                  0,
                                                  bounds.width,
                                                  bounds.height,
                                                ),
                                              ),
                                      child: const Text(
                                        'Labbaik',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "poppins-bold",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 2),
                                    Image.asset(
                                      "assets/icons/info.png",
                                      width: 15,
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                // 270 degrees = right to left
                                colors: [
                                  Color(0xFFFEE4E5),
                                  Color.fromRGBO(254, 228, 229, 0.5),
                                ],
                              ),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: ShaderMask(
                                shaderCallback:
                                    (bounds) => AppColors.primaryGradient
                                        .createShader(bounds),
                                blendMode: BlendMode.srcIn,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Genie ",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "poppins-bold",
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "Extra 10% off above \$400 + Free Delivary",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "poppins-medium",
                                        ),
                                      ),
                                    ],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              gradient: const LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                // 270 degrees = right to left
                                colors: [
                                  Color(0xFFFEE4E5),
                                  Color.fromRGBO(254, 228, 229, 0.5),
                                ],
                              ),
                            ),
                            child: Center(
                              child: SvgPicture.asset("assets/icons/bell.svg"),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              gradient: const LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                // 270 degrees = right to left
                                colors: [
                                  Color(0xFFFEE4E5),
                                  Color.fromRGBO(254, 228, 229, 0.5),
                                ],
                              ),
                            ),
                            child: Center(
                              child: ShaderMask(
                                shaderCallback:
                                    (bounds) => AppColors.primaryGradient
                                        .createShader(bounds),
                                blendMode: BlendMode.srcIn,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Active ",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "poppins-bold",
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Genie Subscription",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "poppins-medium",
                                        ),
                                      ),
                                    ],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    SvgPicture.asset(
                      "assets/icons/discount.svg",
                      height: 40,
                      width: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Items at OMR 0.380\n",
                            style: TextStyle(
                              fontFamily: "poppins-bold",
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: "on selected items",
                            style: TextStyle(
                              fontFamily: "poppins-medium",
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [Text("1/3")]),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "search for dishes",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic, color: Colors.red),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            SectionHeader(title: 'Top Views', onSeeAll: () {}),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Stack(
                children: [
                  Container(
                    height: 240,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/images/china.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.9),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: SvgPicture.asset(
                      "assets/icons/nonlike.svg",
                      height: 40,
                    ),
                  ),
                  Positioned(
                    left: 14,
                    bottom: 10,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "No discount\n",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: "poppins-bold",
                            ),
                          ),
                          TextSpan(
                            text: 'N/A',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                              color: Color(0xFFDEDEDE),
                              fontFamily: "poppins-medium",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: AppColors.primaryGradient,
                      ),
                      child: Center(
                        child: Text(
                          "ADD",
                          style: TextStyle(
                            fontFamily: "poppins-bold",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return _showSafeArea ? content : SafeArea(child: content);
  }
}

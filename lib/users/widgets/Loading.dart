import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerLoadingScreen extends StatefulWidget {
  const ShimmerLoadingScreen({super.key});

  @override
  _ShimmerLoadingScreenState createState() => _ShimmerLoadingScreenState();
}

class _ShimmerLoadingScreenState extends State<ShimmerLoadingScreen> {
  bool isLoading = true;
  List<String> data = [];

  @override
  void initState() {
    super.initState();
    // Simulate data fetching
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
        data = List.generate(10, (index) => 'Item ${index + 1}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer Effect'),
      ),
      body: isLoading ? const ShimmerList() : ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(data[index]),
        ),
      ),
    );
  }
}

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Number of placeholder items
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48.0,
                height: 48.0,
                color: Colors.white, // Placeholder for an image/avatar
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 8.0,
                      color: Colors.white, // Placeholder for title
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      width: 100.0,
                      height: 8.0,
                      color: Colors.white, // Placeholder for subtitle
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class SearchNewsBuild extends StatelessWidget {
  const SearchNewsBuild({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 36,
          width: 275,
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(210, 211, 210, 210),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: "Search for News",
              fillColor: Color.fromARGB(0, 10, 159, 228),
              filled: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              hintStyle: TextStyle(
                color: Color.fromARGB(210, 158, 158, 158),
              ),
              suffixIcon: Icon(Icons.search),
              suffixIconColor: Color.fromARGB(210, 158, 158, 158),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color.fromARGB(255, 240, 75, 94),
          ),
          child: const Icon(
            Icons.notifications_none,
            color: Colors.white,
            size: 22,
          ),
        ),
      ],
    );
  }
}

import 'package:e_taxi/screens/dashboard/transport/available_rides.dart';
import 'package:e_taxi/theme/app_styles.dart';
import 'package:flutter/material.dart';

class SelectTransportScreen extends StatefulWidget {
  const SelectTransportScreen({super.key});

  @override
  State<SelectTransportScreen> createState() => _SelectTransportScreenState();
}

class _SelectTransportScreenState extends State<SelectTransportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      children: [
                        const Icon(Icons.chevron_left),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Back",
                          style: AppStyles.bodyText.copyWith(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Select Transport",
                        style: AppStyles.smallHeader.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Select your transport",
                style: AppStyles.smallHeader.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Wrap(
                spacing: 15,
                runSpacing: 15,
                alignment: WrapAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AvailableRidesScreen(),),);
                    },
                      child: Image.asset("assets/images/car.png", width: 120),),
                  Image.asset("assets/images/bike.png", width: 120),
                  Image.asset("assets/images/bicycle.png", width: 120,),
                  Image.asset("assets/images/taxi.png", width: 120,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

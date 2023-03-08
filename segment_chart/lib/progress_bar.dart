///Dart imports
///Package imports
import 'package:flutter/material.dart';

///gauge import
import 'package:syncfusion_flutter_gauges/gauges.dart';


class ProgressBarSegment extends StatefulWidget {
  const ProgressBarSegment({super.key});

  @override
  State<ProgressBarSegment> createState() => _ProgressBarSegmentState();
}

class _ProgressBarSegmentState extends State<ProgressBarSegment> {
  //  double progressValue = 70;
  double _size = 200;
  double jsonValue = 5000;
  double spent = 2000;
  num acutalSpent = (2000/5000) * 100;
  num progressValue = 100;
  // num cal = 0;
  // late Timer _timer;

  @override
  void initState() {
    super.initState();
    // if (mounted) {
    //   _timer = Timer.periodic(const Duration(milliseconds: 30), (Timer timer) {
        // setState(() {
        //   if (progressValue == 100) {
        //     progressValue = 0;
        //   } else {
        //     progressValue++;
        //   }
        // });
      // });
    // }
  }

  @override
  void dispose() {
    // _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  //  cal = progressValue - acutalSpent;
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _getSegmentedProgressBar1(),
            ],
          ),
        ),
      );
  }

  Widget _getSegmentedProgressBar1() {
    return SizedBox(
        height: _size,
        width: _size,
        child: SfRadialGauge(axes: <RadialAxis>[
          // Create primary radial axis
          RadialAxis(
            interval: 12.5,
            isInversed: true,
            showLabels: false,
            showTicks: false,
            startAngle: 270,
            endAngle: 270,
            radiusFactor: 0.85,
            
            axisLineStyle: const AxisLineStyle(
              thickness: .2,
              color: Color.fromARGB(30, 0, 169, 181),
              // color: Colors.tealAccent.withOpacity(.35),
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            // pointers: <GaugePointer>[
               ranges: <GaugeRange>[GaugeRange(
                
                color: Colors.teal,
                startValue: 0, endValue: acutalSpent.toDouble(),
                    startWidth: 17, endWidth: 17
              // RangePointer(
              //     // value: acutalSpent.toDouble(),
              //     value: progressValue.toDouble() - acutalSpent,
              //     width: 0.05,
              //     pointerOffset: 0.07,
              //     sizeUnit: GaugeSizeUnit.factor,
              //     enableAnimation: true,
              //     // animationDuration: 30,
              //     animationType: AnimationType.linear)
          )],
          ),
          // Create secondary radial axis for segmented line
          RadialAxis(
            interval: 12.5,
            showLabels: false,
            showAxisLine: false,
            isInversed: true,
            tickOffset: -0.05,
            offsetUnit: GaugeSizeUnit.factor,
            minorTicksPerInterval: 0,
            startAngle: 270,
            endAngle: 270,
            radiusFactor: 0.85,
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  angle: 90,
                  positionFactor: 0.1,
                  widget: Text(acutalSpent.toStringAsFixed(2) + '%',
                      style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Times',
                          fontWeight: FontWeight.bold,
                          fontSize: 15)))
            ],
            majorTickStyle: const MajorTickStyle(
                length: 0.3,
                thickness: 3,
                lengthUnit: GaugeSizeUnit.factor,
                color:
                     Colors.white
                    ),
          ),
        //

          
        
        ]));
  }

}
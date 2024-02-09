import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class BlurredContainer extends StatelessWidget {
  const BlurredContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 420,
            child: BlurryContainer(
              blur: 10,
              height: 350,
              width: double.infinity,
              color: const Color(0xff48319D).withOpacity(0.5),
              borderRadius: const BorderRadius.all(
                Radius.circular(44),
              ),
              child: const BlurredContainerContent(),
            ),
          ),
          const Image(
            image: AssetImage('assets/clouds/Moon.png'),
            width: 130,
          ),
        ],
      ),
    );
  }
}

class BlurredContainerContent extends StatelessWidget {
  const BlurredContainerContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('dkdkskdk');
  }
}

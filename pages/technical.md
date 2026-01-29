---
layout: page
title: How It Works
description: Hardware design, system architecture, and AI pipeline
image: assets/images/technical.png
show-tile: true
tile_order: 3
menu_order: 3
nav-menu: true
hide_image: false
---

## Hardware Components

The control center for OralVision's imaging device is a XIAO-ESP32-C6 microcontroller, a low-cost yet powerful solution to reduce costs while maintaining the technical capabilities of larger, more expensive controllers. The image is taken using an OV5642 5 MP Image Sensor with SPI compatibility for high-bandwidth image data transfer to the microcontroller.

Additionally, an anti-fog nano coating is applied to the camera lens to prevent moisture in the mouth from harming the internal components. To minimize user error, the entire system uses a single medical-grade momentary push button to control image streaming and capturing.

The power is regulated using a 5V voltage regulator to prevent current spikes when alternate charging methods are used. The regulator accepts multiple power sources, including USB-C (with a port for easy charging access), AA batteries, and solar power (for extremely low-income areas with minimal electrical infrastructure). The imager also ships with rechargeable Nickel Metal Hydride batteries to prevent thermal runaway during transportation.

The entire system is then enveloped in a sterilization wrap to prevent bacteria and microbes from entering the device. The prototype's housing is held together using a snap-fit mechanism to provide easy access to the electronics for battery replacements and software updates.

## System Architecture

![System architecture diagram]({{ site.baseurl }}/assets/images/architecture.png)

OralVision employs a three-layer distributed architecture optimized for low-latency medical imaging while considering the physical and resource constraints of its target clients:

1. **Sensing Layer** - Arducam OV5642 5-MP image sensor and a 140-degree camera lens to maximize coverage and image quality while minimizing image capture latency.
2. **Processing Layer** - ESP32-C6 with a WiFi 802.11b/g/n transceiver to wirelessly transmit image data to the inference layer utilizing a Flask WiFi Access Point on a Raspberry Pi 5.
3. **Inference Layer** - The Pi has 16GB of SDRAM for model loading and communicates with the device using Flask and the RESTful API. Once the image data is transmitted, the Raspberry Pi analyzes the image with TensorFlow Lite and outputs the possible diseases and their probabilities.

## Communication Protocols

For communication protocols with OralVision, we used SPI and Wifi. We decided on SPI over UART and I2C because of its faster speeds and continuous data transfer, minimizing latency and allowing for high resolution images to be transmitted quickly.

We then transfer our images to our ML interface wirelessly using Wifi 5, where our Federated Learning model then processes the images and outputs our results to the screen on our interface. When a device processes an image, it alters neural parameters to improve the accuracy of our main model, which clients can download from our website for software updates.

## ML Model Performance

Our ML model performs far better than competitors:

| Metric | OralVision | VELScope |
|--------|------------|----------|
| Accuracy | **87.15%** | 53% |
| ROC-AUC Score | **0.9417** | N/A |
| F1 Score | **0.8655** | N/A |

## Training Techniques

We used a variety of techniques while developing our ML model to get this high accuracy rate:

- **Data Augmentation** - We augmented our limited training data using geometric and lighting transformations.
- **DenseNet121 Architecture** - We used DenseNet121 as our model architecture due to its enhanced ability to form neural connections.
- **L2 Regularization** - We used L2 regularization to ensure our model was not overfitted on our data by ensuring no specific decision points were given too large of a weight in the decision making process.
- **Multi-Step Gradual Training** - We initially trained only a head layer, later unfreezing the rest of the model to gain more accuracy with this multi-phase training.

## Federated Learning Advantage

However, we realized that solely basing our model on publicly available training data would allow competitors to easily create comparable models using similar techniques. Therefore, we transformed our standard ML model into a federated learning model that allows for constant inputs of new, HIPAA-compliant patient data that competitors cannot copy.

This shift to federated learning allows us to negate biases that may have been present in our training data, improve our model's parameters, and stay ahead of major market competitors.

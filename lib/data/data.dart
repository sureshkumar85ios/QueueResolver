import 'package:flutter/material.dart';


class SliderModel{

  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Waiting is so unusual that many of us can't stand in a queue for 30 seconds without getting out our phones to check for messages or to Google something.");
  sliderModel.setTitle("Queue");
  sliderModel.setImageAssetPath("assets/images/Queue_1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("These are certainly unprecedented times. We want to be social, and yet the best, safest thing we can do is to stay home and keep our distance from friends, family, and fellow humans—at least 6 feet to be exact!");
  sliderModel.setTitle("Social Distancing");
  sliderModel.setImageAssetPath("assets/images/Queue_2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Help queues move quicker so that customers aren’t waiting any longer than the recommended 15 minutes waiting time.");
  sliderModel.setTitle("QUICKER QUEUE TIMES");
  sliderModel.setImageAssetPath("assets/images/Queue_3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
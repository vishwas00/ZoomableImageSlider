# ZoomableImageSlider

[![CI Status](http://img.shields.io/travis/vishwas00/ZoomableImageSlider.svg?style=flat)](https://travis-ci.org/vishwas00/ZoomableImageSlider)
[![Version](https://img.shields.io/cocoapods/v/ZoomableImageSlider.svg?style=flat)](http://cocoapods.org/pods/ZoomableImageSlider)
[![License](https://img.shields.io/cocoapods/l/ZoomableImageSlider.svg?style=flat)](http://cocoapods.org/pods/ZoomableImageSlider)
[![Platform](https://img.shields.io/cocoapods/p/ZoomableImageSlider.svg?style=flat)](http://cocoapods.org/pods/ZoomableImageSlider)




![out](https://user-images.githubusercontent.com/12559049/28767394-2345ab82-75f1-11e7-8077-e805a49b9924.gif)


ZoomableImageSlider is a simple iOS library for showing images from url in form of slider. 
It has following features-

1. Images are zoomable by double tap and by panning the finger as well.
2. Images are loaded from url (from internet).
3. Shows the image index as well.
4. Close the slider by simply swiping down
5. Support for all device orientations




## Usage

```swift

let images = ["http://www.kurzweilai.net/images/iPhone4-S.jpg", "https://s-media-cache-ak0.pinimg.com/originals/93/aa/25/93aa2535372bb8d37ed42864ad55d904.jpg", "http://images.efulfilment.de/get_image/?t=29A598C0F35F861AECC5DF972434840B", "http://images.all-free-download.com/images/graphicthumb/monitor_the_cameras_02_hd_picture_168726.jpg"]

let slider = ZoomableImageSlider(images: images, currentIndex: 2, placeHolderImage: nil)

self.present(slider, animated: true, completion: nil)

```



## Example

To run the example project, clone or download the repo, and run the project from the Example directory.


## Installation

ZoomableImageSlider is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ZoomableImageSlider"
```

## Author

Vishwas Singh, singh.vis00@gmail.com

## License

ZoomableImageSlider is available under the MIT license. See the LICENSE file for more info.

# Technical Assignment

## Description   

The test project will be a native iOS application that should be created as an Xcode project (version 12.3 or higher) and should also support both landscape and portrait device  orientations. The result of your work should be a buildable application able to run on an iOS  device (iPad or iPhone) with iOS 13.0 or higher.  

Create an iOS application for browsing the Jumbo list of available products. To achieve this you are going to use a provided local JSON list with 10 products.


### Usage example
`ProductsRepository().fetchRawProducts()`

## Requirements

- The first screen of your application should display a start button that should navigate to list of products

- The Products List screen should contain a table view displaying the following fields for each product
  - Image
  - Name
  - Price
  - Quantity added to Cart
  - Add to Cart button

- When Add to Cart button is tapped, the product should be added to a local list of products with quantities (Cart).

- _OPTIONAL_: Save Cart locally on the device
- _OPTIONAL_: Load Cart back from the device when entering the product list screen
- _OPTIONAL_: Cart list accessible on the application level

## Hints 

- Attached designs could be a style guide, feel free to innovate. 
- Write your code in production quality, in a reusable way

![Simulator Screen Shot - iPhone 8 - 2021-09-28 at 16 19 08](https://user-images.githubusercontent.com/55485534/135105894-52b5d465-eec1-4a40-80ee-8f63eed45915.png)


# Build and Run

## Install 

- Xcode
- Brew (/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
- brew install xcodegen
- sudo gem install cocoapods

## Build 
- xcodegen generate
- pod install

## Build 
- open *.xcworkspace via Xcode
- tap CMD+R

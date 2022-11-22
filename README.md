<p align="center">
  <picture height="50">
    <source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/31541782/203431445-d6ac4836-27b6-4d18-b48a-956483150c51.png">
    <source media="(prefers-color-scheme: light)" srcset="https://user-images.githubusercontent.com/31541782/203431367-9253aa36-4c60-4a7b-a02b-29b15965cd77.png">
    <img alt="Glorifier" height="100" src="https://user-images.githubusercontent.com/31541782/203431367-9253aa36-4c60-4a7b-a02b-29b15965cd77.png">
  </picture>
</p>

## Preview
Glorifier allows you to add a certain *bedazzle* to your view. It is a bit difficult to describe so just check it out yourself:
![Simulator Screen Recording - iPhone 14 Pro - 2022-11-22 at 23 47 20](https://user-images.githubusercontent.com/31541782/203437388-4eb916f8-fe48-4b3d-ab6b-b8d229c1a4cf.gif)


## Installation
### Swift Package Manager
Add `https://github.com/no-comment/Glorifier.git` to your [Package Dependencies](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).


## Usage

Just use the `.glorified()` modifier as you would use any other:

```swift
MyView()
    .glorified()
```

There are 4 parameters to further customize the effect:

| **Parameter**       | **Type** | **Default Value** | **Description**                     |
| ------------------- | -------- | ----------------- | ----------------------------------- |
| `duration`          | `Double` | `15`              | Duration of a cycle in seconds      |
| `rotationIntensity` | `Double` | `10`              | Intensity of the 3D rotation effect |
| `shadowColor`       | `Color`  | `.gray`           | Color of the shadow                 |
| `shadowOffset`      | `Double` | `15`              | Offset of the shadow                |

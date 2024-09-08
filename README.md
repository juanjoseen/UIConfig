
# UIConfig

UIConfig is a library designed to simplify the configuration and customization of user interface components (UI) in iOS applications. This project aims to provide a centralized and scalable way to manage UI configurations in projects, making it easier to implement and maintain.

## Table of Contents

- [Characteristics](#characteristics)
- [Requirements](#requirements)
- [Installing](#installing)
- [Usage](#usage)
  - [Button Configuration](#button-configuration)
  - [Label Configuration](#label-configuration)
  - [Available Extensions](#available-extensions)
- [Contributions](#contributions)
- [License](#license)

## Characteristics

- **Modular and Reusable**: UIConfig allows you to apply reusable UI configurations for common components like buttons, labels, views, and more.
- **Style Centralization**: Allows you to define a UI style once and apply it anywhere in the project, ensuring consistency in visual design.
- **Quick Customization**: Easily change the visual properties of components from a single configuration.
- **Scalability**: Ideal for projects of all sizes, from small applications to more complex projects.

## Requirements

- **Xcode** 12.0 or higher
- **Swift** 5.0 or higher
- **iOS** 13.0 or higher

## Installing

1. Clone or download the project.
2. Execute the `update_framework.sh` script to generate de `UIConfig.xcframework`.
3. Add the `UIConfig.xcframework` to your project.
4. Import the library into the files where you plan to use it:

```swift
import UIConfig
```

## Usage

Once installed, you can start using UIConfig to configure your UI components in a centralized and consistent manner.

### Button Configuration

To apply custom settings to a button:

```swift
import UIConfig

let button: UIButton = UIButton(title: "Click me", color: .systemBlue, bgColor: .clear, isBordered: true, border: .systemBlue, width: .lineHeight, radius: .standardRadius)
button.addTarget(self, action: #selector(actionButton(_:)), for: .touchUpInside)

...

@objc func actionButton(_ sender: UIButton) {
     print("Button Clicked!")
}
```

### Label Configuration

Similarly, you can configure labels using the corresponding UIConfig module:

```swift
import UIConfig

let label: UILabel = UILabel(text: "Hello World!", color: .textColor, font: .title, alignment: .center)
```

### Available Extensions

UIConfig includes several extensions that allow you to easily apply configurations to the following elements:

- **Buttons** (`UIButton`)
- **Labels** (`UILabel`)
- **Views** (`UIView`)
- **Images** (`UIImageView`)
- **TextFields** (`UITextField`)
- **CollectionViews** (`UICollectionView`)
- **TableViews** (`UITableView`)
- **Fonts** (`UIFont`)
- **Colors** (`UIColor`)
- **Controllers** (`UIController`)
  
Each of these extensions includes convenient methods for applying predefined or custom style settings.

## Contributions

Contributions to UIConfig are welcome. If you have ideas for new features or improvements, please follow these steps:

1. Fork the project.
2. Create a new branch (`git checkout -b feature-new-feature`).
3. Make your changes and commit them (`git commit -m 'Add new feature'`).
4. Submit your Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more details.

# UIConfig

UIConfig is a library designed to simplify the configuration and customization of user interface components (UI) in iOS applications. This project aims to provide a centralized and scalable way to manage UI configurations in projects, making it easier to implement and maintain.

## Table of Contents

- [Characteristics](#characteristics)
- [Requirements](#requirements)
- [Installing](#installing)
- [Usage](#usage)
  - [Button Configuration](#button-configuration)
  - [Label Configuration](#label-configuration)
  - [Large Page Indicator](#large-page-indicator)
  - [Banner Alerts](#banner-alerts)
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

You can customize the next parameters of the button:

- title
- title font
- title color
- button's background
- button's border
- button's border color
- button's border with

To apply custom settings to a button:

```swift
import UIConfig

// Text Buttons
let btnSimple: UIButton = UIButton(title: "Simple button", color: .white, bgColor: .systemBlue, isBordered: false)
let btnRounded: UIButton = UIButton(title: "Rounded button", color: .white, bgColor: .systemBlue, radius: .standardRadius)
let btnBordered: UIButton = UIButton(title: "Bordered button", color: .systemBlue, bgColor: .clear, isBordered: true, border: .systemBlue, width: 1)
let btnRoundedBordered: UIButton = UIButton(title: "Rounded Bordered button", color: .systemBlue, bgColor: .clear, isBordered: true, border: .systemBlue, width: 1, radius: .standardRadius)

// Image Buttons
let btnProfile: UIButton = UIButton(image: "person.crop.circle.fill", isSystem: true, size: 46, color: .systemBlue)
let btnAppStore: UIButton = UIButton(image: "app_store", isSystem: false, size: 60)
```

<img src="https://axkan.vercel.app/imgs/wiki/buttons_light.jpg" alt="Buttons in dark mode" width="auto" height="400px">

<img src="https://axkan.vercel.app/imgs/wiki/buttons_dark.jpg" alt="Buttons in dark mode" width="auto" height="400px">

### Label Configuration

Similarly, you can configure labels using the corresponding UIConfig module:

```swift
import UIConfig

let label: UILabel = UILabel(text: "Hello World!", color: .textColor, font: .title, alignment: .center)
```

### Large Page Indicator

A larger version of an UIPageControl with some extra notifications

```swift
import UIConfig

let pageIndicator: LargePageIndicator = LargePageIndicator(numberOfPages: 6)

...

indicator.increasePage()

...

indicator.decreasePage()
```

### Banner Alerts

You can use the baner alerts included in UIConfig, we added 4 pre-build banner alerts: Success, Info, Warning & Error Banner Alerts
Here's how you can use them:

```swift
import UIConfig

class TaskController: UIViewController {
...

func taskDidSucceed() {
    showSuccessBannerAlert(title: "This is a success banner alert message") {
        let alert: UIAlertController = UIAlertController(title: "Success!", message: "You tapped into the success banner alert", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
}

```


```swift
import UIConfig

class TaskController: UIViewController {
...

func showInfoAlert() {
    showInfoBannerAlert(title: "This is an info banner alert message") {
        let alert: UIAlertController = UIAlertController(title: "Info!", message: "You tapped into the info banner alert", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
}

```


```swift
import UIConfig

class TaskController: UIViewController {
...

func showWarningAlert() {
    showWarningBannerAlert(title: "This is a warning banner alert message!") {
        let alert: UIAlertController = UIAlertController(title: "Warning!", message: "You tapped into the warning banner alert", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
}

```


```swift
import UIConfig

class TaskController: UIViewController {
...

func taskDidFail() {
    showErrorBannerAlert(title: "This is an error banner alert message!") {
        let alert: UIAlertController = UIAlertController(title: "Error!", message: "You tapped into the error banner alert", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
}

```

of course you can create your own banner alert with your style, like this:

```swift
import UIConfig

class TaskController: UIViewController {
...

    func showCustomAlert() {
        let alert: BannerAlert = BannerAlert(title: "Banner alert title!", icon: Icon(name: "bookmark.fill", isSystemImage: true), color: .systemPurple, titleColor: .white) {
            print("User did tap into the banner alert!")
        }
        alert.show(in: self.view, timeout: 3.0)
    }

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

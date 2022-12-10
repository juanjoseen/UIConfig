# UIConfig
UIConfig is a simple helper to biuld Interfaces with Swift using custom initializers to write less lines of code

UIConfig was made thinking in those developers who build their interfaces with code, for instance, if you need to create a "Hello World!" label, usually you need to write a similar code to this:
```
let label: UILabel = UILabel()
label.translatesAutoresizingMaskIntoConstraints = false
label.text = "Hello World!"
label.font = UIFont(name: "Avenir-Medium", size: 17)!
label.textColor = .black
label.textAlignment = .center
```

But using UIConfig you just need one single line:
```
let label: UILabel = UILabel(text: "Hello World!", color: .black, font: .subTitle, alignment: .center)
```
and that's all!

With UIConfig you can configure some UI components in a single line of code 

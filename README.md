
#  iOS App using  MVVM  &nbsp;

This project displayes list of employees

## Layers
* **UI Layer** = Contains UITableview to create list of employees.
* **View Model** = ViewModel for Presentation/Business logic, data binding is done usign protocol delegate pattern.  
* **Model** = Models are created using Struct. 
* **Localization** = Localizable string file is created to support multiple langauges , currently its supporting english only
* **WebServcies** = Servcie layer is created using URLSession. 

### Dependency Direction
* initiizer dependecy is used to insert mandatory objects
* Protocols are used for dependency inversion. 

### Accessibility 

* Accessibility voice over is added for employee table view cell. 

## Includes

* Unit Tests for Use Cases For viewModel and JsonDecoder . 
* UI Tests are created to test title and UI element exists or not. 
* Mocking and Stubbign technique is used to test asychronous api call related code. 


## Requirements
* Xcode Version 13.0 +  Swift 5.0+


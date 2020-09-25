# Marley Spoon

![](marleySpoon.jpg) <br />

<br />
This repository contains a demo for sample Master-Detail iOS App, An Application designed based on Use Cases with help of **VIPER** architecture and consumes data from [Contentful](https://contentful.com)API.

### Run Requirements

* Xcode 10.2
* Swift 5

### Installation

1. Clone the porject.
2. Navigate to project folder in terminal.
3. Run Pod Install 

### Dependency Graph

According to VIPER Architecture, every Modules have 5 main parts, The main parts of each module are:

**View -** Displays what it is told to by the Presenter and relays user input back to the Presenter. <br /><br />
**Interactor -** Contains the business logic as specified by a use case. <br /><br />
**Presenter -** Contains view logic for preparing content for display (as received from the Interactor) and for reacting to user inputs (by requesting new data from the Interactor). <br /><br />
**Entity -** Contains basic model objects used by the Interactor. <br /><br />
**Routing -** Contains navigation logic for describing which screens are shown in which order. <br /><br />

![](MarelySpoon.gif) <br />

### Dependancy Manager

COCOAPODS

### Pods Installed

Contentful <br />
Kingfisher  <br />

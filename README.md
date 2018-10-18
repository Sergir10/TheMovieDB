# TheMovieDB
This is an application that get information from: https://www.themoviedb.org/ and show it to the user. Basically the application 
show information about movies in three categories: Popular, Top Rated and Upcoming. 

In each of these, we can see some description about the movie, like: Name, Poster, Release Date, Overview and the trailer. 

## **Layer of the app.**
The architecture is based on the design patter: MVVM. But aditionally have another layer to sort the code better. All of those 
layers will be describe below. 

## 1. View 
The view is conformed by: 
- **View Model:** This folder have all the viewmodels implemented to binding the data with the view. This layer are conformed by:
  * **_VideoViewModel.swift:_** Handle the data for the Videos 
  * **_SearchViewModel.swift:_** Handle the data for the Search option.
  * **_MovieViewModel.swift:_** Super class that handle the common function for the movies-
  * **_PopularViewModel.swift:_** Child class from MovieViewModel that handle the specific popular movies.
  * **_TopRatedViewModel.swift:_** Child class from MovieViewModel that handle the specific toprated movies.
  * **_UpcomingViewModel.swift:_** Child class from MovieViewModel that handle the specific upcoming movies.
  * **_MovieViewModelProtocol.swift:_** Protocol to setting the general propierties for a movie. 
  
- **Controllers:** This folder have all the controller used to handler the views. This layer are conformed by: 
  * **_MovieViewController.swift:_** The Main controller, where all movies are showed. 
  * **_MovieDetailViewController.swift_** This manage the detail of any movie. 
  * **_SearchMovieViewController.swift:_** This allow to search and show a movie. 
  * **_YTPlayerViewController.swift:_** Allow to play the movie trailer. 
  
- **Cells:** This folder have the cell controllers and xib/nib used for the views. This layer are conformed by: 

Additionaly, we have another file: 
  * **_MovieDelegate.swif:_** Delegate to send information through the classes.

## 2. Model
This view is conformed by: 
  * **_Movie.swift:_** Allow to parse and setting the Movie Object from the request response. 
  * **_Video.swift:_** -> Allow to parse and setting the Video Object from the request response. 

## 3. Network 
This view is conformed by: 
- **Dispatcher:** Contain the follow class: 
  * **_DispatcherProtocol.swift:_** Set the generic dispatcher. 
  * **_DispatcherImplementation.swift:_** Implement a specific dispatcher. 
  
- **Request:** Contain the follow class: 
  * **_RequestProtocol.swift:_** Set all of the dates that a request should to have. 
  * **_MovieRequest.swift:_** Set the body of the movie request and return it ready to pass it to the dispatcher. 
  * **_VideoRequest.swift:_** Set the body of the video request and return it ready to pass it to the dispatcher.
  * **_SearchRequest.swift:_** Set the body of the search request and return it ready to pass it to the dispatcher. 
  
- **Common:** Contain the follow class: 
  * **_Constant.swift:_** Contain the constant used in whole network process. 
  * **_Enviroment.swift:_** Allow to handler the diferent enviroment that could have the application, like test o production server.
  * **_Request.swift:_** Handle the response of a server. 

Additionaly, we have another two files: 
  * **_OperationProtocol.swift:_** Protocol to set a general network operation. 
  * **_MovieTasks.swift:_** Expose the specific netwokr operations for a Movie. 
  
## 4. Utils
  * **_MovieUtil.swift:_** File with a common enumeration.
  
  
  # Single Responsability. 
  The principle of single responsability appears in Robert C. Martin clean code book and refers to:
  > The Single Responsibility Principle (SRP)2 states that a class or module should have one, and only one, reason to change. 
  This principle gives us both a definition of responsibility, and a guidelines for class size. Classes should have one responsibility—one reason to change.
  
  # Clean Code. 
  After Robert C. Martin (Again) talk about the **SOLID DESING PRINCIPLES** that allow to the programmer to develop software that 
  are easy to mantain and extend. **S.O.L.I.D** is an acronym for the first five object-oriented design(OOD) principles. A clean code
  is all about adopt good development practices, like the Solid principles, desing patterns and of course, implement the recomendation 
  thata make Uncle Bob in his book: Clean Code. 

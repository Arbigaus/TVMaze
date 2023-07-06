# TVMaze

This is a study project to learn about using `async/await` with `URLSession`

## Structure

* MVVM Pattern
* SwiftUI

![](Architecture/TVMaze.drawio.png)

## API 

It used the [TVMaze](https://www.tvmaze.com/api) API.

## Libraries

Used the lib [MiniService](https://github.com/Arbigaus/MiniService), that I created to use in this and in futures projects, to handle with network requests.

## Navigation

1. List of series
2. Details about the series
3. Episode information

## Future Improvements

* Make a filter in both list views
* Check some warnings to fix
* Insert Unit Tests

## Problems to fix:

* The Detail view from Shows, in the first time that enter in this screen, the informations it is not loading to the screen, need get back and enter in the screen again.
* Avoid call API again when use back button in any view.
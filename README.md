# NASAImageViewer
 ## Things to improve on
  1. Building a Robust Caching mechanism. Currently the app uses the NSCache in its rudimentary form.
  2. Building a theme object for the app that can be reused easily for the labels and content. There is a couple of places where
     there is repeating code for cosmetics.
  3. Dependency injection to make testing easier. This can be done through refactoring some pieces of code.
  4. Refreshing the Table view cells faster when the thumbnails have been fetched.

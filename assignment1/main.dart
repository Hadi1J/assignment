void main (){
   LibrarySystemManagement myLibraryBooks= LibrarySystemManagement();;
  
  myLibraryBooks.addBooks(title:"War and Peace",author:"Leo Tolstoy",year:1865, genre:" Historical ");
  myLibraryBooks.addBooks(title:"Love in the Time of Cholera",author:" Gabriel García Márquez",year:1985, genre:"Romance novel");

 myLibraryBooks.getBookInfo(title:"War and Peace"); 
 myLibraryBooks.getBookInfo(title: "The Kite Runner"); 
print(myLibraryBooks.listBooksByGenre(genre: "Romance novel"));
 myLibraryBooks.listAllBooks(); 

print(myLibraryBooks.removeBook(title: "Love in the Time of Cholera"));
  
print(myLibraryBooks.removeBook(title: "sea prayer"));

}


class LibrarySystemManagement {
  
    final Map<String, Map<String,dynamic>> books={};
  
  void addBooks(
    {required  String title,String? author,int? year,String? genre})
    
  {
    books[title]={ 'author':author,'year':year,'genre':genre};
      print("book added successfully");
}
  
  
  
void getBookInfo({required String title}){
  
  if (books.containsKey(title)){
    print (" Title : $title , Author ${books[title]!['author']},Year ${books[title]!['year']} Genre: ${books[title]!['genre']}");
      
  }
  else{
    print ("book not found :(");
  }
   
}
void listAllBooks({String? genre}) {
  List<String> classifiedBooksByGenre = books.keys
      .where((title)=>genre == null||books[title]!['genre']== genre)
      .toList();
  if (classifiedBooksByGenre.isEmpty) {
    print("The library books are empty :(");
  } 
  else {
    classifiedBooksByGenre.forEach((title) {
      print("The title: $title, The author: ${books[title]!['author']}, The year: ${books[title]!['year']}, The genre: ${books[title]!['genre']}");
    });
  }
}
  
 List<String> listBooksByGenre({required String genre}) {
    List<String> genreBooks = [];
    for (var title in books.keys) {
      if (books[title]!['genre'] == genre) {
        genreBooks.add(title);
      }
    }
   return  genreBooks.isNotEmpty ?  genreBooks   :  ["No books found for this genre"]; 
  }
  


  String removeBook({required String title}) {
  if (books.containsKey(title)) {
    books.remove(title);
    return "Book removed successfully.";
  }
  return "Book not found";

  }
 }
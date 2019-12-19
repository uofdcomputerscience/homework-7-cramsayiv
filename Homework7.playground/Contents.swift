import Foundation

// For this homework project, we'll be connecting to the "TLDR" server
// to add a few books. The first thing you need to do is create an object
// that we'll upload to the server.

// MARK: - STEP ONE

struct Book: Codable {
    let title: String
    let author: String
    let published: String
    let imageURLString: String?
}

// Implement a struct that defines a book. A book consists of the following
// items:
// A title, which is a string
// An author, which is a string
// The publication year, as a string (because dates are hard)
// A string for the URL for an image for the book cover
//
// Remember that this structure needs to conform to the `Encodable` protocol.
// Using `Codable` more generally will be useful, as by doing this you'll
// be able to reuse this struct in Project Three.

// MARK: - STEP TWO

let book1 = Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", published: "1925", imageURLString: "https://upload.wikimedia.org/wikipedia/en/thumb/f/f7/TheGreatGatsby_1925jacket.jpeg/220px-TheGreatGatsby_1925jacket.jpeg")
let book2 = Book(title: "Charlotte's Web", author: "E. B. While", published: "1952", imageURLString: "https://images-na.ssl-images-amazon.com/images/I/61t6c3q2suL.jpg")
let book3 = Book(title: "Peter Rabbit", author: "Beatrix Potter", published: "1901", imageURLString: "https://prodimage.images-bn.com/pimages/9780723244325_p0_v1_s550x406.jpg")
let book4 = Book(title: "The Book Thief", author: "Markus Zusak", published: "2005", imageURLString: "https://images-na.ssl-images-amazon.com/images/I/9123eop9gIL.jpg")
let book5 = Book(title: "The Cat in the Hat", author: "Dr. Seuss", published: "1957", imageURLString: "https://upload.wikimedia.org/wikipedia/en/thumb/b/b5/Seuss-cat-hat.gif/220px-Seuss-cat-hat.gif")


// Once you've defined this structure, you'll need to define a couple of
// book objects that you can insert into the database. In order or us to
// have an amusing dataset to work with, each student is requested to
// create five different books for this database.

// MARK: - STEP THREE


func publishData(book: Book) {
    
    let myURL = URL(string: "https://uofd-tldrserver-develop.vapor.cloud/books")
    var request = URLRequest(url: myURL!)
    
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    request.httpBody = try? JSONEncoder().encode(book)
    let task = URLSession(configuration: .ephemeral).dataTask(with: request)

    task.resume()
}

let myBooks = [book1, book2, book3, book4, book5]

for book in myBooks {
    publishData(book: book)
}


// Now we need to publish this data to the server.

// Create a URL to connect to the server. Its address is:
//      https://uofd-tldrserver-develop.vapor.cloud/books

// Create a URL request to publish the information, based upon the URL you
// just created.

// Add the body to the URL request you just created, by using JSONEncoder.

// Add a "Content-Type" : "application/json" header to your request, so that
// the server will properly understand the body of your request.

// Set the method of the request to "POST", because we're providing information
// rather than retrieving it.

// Create a data task for publishing this element, and kick it off with a resume().

// MARK: - HELPFUL HINTS
// You might want to create a method for publishing the data, so that you
// can effectively loop over an array of books.
//
// If you visit the URL for the service in a 'GET' request, it will return a
// list of books to you. We'll be using this list of books for Project Three.

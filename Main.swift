import SwiftUI

@main
struct MealRater: App {
    var body: some Scene {
        WindowGroup {
            MainScreen()
        }
    }
}

struct MainScreen: View {
    @State private var dishName: String = ""
    @State private var restaurantName: String = ""
    @State private var rating: Int?
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                HStack {
                    Text("Restaurant:")
                        .frame(width: 100, alignment: .trailing)
                    TextField("", text: $restaurantName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 200)
                }
                .padding()
                
                HStack {
                    Text("Dish:")
                        .frame(width: 100, alignment: .trailing)
                    TextField("", text: $dishName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 200)
                }
                .padding()

                Text("Rating: \(rating != nil ? "\(rating!)" : "Not rated yet")")
                    .padding()

                NavigationLink(destination: RatingView(rating: $rating)) {
                    Text("Rate Meal")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                .padding()
                
                Spacer() 
            }
            .navigationTitle("Meal Rater")
            .padding()
            .frame(maxHeight: .infinity, alignment: .top) 
        }
    }
}

#Preview {
    MainScreen()
}

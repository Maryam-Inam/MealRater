import SwiftUI
import CoreData

struct RatingView: View {
    @Binding var rating: Int?
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext // Core Data context

    @State private var restaurantName: String = ""
    @State private var meal: String = ""

    var body: some View {
        VStack(alignment: .center) {
            // Meal and Restaurant Text Fields
            TextField("Restaurant Name", text: $restaurantName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Meal", text: $meal)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            HStack {
                ForEach(1...5, id: \.self) { num in
                    Button(action: {
                        rating = num
                    }) {
                        Text("\(num)")
                            .padding()
                            .background(rating == num ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
            }
            .padding()

            HStack {
                Spacer()

                Button("Cancel") {
                    rating = nil
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                .foregroundColor(.blue)

                Spacer()

                Button("Save") {
                    saveRating()
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                .foregroundColor(.blue)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Rate Meal")
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
    }

    private func saveRating() {
        let newRating = MealRatingEntity(context: viewContext) // Create a new instance of MealRating entity
        newRating.restaurantName = restaurantName
        newRating.meal = meal
        newRating.rating = Int16(rating ?? 0) // Set rating value

        do {
            try viewContext.save() // Save the context
        } catch {
            // Handle any errors in saving
            print("Error saving meal rating: \(error.localizedDescription)")
        }
    }
}

#Preview {
    RatingView(rating: .constant(nil))
}

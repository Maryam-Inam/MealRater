import SwiftUI

struct RatingView: View {
    @Binding var rating: Int?
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(alignment: .center) {
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
}

#Preview {
    RatingView(rating: .constant(nil))
}

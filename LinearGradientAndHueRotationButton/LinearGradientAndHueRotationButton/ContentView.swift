import SwiftUI

struct ContentView: View {
    @State private var hue: Double = 0.0
    @State private var colors: [Color] = [
        Color(hue: 0.0, saturation: 1, brightness: 1),
        Color(hue: 0.1, saturation: 1, brightness: 1)
    ]

    var body: some View {
        ZStack {
            Color(.black)
            Button(action: {
                // Perform button action
            }) {
                Text("Continue")
                    .foregroundColor(.white)
                    .font(.title).bold()
                    .padding(25)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(LinearGradient(gradient: Gradient(colors: colors), startPoint: .trailing, endPoint: .leading))
                    )
            }
            .onAppear {
                startHueRotation()
            }
        }
        .ignoresSafeArea()
    }

    private func startHueRotation() {
//        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            withAnimation {
                hue += 0.01
                if hue > 1.0 { hue = 0.0 }
                updateColors()
            }
        }
    }

    private func updateColors() {
        colors = [
            Color(hue: hue, saturation: 1, brightness: 1),
            Color(hue: (hue + 0.1).truncatingRemainder(dividingBy: 1.0), saturation: 1, brightness: 1)
        ]
    }
}

#Preview {
    ContentView()
}

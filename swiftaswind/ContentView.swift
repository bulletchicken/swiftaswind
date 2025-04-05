import SwiftUI
import PythonKit

struct ContentView: View {
    @State private var inputText: String = ""

    var body: some View {
        HStack(spacing: 8) {
            TextField("Ask me anything...", text: $inputText)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(8)
                .contentMargins(4)
                .background(Color.clear)
                .tint(.black)

            Button(action: {
                handleSend(inputText)
                inputText = ""
            }) {
                Image(systemName: "arrow.up.circle.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.black)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(6)
        .padding(.horizontal, 6)
        .background(.ultraThinMaterial)
        .cornerRadius(24)
        .frame(width: 400, height: 60)
    }

    func handleSend(_ text: String) {
        run_script(prompt: text)
        // This is where you'd hook into your automation
        print("User input: \(text)")
    }
}

class DraggableHostingView<Content: View>: NSHostingView<Content> {
    override func mouseDown(with event: NSEvent) {
        self.window?.performDrag(with: event)
    }
}

#Preview {
    ContentView()
}

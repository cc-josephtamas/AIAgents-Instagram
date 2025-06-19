import SwiftUI

struct StoryUIViewRepresentable: UIViewRepresentable {
    let story: Story
    
    func makeUIView(context: Context) -> StoryUIView {
        return StoryUIView(story: story)
    }
    
    func updateUIView(_ uiView: StoryUIView, context: Context) {
        uiView.configure(with: story)
    }
}